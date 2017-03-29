package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.SubGroupDAO
import mcgrady.model.{SubGroup,Group}
import mcgrady.service.SubGroupService

/**
  * Created by Borja Gete on 29/03/17.
  */

@Singleton
class SubGroupServiceImpl @Inject()(subGroupDAO: SubGroupDAO)extends SubGroupService{
  override def add(subGroup: SubGroup): Future[String] = {
    subGroupDAO.add(subGroup)
  }

  override def update(id: Long, subGroup: SubGroup): Future[Int] = {
    subGroupDAO.update(id, subGroup)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    subGroupDAO.delete(id)
  }

  def listSimple: Future[Seq[SubGroup]] = {
    subGroupDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(SubGroup,Group)]] ={
    subGroupDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    subGroupDAO.count
  }
  override def find(id: Long): Future[SubGroup] = {
    subGroupDAO.findById(id)
  }
  def get(id: Long): Future[Option[SubGroup]] = {
    subGroupDAO.get(id)
  }
}
