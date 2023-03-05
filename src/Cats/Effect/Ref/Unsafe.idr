module Cats.Effect.Ref.Unsafe

import Cats.Effect.Ref.Ref
import Cats.Effect.CatsIO

%foreign "jvm:unsafeCoerce,cats/effect/idris/Wrapper"
unsafeCoerce : forall a, b. a -> b

%foreign "jvm:refIO(java/lang/Object cats/effect/IO),cats/effect/idris/Ref"
unsafeRefIO : AnyPtr -> CatsIO (Ref CatsIO AnyPtr)

public export
refIO : a -> CatsIO (Ref CatsIO a)
refIO v = unsafeCoerce $ unsafeRefIO $ unsafeCoerce v

%foreign "jvm:setIO(java/lang/Object cats/effect/kernel/Ref cats/effect/IO),cats/effect/idris/Ref"
unsafeSetIO : AnyPtr -> Ref CatsIO AnyPtr -> CatsIO (Ref CatsIO AnyPtr)

public export
setIO : a -> Ref CatsIO a -> CatsIO (Ref CatsIO a)
setIO a ref = unsafeCoerce $ unsafeSetIO (unsafeCoerce a) (unsafeCoerce ref)

%foreign "jvm:getIO(cats/effect/kernel/Ref cats/effect/IO),cats/effect/idris/Ref"
unsafeGetIO : Ref CatsIO AnyPtr -> CatsIO AnyPtr

public export
getIO : Ref CatsIO a -> CatsIO a
getIO ref = unsafeCoerce $ unsafeGetIO $ unsafeCoerce ref