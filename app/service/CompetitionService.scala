package service

/**
  * Created by Borja Gete on 14/02/17.
  */
import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.{Competition,Country,Season}
import util.Page
import impl.CompetitionServiceImpl


@ImplementedBy(classOf[CompetitionServiceImpl])
trait CompetitionService {
  def add(competition: Competition): Future[String]
  def update(id: Long, competition: Competition): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  //def list: Future[Seq[(Competition, String)]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Competition,Country,Season)]]
  def count: Future[Int]
  def find(id: Long): Future[Competition]
  def get(id: Long): Future[Option[Competition]]
}
