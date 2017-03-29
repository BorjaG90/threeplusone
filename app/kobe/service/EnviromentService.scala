package kobe.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.Enviroment
import impl.EnviromentServiceImpl

/**
  * Created by Borja Gete on 26/03/17.
  */

@ImplementedBy(classOf[EnviromentServiceImpl])
trait EnviromentService {
  def add(competition: Enviroment): Future[String]
  def update(id: Long, enviroment: Enviroment): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Enviroment]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[Enviroment]]
  def count: Future[Int]
  def find(id: Long): Future[Enviroment]
  def get(id: Long): Future[Option[Enviroment]]
}
