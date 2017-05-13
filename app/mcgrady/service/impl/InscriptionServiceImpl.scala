package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.InscriptionDAO
import mcgrady.model._
import mcgrady.service.InscriptionService

/**
  * Created by Borja Gete on 1/04/17.
  */

@Singleton
class InscriptionServiceImpl @Inject()(inscriptionDAO: InscriptionDAO)extends InscriptionService{
  override def add(inscription: Inscription): Future[String] = {
    inscriptionDAO.add(inscription)
  }

  override def update(id: Long, inscription: Inscription): Future[Int] = {
    inscriptionDAO.update(id, inscription)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    inscriptionDAO.delete(id)
  }

  def listSimple: Future[Seq[Inscription]] = {
    inscriptionDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Inscription,Team, Arena,Competition,Season)]] ={
    inscriptionDAO.list(page,pageSize,orderBy,filter)
  }
  override def listFilterCompetition(filter: Long): Future[Seq[Inscription]]={
  inscriptionDAO.listFilterCompetition(filter)
  }
  override def count: Future[Int] = {
    inscriptionDAO.count
  }
  override def find(id: Long): Future[Inscription] = {
    inscriptionDAO.findById(id)
  }
  def get(id: Long): Future[Option[Inscription]] = {
    inscriptionDAO.get(id)
  }
}
