package mcgrady.service.impl

import scala.concurrent.Future
import javax.inject.Inject
import com.google.inject.Singleton
import mcgrady.dao.CountryDAO
import mcgrady.model.Country
import mcgrady.service.CountryService

/**
  * Created by Borja Gete on 14/02/17.
  */

@Singleton
class CountryServiceImpl @Inject()(countryDAO: CountryDAO)extends CountryService{
  override def find(id: Option[Long]): Future[Country] = {
    countryDAO.findById(id.getOrElse(0L))
  }
  override def list: Future[Seq[Country]] = {
    countryDAO.list
  }
  override def count: Future[Int] = {
    countryDAO.count
  }
}
