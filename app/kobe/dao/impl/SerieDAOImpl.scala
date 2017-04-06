package kobe.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import kobe.model.{Serie, SerieTable, Session, Exercise}
import kobe.dao.SerieDAO

/**
  * Created by Borja Gete on 1/04/17.
  */

class SerieDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends SerieDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val series = TableQuery[SerieTable]

  override def add(serie: kobe.model.Serie): Future[String] = {
    db.run(series += serie).map(res => "Serie añadida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, serie: kobe.model.Serie): Future[Int] = {
    db.run(filterQuery(id).update(serie))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(series.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[kobe.model.Serie]] = {
    db.run(series.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[kobe.model.Serie] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(series.length.result)
  }
  override def listSimple: Future[Seq[kobe.model.Serie]] = {
    db.run(series.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(Serie,kobe.model.Session,Exercise)]] = {
    val offset = pageSize * page
    val query =
      (for {
        serie <- series
        session <- serie.serie_session_fk
        exercise <- serie.serie_exercise_fk
      } yield (serie,session,exercise)).drop(offset).take(pageSize)
    val totalRows = count
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  /*private def count(filter: String): Future[Int] = {
    db.run(series.filter(_.name like filter.toLowerCase).length.result)
  }*/

  private def filterQuery(id: Long): Query[SerieTable, kobe.model.Serie, Seq] = {
    series.filter(_.id === id)
  }
}
