package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model._
import impl.SubGroupDAOImpl

/**
  * Created by Borja Gete on 29/03/17.
  */

@ImplementedBy(classOf[SubGroupDAOImpl])
trait SubGroupDAO {
  def add(subGroup: SubGroup): Future[String]
  def update(id: Long, subGroup: SubGroup): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[SubGroup]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(SubGroup,Group,Season,Competition)]]
  def findById(id: Long): Future[SubGroup]
  def get(id: Long): Future[Option[SubGroup]]
  def count: Future[Int]
}
