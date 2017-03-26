package dao

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.{Competition,Country,Season}
import util.Page
import impl.CompetitionDAOImpl

/**
  * Created by Borja Gete on 14/02/17.
  */
@ImplementedBy(classOf[CompetitionDAOImpl])
trait CompetitionDAO {
  def add(competition: Competition): Future[String]
  def update(id: Long, competition: Competition): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Competition,Country,Season)]]
  def findById(id: Long): Future[Competition]
  def get(id: Long): Future[Option[Competition]]
  def count: Future[Int]
}
