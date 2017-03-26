package service.impl

import javax.inject.Inject
import scala.concurrent.Future
import com.google.inject.Singleton
import dao.TypeExerciseDAO
import model.TypeExercise
import util.Page
import service.TypeExerciseService

/**
  * Created by Borja Gete on 25/03/17.
  */
@Singleton
class TypeExerciseServiceImpl @Inject()(typeExerciseDAO: TypeExerciseDAO)extends TypeExerciseService{
  override def add(typeExercise: TypeExercise): Future[String] = {
    typeExerciseDAO.add(typeExercise)
  }

  override def update(id: Long, typeExercise: TypeExercise): Future[Int] = {
    typeExerciseDAO.update(id, typeExercise)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    typeExerciseDAO.delete(id)
  }

  def listSimple: Future[Seq[TypeExercise]] = {
    typeExerciseDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[TypeExercise]] ={
    typeExerciseDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    typeExerciseDAO.count
  }
  override def find(id: Long): Future[TypeExercise] = {
    typeExerciseDAO.findById(id)
  }
  def get(id: Long): Future[Option[TypeExercise]] = {
    typeExerciseDAO.get(id)
  }
}
