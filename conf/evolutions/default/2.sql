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


# Test
# Kobe

#Emptys
INSERT INTO units (id, name, type, creation_date) VALUES(1,' ','D',0);
INSERT INTO enviroments (id, name) VALUES(1,' ');
INSERT INTO typeExercises (id, name) VALUES(1,' ');
INSERT INTO categories (id, name) VALUES(1,' ');
INSERT INTO plans (id, name, creation_date) VALUES(1,' ', 0);

#Units
INSERT INTO units (id, name,description,type, creation_date) VALUES(2,'s','Segundos','T',0);
INSERT INTO units (id, name,description,type, creation_date) VALUES(3,'min','Minutos','T',0);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      INSERT INTO units (id, name,description,type, creation_date) VALUES(4,'h','Horas','T', 0);
INSERT INTO units (id, name,description,type, creation_date) VALUES(5,'m','Metros','D', 0);
INSERT INTO units (id, name,description,type, creation_date) VALUES(6,'km','KiloMetros','D', 0);
INSERT INTO units (id, name,description,type, creation_date) VALUES(7,'rep','Repeticiones','D', 0);
INSERT INTO units (id, name,description,type, creation_date) VALUES(8,'LPM','Latidos por Minuto','D', 0);
INSERT INTO units (id, name,description,type, creation_date) VALUES(9,'fg','Lanzamientos','D', 0);

#Enviroments
INSERT INTO enviroments (id, name) VALUES(2,'Gimnasio');
INSERT INTO enviroments (id, name) VALUES(3,'Pista');
INSERT INTO enviroments (id, name) VALUES(4,'Piscina');
INSERT INTO enviroments (id, name) VALUES(5,'Calle');
INSERT INTO enviroments (id, name) VALUES(6,'Cancha');

#TypeExercises
INSERT INTO typeExercises (id, name) VALUES(2,'Aeróbico');
INSERT INTO typeExercises (id, name) VALUES(3,'Anaeróbico');

#Categories
INSERT INTO categories (id, name) VALUES(2,'Pretemporada');
INSERT INTO categories (id, name) VALUES(3,'Acondicionamiento');
INSERT INTO categories (id, name) VALUES(4,'Competición');
INSERT INTO categories (id, name) VALUES(5,'PlayOff');

#Plans
