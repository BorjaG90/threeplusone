package kobe.model

import play.api.data._
import play.api.data.Forms._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 20/03/17.
  */

case class Unit(id: Option[Long], name: String, description: Option[String] = None, typeUnit: String
                , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
               )

class UnitTable(tag:Tag) extends Table[Unit](tag, "units") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))
  
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def desc = column[String]("description")
  def typeUnit = column[String]("type")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")
  
  override def * =(id.?, name, desc.?, typeUnit
    , creationDate, modifiedDate.?
  ) <>(Unit.tupled, Unit.unapply)
}
object UnitForm {
  val form = Form(
    mapping(
      "id" -> optional(longNumber)
      ,"name" -> nonEmptyText
      ,"description" -> optional(nonEmptyText)
      ,"type" -> nonEmptyText
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Unit.apply)(Unit.unapply)
  )
}