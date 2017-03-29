package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import com.google.inject.Inject
import mcgrady.model.{Group, GroupForm,Competition}
import mcgrady.service.{GroupService,CompetitionService}
import mcgrady.views._

/**
  * Created by Borja Gete on 29/03/17.
  */

class GroupController @Inject()(val messagesApi: MessagesApi
                                , groupService: GroupService
                                , competitionService: CompetitionService
                               ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.GroupController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    groupService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listGroup(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando grupos")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    competitionService.listSimple map { competitions =>
      Ok(html.createGroup(GroupForm.form, competitions.sortBy(_.name)))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    competitionService.listSimple flatMap { competitions =>
      groupService.find(id).map { group =>
        Ok(html.editGroup(id, GroupForm.form.fill(group), competitions))
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error editando un grupo")
          InternalServerError(ex.getMessage)
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    GroupForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editGroup(id, formWithErrors, Seq.empty[Competition]))),
      data => {
        groupService.find(id).flatMap { oldGroup =>
          val newGroup = Group(Some(0L), data.idCompetition, data.name, data.notes
            , oldGroup.creationDate, Some(new java.util.Date())
          )
          val futureGroupUpdate = groupService.update(id, newGroup.copy(id = Some(id)))
          futureGroupUpdate.map { result =>
            home.flashing("success" -> "El grupo %s ha sido actualizado".format(newGroup.name))
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
      formWithErrors => Future.successful(BadRequest(html.createGroup(formWithErrors, Seq.empty[Competition]))),
      data => {
        val newGroup = Group(Some(0L), data.idCompetition, data.name, data.notes
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureGroupInsert = groupService.add(newGroup)
        futureGroupInsert.map { result =>
          home.flashing("success" -> "El grupo %s ha sido creado".format(newGroup.name))
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
    futureGroupDel.map { result => home.flashing("success" -> "Grupo eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un grupo")
        InternalServerError(ex.getMessage)
    }
  }
}
