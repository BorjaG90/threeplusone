package kobe.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import kobe.model.{Exercise,TypeExercise,Category,Enviroment}
import impl.ExerciseServiceImpl

/**
  * Created by Borja Gete on 30/03/17.
  */

@ImplementedBy(classOf[ExerciseServiceImpl])
trait ExerciseService {
  def add(contract: Exercise): Future[String]
  def update(id: Long, contract: Exercise): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Exercise]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Exercise,TypeExercise,Category,Enviroment)]]
  def count: Future[Int]
  def find(id: Long): Future[Exercise]
  def get(id: Long): Future[Option[Exercise]]
}
