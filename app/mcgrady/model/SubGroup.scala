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

case class SubGroup(id: Option[Long], idGroup: Long, name: String, notes: Option[String] = None
                 , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                )

class SubGroupTable(tag:Tag) extends Table[SubGroup](tag, "subgroups") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val groupTable = TableQuery[GroupTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def idGroup = column[Long]("id_group")
  def name = column[String]("name")
  def notes = column[String]("notes")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def subGroup_group_fk = foreignKey("subgroup_group_fk", idGroup, groupTable)(_.id)

  override def * =(id.?, idGroup, name, notes.?
    , creationDate, modifiedDate.?
  ) <>(SubGroup.tupled, SubGroup.unapply)
}
object SubGroupForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_group" -> of[Long]
      ,"name" -> of[String]
      ,"notes" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(SubGroup.apply)(SubGroup.unapply)
  )
}