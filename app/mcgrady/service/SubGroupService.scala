package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{SubGroup,Group}
import impl.SubGroupServiceImpl

/**
  * Created by Borja Gete on 29/03/17.
  */

@ImplementedBy(classOf[SubGroupServiceImpl])
trait SubGroupService {
  def add(competition: SubGroup): Future[String]
  def update(id: Long, subGroup: SubGroup): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[SubGroup]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(SubGroup,Group,String,String)]]
  def count: Future[Int]
  def find(id: Long): Future[SubGroup]
  def get(id: Long): Future[Option[SubGroup]]
}
