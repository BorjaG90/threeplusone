package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException

import com.google.inject.Inject
import kobe.model.{TypeExercise, TypeExerciseForm}
import kobe.service.TypeExerciseService
import kobe.views._
import model.UserForm

/**
  * Created by Borja Gete on 25/03/17.
  */

class TypeExerciseController @Inject()(val messagesApi: MessagesApi,
                                       typeExerciseService: TypeExerciseService
                                      ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.TypeExerciseController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    typeExerciseService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      if (request.session.get("email").isDefined) {
        Ok(html.listTypeExercise(pageEmp, orderBy, filter))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando tipos")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    if (request.session.get("email").isDefined) {
      Ok(html.createTypeExercise(TypeExerciseForm.form))
    } else {
      Ok(views.html.login(UserForm.loginForm))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    typeExerciseService.find(id).map { typeExercise =>
      if (request.session.get("email").isDefined) {
        Ok(html.editTypeExercise(id, TypeExerciseForm.form.fill(typeExercise)))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error editando un tipo")
        InternalServerError(ex.getMessage)
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    TypeExerciseForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editTypeExercise(id, formWithErrors))),
      data => {
        typeExerciseService.find(id).flatMap { oldTypeExercise =>
          val newTypeExercise = TypeExercise(Some(0L), data.name, data.description, data.notes)
          val futureTypeExerciseUpdate = typeExerciseService.update(id, newTypeExercise.copy(id = Some(id)))
          futureTypeExerciseUpdate.map { result =>
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "El tipo %s ha sido actualizado".format(newTypeExercise.name))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un tipo")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    TypeExerciseForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createTypeExercise(formWithErrors))),
      data => {
        val newTypeExercise = TypeExercise(Some(0L), data.name, data.description, data.notes)
        val futureTypeExerciseInsert = typeExerciseService.add(newTypeExercise)
        futureTypeExerciseInsert.map { result =>
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "El tipo %s ha sido creado".format(newTypeExercise.name))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un tipo")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureTypeExerciseDel = typeExerciseService.delete(id)
    futureTypeExerciseDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Tipo eliminado")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un tipo")
        InternalServerError(ex.getMessage)
    }
  }
}
