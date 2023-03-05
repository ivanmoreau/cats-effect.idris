module Cats.Effect.CatsIO.Instances

import Cats.Effect.CatsIO.CatsIO
import Cats.Effect.CatsIO.Unsafe

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