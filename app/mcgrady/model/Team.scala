package mcgrady.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 27/03/17.
  */

case class Team(id: Option[Long], name: String,abrv: String,id_country: Option[Long] = Some(1L)
                 , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                )

class TeamTable(tag:Tag) extends Table[Team](tag, "teams") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val countriesTable = TableQuery[CountryTable]

  def id = column[Long]("id", O.PrimaryKey)
  def name = column[String]("name")
  def abrv = column[String]("abbreviation")
  def id_country = column[Long]("id_country")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def team_country_fk = foreignKey("team_country_fk", id_country, countriesTable)(_.id)

  override def * =(id.?, name, abrv, id_country.?
    , creationDate, modifiedDate.?
  ) <> (Team.tupled, Team.unapply _)
}
object TeamForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"name" -> of[String]
      ,"abbreviation" -> of[String]
      ,"id_country" -> optional(of[Long])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Team.apply)(Team.unapply)
  )
}