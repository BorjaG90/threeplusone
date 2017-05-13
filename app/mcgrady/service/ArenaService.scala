package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{Arena,Country}
import impl.ArenaServiceImpl

/**
  * Created by Borja Gete on 23/03/17.
  */

@ImplementedBy(classOf[ArenaServiceImpl])
trait ArenaService {
  def add(competition: Arena): Future[String]
  def update(id: Long, arena: Arena): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Arena]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[Arena]]
  def count: Future[Int]
  def find(id: Long): Future[Arena]
  def get(id: Long): Future[Option[Arena]]
}
