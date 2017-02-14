package dao

import com.google.inject.ImplementedBy
import model.League
import scala.concurrent.Future
/**
  * Created by borja on 14/02/17.
  */
@ImplementedBy(classOf[LeagueDAOImpl])
trait LeagueDAO {
  def add(league: League): Future[String]
  def get(id: Long): Future[Option[League]]
  def delete(id: Option[Long]): Future[Int]
  def count: Future[Int]
  def list: Future[Seq[(League,String)]]
}
