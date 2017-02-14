package service

/**
  * Created by borja on 9/02/17.
  */
import javax.inject.Inject
import com.google.inject.Singleton
import dao.LeagueDAO
import model.League

import scala.concurrent.Future

@Singleton
class LeagueServiceImpl @Inject()(leagueDAO: LeagueDAO)extends LeagueService{

  def add(league: League): Future[String] = {
    leagueDAO.add(league)
  }

  def delete(id: Option[Long]): Future[Int] = {
    leagueDAO.delete(id)
  }

  def list: Future[Seq[(League, String)]] = {
    leagueDAO.list
  }

  def getLeague(id: Long): Future[Option[League]] = {
    leagueDAO.get(id)
  }
}
