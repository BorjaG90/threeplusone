package dao

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.Category
import impl.CategoryDAOImpl
import util.Page

/**
  * Created by Borja Gete on 26/03/17.
  */

@ImplementedBy(classOf[CategoryDAOImpl])
trait CategoryDAO {
  def add(category: Category): Future[String]
  def update(id: Long, category: Category): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Category]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[Category]]
  def findById(id: Long): Future[Category]
  def get(id: Long): Future[Option[Category]]
  def count: Future[Int]
}
