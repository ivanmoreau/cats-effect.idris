module Main

import Cats.Effect.CatsIO
import Cats.Effect.Console
import Cats.Effect.Ref

cats : CatsIO ()
cats = do
  someNameVar <- refIO "Name test!"
  nameCurrent <- getIO someNameVar
  _ <- catsPrintLn $ "What's your name? (Current: " ++ nameCurrent ++ ")"
  name <- catsReadLn
  _ <- setIO name someNameVar
  nameNew <- getIO someNameVar
  catsPrintLn $ "Hi, " ++ nameNew ++ "!"

main : IO ()
main = runCatsIO cats