import mill._, scalalib._

object catsEffectIdris extends ScalaModule {
  override def scalaVersion = "2.13.10"
  override def ivyDeps = Agg(
    ivy"org.typelevel::cats-effect:3.4.8"
  )
}