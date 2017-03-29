package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.PlayerDAO
import mcgrady.model.Player
import mcgrady.service.PlayerService

/**
  * Created by Borja Gete on 25/03/17.
  */

@Singleton
class PlayerServiceImpl @Inject()(playerDAO: PlayerDAO)extends PlayerService{
  override def add(player: Player): Future[String] = {
    playerDAO.add(player)
  }

  override def update(id: Long, player: Player): Future[Int] = {
    playerDAO.update(id, player)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    playerDAO.delete(id)
  }

  def listSimple: Future[Seq[Player]] = {
    playerDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[Player]] ={
    playerDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    playerDAO.count
  }
  override def find(id: Long): Future[Player] = {
    playerDAO.findById(id)
  }
  def get(id: Long): Future[Option[Player]] = {
    playerDAO.get(id)
  }
}
