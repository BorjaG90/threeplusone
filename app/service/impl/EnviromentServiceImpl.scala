package service.impl

import javax.inject.Inject
import scala.concurrent.Future
import com.google.inject.Singleton
import dao.EnviromentDAO
import model.Enviroment
import util.Page
import service.EnviromentService

/**
  * Created by Borja Gete on 26/03/17.
  */
@Singleton
class EnviromentServiceImpl @Inject()(enviromentDAO: EnviromentDAO)extends EnviromentService{
  override def add(enviroment: Enviroment): Future[String] = {
    enviromentDAO.add(enviroment)
  }

  override def update(id: Long, enviroment: Enviroment): Future[Int] = {
    enviromentDAO.update(id, enviroment)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    enviromentDAO.delete(id)
  }

  def listSimple: Future[Seq[Enviroment]] = {
    enviromentDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[Enviroment]] ={
    enviromentDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    enviromentDAO.count
  }
  override def find(id: Long): Future[Enviroment] = {
    enviromentDAO.findById(id)
  }
  def get(id: Long): Future[Option[Enviroment]] = {
    enviromentDAO.get(id)
  }
}
