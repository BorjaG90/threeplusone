package kobe.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.{Exercise,TypeExercise,Category,Enviroment}
import impl.ExerciseDAOImpl

/**
  * Created by Borja Gete on 30/03/17.
  */

@ImplementedBy(classOf[ExerciseDAOImpl])
trait ExerciseDAO {
  def add(exercise: Exercise): Future[String]
  def update(id: Long, exercise: Exercise): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Exercise]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[Exercise]]
  def findById(id: Long): Future[Exercise]
  def get(id: Long): Future[Option[Exercise]]
  def count: Future[Int]
}
