package service

/**
  * Created by Borja Gete on 9/02/17.
  */
import javax.inject.Inject
import com.google.inject.Singleton
import dao.LeagueDAO
import model.{League,Page}

import scala.concurrent.Future

@Singleton
class LeagueServiceImpl @Inject()(leagueDAO: LeagueDAO)extends LeagueService{

  override def add(league: League): Future[String] = {
    leagueDAO.add(league)
  }

  override def update(id: Long, league: League): Future[Int] = {
    leagueDAO.update(id, league)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    leagueDAO.delete(id)
  }

  /*def list: Future[Seq[(League, String)]] = {
    leagueDAO.list
  }*/
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[League]] ={
    leagueDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    leagueDAO.count
  }
  override def find(id: Long): Future[League] = {
    leagueDAO.findById(id)
  }
  def get(id: Long): Future[Option[League]] = {
    leagueDAO.get(id)
  }
}
