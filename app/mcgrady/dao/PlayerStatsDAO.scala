package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model._
import impl.PlayerStatsDAOImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[PlayerStatsDAOImpl])
trait PlayerStatsDAO {
  def add(playerStat: PlayerStats): Future[String]
  def update(id: Long, playerStats: PlayerStats): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[PlayerStats]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(PlayerStats, Game, Player,Long, String,String)]]
  def findById(id: Long): Future[PlayerStats]
  def get(id: Long): Future[Option[PlayerStats]]
  def count: Future[Int]
}
