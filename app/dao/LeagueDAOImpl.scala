package dao

import javax.inject.Inject

import model.{League,LeagueTable}
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
/**
  * Created by borja on 14/02/17.
  */

class LeagueDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends LeagueDAO{

  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val leagues = TableQuery[LeagueTable]
  def add(league: League): Future[String] = {
    db.run(leagues += league).map(res => "Liga añadida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }
  def get(id: Long): Future[Option[League]] = {
    db.run(leagues.filter(_.id === id).result.headOption)
  }
  def delete(id: Option[Long]): Future[Int] = {
    db.run(leagues.filter(_.id === id).delete)
  }
  def count: Future[Int] = {
    db.run(leagues.length.result)
  }
  def list: Future[Seq[(League,String)]] ={
    db.run {
      (for {
        league <- leagues
        country <- league.league_country_fk
      } yield (league, country.name)).result
    }
  }
}
