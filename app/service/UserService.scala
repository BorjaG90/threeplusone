package service

import com.google.inject.ImplementedBy
import service.impl.UserServiceImpl
import model.User

import scala.concurrent.Future

/**
  * Created by Borja on 03/06/2017.
  */
@ImplementedBy(classOf[UserServiceImpl])
trait UserService {
  def findByEmail(email: String): Future[User]
  def findAll: Future[Seq[User]]
  def authenticate(email: String, password: String): Future[User]
  def add(user: User): Future[String]
}
