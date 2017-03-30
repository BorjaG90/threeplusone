package kobe.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import kobe.model.{Session, SessionTable, Plan}
import kobe.dao.SessionDAO

/**
  * Created by Borja Gete on 29/03/17.
  */

class SessionDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends SessionDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val sessions = TableQuery[SessionTable]

  override def add(session: kobe.model.Session): Future[String] = {
    db.run(sessions += session).map(res => "Sesion añadida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, session: kobe.model.Session): Future[Int] = {
    db.run(filterQuery(id).update(session))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(sessions.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[kobe.model.Session]] = {
    db.run(sessions.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[kobe.model.Session] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(sessions.length.result)
  }
  override def listSimple: Future[Seq[kobe.model.Session]] = {
    db.run(sessions.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(kobe.model.Session,Plan)]] = {
    val offset = pageSize * page
    val query =
      (for {
        session <- sessions if session.name like filter.toLowerCase
        plan <- session.session_plan_fk
      } yield (session,plan)).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(sessions.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[SessionTable, kobe.model.Session, Seq] = {
    sessions.filter(_.id === id)
  }
}
