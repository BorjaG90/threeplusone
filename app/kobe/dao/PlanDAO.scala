package kobe.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.Plan
import impl.PlanDAOImpl

/**
  * Created by Borja Gete on 28/03/17.
  */

@ImplementedBy(classOf[PlanDAOImpl])
trait PlanDAO {
  def add(plan: Plan): Future[String]
  def update(id: Long, plan: Plan): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Plan]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[Plan]]
  def findById(id: Long): Future[Plan]
  def get(id: Long): Future[Option[Plan]]
  def count: Future[Int]
}
