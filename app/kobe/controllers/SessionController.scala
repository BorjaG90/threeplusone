package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import com.google.inject.Inject
import kobe.model.{Session, SessionForm,Plan}
import kobe.service.{SessionService,PlanService}
import kobe.views._

/**
  * Created by Borja Gete on 29/03/17.
  */

class SessionController @Inject()(val messagesApi: MessagesApi
                                , sessionService: SessionService
                                , planService: PlanService
                               ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.SessionController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    sessionService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listSession(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando sesiones")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    planService.listSimple map { plans =>
      Ok(html.createSession(SessionForm.form, plans.sortBy(_.name)))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    planService.listSimple flatMap { plans =>
      sessionService.find(id).map { session =>
        Ok(html.editSession(id, SessionForm.form.fill(session), plans))
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error editando una sesión")
          InternalServerError(ex.getMessage)
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    SessionForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editSession(id, formWithErrors, Seq.empty[Plan]))),
      data => {
        sessionService.find(id).flatMap { oldSession =>
          val newSession = Session(Some(0L), data.name, data.idPlan, data.notes
            , oldSession.creationDate, Some(new java.util.Date())
          )
          val futureSessionUpdate = sessionService.update(id, newSession.copy(id = Some(id)))
          futureSessionUpdate.map { result =>
            home.flashing("success" -> "La sesion %s ha sido actualizada".format(newSession.name))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una sesion")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    SessionForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createSession(formWithErrors, Seq.empty[Plan]))),
      data => {
        val newSession = Session(Some(0L), data.name, data.idPlan, data.notes
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureSessionInsert = sessionService.add(newSession)
        futureSessionInsert.map { result =>
          home.flashing("success" -> "La sesión %s ha sido creada".format(newSession.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una sesión")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureSessionDel = sessionService.delete(id)
    futureSessionDel.map { result => home.flashing("success" -> "Sesión eliminada") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una sesión")
        InternalServerError(ex.getMessage)
    }
  }
}
