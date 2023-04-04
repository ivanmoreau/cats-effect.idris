package cats.effect.idris

import cats.effect.unsafe.implicits.*
import cats.effect.IO
import cats.effect.FiberIO

import scala.concurrent.duration._
import java.util.function.Function
import cats.effect.unsafe.IORuntime

object Wrapper:

  def unsafeRunSync(a: IO[Any], b: IORuntime): Any = a.unsafeRunSync()(b)
  
  def unsafeCoerce(a: Any): Any = a

  def start(a: IO[Any]): IO[FiberIO[Any]] = a.start

  def fromJavaFun(o: Function[Any, Any]): Function1[Any, Any] = o.apply
  def toJavaFun(o: Function1[Any, Any]): Function[Any, Any] = new Function[Any, Any] {
    def apply(t: Any): Any = o.apply(t)
  }

  def sleep(milli: Int): IO[Unit] = IO.sleep(milli.millisecond)

  def foreverIO(a: IO[Any]): IO[Any] = a.foreverM

  def ifM(c: IO[Int], a: IO[Any], b: IO[Any]): IO[Any] = c.map(a => if a == 0 then false else true).ifM(a, b)