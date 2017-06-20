package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{I18nSupport, Messages, MessagesApi}
import java.util.concurrent.TimeoutException

import com.google.inject.Inject
import kobe.model.{Category, CategoryForm}
import kobe.service.CategoryService
import kobe.views._
import model.UserForm

/**
  * Created by Borja Gete on 26/03/17.
  */

class CategoryController @Inject()(val messagesApi: MessagesApi,
                                   categoryService: CategoryService
                                  ) extends Controller with I18nSupport {

  val home = Redirect(kobe.controllers.routes.CategoryController.list(0, 2, ""))

  def index = Action {
    home
  }

  def list(page: Int, orderBy: Int, filter: String): Action[AnyContent] = Action.async { implicit request =>
    categoryService.list(page, 10, orderBy, "%" + filter + "%").map { pageEmp =>
      if (request.session.get("email").isDefined) {
        Ok(html.listCategory(pageEmp, orderBy, filter))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando categorias")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    if (request.session.get("email").isDefined) {
      Ok(html.createCategory(CategoryForm.form))
    } else {
      Ok(views.html.login(UserForm.loginForm))
    }
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    categoryService.find(id).map { category =>
      if (request.session.get("email").isDefined) {
        Ok(html.editCategory(id, CategoryForm.form.fill(category)))
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error editando una categor&iacute;a")
        InternalServerError(ex.getMessage)
    }
  }

  def update(id: Long): Action[AnyContent] = Action.async { implicit request =>
    CategoryForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.editCategory(id, formWithErrors))),
      data => {
        categoryService.find(id).flatMap { oldCategory =>
          val newCategory = Category(Some(0L), data.name, data.description, data.notes)
          val futureCategoryUpdate = categoryService.update(id, newCategory.copy(id = Some(id)))
          futureCategoryUpdate.map { result =>
            if (request.session.get("email").isDefined) {
              home.flashing("success" -> "La categor&iacute;a %s ha sido actualizada".format(newCategory.name))
            } else {
              Ok(views.html.login(UserForm.loginForm))
            }
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una categor&iacute;a")
              InternalServerError(ex.getMessage)
          }
        }
      }
    )
  }

  def save: Action[AnyContent] = Action.async { implicit request =>
    CategoryForm.form.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.createCategory(formWithErrors))),
      data => {
        val newCategory = Category(Some(0L), data.name, data.description, data.notes)
        val futureCategoryInsert = categoryService.add(newCategory)
        futureCategoryInsert.map { result =>
          if (request.session.get("email").isDefined) {
            home.flashing("success" -> "La categor&iacute;a %s ha sido creado".format(newCategory.name))
          } else {
            Ok(views.html.login(UserForm.loginForm))
          }
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una categor&iacute;a")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureCategoryDel = categoryService.delete(id)
    futureCategoryDel.map { result =>
      if (request.session.get("email").isDefined) {
        home.flashing("success" -> "Categor&iacute;a eliminada")
      } else {
        Ok(views.html.login(UserForm.loginForm))
      }
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una categor&iacute;a")
        InternalServerError(ex.getMessage)
    }
  }
}
