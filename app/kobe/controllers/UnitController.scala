package kobe.controllers

import com.google.inject.Inject
import kobe.model.{Unit, UnitForm}
import play.api._
import play.api.mvc._
import kobe.service.UnitService
import scala.concurrent.Future
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import kobe.views._
import java.util.concurrent.TimeoutException

/**
  * Created by Borja Gete on 25/03/17.
  */

class UnitController @Inject()(val messagesApi: MessagesApi,
                               unitService: UnitService
                              ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.UnitController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    unitService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listUnit(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando unidades")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    Ok(html.createUnit(UnitForm.form))
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    unitService.find(id).map { unit =>
      Ok(html.editUnit(id, UnitForm.form.fill(unit)))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error editando una unidad")
        InternalServerError(ex.getMessage)
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    UnitForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editUnit(id, formWithErrors))),
      data => {
        unitService.find(id).flatMap { oldUnit =>
          val newUnit = Unit(Some(0L), data.name, data.description, data.typeUnit
            , oldUnit.creationDate, Some(new java.util.Date())
          )
          val futureUnitUpdate = unitService.update(id, newUnit.copy(id = Some(id)))
          futureUnitUpdate.map { result =>
            home.flashing("success" -> "La unidad %s ha sido actualizado".format(newUnit.name))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una unidad")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    UnitForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createUnit(formWithErrors))),
      data => {
        val newUnit = Unit(Some(0L), data.name, data.description, data.typeUnit
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureUnitInsert = unitService.add(newUnit)
        futureUnitInsert.map { result =>
          home.flashing("success" -> "La unidad %s ha sido creado".format(
            newUnit.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una unidad")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureUnitDel = unitService.delete(id)
    futureUnitDel.map { result => home.flashing("success" -> "Unidad eliminada") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una unidad")
        InternalServerError(ex.getMessage)
    }
  }
}
