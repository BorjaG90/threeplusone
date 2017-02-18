package model

/**
  * Created by Borja Gete on 8/02/17.
  */

import slick.driver.MySQLDriver.api._

case class Country(id: Long, name: String, abbreviation: String)

class CountryTable(tag:Tag) extends Table[Country](tag, "countries") {
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def abrev = column[String]("abbreviation")

  override def * =(id, name, abrev) <>(Country.tupled, Country.unapply)
}