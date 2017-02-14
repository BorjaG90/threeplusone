package controllers

/**
  * Created by borja on 9/02/17.
  */
import com.google.inject.Inject
import model.{League, LeagueForm, Country}
import play.api.mvc.{Action, Controller}
import service.{LeagueService,CountryService}
import scala.concurrent.Future
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import scala.concurrent.ExecutionContext.Implicits._


class LeagueController @Inject()(val messagesApi: MessagesApi, leagueService: LeagueService, countryService: CountryService)extends Controller with I18nSupport{

  def home = Action.async { implicit request =>
    countryService.list flatMap { countries =>
      leagueService.list map {
        leagues =>
          Ok(views.html.league(LeagueForm.form,leagues,countries.sortBy(_.name)))
      }
    }
  }

  /**
    *
    * @return
    */
  def add() = Action.async { implicit request =>
    LeagueForm.form.bindFromRequest.fold(
      errorForm => Future.successful(Ok(views.html.league(errorForm,Seq.empty[(League,String)],Seq.empty[Country]))),
      data => {
        val abr = if(data.name.length()>5) data.name.substring(0, 5).trim().toUpperCase() else data.name.toUpperCase()
        val newLeague = League(Some(0L), data.name, Some(abr), data.division, data.id_country)
        leagueService.add(newLeague).map(res =>
          Redirect(routes.LeagueController.home()).flashing(Messages("flash.success") -> res)
        )
      })
  }

  /**
    * Delete League.
    *
    * @return The result to display.
    */
  def delete(id : Option[Long]) = Action.async { implicit request =>
    leagueService.delete(id) map { res =>
      Redirect(routes.LeagueController.home())
    }
  }
}
