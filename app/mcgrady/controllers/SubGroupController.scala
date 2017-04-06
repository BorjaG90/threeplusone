package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import com.google.inject.Inject
import mcgrady.model.{SubGroup, SubGroupForm, Group,Competition,Season}
import mcgrady.service.{SubGroupService, GroupService,CompetitionService,SeasonService}
import mcgrady.views._

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
      Ok(html.listSubGroup(pageEmp, orderBy, filter))
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
          Ok(html.createSubGroup(SubGroupForm.form, groups.sortBy(_.name),competitions,seasons))
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      competitionService.listSimple flatMap { competitions =>
        groupService.listSimple flatMap { groups =>
          subGroupService.find(id).map { subGroup =>
            Ok(html.editSubGroup(id, SubGroupForm.form.fill(subGroup), groups,competitions,seasons))
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
              home.flashing("success" -> "El subGrupo %s ha sido actualizado".format(newSubGroup.name))
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
            home.flashing("success" -> "El subGrupo %s ha sido creado".format(newSubGroup.name))
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
    futureSubGroupDel.map { result => home.flashing("success" -> "SubGrupo eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un subGrupo")
        InternalServerError(ex.getMessage)
    }
  }
}
