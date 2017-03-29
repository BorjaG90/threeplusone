package kobe.service.impl

import scala.concurrent.Future
import com.google.inject.Singleton
import javax.inject.Inject
import util.Page
import kobe.model.Category
import kobe.dao.CategoryDAO
import kobe.service.CategoryService

/**
  * Created by Borja Gete on 26/03/17.
  */

@Singleton
class CategoryServiceImpl @Inject()(categoryDAO: CategoryDAO)extends CategoryService{
  override def add(category: Category): Future[String] = {
    categoryDAO.add(category)
  }

  override def update(id: Long, category: Category): Future[Int] = {
    categoryDAO.update(id, category)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    categoryDAO.delete(id)
  }

  def listSimple: Future[Seq[Category]] = {
    categoryDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[Category]] ={
    categoryDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    categoryDAO.count
  }
  override def find(id: Long): Future[Category] = {
    categoryDAO.findById(id)
  }
  def get(id: Long): Future[Option[Category]] = {
    categoryDAO.get(id)
  }
}
