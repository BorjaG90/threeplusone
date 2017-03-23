package dao

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.Season
import impl.SeasonDAOImpl
import util.Page

/**
  * Created by Borja Gete on 20/03/17.
  */

@ImplementedBy(classOf[SeasonDAOImpl])
trait SeasonDAO {
  def add(season: Season): Future[String]
  def update(id: Long, season: Season): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Season]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[Season]]
  def findById(id: Long): Future[Season]
  def get(id: Long): Future[Option[Season]]
  def count: Future[Int]
}
