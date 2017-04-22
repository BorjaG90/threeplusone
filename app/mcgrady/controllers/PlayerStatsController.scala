package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import java.text.SimpleDateFormat
import com.google.inject.Inject
import mcgrady.model.{PlayerStats, PlayerStatsForm, Player, Game,Team}
import mcgrady.service.{PlayerStatsService, PlayerService, GameService,TeamService}
import mcgrady.views._

/**
  * Created by Borja Gete on 5/04/17.
  */

class PlayerStatsController @Inject()(val messagesApi: MessagesApi
                                      , playerStatsService: PlayerStatsService
                                      , playerService: PlayerService
                                      , gameService: GameService
                                     , teamService: TeamService
                                     ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.PlayerStatsController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    playerStatsService.list(page, 20, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listPlayerStats(pageEmp, orderBy, filter, new SimpleDateFormat("dd/MM/yyyy")))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando Líneas")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    teamService.listSimple flatMap { teams =>
      gameService.listSimple flatMap { games =>
        playerService.listSimple map { players =>
          Ok(html.createPlayerStats(PlayerStatsForm.form, games
            , players.sortBy(_.lastName),teams, new SimpleDateFormat("dd/MM/yyyy")))
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    teamService.listSimple flatMap { teams =>
      gameService.listSimple flatMap { games =>
        playerService.listSimple flatMap { players =>
          playerStatsService.find(id).map { playerStats =>
            Ok(html.editPlayerStats(id, PlayerStatsForm.form.fill(playerStats), games
              , players.sortBy(_.lastName),teams, new SimpleDateFormat("dd/MM/yyyy")))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error editando una Línea")
              InternalServerError(ex.getMessage)
          }
        }
      }
    }
  }


  def update(id: Long): Action[AnyContent] = Action.async {
    implicit request =>
      PlayerStatsForm.form.bindFromRequest.fold(
        formWithErrors => Future.successful(
          BadRequest(html.editPlayerStats(id, formWithErrors, Seq.empty[Game], Seq.empty[Player],Seq.empty[Team], new SimpleDateFormat("dd/MM/yyyy")))),
        data => {
          val newPlayerStats = PlayerStats(Some(0L), data.idGame
            , data.idPlayer
            , data.points
            , data.offReb
            , data.defReb
            , data.assists
            , data.blocks
            , data.steals
            , data.fouls
            , data.techFouls
            , data.flagFouls
            , data.turnovers
            , data.minutes
            , data.fga
            , data.fgm
            , data.fta
            , data.ftm
            , data.t3a
            , data.t3m
          )
          val futurePlayerStatsUpdate = playerStatsService.update(id, newPlayerStats.copy(id = Some(id)))
          futurePlayerStatsUpdate.map {
            result =>
              home.flashing("success" -> "La Línea ha sido actualizado")
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una Línea")
              InternalServerError(ex.getMessage)
          }
        }
      )
  }

  def save: Action[AnyContent] = Action.async {
    implicit request =>
      PlayerStatsForm.form.bindFromRequest.fold(
        formWithErrors => Future.successful(
          BadRequest(html.createPlayerStats(formWithErrors, Seq.empty[Game], Seq.empty[Player], Seq.empty[Team], new SimpleDateFormat("dd/MM/yyyy")))),
        data => {
          val newPlayerStats = PlayerStats(Some(0L), data.idGame
            , data.idPlayer
            , data.points
            , data.offReb
            , data.defReb
            , data.assists
            , data.blocks
            , data.steals
            , data.fouls
            , data.techFouls
            , data.flagFouls
            , data.turnovers
            , data.minutes
            , data.fga
            , data.fgm
            , data.fta
            , data.ftm
            , data.t3a
            , data.t3m
          )
          val futurePlayerStatsInsert = playerStatsService.add(newPlayerStats)
          futurePlayerStatsInsert.map {
            result =>
              home.flashing("success" -> "La Línea ha sido creada")
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error guardando una Línea")
              InternalServerError(ex.getMessage)
          }
        }
      )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async {
    implicit request =>
      val futurePlayerStatsDel = playerStatsService.delete(id)
      futurePlayerStatsDel.map {
        result => home.flashing("success" -> "Línea eliminada")
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error borrando una Línea")
          InternalServerError(ex.getMessage)
      }
  }
}
