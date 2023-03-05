module Cats.Effect.Console.Unsafe

import Cats.Effect.CatsIO

public export
%foreign "jvm:ioPrintLn(String cats/effect/IO),cats/effect/idris/Console"
catsPrintLn : String -> CatsIO ()

public export
%foreign "jvm:ioReadLn(cats/effect/IO),cats/effect/idris/Console"
catsReadLn : CatsIO String