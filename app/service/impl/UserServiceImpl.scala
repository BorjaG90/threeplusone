package service.impl

import javax.inject.Inject

import dao.UserDAO
import model.User
import service.UserService

import scala.concurrent.Future

/**
  * Created by Borja on 03/06/2017.
  */
class UserServiceImpl @Inject()(userDAO: UserDAO)extends UserService{
  override def findByEmail(email: String): Future[User] ={
    userDAO.findByEmail(email)
  }
  override def findAll: Future[Seq[User]] ={
    userDAO.findAll
  }

  override def authenticate(email: String, password: String): Future[User]={
  userDAO.authenticate(email,password)
  }
  override def add(user: User): Future[String]={
    userDAO.add(user)
  }
}
