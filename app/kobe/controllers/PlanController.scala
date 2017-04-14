package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import java.text.SimpleDateFormat
import com.google.inject.Inject
import kobe.model.{Plan, PlanForm}
import kobe.service.PlanService
import kobe.views._

/**
  * Created by Borja Gete on 28/03/17.
  */

class PlanController @Inject()(val messagesApi: MessagesApi,
                               planService: PlanService
                              ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.PlanController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    planService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listPlan(pageEmp, orderBy, filter, new SimpleDateFormat("dd/MM/yyyy")))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando planes")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    Ok(html.createPlan(PlanForm.form))
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    planService.find(id).map { plan =>
      Ok(html.editPlan(id, PlanForm.form.fill(plan)))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error editando un plan")
        InternalServerError(ex.getMessage)
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    PlanForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editPlan(id, formWithErrors))),
      data => {
        planService.find(id).flatMap { oldPlan =>
          val newPlan = Plan(Some(0L), data.name, data.date, data.description, data.notes
            , oldPlan.creationDate, Some(new java.util.Date())
          )
          val futurePlanUpdate = planService.update(id, newPlan.copy(id = Some(id)))
          futurePlanUpdate.map { result =>
            home.flashing("success" -> "El plan %s ha sido actualizado".format(newPlan.name))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un plan")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    PlanForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createPlan(formWithErrors))),
      data => {
        val newPlan = Plan(Some(0L), data.name, data.date, data.description, data.notes
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futurePlanInsert = planService.add(newPlan)
        futurePlanInsert.map { result =>
          home.flashing("success" -> "El plan %s ha sido creado".format(newPlan.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un plan")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futurePlanDel = planService.delete(id)
    futurePlanDel.map { result => home.flashing("success" -> "Plan eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un plan")
        InternalServerError(ex.getMessage)
    }
  }
}
