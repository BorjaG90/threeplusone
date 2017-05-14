package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model._
import impl.InscriptionDAOImpl

/**
  * Created by Borja Gete on 31/03/17.
  */

@ImplementedBy(classOf[InscriptionDAOImpl])
trait InscriptionDAO {
  def add(inscription: Inscription): Future[String]
  def update(id: Long, inscription: Inscription): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Inscription]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Inscription,Team,Competition,Season)]]
  def listFilterCompetition(filter: Long): Future[Seq[Inscription]]
  def findById(id: Long): Future[Inscription]
  def get(id: Long): Future[Option[Inscription]]
  def count: Future[Int]
}
