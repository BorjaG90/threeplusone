package controllers

import model.UserForm
import play.api.mvc._

class Application extends Controller {
  def index = Action { implicit request =>
    if (request.session.get("email").isDefined) {
      Ok(views.html.index("ThreePlusOne System."))
    } else {
      Ok(views.html.login(UserForm.loginForm))
    }
  }
}
