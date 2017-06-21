-- Big 3
use threeplusone;

-- Teams
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('3´s Company','3SC',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Killer 3s','KIL',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Tri State','TST',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('3 Headed Monsters','3HM',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Trilogy','TLY',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Ghost Ballers','GHB',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Ball Hogs','BHG',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Power','POW',(SELECT id FROM countries where name like ('Estados Unidos')),0);

-- Players
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Allen','Iverson','The Answer',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('DerMarr','Johnson',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Andre','Owens',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Mike','Sweetney','The Bomb',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Ruben','Patterson','Boo',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Chauncey','Billups','Mr. Big Shot',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Stephen','Jackson','Captain Jack',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Reggie','Evans','The Collector',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Larry','Hughes','Smooth',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Brian','Cook',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Jermaine','O´Neal','The Other O´Neal',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Bonzi','Wells','The Bonz',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Xavier','Silas',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Lee','Nailon',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Mike','James',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Rashard','Lewis','Sweet Lew',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Jason','Williams','Chocolate Blanco',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Kwame','Brown',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Eddie','Badsen',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Mahmoud','Abdul-Rauf',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Kenyon','Martin','K-Mart',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Al','Harrington',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Rashad','McCants',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('James','White','Flight',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Dion','Glover',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Mike','Bibby','Manicura Bibby',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Ricky','Davis',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Mo','Evans',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Marcus','Banks',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Ivan','Johnson',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Brian','Scalabrine','The White Mamba',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Josh','Childress',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Derrick','Byars',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Rasual','Butler','The Phoenix',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Dominic','McGuire',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Corey','Maggette',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Cuttino','Mobley','The Cat',0);
INSERT INTO players(first_name, last_name, nick_name, creation_date) VALUES('Jerome','Williams','Junk Yard Dog',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('DeShawn','Stevenson',0);
INSERT INTO players(first_name, last_name, creation_date) VALUES('Moochie','Norris',0);

-- Competition
INSERT INTO competitions (id_season,name,abbreviation,division,id_country,type,init_date,end_date,creation_date)
VALUES ((SELECT id from seasons as s where s.year like '2017'),'The BIG 3','BIG3','1',(SELECT id FROM countries where name like ('Estados Unidos')),'Liga 3x3',1472680800000,1498773600000,0);

--  Inscriptions
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like '3´s Company'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Killer 3s'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Tri State'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like '3 Headed Monsters'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Trilogy'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Ghost Ballers'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Ball Hogs'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Power'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);

--  Contracts
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),(SELECT id FROM teams where name like '3´s Company'),3,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson'),(SELECT id FROM teams where name like '3´s Company'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Andre' and last_name like 'Owens'),(SELECT id FROM teams where name like '3´s Company'),23,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mike' and last_name like 'Sweetney'),(SELECT id FROM teams where name like '3´s Company'),44,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Ruben' and last_name like 'Patterson'),(SELECT id FROM teams where name like '3´s Company'),21,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups'),(SELECT id FROM teams where name like 'Killer 3s'),4,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson'),(SELECT id FROM teams where name like 'Killer 3s'),3,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Reggie' and last_name like 'Evans'),(SELECT id FROM teams where name like 'Killer 3s'),30,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Larry' and last_name like 'Hughes'),(SELECT id FROM teams where name like 'Killer 3s'),20,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Brian' and last_name like 'Cook'),(SELECT id FROM teams where name like 'Killer 3s'),43,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal'),(SELECT id FROM teams where name like 'Tri State'),7,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells'),(SELECT id FROM teams where name like 'Tri State'),42,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Xavier' and last_name like 'Silas'),(SELECT id FROM teams where name like 'Tri State'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Lee' and last_name like 'Nailon'),(SELECT id FROM teams where name like 'Tri State'),33,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mike' and last_name like 'James'),(SELECT id FROM teams where name like 'Tri State'),8,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis'),(SELECT id FROM teams where name like '3 Headed Monsters'),9,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Jason' and last_name like 'Williams'),(SELECT id FROM teams where name like '3 Headed Monsters'),55,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Kwame' and last_name like 'Brown'),(SELECT id FROM teams where name like '3 Headed Monsters'),54,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Eddie' and last_name like 'Badsen'),(SELECT id FROM teams where name like '3 Headed Monsters'),00,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf'),(SELECT id FROM teams where name like '3 Headed Monsters'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin'),(SELECT id FROM teams where name like 'Trilogy'),6,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Al' and last_name like 'Harrington'),(SELECT id FROM teams where name like 'Trilogy'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Rashad' and last_name like 'McCants'),(SELECT id FROM teams where name like 'Trilogy'),40,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'James' and last_name like 'White'),(SELECT id FROM teams where name like 'Trilogy'),23,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Dion' and last_name like 'Glover'),(SELECT id FROM teams where name like 'Trilogy'),16,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mike' and last_name like 'Bibby'),(SELECT id FROM teams where name like 'Ghost Ballers'),10,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Ricky' and last_name like 'Davis'),(SELECT id FROM teams where name like 'Ghost Ballers'),31,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mo' and last_name like 'Evans'),(SELECT id FROM teams where name like 'Ghost Ballers'),00,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Marcus' and last_name like 'Banks'),(SELECT id FROM teams where name like 'Ghost Ballers'),50,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Ivan' and last_name like 'Johnson'),(SELECT id FROM teams where name like 'Ghost Ballers'),44,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine'),(SELECT id FROM teams where name like 'Ball Hogs'),44,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Josh' and last_name like 'Childress'),(SELECT id FROM teams where name like 'Ball Hogs'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Derrick' and last_name like 'Byars'),(SELECT id FROM teams where name like 'Ball Hogs'),15,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Rasual' and last_name like 'Butler'),(SELECT id FROM teams where name like 'Ball Hogs'),32,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Dominic' and last_name like 'McGuire'),(SELECT id FROM teams where name like 'Ball Hogs'),21,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Corey' and last_name like 'Maggette'),(SELECT id FROM teams where name like 'Power'),50,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley'),(SELECT id FROM teams where name like 'Power'),5,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Jerome' and last_name like 'Williams'),(SELECT id FROM teams where name like 'Power'),33,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson'),(SELECT id FROM teams where name like 'Power'),92,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Moochie' and last_name like 'Norris'),(SELECT id FROM teams where name like 'Power'),14,1472680800000,1498773600000,0);

