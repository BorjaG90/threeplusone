package model

/**
  * Created by Borja Gete on 20/03/17.
  */

import slick.driver.MySQLDriver.api._

case class Unit(id: Long, name: String, description: String,typeUnit: String)

class UnitTable(tag:Tag) extends Table[Enviroment](tag, "units") {
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def desc = column[String]("description")
  def typeUnit = column[String]("type")

  override def * =(id, name, desc, typeUnit) <>(Enviroment.tupled, Enviroment.unapply)
}