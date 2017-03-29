package mcgrady.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 27/03/17.
  */

case class Player(id: Option[Long], firstName: Option[String] = None,lastName: String, nickName: Option[String] = None
                  , number: Option[Int] = None, height: Option[Float] = None, weight: Option[Float] = None
                  ,description: Option[String] = None
                  , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                 )

class PlayerTable(tag:Tag) extends Table[Player](tag, "players") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def firstName = column[String]("first_name")
  def lastName = column[String]("last_name")
  def nickName = column[String]("nick_name")
  def number = column[Int]("number")
  def height = column[Float]("height")
  def weight = column[Float]("weight")
  def desc = column[String]("description")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  override def * =(id.?, firstName.?, lastName, nickName.?, number.?, height.?, weight.?, desc.?
    , creationDate, modifiedDate.?
  ) <>(Player.tupled, Player.unapply)
}
object PlayerForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"first_name" -> optional(of[String])
      ,"last_name" -> of[String]
      ,"nick_name" -> optional(of[String])
      ,"number" -> optional(of[Int])
      ,"height" -> optional(of[Float])
      ,"weight" -> optional(of[Float])
      ,"description" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Player.apply)(Player.unapply)
  )
}