--  Games
-- 1stWeek
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1498341600000,(SELECT id from arenas where name like 'Barclays Center'),'H',(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1498341600000,(SELECT id from arenas where name like 'Barclays Center'),'A',(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1498341600000,(SELECT id from arenas where name like 'Barclays Center'),'H',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1498341600000,(SELECT id from arenas where name like 'Barclays Center'),'A',(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin'),0);
-- 2stWeek
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1498946400000,(SELECT id from arenas where name like 'Spectrum Center'),'H',(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1498946400000,(SELECT id from arenas where name like 'Spectrum Center'),'A',(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1498946400000,(SELECT id from arenas where name like 'Spectrum Center'),'H',(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1498946400000,(SELECT id from arenas where name like 'Spectrum Center'),'H',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);
-- 3stWeek
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1499551200000,(SELECT id from arenas where name like 'Bok Center'),'H',(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1499551200000,(SELECT id from arenas where name like 'Bok Center'),'A',(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1499551200000,(SELECT id from arenas where name like 'Bok Center'),'H',(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1499551200000,(SELECT id from arenas where name like 'Bok Center'),'A',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);
-- 4stWeek
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1500156000000,(SELECT id from arenas where name like 'Wells Fargo Center'),'H',(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1500156000000,(SELECT id from arenas where name like 'Wells Fargo Center'),'A',(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1500156000000,(SELECT id from arenas where name like 'Wells Fargo Center'),'A',(SELECT id from players where first_name like 'Jason' and last_name like 'Williams'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1500156000000,(SELECT id from arenas where name like 'Wells Fargo Center'),'H',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);
-- 5stWeek
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1501365600000,(SELECT id from arenas where name like 'American Airlines Center'),'H',(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1501365600000,(SELECT id from arenas where name like 'American Airlines Center'),'H',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1501365600000,(SELECT id from arenas where name like 'American Airlines Center'),'H',(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1501365600000,(SELECT id from arenas where name like 'American Airlines Center'),'A',(SELECT id from players where first_name like 'Jason' and last_name like 'Williams'),0);
-- 6stWeek
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1501970400000,(SELECT id from arenas where name like 'Rupp Arena'),'H',(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1501970400000,(SELECT id from arenas where name like 'Rupp Arena'),'A',(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1501970400000,(SELECT id from arenas where name like 'Rupp Arena'),'A',(SELECT id from players where first_name like 'Jason' and last_name like 'Williams'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1501970400000,(SELECT id from arenas where name like 'Rupp Arena'),'A',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);
-- 7stWeek
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1502575200000,(SELECT id from arenas where name like 'Staples Center'),'H',(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1502575200000,(SELECT id from arenas where name like 'Staples Center'),'A',(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1502575200000,(SELECT id from arenas where name like 'Staples Center'),'H',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1502575200000,(SELECT id from arenas where name like 'Staples Center'),'A',(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin'),0);
-- PlayOff
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1503180000000,(SELECT id from arenas where name like 'Rupp Arena'),'H',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1503180000000,(SELECT id from arenas where name like 'Rupp Arena'),'H',(SELECT id from players where first_name like 'Jason' and last_name like 'Williams'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1503180000000,(SELECT id from arenas where name like 'Rupp Arena'),'A',(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson'),0);
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1503180000000,(SELECT id from arenas where name like 'Rupp Arena'),'A',(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells'),0);
-- Final
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1503698400000,(SELECT id from arenas where name like 'T-Mobile Arena'),'H',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);

-- Stats
-- 1st Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,40,6,7,7,5,7,12,1,2,12,60,30,14,12,6,14,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,12,2,0,4,0,2,5,0,1,4,20,13,4,3,0,8,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,17,0,1,0,1,4,2,1,0,4,20,9,7,3,1,2,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,11,4,6,3,4,1,5,0,1,4,20,8,3,6,5,4,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,35,8,13,10,3,5,8,2,3,4,60,24,12,16,9,6,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,2,3,5,1,1,2,4,0,1,1,20,1,1,2,0,0,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,22,2,6,7,0,2,0,1,1,2,20,17,8,4,4,3,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,11,3,2,2,2,1,4,1,1,1,20,6,3,10,5,3,0);
-- --2
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,28,4,14,10,1,10,6,3,0,4,60,27,11,5,4,12,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,12,0,4,5,0,4,1,1,0,3,20,10,6,1,0,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,6,1,0,3,0,4,4,1,0,0,20,5,3,0,0,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,10,3,10,2,1,2,1,1,0,1,20,12,2,4,4,8,2);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,64,2,9,13,5,3,11,0,1,11,60,55,24,6,3,21,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,37,1,0,6,1,1,4,0,0,4,20,28,14,2,1,8,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,12,1,7,3,2,1,4,0,1,4,20,11,4,1,1,5,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,15,0,2,4,2,1,3,0,0,3,20,16,6,3,1,8,2);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,67,10,9,6,7,3,8,1,2,7,60,50,25,14,3,22,14);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,31,3,3,0,2,0,0,0,1,3,20,20,11,0,0,9,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,23,2,6,6,0,2,4,0,1,3,20,17,8,7,3,9,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,13,5,0,0,5,1,4,1,0,1,20,13,6,7,0,4,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,38,6,14,3,4,9,9,1,0,7,60,37,12,15,7,21,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,16,1,3,1,2,3,2,0,0,0,20,16,5,3,1,11,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,8,1,7,0,0,4,4,0,0,4,20,6,1,7,5,4,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,14,4,4,2,2,2,3,1,0,3,20,15,6,5,1,6,1);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,35,4,7,10,4,9,9,1,1,2,60,30,13,9,3,15,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,22,2,1,9,1,2,0,1,0,1,20,13,9,3,2,4,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,0,1,0,0,2,4,4,0,0,0,20,6,0,4,0,6,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,13,1,6,1,1,3,5,0,1,1,20,11,4,2,1,5,4);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,36,8,10,6,5,1,2,1,0,12,60,32,9,22,11,12,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,18,2,1,5,2,1,1,0,0,4,20,16,5,8,5,7,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,14,1,3,1,2,0,0,1,0,4,20,11,4,8,2,5,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,4,5,6,0,1,0,1,0,0,4,20,5,0,6,4,0,0);
--  2 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,78,6,12,16,5,8,3,2,3,2,60,54,27,16,11,22,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,36,2,3,2,3,3,0,0,1,1,20,27,12,4,3,10,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,35,2,4,13,1,3,3,1,1,0,20,24,14,3,3,10,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Derrick' and last_name like 'Byars')
	,7,2,5,1,1,2,0,1,1,1,20,3,1,9,5,2,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,21,6,4,5,0,7,6,1,1,7,60,22,7,5,2,6,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,7,1,0,2,0,2,0,0,1,3,20,10,2,3,1,2,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,7,2,0,3,0,4,1,0,0,2,20,7,3,0,0,1,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'James')
	,7,3,4,0,0,1,5,1,0,2,20,5,2,2,1,3,2);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,23,9,10,1,6,3,7,3,1,6,60,21,7,23,6,13,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,18,2,2,1,1,0,0,1,1,3,20,9,6,12,3,3,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,5,3,6,0,0,3,4,1,0,3,20,4,1,7,3,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Rashad' and last_name like 'McCants')
	,0,4,2,0,5,0,3,1,0,0,20,8,0,4,0,8,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,67,9,11,21,9,7,11,1,2,5,60,41,22,24,11,15,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,38,2,3,14,3,1,3,0,1,2,20,25,14,6,2,10,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,21,2,0,6,3,4,5,1,0,1,20,10,7,12,4,3,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Kwame' and last_name like 'Brown')
	,8,5,8,1,3,2,3,0,1,2,20,6,1,6,5,2,1);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,61,4,12,13,8,2,13,1,2,7,60,42,21,14,11,15,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,24,0,3,5,1,1,4,0,1,2,20,15,7,4,4,6,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,19,1,2,6,3,1,5,1,1,4,20,10,7,5,5,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Jerome' and last_name like 'Williams')
	,18,3,7,2,4,0,4,0,0,1,20,17,7,5,2,7,2);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,45,1,7,6,7,4,11,2,2,9,60,40,14,25,12,13,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,14,1,1,1,2,1,5,1,1,1,20,14,5,8,3,2,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,20,0,5,4,2,3,3,1,1,4,20,15,6,7,5,4,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Cook')
	,11,0,1,1,3,0,3,0,0,4,20,11,3,10,4,7,1);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,59,6,10,13,7,5,10,3,1,9,60,41,20,31,10,17,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,26,2,3,1,2,2,3,1,1,4,20,24,8,11,3,12,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,26,2,7,11,3,3,3,1,0,2,20,16,11,9,2,5,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Ruben' and last_name like 'Patterson')
	,7,2,0,1,2,0,4,1,0,3,20,1,1,11,5,0,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,47,5,10,7,2,2,9,1,3,5,60,30,13,27,10,15,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,19,2,0,5,1,1,4,0,1,1,20,13,6,8,2,6,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,15,3,4,1,1,0,5,0,1,3,20,8,4,8,3,4,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Marcus' and last_name like 'Banks')
	,13,0,6,1,0,1,0,1,1,1,20,9,3,11,5,5,2);
--  3 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,57,8,19,10,6,8,3,3,1,8,60,36,21,9,8,11,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,34,2,4,3,1,4,2,1,0,0,20,22,13,2,2,8,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,16,4,10,5,2,1,0,1,1,4,20,10,6,5,4,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Jerome' and last_name like 'Williams')
	,7,2,5,2,3,3,1,1,0,4,20,4,2,2,2,1,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,50,2,16,11,6,5,10,3,0,5,60,37,20,11,3,10,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,20,0,3,4,1,0,2,1,0,0,20,18,8,2,0,6,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,25,2,6,6,0,3,3,1,0,1,20,16,10,7,2,3,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Kwame' and last_name like 'Brown')
	,5,0,7,1,5,2,5,1,0,4,20,3,2,2,1,1,0);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,68,4,9,12,11,7,11,1,1,7,60,58,25,16,8,21,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,32,1,0,5,3,1,4,0,0,2,20,27,12,1,1,9,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,32,1,5,6,3,4,5,1,0,4,20,21,12,8,5,6,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Cook')
	,4,2,4,1,5,2,2,0,1,1,20,10,1,7,2,6,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,72,5,13,6,10,7,14,3,2,1,60,54,26,11,7,18,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,43,0,3,0,3,2,5,1,1,0,20,25,16,2,2,9,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,19,5,4,4,5,1,4,1,0,1,20,14,7,4,4,1,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'James')
	,10,0,6,2,2,4,5,1,1,0,20,15,3,5,1,8,3);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,60,5,20,11,5,4,5,1,1,6,60,50,23,13,6,16,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,27,1,4,9,0,1,4,0,0,3,20,28,10,4,2,12,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,19,1,6,1,3,3,0,0,0,0,20,14,8,3,0,4,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Derrick' and last_name like 'Byars')
	,14,3,10,1,2,0,1,1,1,3,20,8,5,6,4,0,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,55,6,10,5,7,2,10,2,3,4,60,45,20,13,8,11,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,29,1,2,3,2,2,4,0,1,3,20,25,10,7,4,6,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,21,0,1,1,3,0,3,1,1,0,20,18,8,4,3,5,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Marcus' and last_name like 'Banks')
	,5,5,7,1,2,0,3,1,1,1,20,2,2,2,1,0,0);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,41,5,16,8,6,2,11,2,2,8,60,39,12,26,9,14,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,14,0,3,2,2,1,4,0,1,4,20,13,5,3,0,8,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,15,2,3,4,2,1,5,1,1,1,20,14,4,11,4,4,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Rashad' and last_name like 'McCants')
	,12,3,10,2,2,0,2,1,0,3,20,12,3,12,5,2,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,44,4,8,4,4,5,8,2,0,7,60,51,13,9,7,15,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,28,0,4,1,2,3,5,0,0,4,20,29,10,1,0,10,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,14,1,4,3,1,1,3,1,0,0,20,13,3,5,5,3,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Ruben' and last_name like 'Patterson')
	,2,3,0,0,1,1,0,1,0,3,20,9,0,3,2,2,0);
