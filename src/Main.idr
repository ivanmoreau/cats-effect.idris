module Main

import Cats.Effect.CatsIO
import Cats.Effect.Instances.CatsIO
import Cats.Effect.Unsafe.CatsIOMethods

cats : CatsIO ()
cats = do
  _ <- catsPrintLn "What's your name?"
  name <- catsReadLn
  catsPrintLn $ "Hi, " ++ name ++ "!"

main : IO ()
main = runCatsIO cats