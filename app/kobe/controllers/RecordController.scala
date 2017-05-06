package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import java.text.SimpleDateFormat
import com.google.inject.Inject
import kobe.model._
import kobe.service._
import kobe.views._

/**
  * Created by Borja Gete on 11/04/17.
  */

class RecordController @Inject()(val messagesApi: MessagesApi
                                 , serieService: SerieService
                                 , sessionService: SessionService
                                 , planService: PlanService
                                 , exerciseService: ExerciseService
                                 , unitService: UnitService
                                 , recordService: RecordService
                                ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.RecordController.list(0, 2, ""))

  def index = Action {
    home
  }


  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    planService.listSimple flatMap { plans =>
      sessionService.listSimple flatMap { sessions =>
        recordService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
          Ok(html.listRecord(pageEmp, orderBy, filter, plans.sortBy(_.id), sessions.sortBy(_.id)))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error listando registros")
            InternalServerError(ex.getMessage)
        }
      }
    }
  }

  def addVolume(id:Long): Action[AnyContent] = Action.async { implicit request =>
    exerciseService.listSimple flatMap { exercises =>
      sessionService.listSimple flatMap { sessions =>
        serieService.listSimple flatMap { series =>
          unitService.listSimple flatMap { units =>
            recordService.listSimple flatMap { records =>
              planService.find(id) map { plan =>
                Ok(html.createVolume(RecordForm.form
                  , records.sortBy(_.id)
                  , plan
                  , units.sortBy(_.id)
                  , sessions
                  , series
                  , exercises))
              }
            }
          }
        }
      }
    }
  }
  def addMark(id:Long): Action[AnyContent] = Action.async { implicit request =>
    exerciseService.listSimple flatMap { exercises =>
      planService.listSimple flatMap { plans =>
        serieService.listSimple flatMap { series =>
          unitService.listSimple flatMap { units =>
            recordService.listSimple flatMap { records =>
              sessionService.find(id) map { session =>
                Ok(html.addMark(RecordForm.form
                  , records.sortBy(_.id)
                  , session
                  , units.sortBy(_.id)
                  , plans
                  , series
                  , exercises
                  , new SimpleDateFormat("dd/MM/yyyy")))
              }
            }
          }
        }
      }
    }
  }

  def editVolume(id: Long): Action[AnyContent] = Action.async { implicit request =>
    unitService.listSimple flatMap { units =>
      planService.listSimple flatMap { plans =>
        exerciseService.listSimple flatMap { exercises =>
          sessionService.listSimple flatMap { sessions =>
            serieService.listSimple flatMap { series =>
              recordService.find(id).map { volume =>
                Ok(html.editVolume(id
                  , RecordForm.form.fill(volume)
                  , series.sortBy(_.id)
                  , exercises.sortBy(_.name)
                  , sessions.sortBy(_.name)
                  , plans.sortBy(_.name)
                  , units))
              }.recover {
                case ex: TimeoutException =>
                  Logger.error("Error editando un volúmen")
                  InternalServerError(ex.getMessage)
              }
            }
          }
        }
      }
    }
  }

  def editMark(id: Long): Action[AnyContent] = Action.async { implicit request =>
    unitService.listSimple flatMap { units =>
      planService.listSimple flatMap { plans =>
        exerciseService.listSimple flatMap { exercises =>
          sessionService.listSimple flatMap { sessions =>
            serieService.listSimple flatMap { series =>
              recordService.find(id).map { volume =>
                Ok(html.editVolume(id
                  , RecordForm.form.fill(volume)
                  , series.sortBy(_.id)
                  , exercises.sortBy(_.name)
                  , sessions.sortBy(_.name)
                  , plans.sortBy(_.name)
                  , units))
              }.recover {
                case ex: TimeoutException =>
                  Logger.error("Error editando un volúmen")
                  InternalServerError(ex.getMessage)
              }
            }
          }
        }
      }
    }
  }

  def updateVolume(id: Long): Action[AnyContent] = Action.async { implicit request =>
    RecordForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editVolume(id
        , formWithErrors
        , Seq.empty[Serie]
        , Seq.empty[Exercise]
        , Seq.empty[kobe.model.Session]
        , Seq.empty[Plan]
        , Seq.empty[Unit]))),
      data => {
        recordService.find(id).flatMap { oldRecord =>
          val newSerie = Record(Some(0L), data.idUnit, data.idSerie, data.value, data.notes, data.typeR, Some(new java.util.Date(0))
            , new java.util.Date(), Some(new java.util.Date(0))
          )
          val futureRecordUpdate = recordService.update(id, newSerie.copy(id = Some(id)))
          futureRecordUpdate.map { result =>
            home.flashing("success" -> "El volúmen ha sido actualizado")
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un volúmen")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }
  def updateMark(id: Long): Action[AnyContent] = Action.async { implicit request =>
    RecordForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editMark(id
        , formWithErrors
        , Seq.empty[Serie]
        , Seq.empty[Exercise]
        , Seq.empty[kobe.model.Session]
        , Seq.empty[Plan]
        , Seq.empty[Unit]))),
      data => {
        recordService.find(id).flatMap { oldRecord =>
          val newSerie = Record(Some(0L), data.idUnit, data.idSerie, data.value, data.notes, data.typeR, data.exeDate
            , new java.util.Date(), Some(new java.util.Date(0))
          )
          val futureRecordUpdate = recordService.update(id, newSerie.copy(id = Some(id)))
          futureRecordUpdate.map { result =>
            home.flashing("success" -> "La marca ha sido actualizada")
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una marca")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def saveVolume(id:Long): Action[AnyContent] = Action.async { implicit request =>
    planService.find(id) flatMap { plan =>
      RecordForm.form.bindFromRequest.fold( formWithErrors =>
        Future.successful(BadRequest(html.createVolume(formWithErrors
          , Seq.empty[Record]
          , plan
          , Seq.empty[Unit]
          , Seq.empty[kobe.model.Session]
          , Seq.empty[Serie]
          , Seq.empty[Exercise])))
      ,data => {
        val newRecord = Record(Some(0L), data.idUnit, data.idSerie, data.value, data.notes, data.typeR, Some(new java.util.Date(0))
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureRecordInsert = recordService.add(newRecord)
        futureRecordInsert.map { result =>
          Redirect(kobe.controllers.routes.RecordController.addVolume(id)).flashing("success" -> "El volumen ha sido creado")
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un volumen")
            InternalServerError(ex.getMessage)
          case ex: NoSuchElementException =>
            Logger.error("Error guardando un volumen")
            InternalServerError(ex.getMessage)
        }
      }
      )
    }
  }
  def saveMark(id:Long): Action[AnyContent] = Action.async { implicit request =>
    sessionService.find(id) flatMap { session =>
      RecordForm.form.bindFromRequest.fold( formWithErrors =>
        Future.successful(BadRequest(html.addMark(formWithErrors
          , Seq.empty[Record]
          , session
          , Seq.empty[Unit]
          , Seq.empty[Plan]
          , Seq.empty[Serie]
          , Seq.empty[Exercise]
          , new SimpleDateFormat("dd/MM/yyyy"))))
        ,data => {
          val newRecord = Record(Some(0L), data.idUnit, data.idSerie, data.value, data.notes, data.typeR, data.exeDate
            , new java.util.Date(), Some(new java.util.Date(0))
          )
          val futureRecordInsert = recordService.add(newRecord)
          futureRecordInsert.map { result =>
            Redirect(kobe.controllers.routes.RecordController.addMark(id)).flashing("success" -> "La marca ha sido creada")
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error guardando una marca")
              InternalServerError(ex.getMessage)
            case ex: NoSuchElementException =>
              Logger.error("Error guardando una marca")
              InternalServerError(ex.getMessage)
          }
        }
      )
    }
  }
  def saveShotChart(id:Long): Action[AnyContent] = Action.async { implicit request =>
    sessionService.find(id) flatMap { session =>
      RecordForm.shotChartForm.bindFromRequest.fold( formWithErrors =>
        Future.successful(BadRequest(html.addMark(RecordForm.form
          , Seq.empty[Record]
          , session
          , Seq.empty[Unit]
          , Seq.empty[Plan]
          , Seq.empty[Serie]
          , Seq.empty[Exercise]
          , new SimpleDateFormat("dd/MM/yyyy"))))
        ,chart => {
          var count = 0;
          chart.shots.foreach { data =>
            var idUnit = 9;
            if(count%2!=0){
              idUnit = 10
            }
            val newRecord = Record(Some(0L), idUnit, chart.idSerie, data.value, data.notes, "M", Some(new java.util.Date())
              , new java.util.Date(), Some(new java.util.Date(0))
            )
            //if(count<27) {
            val futureRecordInsert = recordService.add(newRecord)
            count = count +1
            /*}else if(count=27){
              val futureRecordInsert = recordService.add(newRecord)

              futureRecordInsert.map { result =>
                Redirect(kobe.controllers.routes.RecordController.addMark(id)).flashing("success" -> "La marca ha sido creada")
              }.recover {
                case ex: TimeoutException =>
                  Logger.error("Error guardando una marca")
                  InternalServerError(ex.getMessage)
                case ex: NoSuchElementException =>
                  Logger.error("Error guardando una marca")
                  InternalServerError(ex.getMessage)
              }
            }*/
          }
          Future.successful(Redirect(kobe.controllers.routes.RecordController.addMark(id)).flashing("success" -> "La marca ha sido creada"))
        }
      )
    }
  }
  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureRecordDel = recordService.delete(id)
    futureRecordDel.map { result => home.flashing("success" -> "Registro eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un registro")
        InternalServerError(ex.getMessage)
    }
  }
}
