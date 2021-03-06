package mcgrady.dao.impl

import scala.concurrent.Future
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import mcgrady.model.{Country, CountryTable}
import mcgrady.dao.CountryDAO


/**
  * Created by Borja Gete on 14/02/17.
  */

class CountryDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends CountryDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val countries = TableQuery[CountryTable]

  override def list: Future[Seq[Country]] = {
    db.run(countries.result)
  }

  override def findById(id: Long): Future[Country] = {
    db.run(filterQuery(id).result.head)
  }
  override def count: Future[Int] = {
    db.run(countries.length.result)
  }

  private def filterQuery(id: Long): Query[CountryTable, Country, Seq] = {
    countries.filter(_.id === id)
  }
}
