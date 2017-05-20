package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.PlayerStatsDAO
import mcgrady.model._
import mcgrady.service.PlayerStatsService

/**
  * Created by Borja Gete on 1/04/17.
  */

@Singleton
class PlayerStatsServiceImpl @Inject()(playerStatsDAO: PlayerStatsDAO)extends PlayerStatsService{
  override def add(playerStat: PlayerStats): Future[String] = {
    playerStatsDAO.add(playerStat)
  }

  override def update(id: Long, playerStats: PlayerStats): Future[Int] = {
    playerStatsDAO.update(id, playerStats)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    playerStatsDAO.delete(id)
  }

  def listSimple: Future[Seq[PlayerStats]] = {
    playerStatsDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(PlayerStats, Game, Player,Long, String,String)]] ={
    playerStatsDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    playerStatsDAO.count
  }
  override def find(id: Long): Future[PlayerStats] = {
    playerStatsDAO.findById(id)
  }
  def get(id: Long): Future[Option[PlayerStats]] = {
    playerStatsDAO.get(id)
  }
}
