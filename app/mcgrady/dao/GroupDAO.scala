package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{Group,Competition}
import impl.GroupDAOImpl

/**
  * Created by Borja Gete on 29/03/17.
  */

@ImplementedBy(classOf[GroupDAOImpl])
trait GroupDAO {
  def add(group: Group): Future[String]
  def update(id: Long, group: Group): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Group]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Group,Competition,String)]]
  def findById(id: Long): Future[Group]
  def get(id: Long): Future[Option[Group]]
  def count: Future[Int]
}
