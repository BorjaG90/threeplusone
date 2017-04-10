package kobe.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.{Serie, Session, Exercise,Plan}
import impl.SerieServiceImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[SerieServiceImpl])
trait SerieService {
  def add(competition: Serie): Future[String]
  def update(id: Long, serie: Serie): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Serie]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Serie, Session, Exercise,Plan)]]
  def count: Future[Int]
  def find(id: Long): Future[Serie]
  def get(id: Long): Future[Option[Serie]]
}
