package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, MessagesApi}
import java.util.concurrent.TimeoutException

import com.google.inject.Inject
import kobe.model.{Unit, UnitForm}
import kobe.service.UnitService
import kobe.views._
import model.UserForm

/**
  * Created by Borja Gete on 25/03/17.
  */

class UnitController @Inject()(val messagesApi: MessagesApi,
                               unitService: UnitService
                              ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.UnitController.list(0, 2, ""))

  def index = Action { home }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    unitService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      if (request.session.get("email").isDefined) {
        Ok(html.listUnit(pageEmp, orderBy, filter))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando unidades")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    if (request.session.get("email").isDefined) {
      Ok(html.createUnit(UnitForm.form))
    } else {
      Ok(views.html.login(UserForm.loginForm))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    unitService.find(id).map { unit =>
      if (request.session.get("email").isDefined) {
        Ok(html.editUnit(id, UnitForm.form.fill(unit)))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
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
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "La unidad %s ha sido actualizada".format(newUnit.name))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
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
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "La unidad %s ha sido creado".format(newUnit.name))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
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
    futureUnitDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Unidad eliminada")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una unidad")
        InternalServerError(ex.getMessage)
    }
  }
}
