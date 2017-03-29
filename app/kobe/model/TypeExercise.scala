package kobe.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._

/**
  * Created by Borja Gete on 20/03/17.
  */

case class TypeExercise(id: Option[Long], name: String, description: Option[String] = None, notes: Option[String] = None)

class TypeExerciseTable(tag:Tag) extends Table[TypeExercise](tag, "typeExercises") {
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def desc = column[String]("description")
  def notes = column[String]("notes")

  override def * =(id.?, name, desc.?, notes.?) <>(TypeExercise.tupled, TypeExercise.unapply)
}

object TypeExerciseForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"name" -> of[String]
      ,"description" -> optional(of[String])
      ,"notes" -> optional(of[String])
    )(TypeExercise.apply)(TypeExercise.unapply)
  )
}