package service

/**
  * Created by borja on 9/02/17.
  */
import model.{League,Leagues}
import scala.concurrent.Future

object LeagueService {

  def add(league: League): Future[String] = {
    Leagues.add(league)
  }

  def delete(id: Long): Future[Int] = {
    Leagues.delete(id)
  }

  def list: Future[Seq[(League, String)]] = {
    Leagues.list
  }
}
