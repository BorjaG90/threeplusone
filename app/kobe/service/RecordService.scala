package kobe.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.{Record, Serie, Unit}
import impl.RecordServiceImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[RecordServiceImpl])
trait RecordService {
  def add(competition: Record): Future[String]
  def update(id: Long, record: Record): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Record]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Record, Serie, Unit)]]
  def count: Future[Int]
  def find(id: Long): Future[Record]
  def get(id: Long): Future[Option[Record]]
}
