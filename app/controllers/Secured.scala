package controllers

import play.api.mvc._

/**
  * Created by Borja on 03/06/2017.
  */
trait Secured {
  self:Controller =>

  /**
    * Retrieve the connected user's email
    */
  def username(request: RequestHeader) = request.session.get("email")

  /**
    * Not authorized, forward to login
    */
   def onUnauthorized(request: RequestHeader) = {
    Results.Redirect(routes.Authentication.login)
  }

  /**
    * Action for authenticated users.
    */
  def IsAuthenticated(f: => String => Request[AnyContent] => Result) = {
    Security.Authenticated(username, onUnauthorized) { user =>
      Action(request => f(user)(request))
    }
  }
}
