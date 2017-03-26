package dao

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.Enviroment
import impl.EnviromentDAOImpl
import util.Page

/**
  * Created by Borja Gete on 26/03/17.
  */

@ImplementedBy(classOf[EnviromentDAOImpl])
trait EnviromentDAO {
  def add(enviroment: Enviroment): Future[String]
  def update(id: Long, enviroment: Enviroment): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Enviroment]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[Enviroment]]
  def findById(id: Long): Future[Enviroment]
  def get(id: Long): Future[Option[Enviroment]]
  def count: Future[Int]
}
