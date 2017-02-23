package dao

import com.google.inject.ImplementedBy
import model.{League,Page,Country}
import scala.concurrent.Future
/**
  * Created by Borja Gete on 14/02/17.
  */
@ImplementedBy(classOf[LeagueDAOImpl])
trait LeagueDAO {
  def add(league: League): Future[String]
  def update(id: Long, league: League): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  //def list: Future[Seq[(League,String)]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(League,Country)]]
  def findById(id: Long): Future[League]
  def get(id: Long): Future[Option[League]]
  def count: Future[Int]
}
