package kobe.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 28/03/17.
  */

case class Plan(id: Option[Long], name: String, date: Option[Date] = Some(new java.util.Date(0))
                ,description: Option[String] = None, notes: Option[String] = None
                , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
               )

class PlanTable(tag:Tag) extends Table[Plan](tag, "plans") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def date = column[Date]("date")
  def desc = column[String]("description")
  def notes = column[String]("notes")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  override def * =(id.?, name, date.?, desc.?, notes.?
    , creationDate, modifiedDate.?
  ) <>(Plan.tupled, Plan.unapply)
}
object PlanForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"name" -> of[String]
      ,"date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
      ,"description" -> optional(of[String])
      ,"notes" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Plan.apply)(Plan.unapply)
  )
}