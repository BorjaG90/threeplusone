package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model._
import mcgrady.dao.InscriptionDAO

/**
  * Created by Borja Gete on 31/03/17.
  */

class InscriptionDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends InscriptionDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val inscriptions = TableQuery[InscriptionTable]
  val teams = TableQuery[TeamTable]
  val competitions = TableQuery[CompetitionTable]
  val groups = TableQuery[GroupTable]
  val subgroups = TableQuery[SubGroupTable]
  val arenas = TableQuery[ArenaTable]
  val seasons = TableQuery[SeasonTable]

  override def add(inscription: Inscription): Future[String] = {
    db.run(inscriptions += inscription).map(res => "Inscripcion a&ntilde;adida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, inscription: Inscription): Future[Int] = {
    db.run(filterQuery(id).update(inscription))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(inscriptions.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Inscription]] = {
    db.run(inscriptions.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Inscription] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(inscriptions.length.result)
  }
  override def listSimple: Future[Seq[Inscription]] = {
    db.run(inscriptions.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(Inscription,Team,Competition,Season)]] = {
    val offset = pageSize * page
    val query =
      (for {
        (((inscription,team),competition),season) <- ((inscriptions join teams on (_.idTeam === _.id)
            ) join competitions on (_._1.idCompetition === _.id)
          ) join seasons on (_._2.idSeason === _.id)
        if team.name like filter.toLowerCase
      } yield (inscription, team, competition, season)).sortBy(x=> (x._4.year,x._3.abrv,x._2.name)).drop(offset).take(pageSize)
    val totalRows = count
    val result = db.run(query.result)
    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  override def listFilterCompetition(filter: Long): Future[Seq[Inscription]] = {
    val query =
      (for {
        (((inscription,team),competition),season) <- ((inscriptions join teams on (_.idTeam === _.id)
          ) join competitions on (_._1.idCompetition === _.id)
          ) join seasons on (_._2.idSeason === _.id)
        if (competition.id === filter) || (filter == 0)
      } yield inscription)
   db.run(query.result)
  }

  /*private def count(filter: String): Future[Int] = {
    db.run(inscriptions.filter(_.id === filter.toLong).length.result)
  }*/

  private def filterQuery(id: Long): Query[InscriptionTable, Inscription, Seq] = {
    inscriptions.filter(_.id === id)
  }
}
