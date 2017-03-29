package kobe.service.impl

import scala.concurrent.Future
import com.google.inject.Singleton
import javax.inject.Inject
import util.Page
import kobe.model.Plan
import kobe.dao.PlanDAO
import kobe.service.PlanService

/**
  * Created by Borja Gete on 28/03/17.
  */

@Singleton
class PlanServiceImpl @Inject()(planDAO: PlanDAO)extends PlanService{
  override def add(plan: Plan): Future[String] = {
    planDAO.add(plan)
  }

  override def update(id: Long, plan: Plan): Future[Int] = {
    planDAO.update(id, plan)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    planDAO.delete(id)
  }

  def listSimple: Future[Seq[Plan]] = {
    planDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[Plan]] ={
    planDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    planDAO.count
  }
  override def find(id: Long): Future[Plan] = {
    planDAO.findById(id)
  }
  def get(id: Long): Future[Option[Plan]] = {
    planDAO.get(id)
  }
}
