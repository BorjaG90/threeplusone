package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.TeamDAO
import mcgrady.model.{Team,Country}
import mcgrady.service.TeamService

/**
  * Created by Borja Gete on 27/03/17.
  */
@Singleton
class TeamServiceImpl @Inject()(teamDAO: TeamDAO)extends TeamService{
  override def add(team: Team): Future[String] = {
    teamDAO.add(team)
  }

  override def update(id: Long, team: Team): Future[Int] = {
    teamDAO.update(id, team)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    teamDAO.delete(id)
  }

  def listSimple: Future[Seq[Team]] = {
    teamDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Team,Country)]] ={
    teamDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    teamDAO.count
  }
  override def find(id: Long): Future[Team] = {
    teamDAO.findById(id)
  }
  def get(id: Long): Future[Option[Team]] = {
    teamDAO.get(id)
  }
}
