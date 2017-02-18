package model

/**
  * Created by Borja Gete on 9/02/17.
  */
import play.api.data.Form
import play.api.data.Forms._
import slick.driver.MySQLDriver.api._

case class League(id: Option[Long] = None, name: String, abbreviation: Option[String] = None, division: String, id_country: Option[Long] = Some(1L))

class LeagueTable(tag:Tag) extends Table[League](tag, "leagues") {
  val countriesTable = TableQuery[CountryTable]
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def abbreviation = column[String]("abbreviation")
  def division = column[String]("division")
  def id_country = column[Long]("id_country")
  def league_country_fk = foreignKey("league_country_fk", id_country, countriesTable)(_.id)
  override def * =(id.?, name, abbreviation.?, division, id_country.?) <> (League.tupled, League.unapply _)
}
object LeagueForm {
  val form = Form(
    mapping(
      "id" -> optional(longNumber),
      "name" -> nonEmptyText,
      "abbreviation" -> optional(nonEmptyText),
      "division" -> nonEmptyText,
      "id_country" -> optional(longNumber)
    )(League.apply)(League.unapply)
  )
}