package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{Team,Country}
import impl.TeamServiceImpl

/**
  * Created by Borja Gete on 27/03/17.
  */

@ImplementedBy(classOf[TeamServiceImpl])
trait TeamService {
  def add(team: Team): Future[String]
  def update(id: Long, team: Team): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Team]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Team,Country)]]
  def count: Future[Int]
  def find(id: Long): Future[Team]
  def get(id: Long): Future[Option[Team]]
}
