package kobe.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 1/04/17.
  */

case class Record(id: Option[Long], idUnit: Long, idSerie: Long, value: Long, notes: Option[String] = None, typeR: String
                  , exeDate: Option[Date] = Some(new java.util.Date(0)), creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                )
case class ShotChart(idSerie: Long,shots: List[Shot])
case class Shot(value: Option[Long], notes: Option[String] = None)

class RecordTable(tag:Tag) extends Table[Record](tag, "records") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val unitTable = TableQuery[UnitTable]
  val serieTable = TableQuery[SerieTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def idUnit = column[Long]("id_unit")
  def idSerie = column[Long]("id_serie")
  def value = column[Long]("value")
  def notes = column[String]("notes")
  def typeR = column[String]("type")
  def exeDate = column[Date]("execution_date")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def record_unit_fk = foreignKey("record_unit_fk", idUnit, unitTable)(_.id)
  def record_serie_fk = foreignKey("record_serie_fk", idSerie, serieTable)(_.id)

  override def * =(id.?, idUnit, idSerie, value, notes.?, typeR, exeDate.?
    , creationDate, modifiedDate.?
  ) <>(Record.tupled, Record.unapply)
}
object RecordForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_unit" -> of[Long]
      ,"id_serie" -> of[Long]
      ,"value" -> of[Long]
      ,"notes" -> optional(of[String])
      ,"type" -> of[String]
      ,"execution_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Record.apply)(Record.unapply)
  )
  val shotChartForm = Form(
    mapping(
      "id_serie" -> of[Long]
      ,"shots" -> list(mapping(
        "value" -> optional(of[Long])
        ,"notes" -> optional(of[String])
      )(Shot.apply)(Shot.unapply))
    )(ShotChart.apply)(ShotChart.unapply)
  )
}
