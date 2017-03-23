package service.impl

import javax.inject.Inject
import scala.concurrent.Future
import com.google.inject.Singleton
import dao.SeasonDAO
import model.Season
import util.Page
import service.SeasonService

/**
  * Created by Borja Gete on 20/03/17.
  */
@Singleton
class SeasonServiceImpl @Inject()(seasonDAO: SeasonDAO)extends SeasonService{
  override def add(season: Season): Future[String] = {
    seasonDAO.add(season)
  }

  override def update(id: Long, season: Season): Future[Int] = {
    seasonDAO.update(id, season)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    seasonDAO.delete(id)
  }

  def listSimple: Future[Seq[Season]] = {
    seasonDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[Season]] ={
    seasonDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    seasonDAO.count
  }
  override def find(id: Long): Future[Season] = {
    seasonDAO.findById(id)
  }
  def get(id: Long): Future[Option[Season]] = {
    seasonDAO.get(id)
  }
}
