package kobe.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import kobe.model.{Record, RecordTable, Serie, Unit}
import kobe.dao.RecordDAO

/**
  * Created by Borja Gete on 1/04/17.
  */

class RecordDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends RecordDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val records = TableQuery[RecordTable]

  override def add(record: kobe.model.Record): Future[String] = {
    db.run(records += record).map(res => "Record añadida satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, record: kobe.model.Record): Future[Int] = {
    db.run(filterQuery(id).update(record))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(records.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[kobe.model.Record]] = {
    db.run(records.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[kobe.model.Record] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(records.length.result)
  }
  override def listSimple: Future[Seq[kobe.model.Record]] = {
    db.run(records.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(kobe.model.Record,Serie,Unit)]] = {
    val offset = pageSize * page
    val query =
      (for {
        record <- records
        serie <- record.mark_serie_fk
        unit <- record.record_unit_fk
      } yield (record,serie,unit)).drop(offset).take(pageSize)
    val totalRows = count
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  /*private def count(filter: String): Future[Int] = {
    db.run(records.filter(_.name like filter.toLowerCase).length.result)
  }*/

  private def filterQuery(id: Long): Query[RecordTable, kobe.model.Record, Seq] = {
    records.filter(_.id === id)
  }
}
