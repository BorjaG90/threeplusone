package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{TeamStats, Game, Inscription}
import impl.TeamStatsDAOImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[TeamStatsDAOImpl])
trait TeamStatsDAO {
  def add(teamStat: TeamStats): Future[String]
  def update(id: Long, teamStats: TeamStats): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[TeamStats]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(TeamStats, Game, Inscription,String,String,String)]]
  def findById(id: Long): Future[TeamStats]
  def get(id: Long): Future[Option[TeamStats]]
  def count: Future[Int]
}
