package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model.{Game, GameTable, Inscription, InscriptionTable, Player, PlayerTable, Arena, ArenaTable, Team}
import mcgrady.dao.GameDAO

/**
  * Created by Borja Gete on 1/04/17.
  */

class GameDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends GameDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val games = TableQuery[GameTable]
  val inscriptions = TableQuery[InscriptionTable]
  val players  = TableQuery[PlayerTable]
  val arenas  = TableQuery[ArenaTable]

  override def add(game: Game): Future[String] = {
    db.run(games += game).map(res => "Partido añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, game: Game): Future[Int] = {
    db.run(filterQuery(id).update(game))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(games.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Game]] = {
    db.run(games.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Game] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(games.length.result)
  }
  override def listSimple: Future[Seq[Game]] = {
    db.run(games.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(Game,Inscription,String,Inscription,String,Player,Arena)]] = {
    val offset = pageSize * page
    val query =
      (for {
        ((((game,home),visitor),mvp),arena) <- ((((
          games join inscriptions on (_.idHome === _.id)) join inscriptions on (_._1.idVisitor === _.id)
              ) join players on (_._1._1.mvp === _.id)) join arenas on (_._1._1._1.idArena === _.id))
        teamHome <- home.inscription_team_fk
        teamVisitor <- visitor.inscription_team_fk
        if teamHome.name like filter.toLowerCase
      } yield (game, home, teamHome.abrv, visitor, teamVisitor.abrv, mvp, arena)).drop(offset).take(pageSize)
    val totalRows = count
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  /*private def count(filter: String): Future[Int] = {
    db.run(games.filter(_.id === filter.toLong).length.result)
  }*/

  private def filterQuery(id: Long): Query[GameTable, Game, Seq] = {
    games.filter(_.id === id)
  }
}
