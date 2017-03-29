package kobe.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.Plan
import impl.PlanServiceImpl

/**
  * Created by Borja Gete on 28/03/17.
  */

@ImplementedBy(classOf[PlanServiceImpl])
trait PlanService {
  def add(competition: Plan): Future[String]
  def update(id: Long, plan: Plan): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Plan]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[Plan]]
  def count: Future[Int]
  def find(id: Long): Future[Plan]
  def get(id: Long): Future[Option[Plan]]
}
