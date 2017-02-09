# threeplusone schema
# --- !Downs

drop table if exists leagues cascade;
drop table if exists countries cascade;
drop table if exists comodin cascade;

create table comodin(
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);
create table countries(
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  abbreviation VARCHAR(3) NOT NULL,
  CONSTRAINT country_pk PRIMARY KEY (id)
);
create table leagues(
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  abbreviation VARCHAR(5) NOT NULL,
  division VARCHAR(3),
  id_country BIGINT,
  CONSTRAINT league_pk PRIMARY KEY (id),
  CONSTRAINT league_country_fk FOREIGN KEY (id_country) REFERENCES countries(id)
);