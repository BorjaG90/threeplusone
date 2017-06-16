package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model._
import impl.GameDAOImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[GameDAOImpl])
trait GameDAO {
  def add(inscription: Game): Future[String]
  def update(id: Long, inscription: Game): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Game]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Game, Inscription,String, Inscription,String)]]
  def findById(id: Long): Future[Game]
  def get(id: Long): Future[Option[Game]]
  def count: Future[Int]
}
