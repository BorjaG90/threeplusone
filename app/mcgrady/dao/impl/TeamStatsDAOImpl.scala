package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import  java.util.logging._
import util.Page
import mcgrady.model.{TeamStats, TeamStatsTable, Game, GameTable, Inscription, InscriptionTable,Team,TeamTable}
import mcgrady.dao.TeamStatsDAO

/**
  * Created by Borja Gete on 1/04/17.
  */

class TeamStatsDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends TeamStatsDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val teamStats = TableQuery[TeamStatsTable]
  val inscriptions = TableQuery[InscriptionTable]
  val games = TableQuery[GameTable]
  val teams = TableQuery[TeamTable]

  override def add(teamStat: TeamStats): Future[String] = {
    db.run(teamStats += teamStat).map(res => "Línea estadística añadida satisfactoriamente").recover {
      case ex : Exception => "" + ex.getCause.getMessage
      case ex : RuntimeException => "" + ex.getCause.getMessage
    }
  }

  override def update(id: Long, teamStat: TeamStats): Future[Int] = {
    db.run(filterQuery(id).update(teamStat))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(teamStats.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[TeamStats]] = {
    db.run(filterQuery(id).result.headOption)
  }

  override def findById(id: Long): Future[TeamStats] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(teamStats.length.result)
  }
  override def listSimple: Future[Seq[TeamStats]] = {
    db.run(teamStats.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(TeamStats, Game, Inscription, String,String,String)]] = {
    val offset = pageSize * page
    val query =
      (for {
        (((((teamStat,inscription),game),home),visitor),team) <- (((((teamStats join inscriptions on (_.idInscription === _.id))
        join games on (_._1.idGame === _.id))
        join inscriptions on(_._2.idHome === _.id))
        join inscriptions on(_._1._2.idVisitor === _.id))
        join teams on(_._1._1._1._2.idTeam === _.id))
        homeT <- home.inscription_team_fk
        visitorT <- visitor.inscription_team_fk
        if team.name like filter.toLowerCase
      } yield (teamStat, game, inscription, team.name, homeT.abrv, visitorT.abrv)).sortBy(x=> x._2.id).drop(offset).take(pageSize)
    val totalRows = count
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  /*private def count(filter: String): Future[Int] = {
    db.run(teamStats.filter(_.id === filter.toLong).length.result)
  }*/

  private def filterQuery(id:Long): Query[TeamStatsTable, TeamStats, Seq] = {
    teamStats.filter(_.id === id)
  }
}
