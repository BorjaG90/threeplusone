# threeplusone schema
# --- !Downs

drop table if exists leagues cascade;
drop table if exists countries cascade;

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
  CONSTRAINT league_pk PRIMARY KEY (id)
);