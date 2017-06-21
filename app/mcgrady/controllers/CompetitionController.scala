package mcgrady.controllers

import scala.collection.mutable.ArrayBuffer
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
  * Created by Borja Gete on 9/02/17.
  */

class CompetitionController @Inject()(val messagesApi: MessagesApi
                                      , competitionService: CompetitionService
                                      , countryService: CountryService
                                      , seasonService: SeasonService
                                      , teamService: TeamService
                                      , inscriptionService: InscriptionService
                                      , gameService: GameService
                                      , teamStatsService: TeamStatsService
                                      , playerService: PlayerService
                                      , playerStatsService: PlayerStatsService
                                     ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.CompetitionController.list(0, 2, "", ""))

  def index = Action { home }

  def list(page: Int, orderBy: Int, filter: String, yFilter: String): Action[AnyContent] = Action.async { implicit request =>
    countryService.list flatMap { countries =>
      competitionService.list(page, 10, orderBy, "%" + filter + "%", "%" + yFilter + "%").flatMap { pageEmp =>
        seasonService.listSimple map { seasons =>
          if (request.session.get("email").isDefined) {
            val allYears = new ArrayBuffer[String]()
            for (season <- seasons) {
              allYears += season.year
            }
            val years = collection.Seq[String](allYears: _*)

            Ok(html.listCompetition(pageEmp, orderBy, filter, new SimpleDateFormat("dd/MM/yyyy"), yFilter, years, countries))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error listando competiciones")
          InternalServerError(ex.getMessage)
      }
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      countryService.list map { countries =>
        if (request.session.get("email").isDefined) {
          Ok(html.createCompetition(CompetitionForm.form, countries.sortBy(_.name), seasons.sortBy(_.year)))
        } else {
          Ok(views.html.login(UserForm.loginForm))
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      countryService.list flatMap { countries =>
        competitionService.find(id).map { competition =>
          if (request.session.get("email").isDefined) {
            Ok(html.editCompetition(id, CompetitionForm.form.fill(
              competition), countries.sortBy(_.name), seasons.sortBy(_.year)))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error editando una competici&oacute;n")
            InternalServerError(ex.getMessage)
        }
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    CompetitionForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.editCompetition(id, formWithErrors, Seq.empty[Country], Seq.empty[Season]))),
      data => {
        seasonService.find(data.idSeason).flatMap { season =>
          competitionService.find(id).flatMap { oldCompetition =>
            val newCompetition = Competition(Some(0L), data.idSeason, data.name, data.abrv, data.division
              , data.idCountry, data.description, data.typeCompetition, data.initDate, data.endDate
              , oldCompetition.creationDate, Some(new java.util.Date())
            )
            val futureCompetitionUpdate = competitionService.update(id, newCompetition.copy(id = Some(id)))
            futureCompetitionUpdate.map { result =>
              if (request.session.get("email").isDefined) {
                home.flashing("success" -> "La Competición %s ha sido actualizada".format(newCompetition.name))
              } else {
                Ok(views.html.login(UserForm.loginForm))
              }
            }.recover {
              case ex: TimeoutException =>
                Logger.error("Error actualizando una competici&oacute;n")
                InternalServerError(ex.getMessage)
            }
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    CompetitionForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.createCompetition(formWithErrors, Seq.empty[Country], Seq.empty[Season]))),
      data => {
        seasonService.find(data.idSeason).flatMap { season =>
          val newCompetition = Competition(Some(0L), data.idSeason, data.name, data.abrv, data.division
            , data.idCountry, data.description, data.typeCompetition, data.initDate, data.endDate
            , new java.util.Date(), Some(new java.util.Date(0))
          )
          val futureCompetitionInsert = competitionService.add(newCompetition)
          futureCompetitionInsert.map { result =>
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "La Competición %s ha sido creada".format(
                newCompetition.name))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error guardando una competici&oacute;n")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureCompetitionDel = competitionService.delete(id)
    futureCompetitionDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Competición eliminada")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }

    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una competici&oacute;n")
        InternalServerError(ex.getMessage)
    }
  }

  def view(id: Long): Action[AnyContent] = Action.async {
    implicit request =>
      seasonService.listSimple flatMap {
        seasons =>
          playerStatsService.listSimple flatMap {
            pStats =>
              playerService.listSimple flatMap {
                players =>
                  teamStatsService.listSimple flatMap {
                    tStats =>
                      gameService.listSimple flatMap {
                        games =>
                          inscriptionService.listSimple flatMap {
                            inscriptions =>
                              teamService.listSimple flatMap {
                                teams =>
                                  countryService.list flatMap {
                                    countries =>
                                      competitionService.find(id).map {
                                        competition =>
                                          if (request.session.get("email").isDefined) {
                                            Ok(html.viewCompetition(competition, countries, teams, inscriptions, games, tStats, players
                                              , pStats, seasons))
                                          } else {
                                            Ok(views.html.login(UserForm.loginForm))
                                          }
                                      }.recover {
                                        case ex: TimeoutException =>
                                          Logger.error("Error visualizando competici&oacute;n")
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
}
