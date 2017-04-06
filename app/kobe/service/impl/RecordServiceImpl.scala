package kobe.service.impl

import scala.concurrent.Future
import com.google.inject.Singleton
import javax.inject.Inject
import util.Page
import kobe.model.{Record, Serie, Unit}
import kobe.dao.RecordDAO
import kobe.service.RecordService

/**
  * Created by Borja Gete on 1/04/17.
  */

@Singleton
class RecordServiceImpl @Inject()(recordDAO: RecordDAO)extends RecordService{
  override def add(record: Record): Future[String] = {
    recordDAO.add(record)
  }

  override def update(id: Long, record: Record): Future[Int] = {
    recordDAO.update(id, record)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    recordDAO.delete(id)
  }

  def listSimple: Future[Seq[Record]] = {
    recordDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Record, Serie, Unit)]] ={
    recordDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    recordDAO.count
  }
  override def find(id: Long): Future[Record] = {
    recordDAO.findById(id)
  }
  def get(id: Long): Future[Option[Record]] = {
    recordDAO.get(id)
  }
}
