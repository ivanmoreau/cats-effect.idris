package cats.effect.idris

import  cats.effect.FiberIO
import cats.effect.kernel.Outcome
import cats.effect.IO

object FiberIO:
  def join(a: FiberIO[Any]): IO[Outcome[IO, Throwable, Any]] = a.join