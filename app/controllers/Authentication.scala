package controllers


import scala.concurrent.ExecutionContext.Implicits._
import com.google.inject.Inject
import play.api.mvc._
import views._
import service._
import model._

import scala.concurrent.Future

/**
  * Created by Borja on 03/06/2017.
  */
class Authentication @Inject()(val userService: UserService) extends Controller {

  /**
    * Login page.
    */
  def login = Action { implicit request =>
    Ok(html.login(UserForm.loginForm))
  }

  /**
    * Logout and clean the session.
    */
  def logout = Action {
    Redirect(routes.Authentication.login).withNewSession.flashing(
      "success" -> "Sesi&ocute;n cerrada"
    )
  }

  /**
    * Handle login form submission.
    */
  def authenticate: Action[AnyContent] = Action.async { implicit request =>
    UserForm.loginForm.bindFromRequest.fold(
      formWithErrors => Future.successful(BadRequest(html.login(formWithErrors))),
      data => {
        val auth=userService.authenticate(data.email,data.password)
          auth.map { result =>
          Redirect(routes.Application.index()).withSession("email" -> data.email).flashing("success" ->"")
        }.recover {
            case t: Throwable =>
            Redirect(routes.Authentication.login())
        }
      }
    )
  }

}