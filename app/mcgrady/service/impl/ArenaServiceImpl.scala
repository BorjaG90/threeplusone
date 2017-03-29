package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.ArenaDAO
import mcgrady.model.{Arena,Country}
import mcgrady.service.ArenaService

/**
  * Created by Borja Gete on 23/03/17.
  */
@Singleton
class ArenaServiceImpl @Inject()(arenaDAO: ArenaDAO)extends ArenaService{
  override def add(arena: Arena): Future[String] = {
    arenaDAO.add(arena)
  }

  override def update(id: Long, arena: Arena): Future[Int] = {
    arenaDAO.update(id, arena)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    arenaDAO.delete(id)
  }

  def listSimple: Future[Seq[Arena]] = {
    arenaDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Arena,Country)]] ={
    arenaDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    arenaDAO.count
  }
  override def find(id: Long): Future[Arena] = {
    arenaDAO.findById(id)
  }
  def get(id: Long): Future[Option[Arena]] = {
    arenaDAO.get(id)
  }
}
