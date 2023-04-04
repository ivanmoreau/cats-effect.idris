module Cats.Effect.CatsIO.Unsafe

import Cats.Effect.CatsIO.CatsIO
import Cats.Effect.FiberIO.FiberIO

%foreign "jvm:unsafeCoerce,cats/effect/idris/Wrapper"
unsafeCoerce : forall a, b. a -> b

data ScalaFunction1 : Type -> Type -> Type where [external]

-- From rom scala/Function1 to java/lang/Function
%foreign "jvm:toJavaFun(scala/Function1 java/util/function/Function),cats/effect/idris/Wrapper"
toJavaFunction : ScalaFunction1 a b -> (a -> b)

-- From java/lang/Function to scala/Function1
%foreign "jvm:fromJavaFun(java/util/function/Function scala/Function1),cats/effect/idris/Wrapper"
unsafeFromJavaFunction : AnyPtr -> ScalaFunction1 a b

fromJavaFunction : (a -> b) -> ScalaFunction1 a b
fromJavaFunction f = unsafeFromJavaFunction $ unsafeCoerce f

data IORuntime : Type where [external]

%foreign "jvm:global(cats/effect/unsafe/IORuntime),cats/effect/unsafe/implicits"
globalIO : IORuntime

%foreign "jvm:unsafeRunSync(cats/effect/IO cats/effect/unsafe/IORuntime java/lang/Object),cats/effect/idris/Wrapper"
unsafeRunSyncUnsafe : CatsIO AnyPtr -> IORuntime -> AnyPtr

public export
runCatsIO : CatsIO a -> IO a
runCatsIO c = pure $ unsafeCoerce $ flip unsafeRunSyncUnsafe globalIO $ unsafeCoerce c

public export
%foreign "jvm:pure(java/lang/Object cats/effect/IO),cats/effect/IO"
pureIOUnsafe : a -> CatsIO a

public export
pureIO : a -> CatsIO a
pureIO = pureIOUnsafe

%foreign "jvm:.map(cats/effect/IO scala/Function1 cats/effect/IO),cats/effect/IO"
mapIOUnsafe : CatsIO a -> ScalaFunction1 a b -> CatsIO b

public export
mapIO : (a -> b) -> CatsIO a -> CatsIO b
mapIO f a = mapIOUnsafe a $ fromJavaFunction f

%foreign "jvm:.flatMap(cats/effect/IO scala/Function1 cats/effect/IO),cats/effect/IO"
bindIOUnsafe : CatsIO a -> ScalaFunction1 a (CatsIO b) -> CatsIO b

public export
bindIO : CatsIO a -> (a -> CatsIO b) -> CatsIO b
bindIO a f = bindIOUnsafe a $ fromJavaFunction f

%foreign "jvm:start(cats/effect/IO cats/effect/IO),cats/effect/idris/Wrapper"
startUnsafe : CatsIO AnyPtr -> CatsIO (FiberIO AnyPtr)

public export
start : CatsIO a -> CatsIO (FiberIO a)
start c = unsafeCoerce $ startUnsafe $ unsafeCoerce c

%foreign "jvm:sleep(Int cats/effect/IO),cats/effect/idris/Wrapper"
sleepUnsafe : Int -> CatsIO ()

public export
sleep : Int -> CatsIO ()
sleep = sleepUnsafe

%foreign "jvm:foreverIO(cats/effect/IO cats/effect/IO),cats/effect/idris/Wrapper"
foreverUnsafe : CatsIO AnyPtr -> CatsIO ()

public export
foreverIO : CatsIO a -> CatsIO ()
foreverIO a = foreverUnsafe $ unsafeCoerce a

%foreign "jvm:ifM(cats/effect/IO cats/effect/IO cats/effect/IO cats/effect/IO),cats/effect/idris/Wrapper"
ifMUnsafe : CatsIO Bool -> CatsIO AnyPtr -> CatsIO AnyPtr -> CatsIO AnyPtr

public export
ifM : CatsIO Bool -> CatsIO a -> CatsIO a -> CatsIO a
ifM a b c = unsafeCoerce $ ifMUnsafe a (unsafeCoerce b) (unsafeCoerce c)