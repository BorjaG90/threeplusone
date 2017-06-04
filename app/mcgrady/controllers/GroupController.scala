package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException

import com.google.inject.Inject
import mcgrady.model.{Competition, Group, GroupForm, Season}
import mcgrady.service.{CompetitionService, GroupService, SeasonService}
import mcgrady.views._
import model.UserForm

/**
  * Created by Borja Gete on 29/03/17.
  */

class GroupController @Inject()(val messagesApi: MessagesApi
                                , groupService: GroupService
                                , competitionService: CompetitionService
                                , seasonService: SeasonService
                               ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.GroupController.list(0, 2, ""))

  def index = Action { home }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    groupService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      if (request.session.get("email").isDefined) {
        Ok(html.listGroup(pageEmp, orderBy, filter))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando grupos")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      competitionService.listSimple map { competitions =>
        if (request.session.get("email").isDefined) {
          Ok(html.createGroup(GroupForm.form, competitions.sortBy(_.name), seasons))
        } else {
          Ok(views.html.login(UserForm.loginForm))
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      competitionService.listSimple flatMap { competitions =>
        groupService.find(id).map { group =>
          if (request.session.get("email").isDefined) {
            Ok(html.editGroup(id, GroupForm.form.fill(group), competitions, seasons))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error editando un grupo")
            InternalServerError(ex.getMessage)
        }
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    GroupForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editGroup(id, formWithErrors, Seq.empty[Competition], Seq.empty[Season]))),
      data => {
        groupService.find(id).flatMap { oldGroup =>
          val newGroup = Group(Some(0L), data.idCompetition, data.name, data.notes
            , oldGroup.creationDate, Some(new java.util.Date())
          )
          val futureGroupUpdate = groupService.update(id, newGroup.copy(id = Some(id)))
          futureGroupUpdate.map { result =>
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "El grupo %s ha sido actualizado".format(newGroup.name))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un grupo")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    GroupForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createGroup(formWithErrors, Seq.empty[Competition], Seq.empty[Season]))),
      data => {
        val newGroup = Group(Some(0L), data.idCompetition, data.name, data.notes
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureGroupInsert = groupService.add(newGroup)
        futureGroupInsert.map { result =>
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "El grupo %s ha sido creado".format(newGroup.name))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un grupo")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureGroupDel = groupService.delete(id)
    futureGroupDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Grupo eliminado")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un grupo")
        InternalServerError(ex.getMessage)
    }
  }
}
