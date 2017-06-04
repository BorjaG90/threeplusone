package model

import javax.inject.Inject
import play.api._
import play.api.mvc._
import scala.concurrent.ExecutionContext.Implicits._
import play.api.data.Form
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import service._
/**
  * Created by Borja on 03/06/2017.
  */
case class User(id: Option[Long] = None, email: String, name: String, password: String)
case class UserData(email: String, password: String)

class UserTable(tag: Tag) extends Table[User](tag, "users") {
  def id = column[Long]("id", O.PrimaryKey, O.AutoInc)
  def email = column[String]("email")
  def name = column[String]("name")
  def password = column[String]("password")

  override def * = (id.?, email, name, password) <> (User.tupled, User.unapply _)
}

object UserForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"email" -> of[String]
      ,"name" -> of[String]
      ,"password" -> of[String]
    )(User.apply)(User.unapply)
  )
  val loginForm = Form(
    mapping(
      "email" -> of[String],
      "password" -> of[String]
    )(UserData.apply)(UserData.unapply)
  )
}

/*object User {

  /**
    * Parse a User from a ResultSet
    */
  val simple = {
    get[String]("user.email") ~
      get[String]("user.name") ~
      get[String]("user.password") map {
      case email ~ name ~ password => User(email, name, password)
    }
  }

  /**
    * Retrieve a User from email.
    */
  def findByEmail(email: String): Option[User] = {
    DB.withConnection { implicit connection =>
      SQL("select * from user where email = {email}").on(
        'email -> email).as(User.simple.singleOpt)
    }
  }

  /**
    * Retrieve all users.
    */
  def findAll: Seq[User] = {
    DB.withConnection { implicit connection =>
      SQL("select * from user").as(User.simple *)
    }
  }

  /**
    * Authenticate a User.
    */
  def authenticate(email: String, password: String): Option[User] = {
    DB.withConnection { implicit connection =>
      SQL(
        """
         select * from user where
         email = {email} and password = {password}
        """).on(
        'email -> email,
        'password -> password).as(User.simple.singleOpt)
    }
  }

  /**
    * Create a User.
    */
  def create(user: User): User = {
    DB.withConnection { implicit connection =>
      SQL(
        """
          insert into user values (
            {email}, {name}, {password}
          )
        """).on(
        'email -> user.email,
        'name -> user.name,
        'password -> user.password).executeUpdate()

      user

    }
  }

}*/
