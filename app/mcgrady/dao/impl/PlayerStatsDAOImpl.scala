package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import java.util.logging._
import util.Page
import mcgrady.model._
import mcgrady.dao.PlayerStatsDAO

/**
  * Created by Borja Gete on 1/04/17.
  */

class PlayerStatsDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends PlayerStatsDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val playerStats = TableQuery[PlayerStatsTable]
  val games = TableQuery[GameTable]
  val inscriptions = TableQuery[InscriptionTable]
  val players = TableQuery[PlayerTable]

  override def add(playerStat: PlayerStats): Future[String] = {
    db.run(playerStats += playerStat).map(res => "Línea estadística añadida satisfactoriamente").recover {
      case ex : Exception => "" + ex.getCause.getMessage
      case ex : RuntimeException => "" + ex.getCause.getMessage
    }
  }

  override def update(id: Long, playerStat: PlayerStats): Future[Int] = {
    db.run(filterQuery(id).update(playerStat))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(playerStats.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[PlayerStats]] = {
    db.run(filterQuery(id).result.headOption)
  }

  override def findById(id: Long): Future[PlayerStats] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(playerStats.length.result)
  }
  override def listSimple: Future[Seq[PlayerStats]] = {
    db.run(playerStats.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(PlayerStats, Game, Player, Long, String, String)]] = {
    val offset = pageSize * page
    val query =
      (for {
        ((((playerStat,player),game),home),visitor) <- ((((playerStats join players on (_.idPlayer === _.id))
        join games on (_._1.idGame === _.id))
        join inscriptions on(_._2.idHome === _.id))
        join inscriptions on(_._1._2.idVisitor === _.id))
        homeT <- home.inscription_team_fk
        visitorT <- visitor.inscription_team_fk
        if player.lastName like filter.toLowerCase
      } yield (playerStat, game, player, home.idCompetition, homeT.abrv, visitorT.abrv)).drop(offset).take(pageSize)
    val totalRows = count
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  /*private def count(filter: String): Future[Int] = {
    db.run(playerStats.filter(_.id === filter.toLong).length.result)
  }*/

  private def filterQuery(id:Long): Query[PlayerStatsTable, PlayerStats, Seq] = {
    playerStats.filter(_.id === id)
  }
}
