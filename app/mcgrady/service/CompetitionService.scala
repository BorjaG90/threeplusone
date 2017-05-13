package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{Competition,Country,Season}
import impl.CompetitionServiceImpl

/**
  * Created by Borja Gete on 14/02/17.
  */

@ImplementedBy(classOf[CompetitionServiceImpl])
trait CompetitionService {
  def add(competition: Competition): Future[String]
  def update(id: Long, competition: Competition): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Competition]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String, sFilter: String):Future[Page[(Competition,Season)]]
  def count: Future[Int]
  def find(id: Long): Future[Competition]
  def get(id: Long): Future[Option[Competition]]
}
