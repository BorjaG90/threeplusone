package mcgrady.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 20/03/17.
  */

case class Season(id: Option[Long], year: String, description: Option[String] = None
                  , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                 )

class SeasonTable(tag:Tag) extends Table[Season](tag, "seasons") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  def id = column[Long]("id", O.PrimaryKey)
  def year = column[String]("year")
  def description = column[String]("description")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  override def * =(id.?, year, description.?
    , creationDate, modifiedDate.?
  ) <> (Season.tupled, Season.unapply _)
}
object SeasonForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"year" -> of[String]
      ,"description" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Season.apply)(Season.unapply)
  )
}