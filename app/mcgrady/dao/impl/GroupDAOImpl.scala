package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model.{Group, GroupTable,Competition}
import mcgrady.dao.GroupDAO

/**
  * Created by Borja Gete on 27/03/17.
  */

class GroupDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends GroupDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val groups = TableQuery[GroupTable]

  override def add(group: Group): Future[String] = {
    db.run(groups += group).map(res => "Grupo añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, group: Group): Future[Int] = {
    db.run(filterQuery(id).update(group))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(groups.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Group]] = {
    db.run(groups.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Group] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(groups.length.result)
  }
  override def listSimple: Future[Seq[Group]] = {
    db.run(groups.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(Group,Competition)]] = {
    val offset = pageSize * page
    val query =
      (for {
        group <- groups if group.name like filter.toLowerCase
        competition <- group.group_competition_fk
      } yield (group,competition)).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(groups.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[GroupTable, Group, Seq] = {
    groups.filter(_.id === id)
  }
}
