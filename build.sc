import mill._, scalalib._

object catsEffectIdris extends ScalaModule {
  override def scalaVersion = "3.2.2"
  override def ivyDeps = Agg(
    ivy"org.typelevel::cats-effect:3.4.8"
  )
}