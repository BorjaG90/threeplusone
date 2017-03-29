package kobe.service.impl

import scala.concurrent.Future
import com.google.inject.Singleton
import javax.inject.Inject
import util.Page
import kobe.model.Unit
import kobe.dao.UnitDAO
import kobe.service.UnitService

/**
  * Created by Borja Gete on 25/03/17.
  */

@Singleton
class UnitServiceImpl @Inject()(unitDAO: UnitDAO)extends UnitService{
  override def add(unit: Unit): Future[String] = {
    unitDAO.add(unit)
  }

  override def update(id: Long, unit: Unit): Future[Int] = {
    unitDAO.update(id, unit)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    unitDAO.delete(id)
  }

  def listSimple: Future[Seq[Unit]] = {
    unitDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[Unit]] ={
    unitDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    unitDAO.count
  }
  override def find(id: Long): Future[Unit] = {
    unitDAO.findById(id)
  }
  def get(id: Long): Future[Option[Unit]] = {
    unitDAO.get(id)
  }
}
