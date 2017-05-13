package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.GameDAO
import mcgrady.model.{Game, Inscription, Player, Arena}
import mcgrady.service.GameService

/**
  * Created by Borja Gete on 1/04/17.
  */

@Singleton
class GameServiceImpl @Inject()(gameDAO: GameDAO)extends GameService{
  override def add(game: Game): Future[String] = {
    gameDAO.add(game)
  }

  override def update(id: Long, game: Game): Future[Int] = {
    gameDAO.update(id, game)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    gameDAO.delete(id)
  }

  def listSimple: Future[Seq[Game]] = {
    gameDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Game, Inscription,String, Inscription,String)]] ={
    gameDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    gameDAO.count
  }
  override def find(id: Long): Future[Game] = {
    gameDAO.findById(id)
  }
  def get(id: Long): Future[Option[Game]] = {
    gameDAO.get(id)
  }
}
