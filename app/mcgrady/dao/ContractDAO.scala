package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{Contract,Player,Team}
import impl.ContractDAOImpl

/**
  * Created by Borja Gete on 30/03/17.
  */

@ImplementedBy(classOf[ContractDAOImpl])
trait ContractDAO {
  def add(contract: Contract): Future[String]
  def update(id: Long, contract: Contract): Future[Int]
  def delete(id: Option[Long]):Future[Int]
  def listSimple:Future[Seq[Contract]]
  def list(page: Int = 0, pageSize: Int = 10, orderBy: Int = 1, filter: String = "%"): Future[Page[(Contract,Player,Team)]]
  def findById(id: Long): Future[Contract]
  def get(id: Long): Future[Option[Contract]]
  def count: Future[Int]
}