--  4 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,68,6,13,7,8,5,10,1,2,5,60,42,22,31,13,15,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,39,0,4,3,2,2,5,1,0,2,20,25,14,11,4,8,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,15,1,6,2,3,1,1,0,1,2,20,9,4,10,4,4,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,14,5,3,2,3,2,4,0,1,1,20,8,4,10,5,3,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,51,5,6,4,7,1,6,1,1,7,60,51,19,14,6,20,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,23,0,0,0,3,0,0,0,0,1,20,24,10,0,0,8,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,19,5,3,4,4,1,2,0,1,4,20,16,7,7,3,5,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,9,0,3,0,0,0,4,1,0,2,20,11,2,7,3,7,2);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,50,2,16,10,5,8,9,2,1,8,60,34,16,21,8,14,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,29,1,5,8,3,2,4,1,0,4,20,25,9,10,2,12,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,10,1,2,0,1,4,1,1,1,3,20,4,3,5,4,1,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,11,0,9,2,1,2,4,0,0,1,20,5,4,6,2,1,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,51,5,7,10,11,5,7,2,1,4,60,47,16,9,6,21,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,29,3,3,5,3,0,3,0,1,1,20,25,10,0,0,9,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,18,2,0,5,3,3,3,1,0,2,20,20,6,2,2,11,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,4,0,4,0,5,2,1,1,0,1,20,2,0,7,4,1,0);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,28,5,17,2,7,6,10,0,3,7,60,43,11,18,4,12,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,10,1,4,1,1,2,3,0,1,4,20,15,3,12,4,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,2,1,6,0,3,4,2,0,1,0,20,8,1,2,0,6,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,16,3,7,1,3,0,5,0,1,3,20,20,7,4,0,4,2);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,33,5,9,8,1,4,6,3,2,7,60,40,11,16,9,14,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,14,2,4,5,0,1,1,1,1,1,20,17,6,4,2,4,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,7,1,3,1,0,1,2,1,1,3,20,12,2,4,2,9,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,12,2,2,2,1,2,3,1,0,3,20,11,3,8,5,1,1);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,48,4,6,12,7,0,9,1,2,8,60,33,15,11,10,14,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,16,2,1,4,2,0,5,0,1,1,20,13,5,2,1,7,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,16,2,0,4,1,0,2,0,0,4,20,11,5,4,4,4,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,16,0,5,4,4,0,2,1,1,3,20,9,5,5,5,3,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,41,3,13,9,1,5,7,1,1,4,60,46,14,18,5,15,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,18,0,3,2,1,1,3,0,0,4,20,16,6,8,4,7,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,8,1,6,2,0,3,4,1,0,0,20,10,3,9,1,2,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,15,2,4,5,0,1,0,0,1,0,20,20,5,1,0,6,5);
--  5 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,55,2,17,7,6,0,6,1,2,6,60,35,17,19,10,16,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,29,0,0,0,2,0,0,0,0,2,20,23,10,0,0,11,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,15,1,7,4,2,0,1,1,1,3,20,7,4,8,5,3,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,11,1,10,3,2,0,5,0,1,1,20,5,3,11,5,2,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,45,5,11,9,1,5,4,2,1,4,60,52,14,9,5,23,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,25,0,2,8,0,0,0,0,1,2,20,26,8,1,1,11,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,10,3,0,1,0,3,0,1,0,1,20,9,3,5,1,4,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,10,2,9,0,1,2,4,1,0,1,20,17,3,3,3,8,1);
--  --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,47,2,8,12,9,4,3,1,2,7,60,42,16,5,5,15,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,27,0,3,7,3,2,1,1,0,2,20,20,10,0,0,8,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,8,2,4,2,3,0,0,0,1,3,20,12,3,1,1,5,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,12,0,1,3,3,2,2,0,1,2,20,10,3,4,4,2,2);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,40,6,10,2,5,7,13,1,2,6,60,28,13,19,7,11,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,19,1,2,1,1,3,4,1,1,3,20,16,5,13,4,8,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,5,0,6,0,2,2,5,0,0,0,20,3,2,0,0,1,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,16,5,2,1,2,2,4,0,1,3,20,9,6,6,3,2,1);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,43,3,6,10,8,7,5,1,2,5,60,42,15,10,10,18,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,16,0,0,3,3,2,0,0,1,2,20,19,5,3,3,12,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,19,1,3,4,1,4,2,0,0,3,20,15,7,5,5,6,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,8,2,3,3,4,1,3,1,1,0,20,8,3,2,2,0,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,42,5,14,2,5,6,13,1,0,1,60,35,13,16,9,10,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,22,2,4,0,1,0,3,0,0,0,20,16,8,4,2,4,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,12,1,3,2,0,4,5,0,0,0,20,13,4,2,2,2,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,8,2,7,0,4,2,5,1,0,1,20,6,1,10,5,4,1);
-- --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,45,6,12,12,9,5,2,3,2,4,60,32,15,14,10,5,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,16,3,4,3,2,2,0,1,1,0,20,8,4,4,4,4,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,16,3,6,6,3,3,0,1,0,2,20,11,6,6,4,0,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,13,0,2,3,4,0,2,1,1,2,20,13,5,4,2,1,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,65,6,11,14,4,6,8,2,2,8,60,46,20,28,12,18,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,32,3,0,6,1,2,3,0,1,1,20,20,9,14,5,11,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,24,1,9,7,3,1,1,1,1,4,20,13,9,11,4,2,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,9,2,2,1,0,3,4,1,0,3,20,13,2,3,3,5,2);
-- 6 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,38,6,13,6,5,5,11,1,0,7,60,26,11,14,8,13,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,18,0,6,4,0,3,5,0,0,1,20,15,6,6,2,8,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,10,2,0,0,1,2,3,0,0,3,20,6,3,3,2,2,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Lee' and last_name like 'Nailon')
	,10,4,7,2,4,0,3,1,0,3,20,5,2,5,4,3,2);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,28,2,8,7,8,2,5,2,1,10,60,17,8,11,10,3,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,18,0,3,6,3,0,4,1,1,3,20,12,6,4,4,2,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,9,0,2,1,3,0,1,0,0,3,20,2,2,5,5,0,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ivan' and last_name like 'Johnson')
	,1,2,3,0,2,2,0,1,0,4,20,3,0,2,1,1,0);
