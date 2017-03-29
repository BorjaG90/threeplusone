package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.Player
import impl.PlayerServiceImpl

/**
  * Created by Borja Gete on 27/03/17.
  */

@ImplementedBy(classOf[PlayerServiceImpl])
trait PlayerService {
  def add(competition: Player): Future[String]
  def update(id: Long, player: Player): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Player]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[Player]]
  def count: Future[Int]
  def find(id: Long): Future[Player]
  def get(id: Long): Future[Option[Player]]
}
