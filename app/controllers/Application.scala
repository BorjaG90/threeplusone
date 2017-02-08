package controllers

import model.Country
import service.CountryService
import play.api._
import play.api.mvc._
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global

class Application extends Controller {
  def index = Action.async { implicit request =>
    CountryService.listAllCountries map { countries =>
      Ok(views.html.index(countries))
    }
  }
}
