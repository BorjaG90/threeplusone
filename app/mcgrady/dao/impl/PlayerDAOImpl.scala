package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model.{Player, PlayerTable}
import mcgrady.dao.PlayerDAO

/**
  * Created by Borja Gete on 27/03/17.
  */

class PlayerDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends PlayerDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val players = TableQuery[PlayerTable]

  override def add(player: Player): Future[String] = {
    db.run(players += player).map(res => "Jugador añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, player: Player): Future[Int] = {
    db.run(filterQuery(id).update(player))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(players.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Player]] = {
    db.run(players.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Player] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(players.length.result)
  }
  override def listSimple: Future[Seq[Player]] = {
    db.run(players.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Player]] = {
    val offset = pageSize * page
    val query =
      (for {
        player <- players if player.lastName like filter.toLowerCase
      } yield player).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(players.filter(_.lastName like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[PlayerTable, Player, Seq] = {
    players.filter(_.id === id)
  }
}
