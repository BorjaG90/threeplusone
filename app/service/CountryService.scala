package service

/**
  * Created by Borja Gete on 8/02/17.
  */
import com.google.inject.ImplementedBy
import model.Country

import scala.concurrent.Future

@ImplementedBy(classOf[CountryServiceImpl])
trait CountryService {
  def find(id: Long): Future[Country]
  def list: Future[Seq[Country]]
  def count: Future[Int]
}
