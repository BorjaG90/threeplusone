package service

/**
  * Created by Borja Gete on 14/02/17.
  */
import com.google.inject.ImplementedBy
import model.{League,Page,Country}

import scala.concurrent.Future

@ImplementedBy(classOf[LeagueServiceImpl])
trait LeagueService {
  def add(league: League): Future[String]
  def update(id: Long, league: League): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  //def list: Future[Seq[(League, String)]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(League,Country)]]
  def count: Future[Int]
  def find(id: Long): Future[League]
  def get(id: Long): Future[Option[League]]
}
