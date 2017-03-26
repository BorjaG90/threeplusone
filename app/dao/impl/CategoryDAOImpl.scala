package dao.impl

import javax.inject.Inject
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import model.{Category, CategoryTable}
import dao.CategoryDAO
import util.Page

/**
  * Created by Borja Gete on 26/03/17.
  */

class CategoryDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends CategoryDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val categorys = TableQuery[CategoryTable]

  override def add(category: Category): Future[String] = {
    db.run(categorys += category).map(res => "Tipo añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, category: Category): Future[Int] = {
    db.run(filterQuery(id).update(category))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(categorys.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Category]] = {
    db.run(categorys.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Category] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(categorys.length.result)
  }
  override def listSimple: Future[Seq[Category]] = {
    db.run(categorys.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Category]] = {
    val offset = pageSize * page
    val query =
      (for {
        category <- categorys if category.name like filter.toLowerCase
      } yield category).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(categorys.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[CategoryTable, Category, Seq] = {
    categorys.filter(_.id === id)
  }
}
