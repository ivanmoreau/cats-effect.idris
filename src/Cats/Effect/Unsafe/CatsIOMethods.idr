module Cats.Effect.Unsafe.CatsIOMethods

import Cats.Effect.CatsIO

%foreign "jvm:unsafeCoerce,cats/effect/idris/Wrapper"
unsafeCoerce : forall a, b. a -> b

%foreign "jvm:pure(java/lang/Object cats/effect/IO),cats/effect/IO"
pureIOUnsafe : AnyPtr -> CatsIO AnyPtr

public export
pureIO : a -> CatsIO a
pureIO a = unsafeCoerce $ pureIOUnsafe $ unsafeCoerce a

%foreign "jvm:pure(scala.Function1 cats/effect/IO),cats/effect/IO"
mapIOUnsafe : (AnyPtr -> AnyPtr) -> CatsIO AnyPtr
