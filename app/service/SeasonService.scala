package service

/**
  * Created by Borja Gete on 20/03/17.
  */
import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.Season
import util.Page
import impl.SeasonServiceImpl

@ImplementedBy(classOf[SeasonServiceImpl])
trait SeasonService {
  def add(competition: Season): Future[String]
  def update(id: Long, season: Season): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Season]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[Season]]
  def count: Future[Int]
  def find(id: Long): Future[Season]
  def get(id: Long): Future[Option[Season]]
}
