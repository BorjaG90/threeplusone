package service

/**
  * Created by Borja Gete on 26/03/17.
  */
import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.Category
import util.Page
import impl.CategoryServiceImpl

@ImplementedBy(classOf[CategoryServiceImpl])
trait CategoryService {
  def add(competition: Category): Future[String]
  def update(id: Long, category: Category): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Category]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[Category]]
  def count: Future[Int]
  def find(id: Long): Future[Category]
  def get(id: Long): Future[Option[Category]]
}
