# threeplusone schema
--- Kobe
# --- !Downs

drop table if exists records cascade;
drop table if exists series cascade;
drop table if exists sessions cascade;
drop table if exists plans cascade;
drop table if exists exercises cascade;
drop table if exists categories cascade;
drop table if exists typeExercises cascade;
drop table if exists enviroments cascade;
drop table if exists units cascade;

# --- !Ups
create table units(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,description VARCHAR(250)
    ,type VARCHAR(1) NOT NULL
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT unit_pk PRIMARY KEY (id)
);
create table enviroments(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,description VARCHAR(250)
    ,notes VARCHAR(250)
    ,CONSTRAINT enviroment_pk PRIMARY KEY (id)
);
create table typeExercises(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,description VARCHAR(250)
    ,notes VARCHAR(250)
    ,CONSTRAINT type_pk PRIMARY KEY (id)
);
create table categories(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,description VARCHAR(250)
    ,notes VARCHAR(250)
    ,CONSTRAINT category_pk PRIMARY KEY (id)
);
create table exercises(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,id_type BIGINT
    ,id_category BIGINT
    ,id_enviroment BIGINT
    ,notes VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT exercise_pk PRIMARY KEY (id)
    ,CONSTRAINT exercise_type_fk FOREIGN KEY (id_type) REFERENCES typeExercises(id)
    ,CONSTRAINT exercise_category_fk FOREIGN KEY (id_category) REFERENCES categories(id)
    ,CONSTRAINT exercise_enviroment_fk FOREIGN KEY (id_enviroment) REFERENCES enviroments(id)
);
create table plans(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,date BIGINT
    ,description VARCHAR(250)
    ,notes VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT plan_pk PRIMARY KEY (id)
);
create table sessions(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,id_plan BIGINT NOT NULL
    ,notes VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT session_pk PRIMARY KEY (id)
    ,CONSTRAINT session_plan_fk FOREIGN KEY (id_plan) REFERENCES plans(id)
);
create table series(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_session BIGINT NOT NULL
    ,id_exercise BIGINT NOT NULL
    ,notes VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT serie_pk PRIMARY KEY (id)
    ,CONSTRAINT serie_session_fk FOREIGN KEY (id_session) REFERENCES sessions(id)
    ,CONSTRAINT serie_exercise_fk FOREIGN KEY (id_exercise) REFERENCES exercises(id)
);
create table records(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_unit BIGINT NOT NULL
    ,id_serie BIGINT
    ,value FLOAT NOT NULL
    ,notes VARCHAR(250)
    ,type VARCHAR(1) NOT NULL
    ,execution_date BIGINT
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT record_pk PRIMARY KEY (id)
    ,CONSTRAINT record_unit_fk FOREIGN KEY (id_unit) REFERENCES units(id)
    ,CONSTRAINT record_serie_fk FOREIGN KEY (id_serie) REFERENCES series(id)
);

#Units
INSERT INTO units (name,description,type, creation_date) VALUES('s','Segundos','T',0);
INSERT INTO units (name,description,type, creation_date) VALUES('min','Minutos','T',0);
INSERT INTO units (name,description,type, creation_date) VALUES('h','Horas','T', 0);
INSERT INTO units (name,description,type, creation_date) VALUES('m','Metros','D', 0);
INSERT INTO units (name,description,type, creation_date) VALUES('km','KiloMetros','D', 0);
INSERT INTO units (name,description,type, creation_date) VALUES('rep','Repeticiones','D', 0);
INSERT INTO units (name,description,type, creation_date) VALUES('LPM','Latidos por Minuto','D', 0);
INSERT INTO units (name,description,type, creation_date) VALUES('fga','Lanzamientos','D', 0);
INSERT INTO units (name,description,type, creation_date) VALUES('fgm','Canastas','D', 0);