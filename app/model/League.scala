package model

/**
  * Created by borja on 9/02/17.
  */
import play.api.Play
import play.api.data.Form
import play.api.data.Forms._
import play.api.db.slick.DatabaseConfigProvider
import scala.concurrent.Future
import slick.driver.JdbcProfile
import slick.driver.MySQLDriver.api._
import scala.concurrent.ExecutionContext.Implicits.global

case class League(id: Long, name: String, abbreviation: Option[String] = None, division: String, id_country: Option[Long] = Some(1L))
class LeagueTable(tag:Tag) extends Table[League](tag, "leagues") {
  val countriesTable = TableQuery[CountryTable]
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def abbreviation = column[String]("abbreviation")
  def division = column[String]("division")
  def id_country = column[Long]("id_country")
  def league_country_fk = foreignKey("league_country_fk", id_country, countriesTable)(_.id)
  override def * =(id, name, abbreviation.?, division, id_country.?) <> (League.tupled, League.unapply _)
}
object LeagueForm {
  val form = Form(
    mapping(
      "id" -> longNumber,
      "name" -> nonEmptyText,
      "abbreviation" -> optional(nonEmptyText),
      "division" -> nonEmptyText,
      "id_country" -> optional(longNumber)
    )(League.apply)(League.unapply)
  )
}
object Leagues {
  val dbConfig = DatabaseConfigProvider.get[JdbcProfile](Play.current)
  val leaguesTable = TableQuery[LeagueTable]
  def add(league: League): Future[String] = {
    dbConfig.db.run(leaguesTable += league).map(res => "Liga añadida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }
  def delete(id: Long): Future[Int] = {
    dbConfig.db.run(leaguesTable.filter(_.id === id).delete)
  }
  def list: Future[Seq[(League,String)]] ={
    dbConfig.db.run {
      (for {
        league <- leaguesTable
        country <- league.league_country_fk
      } yield (league, country.name)).result
    }
  }

}