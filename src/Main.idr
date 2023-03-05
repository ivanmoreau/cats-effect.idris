module Main

import Cats.Effect.CatsIO

cats : CatsIO ()
cats = do
  _ <- catsPrintLn "What's your name?"
  name <- catsReadLn
  catsPrintLn $ "Hi, " ++ name ++ "!"

main : IO ()
main = runCatsIO cats