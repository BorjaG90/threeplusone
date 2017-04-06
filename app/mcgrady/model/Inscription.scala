package mcgrady.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 31/03/17.
  */

case class Inscription(id: Option[Long], idTeam: Long, idSubGroup: Long, idArena: Option[Long] = None
                    , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                   )

class InscriptionTable(tag:Tag) extends Table[Inscription](tag, "inscriptions") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val teamTable = TableQuery[TeamTable]
  val subGroupTable = TableQuery[SubGroupTable]
  val arenaTable = TableQuery[ArenaTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def idTeam = column[Long]("id_team")
  def idSubGroup = column[Long]("id_subgroup")
  def idArena = column[Long]("id_arena")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def inscription_team_fk = foreignKey("inscription_team_fk", idTeam, teamTable)(_.id)
  def inscription_subgroup_fk = foreignKey("inscription_subgroup_fk", idTeam, subGroupTable)(_.id)
  def inscription_arena_fk = foreignKey("inscription_arena_fk", idTeam, arenaTable)(_.id)

  override def * =(id.?, idTeam, idSubGroup, idArena.?
    , creationDate, modifiedDate.?
  ) <>(Inscription.tupled, Inscription.unapply)
}
object InscriptionForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_team" -> of[Long]
      ,"id_subgroup" -> of[Long]
      ,"id_arena" -> optional(of[Long])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Inscription.apply)(Inscription.unapply)
  )
}