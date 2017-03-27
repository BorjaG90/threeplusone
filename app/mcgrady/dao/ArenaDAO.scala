package mcgrady.dao

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import mcgrady.model.{Arena,Country}
import impl.ArenaDAOImpl
import util.Page

/**
  * Created by Borja Gete on 23/03/17.
  */

@ImplementedBy(classOf[ArenaDAOImpl])
trait ArenaDAO {
  def add(arena: Arena): Future[String]
  def update(id: Long, arena: Arena): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Arena]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Arena,Country)]]
  def findById(id: Long): Future[Arena]
  def get(id: Long): Future[Option[Arena]]
  def count: Future[Int]
}
