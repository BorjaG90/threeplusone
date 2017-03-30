package kobe.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import kobe.dao.ExerciseDAO
import kobe.model.{Exercise,TypeExercise,Category,Enviroment}
import kobe.service.ExerciseService

/**
  * Created by Borja Gete on 30/03/17.
  */
@Singleton
class ExerciseServiceImpl @Inject()(exerciseDAO: ExerciseDAO)extends ExerciseService{
  override def add(exercise: Exercise): Future[String] = {
    exerciseDAO.add(exercise)
  }

  override def update(id: Long, exercise: Exercise): Future[Int] = {
    exerciseDAO.update(id, exercise)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    exerciseDAO.delete(id)
  }

  def listSimple: Future[Seq[Exercise]] = {
    exerciseDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Exercise,TypeExercise,Category,Enviroment)]] ={
    exerciseDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    exerciseDAO.count
  }
  override def find(id: Long): Future[Exercise] = {
    exerciseDAO.findById(id)
  }
  def get(id: Long): Future[Option[Exercise]] = {
    exerciseDAO.get(id)
  }
}
