package mcgrady.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import com.google.inject.Inject
import mcgrady.model._
import mcgrady.service._
import mcgrady.views._

/**
  * Created by Borja Gete on 31/03/17.
  */

class InscriptionController @Inject()(val messagesApi: MessagesApi
                                      , inscriptionService: InscriptionService
                                      , teamService: TeamService
                                      , subGroupService: SubGroupService
                                      , groupService: GroupService
                                      , competitionService: CompetitionService
                                      , seasonService: SeasonService
                                      , arenaService: ArenaService
                                  ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.InscriptionController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    inscriptionService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listInscription(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando inscripciones")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      competitionService.listSimple flatMap { competitions =>
        groupService.listSimple flatMap { groups =>
          arenaService.listSimple flatMap { arenas =>
            subGroupService.listSimple flatMap { subgroups =>
              teamService.listSimple map { teams =>
                Ok(html.createInscription(InscriptionForm.form
                  , teams.sortBy(_.name), subgroups.sortBy(_.name), arenas.sortBy(_.name)
                  , groups.sortBy(_.name), competitions.sortBy(_.name), seasons.sortBy(_.year)
                ))
              }
            }
          }
        }
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      competitionService.listSimple flatMap { competitions =>
        groupService.listSimple flatMap { groups =>
          arenaService.listSimple flatMap { arenas =>
            subGroupService.listSimple flatMap { subgroups =>
              teamService.listSimple flatMap { teams =>
                inscriptionService.find(id).map { inscription =>
                  Ok(html.editInscription(id, InscriptionForm.form.fill(inscription)
                    , teams.sortBy(_.name), subgroups.sortBy(_.name), arenas.sortBy(_.name)
                    , groups.sortBy(_.name), competitions.sortBy(_.name), seasons.sortBy(_.year)
                  ))
                }.recover {
                  case ex: TimeoutException =>
                    Logger.error("Error editando un inscripción")
                    InternalServerError(ex.getMessage)
                }
              }
            }
          }
        }
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    InscriptionForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editInscription(
        id, formWithErrors, Seq.empty[Team], Seq.empty[SubGroup], Seq.empty[Arena]
        , Seq.empty[Group], Seq.empty[Competition], Seq.empty[Season]
      ))),
      data => {
        inscriptionService.find(id).flatMap { oldInscription =>
          val newInscription = Inscription(Some(0L), data.idTeam, data.idSubGroup, data.idArena
            , oldInscription.creationDate, Some(new java.util.Date())
          )
          val futureInscriptionUpdate = inscriptionService.update(id, newInscription.copy(id = Some(id)))
          futureInscriptionUpdate.map { result =>
            home.flashing("success" -> "La inscripción ha sido actualizada")
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una inscripción")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    InscriptionForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createInscription(
        formWithErrors, Seq.empty[Team], Seq.empty[SubGroup], Seq.empty[Arena]
        , Seq.empty[Group], Seq.empty[Competition], Seq.empty[Season]
      ))),
      data => {
        val newInscription = Inscription(Some(0L), data.idTeam, data.idSubGroup, data.idArena
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureInscriptionInsert = inscriptionService.add(newInscription)
        futureInscriptionInsert.map { result =>
          home.flashing("success" -> "La inscripción ha sido creado")
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una inscripción")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureInscriptionDel = inscriptionService.delete(id)
    futureInscriptionDel.map { result => home.flashing("success" -> "Inscripción eliminada") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una inscripción")
        InternalServerError(ex.getMessage)
    }
  }
}
