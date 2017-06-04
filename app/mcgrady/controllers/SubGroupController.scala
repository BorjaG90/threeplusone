package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException

import com.google.inject.Inject
import mcgrady.model.{Competition, Group, Season, SubGroup, SubGroupForm}
import mcgrady.service.{CompetitionService, GroupService, SeasonService, SubGroupService}
import mcgrady.views._
import model.UserForm

/**
  * Created by Borja Gete on 29/03/17.
  */

class SubGroupController @Inject()(val messagesApi: MessagesApi
                                   , subGroupService: SubGroupService
                                   , groupService: GroupService
                                   , competitionService: CompetitionService
                                   , seasonService: SeasonService
                                  ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.SubGroupController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    subGroupService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      if (request.session.get("email").isDefined) {
      Ok(html.listSubGroup(pageEmp, orderBy, filter))
    } else {
    Ok(views.html.login(UserForm.loginForm))
  }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando subGrupos")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      competitionService.listSimple flatMap { competitions =>
        groupService.listSimple map { groups =>
          if (request.session.get("email").isDefined) {
          Ok(html.createSubGroup(SubGroupForm.form, groups.sortBy(_.name),competitions,seasons))
        } else {
        Ok(views.html.login(UserForm.loginForm))
      }
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      competitionService.listSimple flatMap { competitions =>
        groupService.listSimple flatMap { groups =>
          subGroupService.find(id).map { subGroup =>
            if (request.session.get("email").isDefined) {
            Ok(html.editSubGroup(id, SubGroupForm.form.fill(subGroup), groups,competitions,seasons))
          } else {
          Ok(views.html.login(UserForm.loginForm))
        }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error editando un subGrupo")
              InternalServerError(ex.getMessage)
          }
        }
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    SubGroupForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editSubGroup(id, formWithErrors, Seq.empty[Group], Seq.empty[Competition], Seq.empty[Season]))),
      data => {
        subGroupService.find(id).flatMap { oldSubGroup =>
            val newSubGroup = SubGroup(Some(0L), data.idGroup, data.name, data.notes
              , oldSubGroup.creationDate, Some(new java.util.Date())
            )
            val futureSubGroupUpdate = subGroupService.update(id, newSubGroup.copy(id = Some(id)))
            futureSubGroupUpdate.map { result =>
              if (request.session.get("email").isDefined) {
              home.flashing("success" -> "El subGrupo %s ha sido actualizado".format(newSubGroup.name))
            } else {
          Ok(views.html.login(UserForm.loginForm))
        }
            }.recover {
              case ex: TimeoutException =>
                Logger.error("Error actualizando un subGrupo")
                InternalServerError(ex.getMessage)
            }
          }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    SubGroupForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createSubGroup(formWithErrors, Seq.empty[Group], Seq.empty[Competition], Seq.empty[Season]))),
      data => {
        val newSubGroup = SubGroup(Some(0L), data.idGroup, data.name, data.notes
            , new java.util.Date(), Some(new java.util.Date(0))
          )
          val futureSubGroupInsert = subGroupService.add(newSubGroup)
          futureSubGroupInsert.map { result =>
            if (request.session.get("email").isDefined) {
            home.flashing("success" -> "El subGrupo %s ha sido creado".format(newSubGroup.name))
          } else {
          Ok(views.html.login(UserForm.loginForm))
        }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error guardando un subGrupo")
              InternalServerError(ex.getMessage)
          }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureSubGroupDel = subGroupService.delete(id)
    futureSubGroupDel.map { result =>
      if (request.session.get("email").isDefined) {
      home.flashing("success" -> "SubGrupo eliminado")
    } else {
    Ok(views.html.login(UserForm.loginForm))
  }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un subGrupo")
        InternalServerError(ex.getMessage)
    }
  }
}
