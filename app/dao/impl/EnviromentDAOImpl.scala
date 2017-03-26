package dao.impl

import javax.inject.Inject
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import model.{Enviroment, EnviromentTable}
import dao.EnviromentDAO
import util.Page

/**
  * Created by Borja Gete on 26/03/17.
  */

class EnviromentDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends EnviromentDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val enviroments = TableQuery[EnviromentTable]

  override def add(enviroment: Enviroment): Future[String] = {
    db.run(enviroments += enviroment).map(res => "Entorno añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, enviroment: Enviroment): Future[Int] = {
    db.run(filterQuery(id).update(enviroment))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(enviroments.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Enviroment]] = {
    db.run(enviroments.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Enviroment] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(enviroments.length.result)
  }
  override def listSimple: Future[Seq[Enviroment]] = {
    db.run(enviroments.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Enviroment]] = {
    val offset = pageSize * page
    val query =
      (for {
        enviroment <- enviroments if enviroment.name like filter.toLowerCase
      } yield enviroment).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(enviroments.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[EnviromentTable, Enviroment, Seq] = {
    enviroments.filter(_.id === id)
  }
}
