package service

/**
  * Created by Borja Gete on 8/02/17.
  */
import com.google.inject.ImplementedBy
import scala.concurrent.Future
import model.Country
import impl.CountryServiceImpl


@ImplementedBy(classOf[CountryServiceImpl])
trait CountryService {
  def find(id: Option[Long]): Future[Country]
  def list: Future[Seq[Country]]
  def count: Future[Int]
}
