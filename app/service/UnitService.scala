package service

/**
  * Created by Borja Gete on 23/03/17.
  */
import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.Unit
import util.Page
import impl.UnitServiceImpl

@ImplementedBy(classOf[UnitServiceImpl])
trait UnitService {
  def add(competition: Unit): Future[String]
  def update(id: Long, unit: Unit): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Unit]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[Unit]]
  def count: Future[Int]
  def find(id: Long): Future[Unit]
  def get(id: Long): Future[Option[Unit]]
}
