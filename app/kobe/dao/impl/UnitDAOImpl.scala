package kobe.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import kobe.model.{Unit, UnitTable}
import kobe.dao.UnitDAO

/**
  * Created by Borja Gete on 25/03/17.
  */

class UnitDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends UnitDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val units = TableQuery[UnitTable]

  override def add(unit: Unit): Future[String] = {
    db.run(units += unit).map(res => "Unidad a&ntilde;adida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, unit: Unit): Future[Int] = {
    db.run(filterQuery(id).update(unit))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(units.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Unit]] = {
    db.run(units.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Unit] ={
    db.run(filterQuery(id).result.head)
  }
  override def findByName(name: String): Future[Unit] ={
    db.run(filterQueryName(name).result.head)
  }

  override def count: Future[Int] = {
    db.run(units.length.result)
  }
  override def listSimple: Future[Seq[Unit]] = {
    db.run(units.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Unit]] = {
    val offset = pageSize * page
    val query =
      (for {
        unit <- units if unit.name like filter.toLowerCase
      } yield unit).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(units.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[UnitTable, Unit, Seq] = {
    units.filter(_.id === id)
  }
  private def filterQueryName(name: String): Query[UnitTable, Unit, Seq] = {
    units.filter(_.name === name)
  }
}
