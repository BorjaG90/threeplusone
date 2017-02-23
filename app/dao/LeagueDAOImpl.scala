package dao

import javax.inject.Inject

import model.{League,LeagueTable,Page,Country}
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

/**
  * Created by Borja Gete on 14/02/17.
  */

class LeagueDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends LeagueDAO{

  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val leagues = TableQuery[LeagueTable]

  override def add(league: League): Future[String] = {
    db.run(leagues += league).map(res => "Liga añadida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, league: League): Future[Int] = {
    db.run(filterQuery(id).update(league))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(leagues.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[League]] = {
    db.run(leagues.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[League] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(leagues.length.result)
  }

  /*override def list: Future[Seq[(League,String)]] ={
    db.run {
      (for {
        league <- leagues
        country <- league.league_country_fk
      } yield (league, country.name)).result
    }
  }*/
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(League,Country)]] = {
    val offset = pageSize * page
    val query =
      (for {
        league <- leagues if league.name.toLowerCase like filter.toLowerCase
        country <- league.league_country_fk
      //} yield (league,country)).drop(offset).take(pageSize)
      } yield (league,country)).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(leagues.filter(_.name.toLowerCase like filter.toLowerCase()).length.result)
  }

  private def filterQuery(id: Long): Query[LeagueTable, League, Seq] = {
    leagues.filter(_.id === id)
  }
}
