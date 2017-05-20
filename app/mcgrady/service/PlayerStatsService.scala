package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model._
import impl.PlayerStatsServiceImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[PlayerStatsServiceImpl])
trait PlayerStatsService {
  def add(playerStat: PlayerStats): Future[String]
  def update(id: Long, playerStats: PlayerStats): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[PlayerStats]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(PlayerStats, Game, Player,Long, String,String)]]
  def count: Future[Int]
  def find(id: Long): Future[PlayerStats]
  def get(id: Long): Future[Option[PlayerStats]]
}
