package kobe.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.Unit
import impl.UnitDAOImpl

/**
  * Created by Borja Gete on 25/03/17.
  */

@ImplementedBy(classOf[UnitDAOImpl])
trait UnitDAO {
  def add(unit: Unit): Future[String]
  def update(id: Long, unit: Unit): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Unit]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[Unit]]
  def findById(id: Long): Future[Unit]
  def get(id: Long): Future[Option[Unit]]
  def count: Future[Int]
}
