package mcgrady.dao

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import mcgrady.model.Country
import impl.CountryDAOImpl

/**
  * Created by Borja Gete on 14/02/17.
  */

@ImplementedBy(classOf[CountryDAOImpl])
trait CountryDAO {
  def list:Future[Seq[Country]]
  def findById(id: Long): Future[Country]
  def count: Future[Int]
}
