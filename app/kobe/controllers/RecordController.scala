package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException
import java.text.SimpleDateFormat

import com.google.inject.Inject
import kobe.model._
import kobe.service._
import kobe.views._
import model.UserForm

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
          if (request.session.get("email").isDefined) {
            Ok(html.listRecord(pageEmp, orderBy, filter, plans.sortBy(_.id), sessions.sortBy(_.id)))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error listando registros")
            InternalServerError(ex.getMessage)
        }
      }
    }
  }

  def addVolume(id: Long): Action[AnyContent] = Action.async { implicit request =>
    exerciseService.listSimple flatMap { exercises =>
      sessionService.listSimple flatMap { sessions =>
        serieService.listSimple flatMap { series =>
          unitService.listSimple flatMap { units =>
            recordService.listSimple flatMap { records =>
              planService.find(id) map { plan =>
                if (request.session.get("email").isDefined) {
                  Ok(html.createVolume(RecordForm.form
                    , records.sortBy(_.id)
                    , plan
                    , units.sortBy(_.id)
                    , sessions
                    , series
                    , exercises))
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

  def addMark(id: Long): Action[AnyContent] = Action.async { implicit request =>
    exerciseService.listSimple flatMap { exercises =>
      planService.listSimple flatMap { plans =>
        serieService.listSimple flatMap { series =>
          unitService.listSimple flatMap { units =>
            recordService.listSimple flatMap { records =>
              sessionService.find(id) map { session =>
                if (request.session.get("email").isDefined) {
                  Ok(html.addMark(RecordForm.form
                    , records.sortBy(_.id)
                    , session
                    , units.sortBy(_.id)
                    , plans
                    , series
                    , exercises
                    , new SimpleDateFormat("dd/MM/yyyy")))
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

  def editVolume(id: Long): Action[AnyContent] = Action.async { implicit request =>
    unitService.listSimple flatMap { units =>
      planService.listSimple flatMap { plans =>
        exerciseService.listSimple flatMap { exercises =>
          sessionService.listSimple flatMap { sessions =>
            serieService.listSimple flatMap { series =>
              recordService.find(id).map { volume =>
                if (request.session.get("email").isDefined) {
                  Ok(html.editVolume(id
                    , RecordForm.form.fill(volume)
                    , series.sortBy(_.id)
                    , exercises.sortBy(_.name)
                    , sessions.sortBy(_.name)
                    , plans.sortBy(_.name)
                    , units))
                } else {
                  Ok(views.html.login(UserForm.loginForm))
                }
              }.recover {
                case ex: TimeoutException =>
                  Logger.error("Error editando un vol&uacute;men")
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
              recordService.find(id).map { mark =>
                if (request.session.get("email").isDefined) {
                  Ok(html.editMark(id
                    , RecordForm.form.fill(mark)
                    , series.sortBy(_.id)
                    , exercises.sortBy(_.name)
                    , sessions.sortBy(_.name)
                    , plans.sortBy(_.name)
                    , units))
                } else {
                  Ok(views.html.login(UserForm.loginForm))
                }
              }.recover {
                case ex: TimeoutException =>
                  Logger.error("Error editando una marca")
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
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "El volumen ha sido actualizado")
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un vol&uacute;men")
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
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "La marca ha sido actualizada")
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una marca")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def saveVolume(id: Long): Action[AnyContent] = Action.async { implicit request =>
    planService.find(id) flatMap { plan =>
      RecordForm.form.bindFromRequest.fold(formWithErrors =>
        Future.successful(BadRequest(html.createVolume(formWithErrors
          , Seq.empty[Record]
          , plan
          , Seq.empty[Unit]
          , Seq.empty[kobe.model.Session]
          , Seq.empty[Serie]
          , Seq.empty[Exercise])))
        , data => {
          val newRecord = Record(Some(0L), data.idUnit, data.idSerie, data.value, data.notes, data.typeR, Some(new java.util.Date(0))
            , new java.util.Date(), Some(new java.util.Date(0))
          )
          val futureRecordInsert = recordService.add(newRecord)
          futureRecordInsert.map { result =>
            if (request.session.get("email").isDefined) {
              Redirect(kobe.controllers.routes.RecordController.addVolume(id)).flashing("success" -> "El volumen ha sido creado")
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
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

  def saveMark(id: Long): Action[AnyContent] = Action.async { implicit request =>
    sessionService.find(id) flatMap { session =>
      RecordForm.form.bindFromRequest.fold(formWithErrors =>
        Future.successful(BadRequest(html.addMark(formWithErrors
          , Seq.empty[Record]
          , session
          , Seq.empty[Unit]
          , Seq.empty[Plan]
          , Seq.empty[Serie]
          , Seq.empty[Exercise]
          , new SimpleDateFormat("dd/MM/yyyy"))))
        , data => {
          val newRecord = Record(Some(0L), data.idUnit, data.idSerie, data.value, data.notes, data.typeR, data.exeDate
            , new java.util.Date(), Some(new java.util.Date(0))
          )
          val futureRecordInsert = recordService.add(newRecord)
          futureRecordInsert.map { result =>
            if (request.session.get("email").isDefined) {
              Redirect(kobe.controllers.routes.RecordController.addMark(id)).flashing("success" -> "La marca ha sido creada")
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
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

  def saveShotChart(id: Long): Action[AnyContent] = Action.async { implicit request =>
    unitService.findByName("fgm") flatMap { fgm =>
      unitService.findByName("fga") flatMap { fga =>
        sessionService.find(id) flatMap { sess =>
          RecordForm.shotChartForm.bindFromRequest.fold(formWithErrors =>
            Future.successful(BadRequest(html.addMark(RecordForm.form
              , Seq.empty[Record]
              , sess
              , Seq.empty[Unit]
              , Seq.empty[Plan]
              , Seq.empty[Serie]
              , Seq.empty[Exercise]
              , new SimpleDateFormat("dd/MM/yyyy"))))
            , chart => {
              var count = 0;
              //Recorre el array de anotados/lanzados
              chart.shots.foreach { data =>
                var idUnit = fgm.id.get
                if (data.value != None) {
                  //Si contiene "Intentos" cambia el id de la unidad
                  //IMPORTANTE: Requiere que la BD se cree con los scripts de Evolutions que tienen unidades por defecto
                  if (data.notes.get.toString.contains("Intentos")) {
                    idUnit = fga.id.get
                  }
                  val newRecord = Record(Some(0L), idUnit, chart.idSerie, data.value.get, data.notes, "M", Some(new java.util.Date())
                    , new java.util.Date(), Some(new java.util.Date(0))
                  )
                  val futureRecordInsert = recordService.add(newRecord)
                }
                count = count + 1
              }
              Future.successful(Redirect(kobe.controllers.routes.RecordController.addMark(id))
                .flashing("success" -> s"Los lanzamientos se han añadido (Actualice la página en caso de no observar los cambios)"))
            }
          )
        }
      }
    }
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureRecordDel = recordService.delete(id)
    futureRecordDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Registro eliminado")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un registro")
        InternalServerError(ex.getMessage)
    }
  }
}