-- --2
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,41,6,13,4,9,4,7,3,1,7,60,24,15,12,3,8,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,24,3,1,2,2,0,3,1,0,4,20,15,10,8,0,4,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,9,2,9,1,4,2,2,1,1,2,20,5,3,1,1,2,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Dion' and last_name like 'Glover')
	,8,1,3,1,3,2,2,1,0,1,20,4,2,3,2,2,2);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,76,6,10,16,0,6,10,2,3,10,60,57,28,23,5,25,15);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,27,2,5,8,0,1,4,0,1,2,20,20,9,8,0,11,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,32,2,0,5,0,4,4,1,1,4,20,23,12,13,4,11,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Moochie' and last_name like 'Norris')
	,17,2,5,3,0,1,2,1,1,4,20,14,7,2,1,3,2);
-- --3
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,32,4,11,5,5,8,5,1,1,9,60,38,11,9,5,16,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,16,2,2,4,1,4,1,0,1,4,20,12,6,1,1,4,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,9,1,4,1,2,2,3,1,0,2,20,15,2,8,4,10,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Dominic' and last_name like 'McGuire')
	,7,1,5,0,2,2,1,0,0,3,20,11,3,0,0,2,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,42,5,3,9,6,7,14,2,1,6,60,27,14,19,10,10,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,10,1,0,0,2,4,5,1,0,4,20,7,4,3,0,3,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,23,3,2,8,0,1,4,1,0,0,20,12,8,6,5,4,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Eddie' and last_name like 'Badsen')
	,9,1,1,1,4,2,5,0,1,2,20,8,2,10,5,3,0);
