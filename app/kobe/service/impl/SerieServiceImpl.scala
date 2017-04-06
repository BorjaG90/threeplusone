package kobe.service.impl

import scala.concurrent.Future
import com.google.inject.Singleton
import javax.inject.Inject
import util.Page
import kobe.model.{Serie, Session, Exercise}
import kobe.dao.SerieDAO
import kobe.service.SerieService

/**
  * Created by Borja Gete on 1/04/17.
  */

@Singleton
class SerieServiceImpl @Inject()(serieDAO: SerieDAO)extends SerieService{
  override def add(serie: Serie): Future[String] = {
    serieDAO.add(serie)
  }

  override def update(id: Long, serie: Serie): Future[Int] = {
    serieDAO.update(id, serie)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    serieDAO.delete(id)
  }

  def listSimple: Future[Seq[Serie]] = {
    serieDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Serie, Session, Exercise)]] ={
    serieDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    serieDAO.count
  }
  override def find(id: Long): Future[Serie] = {
    serieDAO.findById(id)
  }
  def get(id: Long): Future[Option[Serie]] = {
    serieDAO.get(id)
  }
}
