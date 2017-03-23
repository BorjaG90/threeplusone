package service.impl

import javax.inject.Inject
import scala.concurrent.Future
import com.google.inject.Singleton
import dao.ArenaDAO
import model.{Arena,Country}
import util.Page
import service.ArenaService

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
