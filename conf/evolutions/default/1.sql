# threeplusone schema
--- McGrady
# --- !Downs

drop table if exists player_stats cascade;
drop table if exists team_stats cascade;
drop table if exists games cascade;
drop table if exists contracts cascade;
drop table if exists inscriptions cascade;
drop table if exists subgroups cascade;
drop table if exists groups cascade;
drop table if exists competitions cascade;
drop table if exists arenas cascade;
drop table if exists players cascade;
drop table if exists teams cascade;
drop table if exists seasons cascade;
drop table if exists countries cascade;

# --- !Ups
create table countries(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,abbreviation VARCHAR(3) NOT NULL
    ,CONSTRAINT country_pk PRIMARY KEY (id)
);
create table seasons(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,year VARCHAR(7) NOT NULL UNIQUE
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,description VARCHAR(250)
    ,is_deleted VARCHAR(1) NOT NULL
    ,CONSTRAINT season_pk PRIMARY KEY (id)
);
create table teams(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(30) NOT NULL
    ,id_country BIGINT
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,is_deleted VARCHAR(1) NOT NULL
    ,CONSTRAINT team_pk PRIMARY KEY (id)
    ,CONSTRAINT team_country_fk FOREIGN KEY (id_country) REFERENCES countries(id)
);

create table players(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,first_name VARCHAR(50) NOT NULL
    ,last_name VARCHAR(50) NOT NULL
    ,number INT
    ,description VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,is_deleted VARCHAR(1) NOT NULL
    ,CONSTRAINT player_pk PRIMARY KEY (id)
);
create table arenas(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,direction VARCHAR(150)
    ,id_country BIGINT
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,is_deleted VARCHAR(1) NOT NULL
    ,CONSTRAINT arena_pk PRIMARY KEY (id)
    ,CONSTRAINT arena_country_fk FOREIGN KEY (id_country) REFERENCES countries(id)
);
create table competitions(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_season BIGINT NOT NULL
    ,name VARCHAR(30) NOT NULL
    ,abbreviation VARCHAR(5) NOT NULL
    ,division VARCHAR(3)
    ,id_country BIGINT
    ,description VARCHAR(250)
    ,type VARCHAR(50) NOT NULL
    ,init_date BIGINT
    ,end_date BIGINT
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,is_deleted VARCHAR(1) NOT NULL
    ,CONSTRAINT competition_pk PRIMARY KEY (id)
    ,CONSTRAINT competition_season_fk FOREIGN KEY (id_season) REFERENCES seasons(id)
    ,CONSTRAINT competition_country_fk FOREIGN KEY (id_country) REFERENCES countries(id)
);
create table groups(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_competition BIGINT NOT NULL
    ,name VARCHAR(50) NOT NULL
    ,notes VARCHAR(250)
    ,CONSTRAINT group_pk PRIMARY KEY (id)
    ,CONSTRAINT group_competition_fk FOREIGN KEY (id_competition) REFERENCES competitions(id)
);
create table subgroups(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_group BIGINT NOT NULL
    ,name VARCHAR(50) NOT NULL
    ,notes VARCHAR(250)
    ,CONSTRAINT subgroup_pk PRIMARY KEY (id)
    ,CONSTRAINT subgroup_group_fk FOREIGN KEY (id_group) REFERENCES groups(id)
);
create table inscriptions(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_team BIGINT NOT NULL
    ,id_subgroup BIGINT NOT NULL
    ,id_arena BIGINT
    ,CONSTRAINT inscription_pk PRIMARY KEY (id)
    ,CONSTRAINT inscription_team_fk FOREIGN KEY (id_team) REFERENCES teams(id)
    ,CONSTRAINT inscription_subgroup_fk FOREIGN KEY (id_subgroup) REFERENCES subgroups(id)
    ,CONSTRAINT inscription_arena_fk FOREIGN KEY (id_arena) REFERENCES arenas(id)
);
create table contracts(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_player BIGINT NOT NULL
    ,id_team BIGINT NOT NULL
    ,init_date BIGINT
    ,end_date BIGINT
    ,description VARCHAR(250)
    ,CONSTRAINT contract_pk PRIMARY KEY (id)
    ,CONSTRAINT contract_player_fk FOREIGN KEY (id_player) REFERENCES players(id)
    ,CONSTRAINT contract_team_fk FOREIGN KEY (id_team) REFERENCES teams(id)
);
create table games(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,home BIGINT NOT NULL
    ,visitor BIGINT NOT NULL
    ,date BIGINT
    ,id_arena BIGINT
    ,winner VARCHAR(1)
    ,mvp BIGINT
    ,description VARCHAR(250)
    ,CONSTRAINT game_pk PRIMARY KEY (id)
    ,CONSTRAINT game_home_fk FOREIGN KEY (home) REFERENCES inscriptions(id)
    ,CONSTRAINT game_visitor_fk FOREIGN KEY (visitor) REFERENCES inscriptions(id)
    ,CONSTRAINT game_arena_fk FOREIGN KEY (id_arena) REFERENCES arenas(id)
    ,CONSTRAINT game_mpv_fk FOREIGN KEY (mvp) REFERENCES players(id)
);
create table team_stats(
    id_game BIGINT NOT NULL
    ,id_inscription BIGINT NOT NULL
    ,points BIGINT
    ,off_rebounds BIGINT
    ,def_rebounds BIGINT
    ,assists BIGINT
    ,blocks BIGINT
    ,steals BIGINT
    ,fouls BIGINT
    ,tech_fouls BIGINT
    ,flag_fouls BIGINT
    ,turnovers BIGINT
    ,minutes BIGINT
    ,tc_attemped BIGINT
    ,tc_made BIGINT
    ,ft_attemped BIGINT
    ,ft_made BIGINT
    ,t3_attemped BIGINT
    ,t3_made BIGINT
    ,description VARCHAR(250)
    ,CONSTRAINT tstats_game_fk FOREIGN KEY (id_game) REFERENCES games(id)
    ,CONSTRAINT tstats_inscription_fk FOREIGN KEY (id_inscription) REFERENCES inscriptions(id)
    ,CONSTRAINT tstats_pk PRIMARY KEY (id_game,id_inscription)
);
create table player_stats(
    id_game BIGINT NOT NULL
    ,id_player BIGINT NOT NULL
    ,points BIGINT
    ,off_rebounds BIGINT
    ,def_rebounds BIGINT
    ,assists BIGINT
    ,blocks BIGINT
    ,steals BIGINT
    ,fouls BIGINT
    ,tech_fouls BIGINT
    ,flag_fouls BIGINT
    ,turnovers BIGINT
    ,minutes BIGINT
    ,tc_attemped BIGINT
    ,tc_made BIGINT
    ,ft_attemped BIGINT
    ,ft_made BIGINT
    ,t3_attemped BIGINT
    ,t3_made BIGINT
    ,description VARCHAR(250)
    ,CONSTRAINT pstats_game_fk FOREIGN KEY (id_game) REFERENCES games(id)
    ,CONSTRAINT pstats_inscription_fk FOREIGN KEY (id_player) REFERENCES players(id)
    ,CONSTRAINT pstats_pk PRIMARY KEY (id_game,id_player)
);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            