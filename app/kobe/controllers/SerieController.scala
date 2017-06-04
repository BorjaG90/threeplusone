package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException

import com.google.inject.Inject
import kobe.model.{Exercise, Plan, Serie, SerieForm, Session}
import kobe.service.{ExerciseService, PlanService, SerieService, SessionService}
import kobe.views._
import model.UserForm

/**
  * Created by Borja Gete on 10/04/17.
  */

class SerieController @Inject()(val messagesApi: MessagesApi
                                , serieService: SerieService
                                , sessionService: SessionService
                                , planService: PlanService
                                , exerciseService: ExerciseService
                               ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.SerieController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    serieService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      if (request.session.get("email").isDefined) {
        Ok(html.listSerie(pageEmp, orderBy, filter))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando series")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    planService.listSimple flatMap { plans =>
      exerciseService.listSimple flatMap { exercises =>
        sessionService.listSimple map { sessions =>
          if (request.session.get("email").isDefined) {
            Ok(html.createSerie(SerieForm.form, sessions.sortBy(_.name), exercises.sortBy(_.name), plans.sortBy(_.name)))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    planService.listSimple flatMap { plans =>
      exerciseService.listSimple flatMap { exercises =>
        sessionService.listSimple flatMap { sessions =>
          serieService.find(id).map { serie =>
            if (request.session.get("email").isDefined) {
              Ok(html.editSerie(id, SerieForm.form.fill(serie), sessions.sortBy(_.name)
                , exercises.sortBy(_.name), plans.sortBy(_.name)))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error editando una serie")
              InternalServerError(ex.getMessage)
          }
        }
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    SerieForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editSerie(id, formWithErrors, Seq.empty[Session], Seq.empty[Exercise], Seq.empty[Plan]))),
      data => {
        serieService.find(id).flatMap { oldSerie =>
          val newSerie = Serie(Some(0L), data.idSession, data.idExercise, data.notes
            , oldSerie.creationDate, Some(new java.util.Date())
          )
          val futureSerieUpdate = serieService.update(id, newSerie.copy(id = Some(id)))
          futureSerieUpdate.map { result =>
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "La serie ha sido actualizada")
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una serie")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    SerieForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createSerie(formWithErrors, Seq.empty[Session], Seq.empty[Exercise], Seq.empty[Plan]))),
      data => {
        val newSerie = Serie(Some(0L), data.idSession, data.idExercise, data.notes
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureSerieInsert = serieService.add(newSerie)
        futureSerieInsert.map { result =>
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "La serie ha sido creada")
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una serie")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureSerieDel = serieService.delete(id)
    futureSerieDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Serie eliminada")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una serie")
        InternalServerError(ex.getMessage)
    }
  }
}
