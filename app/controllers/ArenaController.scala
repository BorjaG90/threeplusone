package controllers

/**
  * Created by Borja Gete on 9/02/17.
  */

import com.google.inject.Inject
import model.{Arena, ArenaForm, Country}
import play.api._
import play.api.mvc._
import service.{ArenaService, CountryService, SeasonService}
import scala.concurrent.Future
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import views._

import java.util.concurrent.TimeoutException

class ArenaController @Inject()(val messagesApi: MessagesApi,
                                arenaService: ArenaService,
                                countryService: CountryService
                               ) extends Controller with I18nSupport {

  val home = Redirect(routes.ArenaController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    arenaService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listArena(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando estadios")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    countryService.list map { countries =>
      Ok(html.createArena(ArenaForm.form, countries.sortBy(_.name)))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    countryService.list flatMap { countries =>
      arenaService.find(id).map { arena =>
        Ok(html.editArena(id, ArenaForm.form.fill(
          arena), countries.sortBy(_.name)))
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error editando un estadio")
          InternalServerError(ex.getMessage)
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    ArenaForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.editArena(id, formWithErrors, Seq.empty[Country]))),
      data => {
        arenaService.find(id).flatMap { oldArena =>
          val newArena = Arena(Some(0L), data.name, data.direction, data.id_country
            , oldArena.creationDate, Some(new java.util.Date()), "F"
          )
          val futureArenaUpdate = arenaService.update(id, newArena.copy(id = Some(id)))
          futureArenaUpdate.map { result =>
            home.flashing("success" -> "El estadio %s ha sido actualizado".format(newArena.name))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un estadio")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    ArenaForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.createArena(formWithErrors, Seq.empty[Country]))),
      data => {
        val newArena = Arena(Some(0L), data.name, data.direction, data.id_country
          , new java.util.Date(), Some(new java.util.Date(0)), "F"
        )
        val futureArenaInsert = arenaService.add(newArena)
        futureArenaInsert.map { result =>
          home.flashing("success" -> "El estadio %s ha sido creado".format(
            newArena.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un estadio")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureArenaDel = arenaService.delete(id)
    futureArenaDel.map { result => home.flashing("success" -> "Estadio eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un estadio")
        InternalServerError(ex.getMessage)
    }
  }
}
