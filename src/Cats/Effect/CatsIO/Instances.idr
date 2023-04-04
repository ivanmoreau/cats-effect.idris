module Cats.Effect.CatsIO.Instances

import Cats.Effect.CatsIO.CatsIO
import Cats.Effect.CatsIO.Unsafe

public export
Functor CatsIO where
  map = mapIO

public export
Applicative CatsIO where
  pure = pureIO
  (<*>) f a = bindIO f (\f => mapIO f a)

public export
Monad CatsIO where
  (>>=) = bindIO