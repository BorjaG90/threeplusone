package kobe.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.{Session,Plan}
import impl.SessionDAOImpl

/**
  * Created by Borja Gete on 29/03/17.
  */

@ImplementedBy(classOf[SessionDAOImpl])
trait SessionDAO {
  def add(session: Session): Future[String]
  def update(id: Long, session: Session): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Session]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Session,Plan)]]
  def findById(id: Long): Future[Session]
  def get(id: Long): Future[Option[Session]]
  def count: Future[Int]
}
