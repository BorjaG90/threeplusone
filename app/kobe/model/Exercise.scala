package kobe.model

import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

/**
  * Created by Borja Gete on 30/03/17.
  */

case class Exercise(id: Option[Long], name: String, idTypeExercise: Option[Long] = None, idCategory: Option[Long] = None
                   , idEnviroment: Option[Long] = None, notes: Option[String] = None
                   , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                  )

class ExerciseTable(tag:Tag) extends Table[Exercise](tag, "exercises") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val typeTable = TableQuery[TypeExerciseTable]
  val categoryTable = TableQuery[CategoryTable]
  val enviromentTable = TableQuery[EnviromentTable]

  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def idTypeExercise = column[Long]("id_type")
  def idCategory = column[Long]("id_category")
  def idEnviroment = column[Long]("id_enviroment")
  def notes = column[String]("notes")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def exercise_type_fk = foreignKey("exercise_type_fk", idTypeExercise, typeTable)(_.id)
  def exercise_category_fk = foreignKey("exercise_category_fk", idCategory, categoryTable)(_.id)
  def exercise_enviroment_fk = foreignKey("exercise_enviroment_fk", idEnviroment, enviromentTable)(_.id)

  override def * =(id.?, name, idTypeExercise.?, idCategory.?, idEnviroment.?, notes.?
    , creationDate, modifiedDate.?
  ) <>(Exercise.tupled, Exercise.unapply)
}
object ExerciseForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"name" -> of[String]
      ,"id_type" -> optional(of[Long])
      ,"id_category" -> optional(of[Long])
      ,"id_enviroment" -> optional(of[Long])
      ,"notes" -> optional(of[String])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Exercise.apply)(Exercise.unapply)
  )
}