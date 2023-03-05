module Main

import Data.Vect

import Cats.Effect.CatsIO
import Cats.Effect.Console
import Cats.Effect.Ref

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
  catsPrintLn $ "Words: " ++ (show words)

main : IO ()
main = runCatsIO cats