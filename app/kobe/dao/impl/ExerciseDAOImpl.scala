package kobe.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import kobe.model.{Exercise, ExerciseTable, TypeExercise,TypeExerciseTable, Category, CategoryTable, Enviroment,EnviromentTable}
import kobe.dao.ExerciseDAO

/**
  * Created by Borja Gete on 30/03/17.
  */

class ExerciseDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends ExerciseDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val exercises = TableQuery[ExerciseTable]
  val enviroments = TableQuery[EnviromentTable]
  val typeExercises = TableQuery[TypeExerciseTable]
  val categories = TableQuery[CategoryTable]

  override def add(exercise: kobe.model.Exercise): Future[String] = {
    db.run(exercises += exercise).map(res => "Ejercicio añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, exercise: kobe.model.Exercise): Future[Int] = {
    db.run(filterQuery(id).update(exercise))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(exercises.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[kobe.model.Exercise]] = {
    db.run(exercises.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[kobe.model.Exercise] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(exercises.length.result)
  }
  override def listSimple: Future[Seq[kobe.model.Exercise]] = {
    db.run(exercises.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Exercise]] = {
    val offset = pageSize * page
    val query =
      (for {
        //exercise <- exercises if exercise.name like filter.toLowerCase
        exercise <- exercises if exercise.name.toLowerCase like filter.toLowerCase
      } yield exercise).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(exercises.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[ExerciseTable, kobe.model.Exercise, Seq] = {
    exercises.filter(_.id === id)
  }
  private def filterName(filter: String): Query[ExerciseTable, kobe.model.Exercise, Seq] = {
    exercises.filter(_.name like filter.toLowerCase)
  }

}
