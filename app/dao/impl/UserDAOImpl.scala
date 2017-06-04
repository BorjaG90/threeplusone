package dao.impl

import javax.inject.Inject
import scala.concurrent.ExecutionContext.Implicits.global
import dao.UserDAO
import model._
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import slick.lifted.TableQuery

import scala.concurrent.Future

/**
  * Created by Borja on 03/06/2017.
  */
class UserDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends UserDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  val users = TableQuery[UserTable]


  import dbConfig._
  import driver.api._
  
  override def add(user: User): Future[String] = {
    db.run(users += user).map(res => "Usario añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def findByEmail(email: String): Future[User] ={
    db.run(users.filter(_.email like email).result.head)
  }

  override def findAll: Future[Seq[User]] = {
    db.run(users.result)
  }
  override def authenticate(email: String, password: String): Future[User] ={
    db.run(users.filter(_.email like email).filter(_.password like password).result.head)
  }
}
