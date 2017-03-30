package mcgrady.dao.impl

import scala.concurrent.Future
import scala.concurrent.ExecutionContext.Implicits.global
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile
import javax.inject.Inject
import util.Page
import mcgrady.model.{Contract, ContractTable, Player, Team, TeamTable}
import mcgrady.dao.{ContractDAO,TeamDAO}

/**
  * Created by Borja Gete on 30/03/17.
  */

class ContractDAOImpl @Inject()(protected val dbConfigProvider: DatabaseConfigProvider) extends ContractDAO{
  val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  val contracts = TableQuery[ContractTable]
  val teams = TableQuery[TeamTable]
  //val tD = mcgrady.dao.impl.TeamDAO
  override def add(contract: Contract): Future[String] = {
    db.run(contracts += contract).map(res => "Contrato añadido satisfactoriamente").recover {
      case ex : Exception => ex.getCause.getMessage
    }
  }

  override def update(id: Long, contract: Contract): Future[Int] = {
    db.run(filterQuery(id).update(contract))
  }

  override def delete(id: Option[Long]): Future[Int] = {
    db.run(contracts.filter(_.id === id).delete)
  }

  override def get(id: Long): Future[Option[Contract]] = {
    db.run(contracts.filter(_.id === id).result.headOption)
  }

  override def findById(id: Long): Future[Contract] ={
    db.run(filterQuery(id).result.head)
  }

  override def count: Future[Int] = {
    db.run(contracts.length.result)
  }
  override def listSimple: Future[Seq[Contract]] = {
    db.run(contracts.result)
  }
  override def list(page: Int, pageSize: Int, orderBy: Int, filter: String = "%"): Future[Page[(Contract,Player,Team)]] = {
    val offset = pageSize * page
    val query =
      (for {
        contract <- contracts
        player <- contract.contract_player_fk
        team <- contract.contract_team_fk if team.name like filter.toLowerCase
      } yield (contract,player,team)).drop(offset).take(pageSize)
    val totalRows = count(filter)
    val result = db.run(query.result)

    result flatMap (objects => totalRows map (rows => Page(objects, page, offset, rows)))
  }

  private def count(filter: String): Future[Int] = {
    //db.run(teams.filter(_.name like filter.toLowerCase).length.result)
    db.run(contracts.length.result)
  }

  private def filterQuery(id: Long): Query[ContractTable, Contract, Seq] = {
    contracts.filter(_.id === id)
  }

  private def filterTeam(filter: String): Query[TeamTable, Team, Seq] = {
    teams.filter(_.name like filter.toLowerCase)
  }
  private def countTeams() = {}


}
