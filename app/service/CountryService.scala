package service

import scala.concurrent.Future

import model.{Countries, Country}

/**
  * Created by borja on 8/02/17.
  */
object CountryService {
  def list: Future[Seq[Country]] = {
    Countries.listAll
  }
}
