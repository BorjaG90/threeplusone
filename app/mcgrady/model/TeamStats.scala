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

case class TeamStats(id: Option[Long], idGame: Long, idInscription: Long, points: Option[Long]
                       , offReb: Option[Long] = None, defReb: Option[Long] = None, assists: Option[Long] = None
                       , blocks: Option[Long] = None, steals: Option[Long] = None, fouls: Option[Long] = None
                       , techFouls: Option[Long] = None, flagFouls: Option[Long] = None, turnovers: Option[Long] = None
                       , minutes: Option[Long] = None, fga: Option[Long] = None, fgm: Option[Long] = None
                       , fta: Option[Long] = None, ftm: Option[Long] = None, t3a: Option[Long] = None, t3m: Option[Long] = None
                      )

class TeamStatsTable(tag:Tag) extends Table[TeamStats](tag, "team_stats") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val gameTable = TableQuery[GameTable]
  val inscriptionTable = TableQuery[InscriptionTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def idGame = column[Long]("id_game")
  def idInscription = column[Long]("id_inscription")
  def points = column[Long]("points")
  def offReb = column[Long]("off_rebounds")
  def defReb = column[Long]("def_rebounds")
  def assists = column[Long]("assists")
  def blocks = column[Long]("blocks")
  def steals = column[Long]("steals")
  def fouls = column[Long]("fouls")
  def techFouls = column[Long]("tech_fouls")
  def flagFouls = column[Long]("flag_fouls")
  def turnovers = column[Long]("turnovers")
  def minutes = column[Long]("minutes")
  def fga = column[Long]("fg_attemped")
  def fgm = column[Long]("fg_made")
  def fta = column[Long]("ft_attemped")
  def ftm = column[Long]("ft_made")
  def t3a = column[Long]("t3_attemped")
  def t3m = column[Long]("t3_made")

  def tstats_game_fk = foreignKey("tstats_game_fk", idGame, gameTable)(_.id)
  def tstats_inscription_fk = foreignKey("tstats_inscription_fk", idInscription, inscriptionTable)(_.id)

  override def * =(id.?, idGame, idInscription, points.?, offReb.?, defReb.?, assists.?, blocks.?, steals.?
    , fouls.?, techFouls.?, flagFouls.?, turnovers.?, minutes.?, fga.?, fgm.?, fta.?, ftm.?, t3a.?, t3m.?
  ) <>(TeamStats.tupled, TeamStats.unapply)
}
object TeamStatsForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_game" -> of[Long]
      ,"id_inscription" -> of[Long]
      ,"points" -> optional(of[Long])
      ,"off_rebounds" -> optional(of[Long])
      ,"def_rebounds" -> optional(of[Long])
      ,"assists" -> optional(of[Long])
      ,"blocks" -> optional(of[Long])
      ,"steals" -> optional(of[Long])
      ,"fouls" -> optional(of[Long])
      ,"tech_fouls" -> optional(of[Long])
      ,"flag_fouls" -> optional(of[Long])
      ,"turnovers" -> optional(of[Long])
      ,"minutes" -> optional(of[Long])
      ,"fg_attemped" -> optional(of[Long])
      ,"fg_made" -> optional(of[Long])
      ,"ft_attemped" -> optional(of[Long])
      ,"ft_made" -> optional(of[Long])
      ,"t3_attemped" -> optional(of[Long])
      ,"t3_made" -> optional(of[Long])
    )(TeamStats.apply)(TeamStats.unapply)
  )
}