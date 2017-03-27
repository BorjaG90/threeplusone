package mcgrady.service

import com.google.inject.ImplementedBy
import scala.concurrent.Future
import mcgrady.model.Country
import impl.CountryServiceImpl

/**
  * Created by Borja Gete on 8/02/17.
  */

@ImplementedBy(classOf[CountryServiceImpl])
trait CountryService {
  def find(id: Option[Long]): Future[Country]
  def list: Future[Seq[Country]]
  def count: Future[Int]
}
