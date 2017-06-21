package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException

import com.google.inject.Inject
import kobe.model.{Enviroment, EnviromentForm}
import kobe.service.EnviromentService
import kobe.views._
import model.UserForm

/**
  * Created by Borja Gete on 26/03/17.
  */

class EnviromentController @Inject()(val messagesApi: MessagesApi,
                                     enviromentService: EnviromentService
                                    ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.EnviromentController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    enviromentService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      if (request.session.get("email").isDefined) {
        Ok(html.listEnviroment(pageEmp, orderBy, filter))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando entornos")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    if (request.session.get("email").isDefined) {
      Ok(html.createEnviroment(EnviromentForm.form))
    } else {
      Ok(views.html.login(UserForm.loginForm))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    enviromentService.find(id).map { enviroment =>
      if (request.session.get("email").isDefined) {
        Ok(html.editEnviroment(id, EnviromentForm.form.fill(enviroment)))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error editando una entorno")
        InternalServerError(ex.getMessage)
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    EnviromentForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editEnviroment(id, formWithErrors))),
      data => {
        enviromentService.find(id).flatMap { oldEnviroment =>
          val newEnviroment = Enviroment(Some(0L), data.name, data.description, data.notes)
          val futureEnviromentUpdate = enviromentService.update(id, newEnviroment.copy(id = Some(id)))
          futureEnviromentUpdate.map { result =>
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "El entorno %s ha sido actualizado".format(newEnviroment.name))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un entorno")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    EnviromentForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createEnviroment(formWithErrors))),
      data => {
        val newEnviroment = Enviroment(Some(0L), data.name, data.description, data.notes)
        val futureEnviromentInsert = enviromentService.add(newEnviroment)
        futureEnviromentInsert.map { result =>
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "El entorno %s ha sido creado".format(newEnviroment.name))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un entorno")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureEnviromentDel = enviromentService.delete(id)
    futureEnviromentDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Entorno eliminado")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un entorno")
        InternalServerError(ex.getMessage)
    }
  }
}
