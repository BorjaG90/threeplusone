package model

/**
  * Created by borja on 8/02/17.
  */
import play.api.Play
import play.api.db.slick.DatabaseConfigProvider
import scala.concurrent.Future
import slick.driver.JdbcProfile
import slick.driver.MySQLDriver.api._

case class Country(id: Long, name: String, abbreviation: String)

class CountryTable(tag:Tag) extends Table[Country](tag, "countries") {
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def abrev = column[String]("abbreviation")

  override def * =(id, name, abrev) <>(Country.tupled, Country.unapply)
}
object Countries {
  val dbConfig = DatabaseConfigProvider.get[JdbcProfile](Play.current)
  //val dbConfig = MySQLDriver.api.
  val countriesTable = TableQuery[CountryTable]
  def listAll: Future[Seq[Country]] = {
    dbConfig.db.run(countriesTable.result)
  }
}