package kobe.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 29/03/17.
  */

case class Session(id: Option[Long], name: String, idPlan: Long, notes: Option[String] = None
                , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
               )

class SessionTable(tag:Tag) extends Table[Session](tag, "sessions") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val planTable = TableQuery[PlanTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def idPlan = column[Long]("id_plan")
  def notes = column[String]("notes")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def session_plan_fk = foreignKey("session_plan_fk", idPlan, planTable)(_.id)

  override def * =(id.?, name, idPlan, notes.?
    , creationDate, modifiedDate.?
  ) <>(Session.tupled, Session.unapply)
}
object SessionForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"name" -> of[String]
      ,"id_plan" -> of[Long]
      ,"notes" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Session.apply)(Session.unapply)
  )
}