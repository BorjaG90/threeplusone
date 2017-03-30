package kobe.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.{Session,Plan}
import impl.SessionServiceImpl

/**
  * Created by Borja Gete on 29/03/17.
  */

@ImplementedBy(classOf[SessionServiceImpl])
trait SessionService {
  def add(competition: Session): Future[String]
  def update(id: Long, session: Session): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Session]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Session,Plan)]]
  def count: Future[Int]
  def find(id: Long): Future[Session]
  def get(id: Long): Future[Option[Session]]
}
