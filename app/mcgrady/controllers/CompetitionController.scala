package mcgrady.controllers

import com.google.inject.Inject
import mcgrady.model.{Competition, CompetitionForm, Country, Season}
import play.api._
import play.api.mvc._
import mcgrady.service.{CompetitionService, CountryService, SeasonService}
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import mcgrady.views._
import java.util.concurrent.TimeoutException
import java.text.SimpleDateFormat
import scala.collection.mutable.ArrayBuffer

/**
  * Created by Borja Gete on 9/02/17.
  */

class CompetitionController @Inject()(val messagesApi: MessagesApi,
                                      competitionService: CompetitionService,
                                      countryService: CountryService,
                                      seasonService: SeasonService
                                     ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.CompetitionController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    competitionService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listCompetition(pageEmp, orderBy, filter,new SimpleDateFormat("dd/MM/yyyy")))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando competiciones")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      countryService.list map { countries =>
        Ok(html.createCompetition(CompetitionForm.form, countries.sortBy(_.name), seasons.sortBy(_.year))
        )
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      countryService.list flatMap { countries =>
        competitionService.find(id).map { competition =>
          Ok(html.editCompetition(id, CompetitionForm.form.fill(
            competition), countries.sortBy(_.name), seasons.sortBy(_.year)))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error editando una competición")
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
        competitionService.find(id).flatMap { oldCompetition =>
          val newCompetition = Competition(Some(0L), data.id_season, data.name, data.abbreviation, data.division
            , data.id_country, data.description, data.typeCompetition, data.initDate, data.endDate
            , oldCompetition.creationDate, Some(new java.util.Date())
          )
          val futureCompetitionUpdate = competitionService.update(id, newCompetition.copy(id = Some(id)))
          futureCompetitionUpdate.map { result =>
            home.flashing("success" -> "La Competición %s ha sido actualizada".format(newCompetition.name))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una competición")
              InternalServerError(ex.getMessage)
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
        val newCompetition = Competition(Some(0L), data.id_season, data.name, data.abbreviation, data.division
          , data.id_country, data.description, data.typeCompetition, data.initDate, data.endDate
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureCompetitionInsert = competitionService.add(newCompetition)
        futureCompetitionInsert.map { result =>
          home.flashing("success" -> "La Competición %s ha sido creada".format(
            newCompetition.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una competición")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureCompetitionDel = competitionService.delete(id)
    futureCompetitionDel.map { result => home.flashing("success" -> "Competición eliminada") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una competición")
        InternalServerError(ex.getMessage)
    }
  }
}
