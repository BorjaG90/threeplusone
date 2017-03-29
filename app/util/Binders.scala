package util

/**
  * Created by Borja Gete on 13/02/17.
  */

import play.api.mvc._
object Binders {
  implicit def OptionBindable[T : PathBindable] = new PathBindable[Option[T]] {
    def bind(key: String, value: String): Either[String, Option[T]] =
      implicitly[PathBindable[T]].
        bind(key, value).
        fold(
          left => Left(left),
          right => Right(Some(right))
        )

    def unbind(key: String, value: Option[T]): String = value map (_.toString) getOrElse ""
  }
}