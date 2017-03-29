package mcgrady.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 29/03/17.
  */

case class Group(id: Option[Long], idCompetition: Long, name: String, notes: Option[String] = None
                  , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                 )

class GroupTable(tag:Tag) extends Table[Group](tag, "groups") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val competitionTable = TableQuery[CompetitionTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def idCompetition = column[Long]("id_competition")
  def name = column[String]("name")
  def notes = column[String]("notes")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def group_competition_fk = foreignKey("group_competition_fk", idCompetition, competitionTable)(_.id)

  override def * =(id.?, idCompetition, name, notes.?
    , creationDate, modifiedDate.?
  ) <>(Group.tupled, Group.unapply)
}
object GroupForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_competition" -> of[Long]
      ,"name" -> of[String]
      ,"notes" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Group.apply)(Group.unapply)
  )
}