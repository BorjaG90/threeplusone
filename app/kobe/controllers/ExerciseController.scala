package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException

import com.google.inject.Inject
import kobe.model.{Category, Enviroment, Exercise, ExerciseForm, TypeExercise}
import kobe.service.{CategoryService, EnviromentService, ExerciseService, TypeExerciseService}
import kobe.views._
import model.UserForm

/**
  * Created by Borja Gete on 30/03/17.
  */

class ExerciseController @Inject()(val messagesApi: MessagesApi
                                   , exerciseService: ExerciseService
                                   , typeExerciseService: TypeExerciseService
                                   , categoryService: CategoryService
                                   , enviromentService: EnviromentService
                                  ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.ExerciseController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    enviromentService.listSimple flatMap { enviroments =>
      categoryService.listSimple flatMap { categories =>
        typeExerciseService.listSimple flatMap { types =>
          exerciseService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
            if (request.session.get("email").isDefined) {
              Ok(html.listExercise(pageEmp, orderBy, filter, types, categories, enviroments))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error listando ejercicios")
              InternalServerError(ex.getMessage)
          }
        }
      }
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    enviromentService.listSimple flatMap { enviroments =>
      categoryService.listSimple flatMap { categories =>
        typeExerciseService.listSimple map { typeExercises =>
          if (request.session.get("email").isDefined) {
            Ok(html.createExercise(ExerciseForm.form, typeExercises.sortBy(_.name)
              , categories.sortBy(_.name), enviroments.sortBy(_.name)))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    enviromentService.listSimple flatMap { enviroments =>
      categoryService.listSimple flatMap { categories =>
        typeExerciseService.listSimple flatMap { typeExercises =>
          exerciseService.find(id).map { exercise =>
            if (request.session.get("email").isDefined) {
              Ok(html.editExercise(id, ExerciseForm.form.fill(exercise), typeExercises.sortBy(_.name)
                , categories.sortBy(_.name), enviroments.sortBy(_.name)))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error editando un ejercicio")
              InternalServerError(ex.getMessage)
          }
        }
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    ExerciseForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.editExercise(
          id, formWithErrors, Seq.empty[TypeExercise], Seq.empty[Category], Seq.empty[Enviroment])
        )),
      data => {
        exerciseService.find(id).flatMap { oldExercise =>
          val newExercise = Exercise(
            Some(0L), data.name, data.idTypeExercise, data.idCategory, data.idEnviroment, data.notes
            , oldExercise.creationDate, Some(new java.util.Date())
          )
          val futureExerciseUpdate = exerciseService.update(id, newExercise.copy(id = Some(id)))
          futureExerciseUpdate.map { result =>
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "El ejercicio %s ha sido actualizado".format(newExercise.name))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un ejercicio")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    ExerciseForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.createExercise(
          formWithErrors, Seq.empty[TypeExercise], Seq.empty[Category], Seq.empty[Enviroment])
        )),
      data => {
        val newExercise = Exercise(
          Some(0L), data.name, data.idTypeExercise, data.idCategory, data.idEnviroment, data.notes
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureExerciseInsert = exerciseService.add(newExercise)
        futureExerciseInsert.map { result =>
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "El ejercicio %s ha sido creado".format(newExercise.name))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un ejercicio")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureExerciseDel = exerciseService.delete(id)
    futureExerciseDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Ejercicio eliminado")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un ejercicio")
        InternalServerError(ex.getMessage)
    }
  }
}
