package kobe.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._

/**
  * Created by Borja Gete on 20/03/17.
  */

case class Enviroment(id: Option[Long], name: String, description: Option[String]= None, notes: Option[String]= None)

class EnviromentTable(tag:Tag) extends Table[Enviroment](tag, "enviroments") {
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def desc = column[String]("description")
  def notes = column[String]("notes")

  override def * =(id.?, name, desc.?, notes.?) <>(Enviroment.tupled, Enviroment.unapply)
}
object EnviromentForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"name" -> of[String]
      ,"description" -> optional(of[String])
      ,"notes" -> optional(of[String])
    )(Enviroment.apply)(Enviroment.unapply)
  )
}