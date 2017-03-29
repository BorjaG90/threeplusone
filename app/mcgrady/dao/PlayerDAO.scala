package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.Player
import impl.PlayerDAOImpl

/**
  * Created by Borja Gete on 27/03/17.
  */

@ImplementedBy(classOf[PlayerDAOImpl])
trait PlayerDAO {
  def add(player: Player): Future[String]
  def update(id: Long, player: Player): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Player]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[Player]]
  def findById(id: Long): Future[Player]
  def get(id: Long): Future[Option[Player]]
  def count: Future[Int]
}
