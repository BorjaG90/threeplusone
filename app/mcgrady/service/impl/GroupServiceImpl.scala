package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.GroupDAO
import mcgrady.model.{Group,Competition}
import mcgrady.service.GroupService

/**
  * Created by Borja Gete on 29/03/17.
  */

@Singleton
class GroupServiceImpl @Inject()(groupDAO: GroupDAO)extends GroupService{
  override def add(group: Group): Future[String] = {
    groupDAO.add(group)
  }

  override def update(id: Long, group: Group): Future[Int] = {
    groupDAO.update(id, group)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    groupDAO.delete(id)
  }

  def listSimple: Future[Seq[Group]] = {
    groupDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Group,Competition,String)]] ={
    groupDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    groupDAO.count
  }
  override def find(id: Long): Future[Group] = {
    groupDAO.findById(id)
  }
  def get(id: Long): Future[Option[Group]] = {
    groupDAO.get(id)
  }
}
