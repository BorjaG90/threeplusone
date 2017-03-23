package dao.impl

import javax.inject.Inject
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import model.{Season, SeasonTable}
import dao.SeasonDAO
import util.Page

/**
  * Created by Borja Gete on 20/03/17.
  */

class SeasonDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends SeasonDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val seasons = TableQuery[SeasonTable]

  override def add(season: Season): Future[String] = {
    db.run(seasons += season).map(res => "Temporada añadida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, season: Season): Future[Int] = {
    db.run(filterQuery(id).update(season))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(seasons.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Season]] = {
    db.run(seasons.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Season] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(seasons.length.result)
  }
  override def listSimple: Future[Seq[Season]] = {
    db.run(seasons.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Season]] = {
    val offset = pageSize * page
    val query =
      (for {
        season <- seasons if season.year like filter.toLowerCase
      } yield season).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(seasons.filter(_.year like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[SeasonTable, Season, Seq] = {
    seasons.filter(_.id === id)
  }
}
