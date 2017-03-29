package kobe.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import kobe.model.{Plan, PlanTable}
import kobe.dao.PlanDAO

/**
  * Created by Borja Gete on 28/03/17.
  */

class PlanDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends PlanDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val plans = TableQuery[PlanTable]

  override def add(plan: Plan): Future[String] = {
    db.run(plans += plan).map(res => "Plan añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, plan: Plan): Future[Int] = {
    db.run(filterQuery(id).update(plan))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(plans.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Plan]] = {
    db.run(plans.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Plan] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(plans.length.result)
  }
  override def listSimple: Future[Seq[Plan]] = {
    db.run(plans.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[Plan]] = {
    val offset = pageSize * page
    val query =
      (for {
        plan <- plans if plan.name like filter.toLowerCase
      } yield plan).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    db.run(plans.filter(_.name like filter.toLowerCase).length.result)
  }

  private def filterQuery(id: Long): Query[PlanTable, Plan, Seq] = {
    plans.filter(_.id === id)
  }
}
