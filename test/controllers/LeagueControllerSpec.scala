package controllers

import java.util

import org.scalatestplus.play._
import play.api.test._
import play.api.test.Helpers._
import model.{League, LeagueForm}
import play.api.data
import play.api.mvc.{Action, Controller}

/**
  * Created by borja on 12/03/17.
  */

class leagueControllerSpec extends PlaySpec with OneAppPerSuite{
  "LeagueController" should {

    "render the leagues page" in new App(){
      val leaguePage = route(app, FakeRequest(GET, "/league")).get
      status(leaguePage) mustBe OK
      contentType(leaguePage) mustBe Some("text/html")
      contentAsString(leaguePage) must include ("Ligas")
    }

    "add a new league" in new App(){
      val leagueAddPage = route(
        app, FakeRequest( POST, "/league").withFormUrlEncodedBody(
          ("name", "LigaPrueba"),("division","1"),("id_country","133")
        )
      ).get
      status(leagueAddPage) mustEqual OK
      contentAsString(leagueAddPage) must include ("Liga a&ntilde;adida satisfactoriamente")
    }

    "delete a league" in new App(){
      val leagueDeletePage = route(app, FakeRequest(GET, "/league/delete/:1")).get
      status(leagueDeletePage) mustEqual OK
      contentAsString(leagueDeletePage) must include ("Liga eliminada")
    }

    "update a league" in new App(){
      val leagueUpdatePage = route(
        app, FakeRequest(POST, "/league/:1").withFormUrlEncodedBody(
          ("name", "NuevosAmistosos"),("division","2"),("id_country","133")
        )
      ).get
      status(leagueUpdatePage) mustEqual OK
      contentAsString(leagueUpdatePage) must include ("La Liga NuevosAmistosos ha sido actualizada")
    }


  }
}
