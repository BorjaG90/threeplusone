package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import util.Page
import mcgrady.dao.ContractDAO
import mcgrady.model.{Contract,Player,Team}
import mcgrady.service.ContractService

/**
  * Created by Borja Gete on 30/03/17.
  */
@Singleton
class ContractServiceImpl @Inject()(contractDAO: ContractDAO)extends ContractService{
  override def add(contract: Contract): Future[String] = {
    contractDAO.add(contract)
  }

  override def update(id: Long, contract: Contract): Future[Int] = {
    contractDAO.update(id, contract)
  }

  override def delete(id: Option[Long]): Future[Int] = {
    contractDAO.delete(id)
  }

  def listSimple: Future[Seq[Contract]] = {
    contractDAO.listSimple
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String):Future[Page[(Contract,Player,Team)]] ={
    contractDAO.list(page,pageSize,orderBy,filter)
  }
  override def count: Future[Int] = {
    contractDAO.count
  }
  override def find(id: Long): Future[Contract] = {
    contractDAO.findById(id)
  }
  def get(id: Long): Future[Option[Contract]] = {
    contractDAO.get(id)
  }
}
