package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model.{Arena, ArenaTable, Country}
import mcgrady.dao.ArenaDAO

/**
  * Created by Borja Gete on 23/03/17.
  */

class ArenaDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends ArenaDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val arenas = TableQuery[ArenaTable]

  override def add(arena: Arena): Future[String] = {
    db.run(arenas += arena).map(res => "Estadio a&ntilde;adido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, arena: Arena): Future[Int] = {
    db.run(filterQuery(id).update(arena))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(arenas.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Arena]] = {
    db.run(arenas.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Arena] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(arenas.length.result)
  }
  override def listSimple: Future[Seq[Arena]] = {
    db.run(arenas.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Arena]] = {
    val offset = pageSize * page
    val query =
      (for {
        arena <- arenas if arena.name like filter.toLowerCase
      } yield arena).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)
    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(arenas.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[ArenaTable, Arena, Seq] = {
    arenas.filter(_.id === id)
  }
}
