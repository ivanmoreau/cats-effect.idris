package cats.effect.idris

import cats.effect.unsafe.implicits.*
import cats.effect.IO
import cats.effect.FiberIO

import scala.concurrent.duration._
import java.util.function.Function
import cats.effect.unsafe.IORuntime

object Wrapper:
  def globalIO(): Any = global
  def unsafeRunSync(a: IO[Any], b: IORuntime): Any = a.unsafeRunSync()(b)
  
  def unsafeCoerce(tt: Any, tt2: Any, a: Any): Any = a

  def ioMap(a: Any, xs: IO[Any]): IO[Any] = xs.map(fromJavaFun(a.asInstanceOf[Function[Any, Any]])(_))

  def ioAp(a: IO[Function[Any, Any]], b: IO[Any]): IO[Any] = a.flatMap(f => b.map(f.apply))
  def ioPure(a: Any): IO[Any] = IO.pure(a)

  def ioBind(a: IO[Any], b: Any): IO[Any] = a.flatMap(b.asInstanceOf[Function[Any, IO[Any]]].apply)

  def start(a: IO[Any]): IO[FiberIO[Any]] = a.start

  def fromJavaFun(o: Function[Any, Any]): Function1[Any, Any] = o.apply
  def toJavaFun(o: Function1[Any, Any]): Function[Any, Any] = new Function[Any, Any] {
    def apply(t: Any): Any = o.apply(t)
  }

  def sleep(milli: Int): IO[Unit] = IO.sleep(milli.millisecond)

  def foreverIO(a: IO[Any]): IO[Any] = a.foreverM