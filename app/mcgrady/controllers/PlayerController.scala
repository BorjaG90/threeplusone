package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import com.google.inject.Inject
import mcgrady.model.{Player, PlayerForm}
import mcgrady.service.PlayerService
import mcgrady.views._

/**
  * Created by Borja Gete on 25/03/17.
  */

class PlayerController @Inject()(val messagesApi: MessagesApi,
                               playerService: PlayerService
                              ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.PlayerController.list(0, 2, ""))

  def index = Action { home }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    playerService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listPlayer(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando jugadores")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    Ok(html.createPlayer(PlayerForm.form))
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    playerService.find(id).map { player =>
      Ok(html.editPlayer(id, PlayerForm.form.fill(player)))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error editando un jugador")
        InternalServerError(ex.getMessage)
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    PlayerForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editPlayer(id, formWithErrors))),
      data => {
        playerService.find(id).flatMap { oldPlayer =>
          val newPlayer = Player(Some(0L), data.firstName, data.lastName, data.nickName
            , data.height, data.weight, data.description
            , oldPlayer.creationDate, Some(new java.util.Date())
          )
          val futurePlayerUpdate = playerService.update(id, newPlayer.copy(id = Some(id)))
          futurePlayerUpdate.map { result =>
            home.flashing("success" -> "El jugador %s ha sido actualizado".format(newPlayer.lastName))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un jugador")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    PlayerForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createPlayer(formWithErrors))),
      data => {
        val newPlayer = Player(Some(0L), data.firstName, data.lastName, data.nickName
          , data.height, data.weight, data.description
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futurePlayerInsert = playerService.add(newPlayer)
        futurePlayerInsert.map { result =>
          home.flashing("success" -> "El jugador %s ha sido creado".format(newPlayer.lastName))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un jugador")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futurePlayerDel = playerService.delete(id)
    futurePlayerDel.map { result => home.flashing("success" -> "Jugador eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un jugador")
        InternalServerError(ex.getMessage)
    }
  }
}
