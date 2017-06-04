package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException
import java.text.SimpleDateFormat

import com.google.inject.Inject
import mcgrady.model._
import mcgrady.service._
import mcgrady.views._
import model.UserForm

/**
  * Created by Borja Gete on 25/03/17.
  */

class PlayerController @Inject()(val messagesApi: MessagesApi
                                 , playerService: PlayerService
                                 , playerStatsService: PlayerStatsService
                                 , gameService: GameService
                                 , inscriptionService: InscriptionService
                                 , competitionService: CompetitionService
                                 , seasonService: SeasonService
                                 , teamService: TeamService
                                 , contractService: ContractService
                                ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.PlayerController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    playerService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      if (request.session.get("email").isDefined) {
        Ok(html.listPlayer(pageEmp, orderBy, filter))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando jugadores")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    if (request.session.get("email").isDefined) {
      Ok(html.createPlayer(PlayerForm.form))
    } else {
      Ok(views.html.login(UserForm.loginForm))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    playerService.find(id).map { player =>
      if (request.session.get("email").isDefined) {
        Ok(html.editPlayer(id, PlayerForm.form.fill(player)))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
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
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "El jugador %s ha sido actualizado".format(newPlayer.lastName))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
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
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "El jugador %s ha sido creado".format(newPlayer.lastName))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
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
    futurePlayerDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Jugador eliminado")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un jugador")
        InternalServerError(ex.getMessage)
    }
  }

  def view(id: Long): Action[AnyContent] = Action.async { implicit request =>
    contractService.listSimple flatMap { contracts =>
      teamService.listSimple flatMap { teams =>
        seasonService.listSimple flatMap { seasons =>
          competitionService.listSimple flatMap { competitions =>
            inscriptionService.listSimple flatMap { inscriptions =>
              gameService.listSimple flatMap { games =>
                playerStatsService.listSimple flatMap { pStats =>
                  playerService.find(id).map { player =>
                    if (request.session.get("email").isDefined) {
                      Ok(html.viewPlayer(player, pStats, games, inscriptions, competitions, seasons, teams, contracts
                        , new SimpleDateFormat("dd/MM/yyyy")))
                    } else {
                      Ok(views.html.login(UserForm.loginForm))
                    }
                  }.recover {
                    case ex: TimeoutException =>
                      Logger.error("Error visualizando jugador")
                      InternalServerError(ex.getMessage)
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
