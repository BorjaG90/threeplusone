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
import mcgrady.model.{TeamStats, TeamStatsForm, Inscription, Game,Team}
import mcgrady.service.{TeamStatsService, InscriptionService, GameService,TeamService}
import mcgrady.views._

/**
  * Created by Borja Gete on 5/04/17.
  */

class TeamStatsController @Inject()(val messagesApi: MessagesApi
                                      , teamStatsService: TeamStatsService
                                      , inscriptionService: InscriptionService
                                      , gameService: GameService
                                    , teamService: TeamService
                                     ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.TeamStatsController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    teamStatsService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listTeamStats(pageEmp, orderBy, filter, new SimpleDateFormat("dd/MM/yyyy")))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando Líneas")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    teamService.listSimple flatMap { teams =>
      gameService.listSimple flatMap { games =>
        inscriptionService.listSimple map { inscriptions =>
          Ok(html.createTeamStats(TeamStatsForm.form, games
            , inscriptions,teams, new SimpleDateFormat("dd/MM/yyyy")))
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    teamService.listSimple flatMap { teams =>
      gameService.listSimple flatMap { games =>
        inscriptionService.listSimple flatMap { inscriptions =>
          teamStatsService.find(id).map { teamStats =>
            Ok(html.editTeamStats(id, TeamStatsForm.form.fill(teamStats), games
              , inscriptions,teams, new SimpleDateFormat("dd/MM/yyyy")))
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
      TeamStatsForm.form.bindFromRequest.fold(
        formWithErrors => Future.successful(
          BadRequest(html.editTeamStats(id, formWithErrors, Seq.empty[Game], Seq.empty[Inscription],Seq.empty[Team], new SimpleDateFormat("dd/MM/yyyy")))),
        data => {
          val newTeamStats = TeamStats(Some(0L), data.idGame
            , data.idInscription
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
          val futureTeamStatsUpdate = teamStatsService.update(id, newTeamStats.copy(id = Some(id)))
          futureTeamStatsUpdate.map {
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
      TeamStatsForm.form.bindFromRequest.fold(
        formWithErrors => Future.successful(
          BadRequest(html.createTeamStats(formWithErrors, Seq.empty[Game], Seq.empty[Inscription],Seq.empty[Team], new SimpleDateFormat("dd/MM/yyyy")))),
        data => {
          val newTeamStats = TeamStats(Some(0L), data.idGame
            , data.idInscription
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
          val futureTeamStatsInsert = teamStatsService.add(newTeamStats)
          futureTeamStatsInsert.map {
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
      val futureTeamStatsDel = teamStatsService.delete(id)
      futureTeamStatsDel.map {
        result => home.flashing("success" -> "Línea eliminada")
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error borrando una Línea")
          InternalServerError(ex.getMessage)
      }
  }
}
