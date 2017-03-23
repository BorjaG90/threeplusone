package controllers

/**
  * Created by Borja Gete on 9/02/17.
  */

import com.google.inject.Inject
import model.{Season, SeasonForm}
import play.api._
import play.api.mvc._
import service.{SeasonService}
import scala.concurrent.Future
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import scala.collection.mutable._
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import views._

import java.util.concurrent.TimeoutException

class SeasonController @Inject()(val messagesApi: MessagesApi,
                                 seasonService: SeasonService
                                ) extends Controller with I18nSupport {

  val home = Redirect(routes.SeasonController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    seasonService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listSeason(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando temporadas")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple map { seasons =>
      val years= new ArrayBuffer[String]()
      for(a <- 2000 to 2050){
        years += a.toString
        for(season <- seasons){
          if(years.contains(season.year)){
           years -= season.year
          }
        }
      }
      val y=collection.Seq[String](years:_*)
      Ok(html.createSeason(SeasonForm.form, y))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    seasonService.listSimple flatMap { seasons =>
      val years = new ArrayBuffer[String]()
      for (a <- 2000 to 2050) {
        years += a.toString
        for (season <- seasons) {
          if (years.contains(season.year)) {
            years -= season.year
          }
        }
      }
      val y = collection.Seq[String](years: _*)
      seasonService.find(id).map { season =>
        Ok(html.editSeason(id, SeasonForm.form.fill(season), y))
      }.recover {
        case ex: TimeoutException =>
          Logger.error("Error editando una temporada")
          InternalServerError(ex.getMessage)
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    SeasonForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editSeason(id, formWithErrors,Seq.empty[String]))),
      data => {
        seasonService.find(id).flatMap { oldSeason =>
          val newSeason = Season(Some(0L), data.year, data.description
            , oldSeason.creationDate, Some(new java.util.Date()), "F"
          )
          val futureSeasonUpdate = seasonService.update(id, newSeason.copy(id = Some(id)))
          futureSeasonUpdate.map { result =>
            home.flashing("success" -> "La Temporada %s ha sido actualizada".format(newSeason.year))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una temporada")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    SeasonForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createSeason(formWithErrors,Seq.empty[String]))),
      data => {
        val newSeason = Season(Some(0L), data.year, data.description
          , new java.util.Date(), Some(new java.util.Date(0)), "F"
        )
        val futureSeasonInsert = seasonService.add(newSeason)
        futureSeasonInsert.map { result => home.flashing("success" -> "La Temporada %s ha sido creada".format(newSeason.year))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una temporada")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureSeasonDel = seasonService.delete(id)
    futureSeasonDel.map { result => home.flashing("success" -> "Temporada eliminada") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una temporada")
        InternalServerError(ex.getMessage)
    }
  }
}
