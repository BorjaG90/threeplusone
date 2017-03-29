package kobe.controllers

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits._
import play.api.libs.concurrent.Execution.Implicits._
import play.api._
import play.api.mvc._
import play.api.i18n.{MessagesApi, Messages, I18nSupport}
import java.util.concurrent.TimeoutException
import com.google.inject.Inject
import kobe.model.{Category, CategoryForm}
import kobe.service.CategoryService
import kobe.views._

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
      Ok(html.listCategory(pageEmp, orderBy, filter))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error listando categorias")
        InternalServerError(ex.getMessage)
    }
  }

  def add: Action[AnyContent] = Action { implicit request =>
    Ok(html.createCategory(CategoryForm.form))
  }

  def edit(id: Long): Action[AnyContent] = Action.async { implicit request =>
    categoryService.find(id).map { category =>
      Ok(html.editCategory(id, CategoryForm.form.fill(category)))
    }.recover {
      case ex: TimeoutException =>
        Logger.error("Error editando una categoría")
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
            home.flashing("success" -> "La categoría %s ha sido actualizada".format(newCategory.name))
          }.recover {
            case ex: TimeoutException =>
              Logger.error("Error actualizando una categoría")
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
          home.flashing("success" -> "La categoría %s ha sido creado".format(
            newCategory.name))
        }.recover {
          case ex: TimeoutException =>
            Logger.error("Error guardando una categoría")
            InternalServerError(ex.getMessage)
        }
      }
    )
  }

  def delete(id: Option[Long]): Action[AnyContent] = Action.async { implicit request =>
    val futureCategoryDel = categoryService.delete(id)
    futureCategoryDel.map { result => home.flashing("success" -> "Categoría eliminada") }.recover {
      case ex: TimeoutException =>
        Logger.error("Error borrando una categoría")
        InternalServerError(ex.getMessage)
    }
  }
}
