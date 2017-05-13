package mcgrady.model

/**
  * Created by Borja Gete on 23/03/17.
  */
import play.api.data._
import play.api.data.Forms._
import play.api.data.format.Formats._
import slick.driver.MySQLDriver.api._
import java.util.Date
import java.sql.{ Date => SqlDate }

case class Arena(id: Option[Long], name: String, direction: Option[String] = None,idCountry: Option[Long] = None
                 , creationDate: Date, modifiedDate: Option[Date] = Some(new java.util.Date(0))
                )

class ArenaTable(tag:Tag) extends Table[Arena](tag, "arenas") {
  implicit val dateColumnType = MappedColumnType.base[Date, Long](d => d.getTime, d => new Date(d))

  val countriesTable = TableQuery[CountryTable]

  def id = column[Long]("id", O.PrimaryKey)
  def name = column[String]("name")
  def direction = column[String]("direction")
  def idCountry = column[Long]("id_country")
  def creationDate = column[Date]("creation_date")
  def modifiedDate = column[Date]("modified_date")

  def arena_country_fk = foreignKey("arena_country_fk", idCountry, countriesTable)(_.id)

  override def * =(id.?, name, direction.?, idCountry.?
    , creationDate, modifiedDate.?
  ) <> (Arena.tupled, Arena.unapply _)
}
object ArenaForm {
  val form = Form(
    mapping(
      "id" -> optional(of[Long])
      ,"name" -> of[String]
      ,"direction" -> optional(of[String])
      ,"id_country" -> optional(of[Long])
      ,"creation_date" -> default(date("yyyy-MM-dd"), new java.util.Date)
      ,"modified_date" -> optional(default(date("yyyy-MM-dd"), new java.util.Date))
    )(Arena.apply)(Arena.unapply)
  )
}