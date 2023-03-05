package cats.effect.idris

import cats.effect.IO
import cats.effect.std

object Console:
  def ioPrintLn(t: String): IO[Unit] = std.Console[IO].println(t)
  def ioReadLn(): IO[String] = std.Console[IO].readLine