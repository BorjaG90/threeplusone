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
  * Created by Borja Gete on 3/04/17.
  */

class GameController @Inject()(val messagesApi: MessagesApi
                               , gameService: GameService
                               , playerService: PlayerService
                               , contractService: ContractService
                               , inscriptionService: InscriptionService
                               , arenaService: ArenaService
                               , teamService: TeamService
                               , competitionService: CompetitionService
                               , seasonService: SeasonService
                               , playerStatsService: PlayerStatsService
                               , teamStatsService: TeamStatsService
                              ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.GameController.list(0, 2, ""))

  def index = Action { home }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    playerService.listSimple flatMap { players =>
      arenaService.listSimple flatMap { arenas =>
        gameService.list(page, 20, orderBy, "%" + filter + "%").map { pageEmp =>
          if (request.session.get("email").isDefined) {
            Ok(html.listGame(pageEmp, orderBy, filter, new SimpleDateFormat("dd/MM/yyyy"), players, arenas))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error listando partidos")
            InternalServerError(ex.getMessage)
        }
      }
    }
  }

  def add(id: Long): Action[AnyContent] = Action.async { implicit request =>
    contractService.listSimple flatMap { contracts =>
      seasonService.listSimple flatMap { seasons =>
        competitionService.listSimple flatMap { competitions =>
          teamService.listSimple flatMap { teams =>
            arenaService.listSimple flatMap { arenas =>
              inscriptionService.listFilterCompetition(id) flatMap { inscriptions =>
                playerService.listSimple map { players =>
                  if (request.session.get("email").isDefined) {
                    Ok(html.createGame(GameForm.form, players.sortBy(_.lastName)
                      , inscriptions, arenas.sortBy(_.name), teams.sortBy(_.name), id, competitions, seasons, contracts))
                  } else {
                    Ok(views.html.login(UserForm.loginForm))
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  def edit(id: Long, idComp: Long): Action[AnyContent] = Action.async { implicit request =>
    contractService.listSimple flatMap { contracts =>
      seasonService.listSimple flatMap { seasons =>
        competitionService.listSimple flatMap { competitions =>
          teamService.listSimple flatMap { teams =>
            arenaService.listSimple flatMap { arenas =>
              inscriptionService.listFilterCompetition(idComp) flatMap { inscriptions =>
                playerService.listSimple flatMap { players =>
                  gameService.find(id).map { game =>
                    if (request.session.get("email").isDefined) {
                      Ok(html.editGame(id, GameForm.form.fill(game), players.sortBy(_.lastName)
                        , inscriptions, arenas.sortBy(_.name), teams.sortBy(_.name), idComp, competitions, seasons, contracts))
                    } else {
                      Ok(views.html.login(UserForm.loginForm))
                    }
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
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    GameForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.editGame(id, formWithErrors, Seq.empty[Player], Seq.empty[Inscription]
          , Seq.empty[Arena], Seq.empty[Team], 0, Seq.empty[Competition], Seq.empty[Season], Seq.empty[Contract]))),
      data => {
        gameService.find(id).flatMap { oldGame =>
          val newGame = Game(Some(0L), data.idHome, data.idVisitor, data.dateGame
            , data.idArena, data.winner, data.mvp, data.description
            , oldGame.creationDate, Some(new java.util.Date())
          )
          val futureGameUpdate = gameService.update(id, newGame.copy(id = Some(id)))
          futureGameUpdate.map { result =>
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "El partido  ha sido actualizado")
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
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
          , Seq.empty[Arena], Seq.empty[Team], 0, Seq.empty[Competition], Seq.empty[Season], Seq.empty[Contract]))),
      data => {
        val newGame = Game(Some(0L), data.idHome, data.idVisitor, data.dateGame
          , data.idArena, data.winner, data.mvp, data.description
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureGameInsert = gameService.add(newGame)
        futureGameInsert.map { result =>
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "El partido ha sido creado")
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
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
    futureGameDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Partido eliminado")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un partido")
        InternalServerError(ex.getMessage)
    }
  }

  def view(id: Long): Action[AnyContent] = Action.async { implicit request =>
    teamService.listSimple flatMap { teams =>
      teamStatsService.listSimple flatMap { tStats =>
        contractService.listSimple flatMap { contracts =>
          inscriptionService.listSimple flatMap { inscriptions =>
            playerService.listSimple flatMap { players =>
              playerStatsService.listSimple flatMap { pStats =>
                gameService.find(id).map { game =>
                  if (request.session.get("email").isDefined) {
                    Ok(html.viewGame(game, pStats, players, inscriptions, contracts, tStats, teams
                      , new SimpleDateFormat("dd/MM/yyyy")))
                  } else {
                    Ok(views.html.login(UserForm.loginForm))
                  }
                }.recover {
                  case ex: TimeoutException =>
                    Logger.error("Error visualizando partido")
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
