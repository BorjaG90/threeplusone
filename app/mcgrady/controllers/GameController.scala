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

/**
  * Created by Borja Gete on 3/04/17.
  */

class GameController @Inject()(val messagesApi: MessagesApi
                               , gameService: GameService
                               , playerService: PlayerService
                               , inscriptionService: InscriptionService
                               , arenaService: ArenaService
                               , teamService: TeamService
                              , competitionService: CompetitionService
                              , seasonService: SeasonService
                              ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.GameController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    gameService.list(page, 20, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listGame(pageEmp, orderBy, filter, new SimpleDateFormat("dd/MM/yyyy")))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando partidos")
        InternalServerError(ex.getMessage)
    }
  }

  def add(id:Long): Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      competitionService.listSimple flatMap { competitions =>
        teamService.listSimple flatMap { teams =>
          arenaService.listSimple flatMap { arenas =>
            inscriptionService.listFilterCompetition(id) flatMap { inscriptions =>
              playerService.listSimple map { players =>
                Ok(html.createGame(GameForm.form, players.sortBy(_.lastName)
                  , inscriptions, arenas.sortBy(_.name), teams.sortBy(_.name), id, competitions, seasons))
              }
            }
          }
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    teamService.listSimple flatMap { teams =>
      arenaService.listSimple flatMap { arenas =>
        inscriptionService.listSimple flatMap { inscriptions =>
          playerService.listSimple flatMap { players =>
            gameService.find(id).map { game =>
              Ok(html.editGame(id, GameForm.form.fill(game), players.sortBy(_.lastName)
                , inscriptions, arenas.sortBy(_.name), teams.sortBy(_.name)))
            }.recover {
              case ex: TimeoutException =>
                Logger.error("Error editando un partido")
                InternalServerError(ex.getMessage)
            }
          }
        }
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    GameForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.editGame(id, formWithErrors, Seq.empty[Player], Seq.empty[Inscription]
          , Seq.empty[Arena], Seq.empty[Team]))),
      data => {
        gameService.find(id).flatMap { oldGame =>
          val newGame = Game(Some(0L), data.idHome, data.idVisitor, data.dateGame
            , data.idArena, data.winner, data.mvp, data.description
            , oldGame.creationDate, Some(new java.util.Date())
          )
          val futureGameUpdate = gameService.update(id, newGame.copy(id = Some(id)))
          futureGameUpdate.map { result =>
            home.flashing("success" -> "El partido  ha sido actualizado")
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un partido")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    GameForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.createGame(formWithErrors, Seq.empty[Player], Seq.empty[Inscription]
          , Seq.empty[Arena], Seq.empty[Team], 0, Seq.empty[Competition], Seq.empty[Season]))),
      data => {
        val newGame = Game(Some(0L), data.idHome, data.idVisitor, data.dateGame
          , data.idArena, data.winner, data.mvp, data.description
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureGameInsert = gameService.add(newGame)
        futureGameInsert.map { result =>
          home.flashing("success" -> "El partido ha sido creado")
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un partido")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureGameDel = gameService.delete(id)
    futureGameDel.map { result => home.flashing("success" -> "Partido eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un partido")
        InternalServerError(ex.getMessage)
    }
  }
}
