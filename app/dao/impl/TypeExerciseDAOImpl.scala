package dao.impl

import javax.inject.Inject
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import model.{TypeExercise, TypeExerciseTable}
import dao.TypeExerciseDAO
import util.Page

/**
  * Created by Borja Gete on 25/03/17.
  */

class TypeExerciseDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends TypeExerciseDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val typeExercises = TableQuery[TypeExerciseTable]

  override def add(typeExercise: TypeExercise): Future[String] = {
    db.run(typeExercises += typeExercise).map(res => "Tipo añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, typeExercise: TypeExercise): Future[Int] = {
    db.run(filterQuery(id).update(typeExercise))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(typeExercises.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[TypeExercise]] = {
    db.run(typeExercises.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[TypeExercise] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(typeExercises.length.result)
  }
  override def listSimple: Future[Seq[TypeExercise]] = {
    db.run(typeExercises.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[TypeExercise]] = {
    val offset = pageSize * page
    val query =
      (for {
        typeExercise <- typeExercises if typeExercise.name like filter.toLowerCase
      } yield typeExercise).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(typeExercises.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[TypeExerciseTable, TypeExercise, Seq] = {
    typeExercises.filter(_.id === id)
  }
}
