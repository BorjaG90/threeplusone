#Europe
#Teams
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Real Madrid Baloncesto','RMB',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Barcelona Lassa','FCB',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Valencia Basket','VAL',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Unicaja Málaga','UNI',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Saski Baskonia','BSK',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('IberoStar Tenerife','IBT',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Herbalife Gran Canaria','HGC',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('MoraBanc Andorra','MBA',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('RETAbet Bilbao Basket','BBB',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Movistar Estudiantes','EST',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('UCAM Murcia','UCM',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Montakit Fuenlabrada','FUE',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Rio Natura Monbus Obradoiro','OBR',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Divina Seguros Joventut','JOV',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Basket Zaragoza','BZG',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Real Betis Energía Plus','BET',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('ICL Manresa','ICL',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Andalou Efes Istanbul','IST',(SELECT id FROM countries where name like ('Turquía')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Brose Bamberg','BAM',(SELECT id FROM countries where name like ('Alemania')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Crvena Zvezda mts Belgrade','RED',(SELECT id FROM countries where name like ('Serbia')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('CSKA Moscow','CSK',(SELECT id FROM countries where name like ('Rusia')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Darussafaka Dogus Istanbul','DAR',(SELECT id FROM countries where name like ('Turquía')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('EA7 Emporio Armani Milan','MIL',(SELECT id FROM countries where name like ('Italia')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Fenerbahce Istanbul','ULK',(SELECT id FROM countries where name like ('Turquía')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Galatasaray Odeabank Istanbul','GAL',(SELECT id FROM countries where name like ('Turquía')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Maccabi FOX Tel Aviv','TEL',(SELECT id FROM countries where name like ('Turquía')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Olympiacos Piraeus','OLY',(SELECT id FROM countries where name like ('Grecia')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Panathinaikos Superfoods Athens','PAN',(SELECT id FROM countries where name like ('Grecia')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Unics Kazan','UNK',(SELECT id FROM countries where name like ('Rusia')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Zalgiris Kaunas','ZAL',(SELECT id FROM countries where name like ('Lituania')),0);

#Players
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Sergi','Llull','Mandarinas',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Rodolfo','Fernández','Rudy',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Luka','Doncic','',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Anthony','Randolph','',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Gustavo','Ayon','Titán de Nayarit',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Juan Carlos','Navarro','La Bomba',0);

#Arenas
INSERT INTO arenas(name,id_country,creation_date) VALUES ('Palacio de los Deportes de la Comunidad de Madrid',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,id_country,creation_date) VALUES ('Palau Sant Jordi',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,id_country,creation_date) VALUES ('Martin Carpena',(SELECT id FROM countries where name like ('España')),0);

#Competitions
INSERT INTO competitions (id_season,name,abbreviation,division,id_country,type,init_date,end_date,creation_date)
VALUES ((SELECT id from seasons as s where s.year like '2017'),'Asociacion Clubs Baloncesto','ACB','1',(SELECT id FROM countries where name like ('España')),'Liga',1472680800000,1472680800000,0);
INSERT INTO competitions (id_season,name,abbreviation,division,type,init_date,end_date,creation_date)
VALUES ((SELECT id from seasons as s where s.year like '2017'),'Turkish Airlines Euroleague','EUR','1','Liga',1472680800000,1472680800000,0);

#Inscriptions
#ACB
INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES ((SELECT id FROM teams where name like 'Real Madrid Baloncesto'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),(SELECT id FROM arenas WHERE name like 'Palacio de los Deportes de la Comunidad de Madrid'),0);
INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES ((SELECT id FROM teams where name like 'Barcelona Lassa'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),(SELECT id FROM arenas WHERE name like 'Palau Sant Jordi'),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Valencia Basket'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES ((SELECT id FROM teams where name like 'Unicaja Málaga'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),(SELECT id FROM arenas WHERE name like 'Martin Carpena'),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Saski Baskonia'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'IberoStar Tenerife'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Herbalife Gran Canaria'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'MoraBanc Andorra'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'RETAbet Bilbao Basket'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Movistar Estudiantes'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'UCAM Murcia'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Montakit Fuenlabrada'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Rio Natura Monbus Obradoiro'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Divina Seguros Joventut'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Basket Zaragoza'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Real Betis Energía Plus'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'ICL Manresa'),(SELECT id FROM competitions where abbreviation like 'ACB' and id_season in (SELECT id from season as s where s.year like '2017')),0);

#Euroleague
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (49,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (50,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (51,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (52,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (53,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (54,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (55,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (56,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (57,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (58,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (59,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (60,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (61,4,9,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (32,4,6,0);
#INSERT INTO inscriptions (id_team,id_competition,id_arena,creation_date) VALUES (33,4,7,0);