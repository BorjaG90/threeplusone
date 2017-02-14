package service

/**
  * Created by borja on 14/02/17.
  */
import com.google.inject.ImplementedBy
import model.League

import scala.concurrent.Future

@ImplementedBy(classOf[LeagueServiceImpl])
trait LeagueService {
  def add(league: League): Future[String]
  def delete(id: Option[Long]): Future[Int]
  def list: Future[Seq[(League, String)]]
  def getLeague(id: Long): Future[Option[League]]
}
