package mcgrady.service.impl

import javax.inject.Inject
import com.google.inject.Singleton
import scala.concurrent.Future
import mcgrady.dao.CompetitionDAO
import mcgrady.model.{Competition,Country,Season}
import util.Page
import mcgrady.service.CompetitionService

/**
  * Created by Borja Gete on 9/02/17.
  */

@Singleton
class CompetitionServiceImpl @Inject()(competitionDAO: CompetitionDAO)extends CompetitionService{

  override def add(competition: Competition): Future[String] = {
    competitionDAO.add(competition)
  }

  override def update(id: Long, competition: Competition): Future[Int] = {
    competitionDAO.update(id, competition)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    competitionDAO.delete(id)
  }

  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Competition,Country,Season)]] ={
    competitionDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    competitionDAO.count
  }
  override def find(id: Long): Future[Competition] = {
    competitionDAO.findById(id)
  }
  def get(id: Long): Future[Option[Competition]] = {
    competitionDAO.get(id)
  }
}
