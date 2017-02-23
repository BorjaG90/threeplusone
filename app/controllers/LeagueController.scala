package controllers

/**
  * Created by Borja Gete on 9/02/17.
  */
import com.google.inject.Inject
import model.{League, LeagueForm, Country}
import play.api._
import play.api.mvc._
import service.{LeagueService,CountryService}
import scala.concurrent.Future
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import views._

import java.util.concurrent.TimeoutException

class LeagueController @Inject()(val messagesApi: MessagesApi, leagueService: LeagueService, countryService: CountryService)extends Controller with I18nSupport{

  val home = Redirect(routes.LeagueController.list(0, 2, ""))

  def index = Action { home }

  /*def list: Action[AnyContent] = Action.async { implicit request =>
    service.list map { pageEmp =>
      Ok(html.listLeague(pageEmp))
    }
  }*/
  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    leagueService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listLeague(pageEmp, orderBy, filter, countryService))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando ligas")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    countryService.list map { countries =>
      Ok(html.createLeague(LeagueForm.form, countries.sortBy(_.name)))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    countryService.list flatMap { countries =>
      leagueService.find(id).map { league =>
        Ok(html.editLeague(id, LeagueForm.form.fill(league), countries.sortBy(_.name)))
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error editando una liga")
          InternalServerError(ex.getMessage)
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    LeagueForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editLeague(id, formWithErrors,Seq.empty[Country]))),
      data => {
        val abr = if(data.name.length()>5) data.name.substring(0, 5).trim().toUpperCase() else data.name.toUpperCase()
        val newLeague = League(Some(0L), data.name, Some(abr), data.division, data.id_country)
        val futureLeagueUpdate = leagueService.update(id, newLeague.copy(id = Some(id)))
        futureLeagueUpdate.map { result =>
          home.flashing("success" -> "La Liga %s ha sido actualizada".format(newLeague.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error actualizando una liga")
            InternalServerError(ex.getMessage)
        }
      })
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    LeagueForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createLeague(formWithErrors,Seq.empty[Country]))),
      data => {
        val abr = if(data.name.length()>5) data.name.substring(0, 5).trim().toUpperCase() else data.name.toUpperCase()
        val newLeague = League(Some(0L), data.name, Some(abr), data.division, data.id_country)
        val futureLeagueInsert = leagueService.add(newLeague)
        futureLeagueInsert.map { result => home.flashing("success" -> "La liga %s ha sido creada".format(newLeague.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una liga")
            InternalServerError(ex.getMessage)
        }
      })
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureLeagueDel = leagueService.delete(id)
    futureLeagueDel.map { result => home.flashing("success" -> "Liga eliminada") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una liga")
        InternalServerError(ex.getMessage)
    }
  }
}
