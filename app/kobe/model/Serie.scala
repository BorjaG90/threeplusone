package kobe.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 1/04/17.
  */

case class Serie(id: Option[Long], idSession: Long, idExercise: Long, notes: Option[String] = None
                   , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                  )

class SerieTable(tag:Tag) extends Table[Serie](tag, "series") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val sessionTable = TableQuery[SessionTable]
  val exerciseTable = TableQuery[ExerciseTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def idSession = column[Long]("id_session")
  def idExercise = column[Long]("id_exercise")
  def notes = column[String]("notes")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def serie_session_fk = foreignKey("serie_session_fk", idSession, sessionTable)(_.id)
  def serie_exercise_fk = foreignKey("serie_exercise_fk", idExercise, exerciseTable)(_.id)

  override def * =(id.?, idSession, idExercise, notes.?
    , creationDate, modifiedDate.?
  ) <>(Serie.tupled, Serie.unapply)
}
object SerieForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"id_session" -> of[Long]
      ,"id_exercise" -> of[Long]
      ,"notes" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Serie.apply)(Serie.unapply)
  )
}