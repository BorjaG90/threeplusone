package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{Contract,Player,Team}
import impl.ContractServiceImpl

/**
  * Created by Borja Gete on 30/03/17.
  */

@ImplementedBy(classOf[ContractServiceImpl])
trait ContractService {
  def add(contract: Contract): Future[String]
  def update(id: Long, contract: Contract): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Contract]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Contract,Player,Team)]]
  def count: Future[Int]
  def find(id: Long): Future[Contract]
  def get(id: Long): Future[Option[Contract]]
}
