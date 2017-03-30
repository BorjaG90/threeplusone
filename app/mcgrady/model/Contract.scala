package mcgrady.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 30/03/17.
  */

case class Contract(id: Option[Long], idPlayer: Long, idTeam: Long, initDate: Option[Date] = Some(new java.util.Date(0))
                    , endDate: Option[Date] = Some(new java.util.Date(0)), description: Option[String] = None
                    , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                   )

class ContractTable(tag:Tag) extends Table[Contract](tag, "contracts") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val playerTable = TableQuery[PlayerTable]
  val teamTable = TableQuery[TeamTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def idPlayer = column[Long]("id_player")
  def idTeam = column[Long]("id_team")
  def initDate = column[Date]("init_date")
  def endDate = column[Date]("end_date")
  def description = column[String]("description")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def contract_player_fk = foreignKey("contract_player_fk", idPlayer, playerTable)(_.id)
  def contract_team_fk = foreignKey("contract_team_fk", idTeam, teamTable)(_.id)

  override def * =(id.?, idPlayer, idTeam, initDate.?, endDate.?, description.?
    , creationDate, modifiedDate.?
  ) <>(Contract.tupled, Contract.unapply)
}
object ContractForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_player" -> of[Long]
      ,"id_team" -> of[Long]
      ,"init_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
      ,"end_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
      ,"description" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Contract.apply)(Contract.unapply)
  )
}