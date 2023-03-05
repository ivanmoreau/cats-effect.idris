module Main

import Data.Vect

import Cats.Effect.CatsIO
import Cats.Effect.Console
import Cats.Effect.Ref
import Cats.Effect.FiberIO

update : Ref CatsIO a -> (a -> a) -> CatsIO ()
update r f = do
  ref <- getIO r
  setIO (f ref) r 

-- Fix me!
ifM : CatsIO Bool -> CatsIO() -> CatsIO ()
ifM fb fa = fb >>= p where
  p : Bool -> CatsIO ()
  p false = pure ()
  p true = fa

readWords : (n : Nat) -> CatsIO (Vect n String)
readWords 0 = pure Nil
readWords (S n) = do
  word <- catsReadLn
  xs <- readWords n
  pure $ word :: xs

cats : CatsIO ()
cats = do
  someNameVar <- refIO "Name test!"
  nameCurrent <- getIO someNameVar
  _ <- catsPrintLn $ "What's your name? (Current: " ++ nameCurrent ++ ")"
  name <- catsReadLn
  _ <- setIO name someNameVar
  nameNew <- getIO someNameVar
  _ <- catsPrintLn $ "Hi, " ++ nameNew ++ "!"
  _ <- catsPrintLn "Give me some words to print"
  words <- readWords 5
  _ <- catsPrintLn $ "Words: " ++ (show words)
  ctr <- refIO 0
  let wait = sleep 1000
  let poll = wait *> getIO ctr
  _ <- start $ foreverIO $ poll >>= \a => catsPrintLn $ show a
  _ <- start $ foreverIO $ flip ifM (catsPrintLn "fizz") $ map (\x => (x `mod` 3) == 0) poll
  _ <- start $ foreverIO $ flip ifM (catsPrintLn "buzz") $ map (\x => (x `mod` 3) == 0) poll
  _ <- foreverIO $ wait *> update ctr ((+) 1)
  pure ()




main : IO ()
main = runCatsIO cats