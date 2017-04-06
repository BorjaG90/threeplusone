package mcgrady.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 1/04/17.
  */

case class Game(id: Option[Long], idHome: Long, idVisitor: Long, dateGame: Date, idArena: Option[Long] = None
                , winner: Option[String] = None, mvp: Option[Long] = None, description: Option[String] = None
                , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
               )

class GameTable(tag:Tag) extends Table[Game](tag, "games") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val inscriptionTable = TableQuery[InscriptionTable]
  val playerTable = TableQuery[PlayerTable]
  val arenaTable = TableQuery[ArenaTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def idHome = column[Long]("id_home")
  def idVisitor = column[Long]("id_visitor")
  def dateGame = column[Date]("date")
  def idArena = column[Long]("id_arena")
  def winner = column[String]("winner")
  def mvp = column[Long]("mvp")
  def description = column[String]("description")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def game_home_fk = foreignKey("game_home_fk", idHome, inscriptionTable)(_.id)
  def game_visitor_fk = foreignKey("game_visitor_fk", idVisitor, inscriptionTable)(_.id)
  def game_mvp_fk = foreignKey("game_mvp_fk", mvp, playerTable)(_.id)
  def game_arena_fk = foreignKey("game_arena_fk", idArena, arenaTable)(_.id)

  override def * =(id.?, idHome, idVisitor, dateGame, idArena.?, winner.?, mvp.?, description.?
    , creationDate, modifiedDate.?
  ) <>(Game.tupled, Game.unapply)
}
object GameForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_home" -> of[Long]
      ,"id_visitor" -> of[Long]
      ,"date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"id_arena" -> optional(of[Long])
      ,"winner" -> optional(of[String])
      ,"mvp" -> optional(of[Long])
      ,"description" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Game.apply)(Game.unapply)
  )
}