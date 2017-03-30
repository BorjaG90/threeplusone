package kobe.service.impl

import scala.concurrent.Future
import com.google.inject.Singleton
import javax.inject.Inject
import util.Page
import kobe.model.{Session,Plan}
import kobe.dao.SessionDAO
import kobe.service.SessionService

/**
  * Created by Borja Gete on 29/03/17.
  */

@Singleton
class SessionServiceImpl @Inject()(sessionDAO: SessionDAO)extends SessionService{
  override def add(session: Session): Future[String] = {
    sessionDAO.add(session)
  }

  override def update(id: Long, session: Session): Future[Int] = {
    sessionDAO.update(id, session)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    sessionDAO.delete(id)
  }

  def listSimple: Future[Seq[Session]] = {
    sessionDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Session,Plan)]] ={
    sessionDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    sessionDAO.count
  }
  override def find(id: Long): Future[Session] = {
    sessionDAO.findById(id)
  }
  def get(id: Long): Future[Option[Session]] = {
    sessionDAO.get(id)
  }
}
