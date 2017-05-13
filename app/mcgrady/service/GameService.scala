package mcgrady.service

import scala.concurrent.Future
import com.google.inject.ImplementedBy
import util.Page
import mcgrady.model.{Game, Inscription, Player, Arena}
import impl.GameServiceImpl

/**
  * Created by Borja Gete on 1/04/17.
  */

@ImplementedBy(classOf[GameServiceImpl])
trait GameService {
  def add(competition: Game): Future[String]
  def update(id: Long, inscription: Game): Future[Int]
  def delete(id: Option[Long]): Future[Int]
  def listSimple: Future[Seq[Game]]
  def list(page: Int, pageSize:Int, orderBy: Int, filter: String):Future[Page[(Game, Inscription,String, Inscription,String)]]
  def count: Future[Int]
  def find(id: Long): Future[Game]
  def get(id: Long): Future[Option[Game]]
}
