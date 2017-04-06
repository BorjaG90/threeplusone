package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{TeamStats, Game, Inscription}
import impl.TeamStatsServiceImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[TeamStatsServiceImpl])
trait TeamStatsService {
  def add(teamStat: TeamStats): Future[String]
  def update(id: Long, teamStats: TeamStats): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[TeamStats]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(TeamStats, Game, Inscription,String,String,String)]]
  def count: Future[Int]
  def find(id: Long): Future[TeamStats]
  def get(id: Long): Future[Option[TeamStats]]
}
