package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.TeamStatsDAO
import mcgrady.model.{TeamStats, Game, Inscription}
import mcgrady.service.TeamStatsService

/**
  * Created by Borja Gete on 1/04/17.
  */

@Singleton
class TeamStatsServiceImpl @Inject()(teamStatsDAO: TeamStatsDAO)extends TeamStatsService{
  override def add(teamStat: TeamStats): Future[String] = {
    teamStatsDAO.add(teamStat)
  }

  override def update(id: Long, teamStats: TeamStats): Future[Int] = {
    teamStatsDAO.update(id, teamStats)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    teamStatsDAO.delete(id)
  }

  def listSimple: Future[Seq[TeamStats]] = {
    teamStatsDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(TeamStats, Game, Inscription,String,String,String)]] ={
    teamStatsDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    teamStatsDAO.count
  }
  override def find(id: Long): Future[TeamStats] = {
    teamStatsDAO.findById(id)
  }
  def get(id: Long): Future[Option[TeamStats]] = {
    teamStatsDAO.get(id)
  }
}
