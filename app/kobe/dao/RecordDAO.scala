package kobe.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.{Record,Serie,Unit,Exercise}
import impl.RecordDAOImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[RecordDAOImpl])
trait RecordDAO {
  def add(record: Record): Future[String]
  def update(id: Long, record: Record): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Record]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Record,Serie,Unit,Exercise)]]
  def findById(id: Long): Future[Record]
  def get(id: Long): Future[Option[Record]]
  def count: Future[Int]
}
