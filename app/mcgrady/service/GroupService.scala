package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model._
import impl.GroupServiceImpl

/**
  * Created by Borja Gete on 29/03/17.
  */

@ImplementedBy(classOf[GroupServiceImpl])
trait GroupService {
  def add(competition: Group): Future[String]
  def update(id: Long, group: Group): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Group]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Group,Competition,Season)]]
  def count: Future[Int]
  def find(id: Long): Future[Group]
  def get(id: Long): Future[Option[Group]]
}
