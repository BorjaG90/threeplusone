package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model.{Team, TeamTable, Country}
import mcgrady.dao.TeamDAO

/**
  * Created by Borja Gete on 27/03/17.
  */

class TeamDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends TeamDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val teams = TableQuery[TeamTable]

  override def add(team: Team): Future[String] = {
    db.run(teams += team).map(res => "Equipo a&ntilde;adido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, team: Team): Future[Int] = {
    db.run(idQuery(id).update(team))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(teams.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Team]] = {
    db.run(teams.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Team] ={
    db.run(idQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(teams.length.result)
  }
  override def listSimple: Future[Seq[Team]] = {
    db.run(teams.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Team]] = {
    val offset = pageSize * page
    val query =
      (for {
        team <- teams if team.name like filter.toLowerCase
      } yield team).sortBy(_.name.asc.nullsLast).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(teams.filter(_.name like filter.toLowerCase).length.result)
  }

  private def idQuery(id: Long): Query[TeamTable, Team, Seq] = {
    teams.filter(_.id === id)
  }

  def findTeamsByName(name:String): Future[Seq[Team]] = {
    db.run(nameQuery(name).result)
  }

  def nameQuery(name: String): Query[TeamTable, Team, Seq] = {
    teams.filter(_.name.toLowerCase like name.toLowerCase())
  }
}
