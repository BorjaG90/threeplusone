package service

/**
  * Created by Borja Gete on 23/03/17.
  */
import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.{Arena,Country}
import util.Page
import impl.ArenaServiceImpl

@ImplementedBy(classOf[ArenaServiceImpl])
trait ArenaService {
  def add(competition: Arena): Future[String]
  def update(id: Long, arena: Arena): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Arena]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Arena,Country)]]
  def count: Future[Int]
  def find(id: Long): Future[Arena]
  def get(id: Long): Future[Option[Arena]]
}