-- --4
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,40,2,12,3,6,4,12,2,3,3,60,39,11,14,11,13,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,23,1,2,0,3,1,5,1,1,0,20,20,6,6,5,8,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,9,0,5,1,1,0,2,0,1,2,20,9,3,5,3,1,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Reggie' and last_name like 'Evans')
	,8,1,5,2,2,3,5,1,1,1,20,10,2,3,3,4,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,42,0,9,2,4,8,7,2,2,4,60,39,11,17,10,22,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,23,0,2,1,0,4,2,0,1,0,20,19,7,2,2,10,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,11,0,6,1,1,2,5,1,0,2,20,17,3,10,3,10,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Sweetney')
	,8,0,1,0,3,2,0,1,1,2,20,3,1,5,5,2,1);
--  7 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,54,8,11,11,5,7,10,2,0,6,60,44,19,16,8,12,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,22,3,3,5,2,3,4,1,0,2,20,16,8,1,1,6,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,19,2,6,2,2,1,2,0,0,4,20,17,7,13,5,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,13,3,2,4,1,3,4,1,0,0,20,11,4,2,2,4,3);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,33,7,16,10,7,4,9,2,2,10,60,40,10,9,4,12,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,7,1,6,2,1,0,3,0,0,3,20,4,2,4,2,1,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,24,1,5,8,1,2,3,1,1,4,20,26,8,0,0,8,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,2,5,5,0,5,2,3,1,1,3,20,10,0,5,2,3,0);
-- --2
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,34,4,4,4,8,4,9,2,0,7,60,38,11,14,7,26,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,15,3,1,1,2,0,4,1,0,2,20,11,5,7,3,6,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,16,1,2,3,1,4,3,0,0,1,20,19,6,1,1,12,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,3,0,1,0,5,0,2,1,0,4,20,8,0,6,3,8,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,50,4,18,7,7,6,8,2,1,6,60,53,15,20,8,23,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,21,0,2,5,1,1,2,0,0,0,20,22,6,11,3,13,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,17,0,7,1,1,4,3,1,1,2,20,17,6,1,1,7,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,12,4,9,1,5,1,3,1,0,4,20,14,3,8,4,3,2);
-- --3
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,86,2,11,11,1,8,3,2,2,9,60,52,32,21,10,14,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,41,1,2,2,0,3,1,1,1,3,20,25,15,11,4,7,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,26,0,3,4,1,3,1,1,1,2,20,16,10,6,2,6,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,19,1,6,5,0,2,1,0,0,4,20,11,7,4,4,1,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,42,2,14,2,5,2,5,1,1,5,60,39,12,16,12,11,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,28,1,3,0,0,0,0,0,1,0,20,21,10,4,2,9,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,7,0,6,1,1,1,5,1,0,1,20,12,1,5,5,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,7,1,5,1,4,1,0,0,0,4,20,6,1,7,5,0,0);
-- --4
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,30,7,12,6,3,2,8,1,2,9,60,30,10,11,6,11,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,13,3,7,4,3,0,3,1,1,3,20,6,6,1,1,0,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,10,1,2,0,0,1,5,0,0,2,20,9,2,7,4,5,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,7,3,3,2,0,1,0,0,1,4,20,15,2,3,1,6,2);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,34,4,13,0,5,9,9,1,1,4,60,32,12,4,2,20,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,15,2,1,0,3,3,5,0,0,2,20,16,5,3,1,11,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,15,1,3,0,0,4,2,1,0,0,20,14,6,0,0,8,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,4,1,9,0,2,2,2,0,1,2,20,2,1,1,1,1,1);
--  Playoffs
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,70,7,5,16,8,3,5,0,3,12,60,41,25,24,8,12,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,37,3,4,13,2,2,0,0,1,4,20,22,13,9,2,9,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,27,0,0,3,1,0,4,0,1,4,20,17,11,8,3,2,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,6,4,1,0,5,1,1,0,1,4,20,2,1,7,3,1,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,46,5,16,9,4,3,3,1,1,8,60,30,18,14,6,8,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,23,2,6,5,1,2,0,1,0,4,20,12,9,3,3,3,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,10,3,3,3,3,1,1,0,1,3,20,8,3,9,3,3,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,13,0,7,1,0,0,2,0,0,1,20,10,6,2,0,2,1);
-- --2
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,55,8,19,8,5,7,13,2,3,10,60,47,19,15,7,15,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,23,3,3,0,2,2,5,0,1,2,20,23,7,5,2,7,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,26,0,7,6,0,4,5,1,1,4,20,12,10,9,5,2,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,6,5,9,2,3,1,3,1,1,4,20,12,2,1,0,6,2);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,39,9,10,4,2,1,7,3,2,4,60,36,13,13,7,14,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,18,3,4,2,0,0,0,1,1,0,20,20,6,5,2,8,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,16,2,0,2,1,1,2,1,0,4,20,11,6,2,2,4,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,5,4,6,0,1,0,5,1,1,0,20,5,1,6,3,2,0);
-- --3
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,19,4,11,2,9,5,8,3,1,10,60,31,5,11,9,12,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,3,2,2,0,1,2,3,1,0,4,20,6,0,4,3,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,9,1,0,2,3,3,2,1,0,4,20,9,4,2,1,0,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,7,1,9,0,5,0,3,1,1,2,20,16,1,5,5,10,0);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,34,3,11,8,5,6,6,1,3,6,60,33,12,4,3,19,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,13,1,2,2,1,1,1,0,1,3,20,16,4,1,1,10,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,9,1,4,2,0,3,5,0,1,1,20,8,3,1,0,5,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,12,1,5,4,4,2,0,1,1,2,20,9,5,2,2,4,0);
-- --4
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,40,5,11,3,2,6,5,1,0,9,60,37,12,23,7,21,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,25,1,1,0,1,2,4,0,0,3,20,16,8,9,3,7,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,10,3,8,2,0,0,0,0,0,2,20,12,3,10,2,6,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,5,1,2,1,1,4,1,1,0,4,20,9,1,4,2,8,1);

INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,50,4,7,13,2,5,9,3,3,7,60,44,16,19,7,17,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,33,0,1,11,0,2,4,1,1,3,20,29,11,5,3,13,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,12,3,4,1,2,2,5,1,1,1,20,9,3,12,4,3,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,5,1,2,1,0,1,0,1,1,3,20,6,2,2,0,1,1);
--  Finals
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,62,8,12,9,4,5,8,2,0,3,60,46,21,15,7,20,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,36,2,2,7,1,1,2,1,0,1,20,26,13,3,3,11,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,18,1,6,0,0,2,4,0,0,0,20,13,5,5,4,5,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,8,5,4,2,3,2,2,1,0,2,20,7,3,7,0,4,2);
	
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,29,9,20,2,7,3,7,2,2,4,60,45,7,19,8,16,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,13,1,6,1,2,0,5,1,1,0,20,12,3,10,4,3,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,15,3,4,1,0,3,2,1,0,1,20,23,4,6,3,9,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,1,5,10,0,5,0,0,0,1,3,20,10,0,3,1,4,0);