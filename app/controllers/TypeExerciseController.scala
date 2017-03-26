package controllers

/**
  * Created by Borja Gete on 25/03/17.
  */

import com.google.inject.Inject
import model.{TypeExercise, TypeExerciseForm}
import play.api._
import play.api.mvc._
import service.TypeExerciseService
import scala.concurrent.Future
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import views._

import java.util.concurrent.TimeoutException

class TypeExerciseController @Inject()(val messagesApi: MessagesApi,
                               typeExerciseService: TypeExerciseService
                              ) extends Controller with I18nSupport {

  val home = Redirect(routes.TypeExerciseController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    typeExerciseService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listTypeExercise(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando tipos")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    Ok(html.createTypeExercise(TypeExerciseForm.form))
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    typeExerciseService.find(id).map { typeExercise =>
      Ok(html.editTypeExercise(id, TypeExerciseForm.form.fill(typeExercise)))
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
            home.flashing("success" -> "El tipo %s ha sido actualizado".format(newTypeExercise.name))
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
          home.flashing("success" -> "El tipo %s ha sido creado".format(
            newTypeExercise.name))
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
    futureTypeExerciseDel.map { result => home.flashing("success" -> "Tipo eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un tipo")
        InternalServerError(ex.getMessage)
    }
  }
}
