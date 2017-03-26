package dao

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.TypeExercise
import impl.TypeExerciseDAOImpl
import util.Page

/**
  * Created by Borja Gete on 25/03/17.
  */

@ImplementedBy(classOf[TypeExerciseDAOImpl])
trait TypeExerciseDAO {
  def add(typeExercise: TypeExercise): Future[String]
  def update(id: Long, typeExercise: TypeExercise): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[TypeExercise]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[TypeExercise]]
  def findById(id: Long): Future[TypeExercise]
  def get(id: Long): Future[Option[TypeExercise]]
  def count: Future[Int]
}
