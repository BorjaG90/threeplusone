package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model.{SubGroup, SubGroupTable, Group, GroupTable}
import mcgrady.dao.SubGroupDAO

/**
  * Created by Borja Gete on 29/03/17.
  */

class SubGroupDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends SubGroupDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val subGroups = TableQuery[SubGroupTable]
  val groups = TableQuery[GroupTable]

  override def add(subGroup: SubGroup): Future[String] = {
    db.run(subGroups += subGroup).map(res => "SubGrupo añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, subGroup: SubGroup): Future[Int] = {
    db.run(filterQuery(id).update(subGroup))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(subGroups.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[SubGroup]] = {
    db.run(subGroups.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[SubGroup] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(subGroups.length.result)
  }
  override def listSimple: Future[Seq[SubGroup]] = {
    db.run(subGroups.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(SubGroup,Group,String,String)]] = {
    val offset = pageSize * page
    val query =
      (for {
        (subGroup,group) <- subGroups join groups on (_.idGroup === _.id)
        competition <- group.group_competition_fk
        season <- competition.competition_season_fk
        if subGroup.name like filter.toLowerCase
      } yield (subGroup,group,season.year, competition.abrv)).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(subGroups.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[SubGroupTable, SubGroup, Seq] = {
    subGroups.filter(_.id === id)
  }
}
