package kobe.service

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import kobe.model.TypeExercise
import util.Page
import impl.TypeExerciseServiceImpl

/**
  * Created by Borja Gete on 25/03/17.
  */

@ImplementedBy(classOf[TypeExerciseServiceImpl])
trait TypeExerciseService {
  def add(competition: TypeExercise): Future[String]
  def update(id: Long, typeExercise: TypeExercise): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[TypeExercise]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[TypeExercise]]
  def count: Future[Int]
  def find(id: Long): Future[TypeExercise]
  def get(id: Long): Future[Option[TypeExercise]]
}
