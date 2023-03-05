module Cats.Effect.CatsIO

import public Cats.Effect.CatsIO.CatsIO
import public Cats.Effect.CatsIO.Instances

import Cats.Effect.CatsIO.Unsafe

public export
runCatsIO : CatsIO a -> IO a
runCatsIO = Cats.Effect.CatsIO.Unsafe.runCatsIO