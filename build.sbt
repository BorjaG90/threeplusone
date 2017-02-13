name := """Three Plus One"""
version := "1.0"
scalaVersion := "2.11.8"

lazy val root = (project in file(".")).enablePlugins(PlayScala)
pipelineStages := Seq(digest)

libraryDependencies ++= Seq(
  cache,
  ws,
  "mysql" % "mysql-connector-java" % "5.1.40",
  "com.typesafe.play" %% "play-slick" % "2.0.0",
  "com.typesafe.play" %% "play-slick-evolutions" % "2.0.0"
)

resolvers += "scalaz-bintray" at "http://dl.bintray.com/scalaz/releases"

routesGenerator := InjectedRoutesGenerator
routesImport += "extension.Binders._"

fork in run := true