package cats.effect.idris

import cats.effect.unsafe.implicits.*
import cats.effect.IO

import java.util.function.Function
import cats.effect.std
import cats.effect.unsafe.IORuntime

object Wrapper:
  def globalIO(): Any = global
  def unsafeRunSync(a: IO[Any], b: IORuntime): Any = a.unsafeRunSync()(b)
  
  def unsafeCoerce(tt: Any, tt2: Any, a: Any): Any = a

  def ioMap(a: Any, xs: IO[Any]): IO[Any] = xs.map(fromJavaFun(a.asInstanceOf[Function[Any, Any]])(_))

  def ioAp(a: IO[Function[Any, Any]], b: IO[Any]): IO[Any] = a.flatMap(f => b.map(f.apply))
  def ioPure(a: Any): IO[Any] = IO.pure(a)

  def ioBind(a: IO[Any], b: Any): IO[Any] = a.flatMap(b.asInstanceOf[Function[Any, IO[Any]]].apply)

  def fromJavaFun(o: Function[Any, Any]): Function1[Any, Any] = o.apply
  def toJavaFun(o: Function1[Any, Any]): Function[Any, Any] = new Function[Any, Any] {
    def apply(t: Any): Any = o.apply(t)
  }

  def ioPrintLn(t: String): IO[Unit] = std.Console[IO].println(t)
  def ioReadLn(): IO[String] = std.Console[IO].readLine
