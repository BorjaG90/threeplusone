package mcgrady.dao

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import mcgrady.model.{Team,Country}
import impl.TeamDAOImpl
import util.Page

/**
  * Created by Borja Gete on 27/03/17.
  */

@ImplementedBy(classOf[TeamDAOImpl])
trait TeamDAO {
  def add(team: Team): Future[String]
  def update(id: Long, team: Team): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Team]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[Team]]
  def findById(id: Long): Future[Team]
  def get(id: Long): Future[Option[Team]]
  def count: Future[Int]
}
