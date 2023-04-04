module Cats.Effect.Ref.Unsafe

import Cats.Effect.Ref.Ref
import Cats.Effect.CatsIO

%foreign "jvm:ref(java/lang/Object cats/effect/IO),cats/effect/IO"
unsafeRefIO : a -> CatsIO (Ref CatsIO a)

public export
refIO : a -> CatsIO (Ref CatsIO a)
refIO = unsafeRefIO

%foreign "jvm:.set(cats/effect/kernel/Ref java/lang/Object java/lang/Object),cats/effect/kernel/Ref"
unsafeSetIO : Ref CatsIO a -> a -> CatsIO ()

public export
setIO : a -> Ref CatsIO a -> CatsIO () 
setIO = flip unsafeSetIO

%foreign "jvm:.get(cats/effect/kernel/Ref java/lang/Object),cats/effect/kernel/Ref"
unsafeGetIO : Ref CatsIO a -> CatsIO a

public export
getIO : Ref CatsIO a -> CatsIO a
getIO = unsafeGetIO