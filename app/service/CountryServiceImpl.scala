package service

import javax.inject.Inject
import com.google.inject.Singleton
import dao.CountryDAO
import model.Country

import scala.concurrent.Future
/**
  * Created by Borja Gete on 14/02/17.
  */
@Singleton
class CountryServiceImpl @Inject()(countryDAO: CountryDAO)extends CountryService{
  override def find(id: Long): Future[Country] = {
    countryDAO.findById(id)
  }
  override def list: Future[Seq[Country]] = {
    countryDAO.list
  }
  override def count: Future[Int] = {
    countryDAO.count
  }
}
