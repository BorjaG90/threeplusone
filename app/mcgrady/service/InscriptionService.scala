package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model._
import impl.InscriptionServiceImpl

/**
  * Created by Borja Gete on 31/03/17.
  */

@ImplementedBy(classOf[InscriptionServiceImpl])
trait InscriptionService {
  def add(competition: Inscription): Future[String]
  def update(id: Long, inscription: Inscription): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Inscription]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Inscription,Team,Competition,Season)]]
  def listFilterCompetition(filter: Long): Future[Seq[Inscription]]
  def count: Future[Int]
  def find(id: Long): Future[Inscription]
  def get(id: Long): Future[Option[Inscription]]
}
