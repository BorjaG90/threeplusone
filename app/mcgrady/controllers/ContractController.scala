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
import mcgrady.model.{Contract, ContractForm, Player, Team}
import mcgrady.service.{ContractService, PlayerService, TeamService}
import mcgrady.views._

/**
  * Created by Borja Gete on 30/03/17.
  */

class ContractController @Inject()(val messagesApi: MessagesApi
                                   , contractService: ContractService
                                   , playerService: PlayerService
                                   , teamService: TeamService 
                                  ) extends Controller with I18nSupport {

  val home = Redirect(mcgrady.controllers.routes.ContractController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    contractService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      Ok(html.listContract(pageEmp, orderBy, filter, new SimpleDateFormat("dd/MM/yyyy")))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando contratos")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action.async { implicit request =>
    teamService.listSimple flatMap { teams =>
      playerService.listSimple map { players =>
        Ok(html.createContract(ContractForm.form, players.sortBy(_.lastName), teams.sortBy(_.name)))
      }
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    teamService.listSimple flatMap { teams =>
      playerService.listSimple flatMap { players =>
        contractService.find(id).map { contract =>
          Ok(html.editContract(id, ContractForm.form.fill(contract), players.sortBy(_.lastName), teams.sortBy(_.name)))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error editando un contrato")
            InternalServerError(ex.getMessage)
        }
      }
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    ContractForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.editContract(id, formWithErrors, Seq.empty[Player], Seq.empty[Team]))),
      data => {
        contractService.find(id).flatMap { oldContract =>
          val newContract = Contract(Some(0L), data.idPlayer, data.idTeam, data.number
            , data.initDate, data.endDate, data.description
            , oldContract.creationDate, Some(new java.util.Date())
          )
          val futureContractUpdate = contractService.update(id, newContract.copy(id = Some(id)))
          futureContractUpdate.map { result =>
            home.flashing("success" -> "El contrato  ha sido actualizado")
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando un contrato")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    ContractForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(
        BadRequest(html.createContract(formWithErrors, Seq.empty[Player],Seq.empty[Team]))),
      data => {
        val newContract = Contract(Some(0L), data.idPlayer, data.idTeam, data.number
          , data.initDate, data.endDate, data.description
          , new java.util.Date(), Some(new java.util.Date(0))
        )
        val futureContractInsert = contractService.add(newContract)
        futureContractInsert.map { result =>
          home.flashing("success" -> "El contrato ha sido creado")
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando un contrato")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureContractDel = contractService.delete(id)
    futureContractDel.map { result => home.flashing("success" -> "Contrato eliminado") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando un contrato")
        InternalServerError(ex.getMessage)
    }
  }
}
