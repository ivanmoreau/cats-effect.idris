module Cats.Effect.Instances.CatsIO

import Cats.Effect.CatsIO
import Cats.Effect.Unsafe.CatsIOMethods

public export
Functor CatsIO where
  map = mapIO

public export
Applicative CatsIO where
  pure = pureIO
  (<*>) = apIO

public export
Monad CatsIO where
  (>>=) = bindIO