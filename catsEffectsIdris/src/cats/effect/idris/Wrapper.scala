package cats.effect.idris

import cats.effect.unsafe.implicits._
import cats.effect.IO

object Wrapper {
  def globalIO(): Any = global
  def unsafeCoerce(tt: Any, tt2: Any, a: Any): Any = a
}