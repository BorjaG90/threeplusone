package dao

/**
  * Created by borja on 14/02/17.
  */

import com.google.inject.ImplementedBy
import model.Country

import scala.concurrent.Future

@ImplementedBy(classOf[CountryDAOImpl])
trait CountryDAO {
  def list:Future[Seq[Country]]
}
