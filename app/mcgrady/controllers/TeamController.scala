package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import com.google.inject.Inject
import mcgrady.model.{Team, TeamForm, Country}
import mcgrady.service.{TeamService, CountryService}
import mcgrady.views._

/**
  * Created by Borja Gete on 27/03/17.
  */

class TeamController @Inject()(val messagesApi: MessagesApi,
                                teamService: TeamService,
                                countryService: CountryService
                               ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.TeamController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    teamService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listTeam(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando equipos")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    countryService.list map { countries =>
      Ok(html.createTeam(TeamForm.form, countries.sortBy(_.name)))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    countryService.list flatMap { countries =>
      teamService.find(id).map { team =>
        Ok(html.editTeam(id, TeamForm.form.fill(team), countries.sortBy(_.name)))
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error editando un equipo")
          InternalServerError(ex.getMessage)
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    TeamForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.editTeam(id, formWithErrors, Seq.empty[Country]))),
      data => {
        teamService.find(id).flatMap { oldTeam =>
          val newTeam = Team(Some(0L), data.name, data.abrv, data.id_country
            , oldTeam.creationDate, Some(new java.util.Date())
          )
          val futureTeamUpdate = teamService.update(id, newTeam.copy(id = Some(id)))
          futureTeamUpdate.map { result =>
            home.flashing("success" -> "El equipo %s ha sido actualizado".format(newTeam.name))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un equipo")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    TeamForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.createTeam(formWithErrors, Seq.empty[Country]))),
      data => {
        val newTeam = Team(Some(0L), data.name, data.abrv, data.id_country
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureTeamInsert = teamService.add(newTeam)
        futureTeamInsert.map { result =>
          home.flashing("success" -> "El equipo %s ha sido creado".format(
            newTeam.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un equipo")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureTeamDel = teamService.delete(id)
    futureTeamDel.map { result => home.flashing("success" -> "Equipo eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un equipo")
        InternalServerError(ex.getMessage)
    }
  }
}
