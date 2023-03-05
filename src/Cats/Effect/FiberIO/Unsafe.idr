module Cats.Effect.FiberIO.Unsafe

import Cats.Effect.FiberIO.FiberIO
import Cats.Effect.CatsIO.CatsIO

%foreign "jvm:unsafeCoerce,cats/effect/idris/Wrapper"
unsafeCoerce : forall a, b. a -> b

%foreign "jvm:join(cats/effect/kernel/Fiber cats/effect/IO),cats/effect/idris/FiberIO"
joinUnsafe : FiberIO AnyPtr -> CatsIO AnyPtr

public export
join : FiberIO a -> CatsIO (Outcome CatsIO Throwable a)
join f = unsafeCoerce $ joinUnsafe $ unsafeCoerce f