module Cats.Effect.CatsIO

import public Cats.Effect.CatsIO.CatsIO
import public Cats.Effect.CatsIO.Instances

import Cats.Effect.CatsIO.Unsafe
import Cats.Effect.FiberIO

public export
runCatsIO : CatsIO a -> IO a
runCatsIO = Cats.Effect.CatsIO.Unsafe.runCatsIO

public export
sleep : Int -> CatsIO ()
sleep = Cats.Effect.CatsIO.Unsafe.sleep

public export
start : CatsIO a -> CatsIO (FiberIO a)
start = Cats.Effect.CatsIO.Unsafe.start

public export
foreverIO : CatsIO a -> CatsIO ()
foreverIO = Cats.Effect.CatsIO.Unsafe.foreverIO 

public export
ifM : CatsIO Bool -> CatsIO a -> CatsIO a -> CatsIO a
ifM = Cats.Effect.CatsIO.Unsafe.ifM
