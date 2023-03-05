module Cats.Effect.CatsIO.CatsIO

public export
data CatsIO : Type -> Type where [external]

public export
%foreign "jvm:ioPrintLn(String cats/effect/IO),cats/effect/idris/Wrapper"
catsPrintLn : String -> CatsIO ()

public export
%foreign "jvm:ioReadLn(cats/effect/IO),cats/effect/idris/Wrapper"
catsReadLn : CatsIO String