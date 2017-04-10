package kobe.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.{Serie, Session, Exercise,Plan}
import impl.SerieDAOImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[SerieDAOImpl])
trait SerieDAO {
  def add(serie: Serie): Future[String]
  def update(id: Long, serie: Serie): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Serie]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Serie, Session, Exercise,Plan)]]
  def findById(id: Long): Future[Serie]
  def get(id: Long): Future[Option[Serie]]
  def count: Future[Int]
}
