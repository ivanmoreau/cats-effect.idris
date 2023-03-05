module Cats.Effect.FiberIO.FiberIO

public export
data FiberIO : Type -> Type where [external]

public export
data Outcome : (Type -> Type) -> Type -> Type -> Type where [external]

public export
data Throwable : Type where [external]