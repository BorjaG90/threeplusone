package model

/**
  * Created by Borja Gete on 20/03/17.
  */

import slick.driver.MySQLDriver.api._

case class Category(id: Long, name: String, description: String, notes: String)

class CategoryTable(tag:Tag) extends Table[Category](tag, "categories") {
  def id = column[Long]("id", O.PrimaryKey,O.AutoInc)
  def name = column[String]("name")
  def desc = column[String]("description")
  def notes = column[String]("notes")

  override def * =(id, name, desc, notes) <>(Category.tupled, Category.unapply)
}