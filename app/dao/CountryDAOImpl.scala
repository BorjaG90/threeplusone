package dao

/**
  * Created by borja on 14/02/17.
  */
import javax.inject.Inject

import model.{Country, CountryTable}
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import scala.concurrent.Future

class CountryDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends CountryDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val countries = TableQuery[CountryTable]

  override def list: Future[Seq[Country]] = {
    db.run(countries.result)
  }
}
