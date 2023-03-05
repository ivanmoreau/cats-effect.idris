package cats.effect.idris

import cats.effect.IO
import cats.effect.Ref

object Ref:
  def refIO(a: Any): IO[Ref[IO, Any]] = IO.ref(a)

  def getIO(a: Ref[IO, Any]): IO[Any] = a.get

  def setIO(a: Any, b: Ref[IO, Any]): IO[Unit] = b.set(a)