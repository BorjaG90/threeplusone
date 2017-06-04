package dao

import com.google.inject.ImplementedBy
import dao.impl.UserDAOImpl
import model.User

import scala.concurrent.Future

/**
  * Created by Borja on 03/06/2017.
  */
@ImplementedBy(classOf[UserDAOImpl])
trait UserDAO {
  def findByEmail(email: String): Future[User]
  def findAll: Future[Seq[User]]
  def authenticate(email: String, password: String): Future[User]
  def add(user: User): Future[String]
}
