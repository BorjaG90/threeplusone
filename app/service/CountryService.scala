package service

/**
  * Created by borja on 8/02/17.
  */
import com.google.inject.ImplementedBy
import model.Country

import scala.concurrent.Future

@ImplementedBy(classOf[CountryServiceImpl])
trait CountryService {
  def list: Future[Seq[Country]]
}
