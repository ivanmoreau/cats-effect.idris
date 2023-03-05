module Cats.Effect.CatsIO.Unsafe

import Cats.Effect.CatsIO.CatsIO

%foreign "jvm:unsafeCoerce,cats/effect/idris/Wrapper"
unsafeCoerce : forall a, b. a -> b

data IORuntime : Type where [external]

%foreign "jvm:globalIO,cats/effect/idris/Wrapper"
globalIO : IORuntime

%foreign "jvm:unsafeRunSync(cats/effect/IO cats/effect/unsafe/IORuntime java/lang/Object),cats/effect/idris/Wrapper"
unsafeRunSyncUnsafe : CatsIO AnyPtr -> IORuntime -> AnyPtr

public export
runCatsIO : CatsIO a -> IO a
runCatsIO c = pure $ unsafeCoerce $ flip unsafeRunSyncUnsafe globalIO $ unsafeCoerce c

public export
%foreign "jvm:ioPure(java/lang/Object cats/effect/IO),cats/effect/idris/Wrapper"
pureIOUnsafe : AnyPtr -> CatsIO AnyPtr

public export
pureIO : a -> CatsIO a
pureIO a = unsafeCoerce $ pureIOUnsafe $ unsafeCoerce a

%foreign "jvm:ioMap(java/lang/Object cats/effect/IO cats/effect/IO),cats/effect/idris/Wrapper"
mapIOUnsafe : AnyPtr -> CatsIO AnyPtr -> CatsIO AnyPtr

public export
mapIO : (a -> b) -> CatsIO a -> CatsIO b
mapIO f io = unsafeCoerce $ mapIOUnsafe (unsafeCoerce f) (unsafeCoerce io)

%foreign "jvm:ioAp(cats/effect/IO cats/effect/IO cats/effect/IO),cats/effect/idris/Wrapper"
apIOUnsafe : CatsIO (AnyPtr -> AnyPtr) -> CatsIO AnyPtr -> CatsIO AnyPtr

public export
apIO : CatsIO (a -> b) -> CatsIO a -> CatsIO b
apIO f io = unsafeCoerce $ apIOUnsafe (unsafeCoerce f) (unsafeCoerce io)

%foreign "jvm:ioBind(cats/effect/IO java/lang/Object cats/effect/IO),cats/effect/idris/Wrapper"
bindIOUnsafe : CatsIO AnyPtr -> AnyPtr -> CatsIO AnyPtr

public export
bindIO : CatsIO a -> (a -> CatsIO b) -> CatsIO b
bindIO io f = unsafeCoerce $ bindIOUnsafe (unsafeCoerce io) (unsafeCoerce f)