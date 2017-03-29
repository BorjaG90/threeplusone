package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model.{Competition,CompetitionTable,Country,Season}
import mcgrady.dao.CompetitionDAO

/**
  * Created by Borja Gete on 14/02/17.
  */

class CompetitionDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends CompetitionDAO{

  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val competitions = TableQuery[CompetitionTable]

  override def add(competition: Competition): Future[String] = {
    db.run(competitions += competition).map(res => "Competición añadida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, competition: Competition): Future[Int] = {
    db.run(filterQuery(id).update(competition))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(competitions.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Competition]] = {
    db.run(competitions.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Competition] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(competitions.length.result)
  }

  override def listSimple: Future[Seq[Competition]] = {
    db.run(competitions.result)
  }

  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(Competition,Country,Season)]] = {
    val offset = pageSize * page
    val query =
      (for {
        competition <- competitions if competition.name.toLowerCase like filter.toLowerCase
        country <- competition.competition_country_fk
        season <-competition.competition_season_fk
      } yield (competition,country,season)).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

    private def count(filter: String): Future[Int] = {
    db.run(competitions.filter(_.name.toLowerCase like filter.toLowerCase()).length.result)
  }

  private def filterQuery(id: Long): Query[CompetitionTable, Competition, Seq] = {
    competitions.filter(_.id === id)
  }
}
