package mcgrady.model

import play.api.data.Form
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 9/02/17.
  */

case class Competition(id: Option[Long] = None
                       ,id_season: Long
                       ,name: String
                       ,abbreviation: Option[String] = None
                       ,division: Option[String] = None
                       ,id_country: Option[Long] = Some(1L)
                       ,description: Option[String] = None
                       ,typeCompetition: String
                       ,initDate: Option[Date] = Some(new java.util.Date(0))
                       ,endDate: Option[Date] = Some(new java.util.Date(0))
                       ,creationDate: Date
                       ,modifiedDate: Option[Date] = Some(new java.util.Date(0))
)

class CompetitionTable(tag: Tag) extends Table[Competition](tag, "competitions") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val countriesTable = TableQuery[CountryTable]
  val seasonsTable = TableQuery[SeasonTable]

  def id = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def id_season = column[Long]("id_season")
  def name = column[String]("name")
  def abbreviation = column[String]("abbreviation")
  def division = column[String]("division")
  def id_country = column[Long]("id_country")
  def description = column[String]("description")
  def typeCompetition = column[String]("type")
  def initDate = column[Date]("init_date")
  def endDate = column[Date]("end_date")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def competition_country_fk = foreignKey("competition_country_fk", id_country, countriesTable)(_.id)
  def competition_season_fk = foreignKey("competition_season_fk", id_season, seasonsTable)(_.id)

  override def * = (id.?, id_season, name, abbreviation.?, division.?, id_country.?,
    description.?, typeCompetition
    , initDate.?, endDate.?
    , creationDate, modifiedDate.?
  ) <> (Competition.tupled, Competition.unapply _)
}

object CompetitionForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_season" -> of[Long]
      ,"name" -> of[String]
      ,"abbreviation" -> optional(of[String])
      ,"division" -> optional(of[String])
      ,"id_country" -> optional(of[Long])
      ,"description" -> optional(of[String])
      ,"type" -> default(of[String],"Liga")
      ,"init_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
      ,"end_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Competition.apply)(Competition.unapply)
  )
}