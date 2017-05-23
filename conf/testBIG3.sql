#Big 3
use threeplusone;
#Seasons
INSERT INTO seasons (year, creation_date) VALUES ('2017', 0);
#Teams
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('3´s Company','3SC',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Killer 3s','KIL',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Tri State','TST',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('3 Headed Monsters','3HM',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Trilogy','TLY',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Ghost Ballers','GHB',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Ball Hogs','BHG',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO teams (name, abbreviation, id_country, creation_date) VALUES ('Power','POW',(SELECT id FROM countries where name like ('Estados Unidos')),0);

#Players
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

#arenas
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Barclays Center','Brooklyn, New York',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Spectrum Center','Charlotte, North Carolina',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Bok Center','Tulsa, Oklahoma',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Wells Fargo Center','Philadelphia,Philadelphia',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('American Airlines Center','Dallas, Texas',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Staples Center','Los Ángeles, California',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Rupp Arena','Lexington, Kentucky',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Key Arena','Seattle, Washington',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('T-Mobile Arena','Las Vegas, Nevada',(SELECT id FROM countries where name like ('Estados Unidos')),0);

#Competition
INSERT INTO competitions (id_season,name,abbreviation,division,id_country,type,init_date,end_date,creation_date)
VALUES ((SELECT id from seasons as s where s.year like '2017'),'The BIG 3','BIG3','1',(SELECT id FROM countries where name like ('Estados Unidos')),'Liga 3x3',1472680800000,1498773600000,0);

# Inscriptions
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like '3´s Company'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Killer 3s'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Tri State'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like '3 Headed Monsters'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Trilogy'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Ghost Ballers'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Ball Hogs'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);
INSERT INTO inscriptions (id_team,id_competition,creation_date) VALUES ((SELECT id FROM teams where name like 'Power'),(SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')),0);

# Contracts
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Allen' and last_name like'Iverson'),(SELECT id FROM teams where name like '3´s Company'),3,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'DerMarr' and last_name like'Johnson'),(SELECT id FROM teams where name like '3´s Company'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Andre' and last_name like'Owens'),(SELECT id FROM teams where name like '3´s Company'),23,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mike' and last_name like'Sweetney'),(SELECT id FROM teams where name like '3´s Company'),44,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Ruben' and last_name like'Patterson'),(SELECT id FROM teams where name like '3´s Company'),21,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Chauncey' and last_name like'Billups'),(SELECT id FROM teams where name like 'Killer 3s'),4,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Stephen' and last_name like'Jackson'),(SELECT id FROM teams where name like 'Killer 3s'),3,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Reggie' and last_name like'Evans'),(SELECT id FROM teams where name like 'Killer 3s'),30,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Larry' and last_name like'Hughes'),(SELECT id FROM teams where name like 'Killer 3s'),20,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Brian' and last_name like'Cook'),(SELECT id FROM teams where name like 'Killer 3s'),43,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Jermaine' and last_name like'O´Neal'),(SELECT id FROM teams where name like 'Tri State'),7,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Bonzi' and last_name like'Wells'),(SELECT id FROM teams where name like 'Tri State'),42,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Xavier' and last_name like'Silas'),(SELECT id FROM teams where name like 'Tri State'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Lee' and last_name like'Nailon'),(SELECT id FROM teams where name like 'Tri State'),33,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mike' and last_name like'James'),(SELECT id FROM teams where name like 'Tri State'),8,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Rashard' and last_name like'Lewis'),(SELECT id FROM teams where name like '3 Headed Monsters'),9,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Jason' and last_name like'Williams'),(SELECT id FROM teams where name like '3 Headed Monsters'),55,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Kwame' and last_name like'Brown'),(SELECT id FROM teams where name like '3 Headed Monsters'),54,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Eddie' and last_name like'Badsen'),(SELECT id FROM teams where name like '3 Headed Monsters'),00,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mahmoud' and last_name like'Abdul-Rauf'),(SELECT id FROM teams where name like '3 Headed Monsters'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Kenyon' and last_name like'Martin'),(SELECT id FROM teams where name like 'Trilogy'),6,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Al' and last_name like'Harrington'),(SELECT id FROM teams where name like 'Trilogy'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Rashad' and last_name like'McCants'),(SELECT id FROM teams where name like 'Trilogy'),40,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'James' and last_name like'White'),(SELECT id FROM teams where name like 'Trilogy'),23,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Dion' and last_name like'Glover'),(SELECT id FROM teams where name like 'Trilogy'),16,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mike' and last_name like'Bibby'),(SELECT id FROM teams where name like 'Ghost Ballers'),10,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Ricky' and last_name like'Davis'),(SELECT id FROM teams where name like 'Ghost Ballers'),31,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Mo' and last_name like'Evans'),(SELECT id FROM teams where name like 'Ghost Ballers'),00,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Marcus' and last_name like'Banks'),(SELECT id FROM teams where name like 'Ghost Ballers'),50,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Ivan' and last_name like'Johnson'),(SELECT id FROM teams where name like 'Ghost Ballers'),44,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Brian' and last_name like'Scalabrine'),(SELECT id FROM teams where name like 'Ball Hogs'),44,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Josh' and last_name like'Childress'),(SELECT id FROM teams where name like 'Ball Hogs'),1,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Derrick' and last_name like'Byars'),(SELECT id FROM teams where name like 'Ball Hogs'),15,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Rasual' and last_name like'Butler'),(SELECT id FROM teams where name like 'Ball Hogs'),32,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Dominic' and last_name like'McGuire'),(SELECT id FROM teams where name like 'Ball Hogs'),21,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Corey' and last_name like'Maggette'),(SELECT id FROM teams where name like 'Power'),50,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Cuttino' and last_name like'Mobley'),(SELECT id FROM teams where name like 'Power'),5,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Jerome' and last_name like'Williams'),(SELECT id FROM teams where name like 'Power'),33,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'DeShawn' and last_name like'Stevenson'),(SELECT id FROM teams where name like 'Power'),92,1472680800000,1498773600000,0);
INSERT INTO contracts (id_player,id_team,number,init_date,end_date,creation_date) VALUES ((SELECT id from players where first_name like 'Moochie' and last_name like'Norris'),(SELECT id FROM teams where name like 'Power'),14,1472680800000,1498773600000,0);

# Games
#1stWeek
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
#2stWeek
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
#3stWeek
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
#4stWeek
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
#5stWeek
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
#6stWeek
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
#7stWeek
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
#PlayOff
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
#Final
INSERT INTO games (id_home,id_visitor,date,id_arena,winner,mvp,creation_date) VALUES (
	(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters') and id_competition in (SELECT id FROM competitions where abbreviation like 'BIG3' and id_season in (SELECT id from seasons as s where s.year like '2017')))
	,1503698400000,(SELECT id from arenas where name like 'T-Mobile Arena'),'H',(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson'),0);

#Stats 
#1st Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,67,11,14,19,11,11,7,2,4,14,90,32,15,14,9,22,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,40,2,11,2,4,2,0,0,2,4,30,10,8,7,6,7,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,4,7,2,8,4,4,4,0,2,4,30,9,0,4,1,7,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,23,3,1,9,3,4,3,2,1,6,30,13,6,3,2,8,3);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,50,10,22,13,7,1,10,1,3,24,90,28,6,24,12,21,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,16,1,3,4,5,0,0,1,0,9,30,13,5,5,2,10,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,19,6,8,8,2,0,6,0,1,8,30,7,1,7,4,6,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,15,2,11,1,0,0,4,1,2,7,30,8,0,12,7,5,3);
#--2
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,56,8,17,17,7,8,3,3,3,17,90,31,11,22,9,24,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,20,1,5,10,4,5,0,2,0,6,30,6,2,9,4,10,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,17,7,5,1,2,3,1,1,2,1,30,7,2,11,3,7,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,19,0,7,6,1,1,2,1,1,9,30,17,7,2,2,8,1);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,63,15,11,15,2,8,8,2,4,11,90,19,8,20,8,38,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,23,3,3,6,1,0,4,0,2,0,30,5,3,3,1,16,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,18,7,5,9,0,4,2,1,1,5,30,4,3,11,4,11,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,21,5,3,1,1,4,2,1,1,6,30,11,3,6,3,12,4);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,66,14,15,19,10,7,5,4,4,19,90,20,9,28,9,26,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,29,4,8,1,2,1,3,2,1,1,30,3,3,11,2,13,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,13,9,6,10,5,3,1,1,1,9,30,7,1,6,5,7,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,24,2,0,7,4,3,0,0,1,9,30,11,6,12,3,6,3);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,62,10,23,14,5,3,3,2,0,21,90,25,13,20,8,25,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,38,5,11,4,3,1,1,0,0,3,30,11,8,10,6,9,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,13,0,7,5,1,2,1,1,0,9,30,3,2,5,0,8,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,11,5,4,4,1,1,1,1,0,9,30,11,2,5,1,9,2);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,70,10,22,16,12,5,10,3,5,12,90,37,21,27,10,26,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,30,2,14,4,5,0,4,1,2,2,30,16,8,9,5,6,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,19,4,3,9,5,5,3,0,1,1,30,11,6,6,2,10,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,20,4,5,3,3,0,3,2,2,9,30,10,7,12,3,9,1);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,83,15,7,9,8,7,10,4,3,21,90,25,13,30,14,32,15);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,36,6,1,0,3,3,2,2,0,8,30,6,3,12,7,15,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,15,0,3,1,1,3,3,1,2,5,30,10,4,7,5,7,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498341600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,32,8,3,8,5,1,5,2,1,8,30,9,6,11,2,10,6);
# 2 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,72,9,23,14,9,7,12,2,4,6,90,41,12,22,14,26,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,33,6,11,6,2,4,5,0,1,3,30,14,5,8,8,10,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,26,2,5,7,5,2,5,2,2,3,30,13,3,10,4,11,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Derrick' and last_name like 'Byars')
	,13,1,7,1,3,2,3,0,1,0,30,15,5,4,2,5,0);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,61,16,18,17,13,11,8,1,4,22,90,32,15,28,12,20,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,23,4,5,1,5,3,2,0,2,6,30,9,3,16,6,12,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,14,6,6,6,5,4,5,0,2,7,30,8,5,8,2,1,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'James')
	,24,6,7,10,4,4,1,1,0,8,30,15,7,5,4,8,2);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,60,11,18,19,7,5,8,3,5,14,90,20,6,26,13,27,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,28,4,2,7,1,3,4,2,1,2,30,8,3,15,8,15,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,21,5,8,9,1,0,0,1,2,10,30,7,0,10,4,6,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Rashad' and last_name like 'McCants')
	,11,2,7,3,4,2,4,1,2,3,30,5,3,2,1,6,1);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,65,20,11,14,10,7,10,2,4,11,90,35,14,33,8,26,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,35,8,2,1,4,5,1,0,1,6,30,9,6,16,7,13,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,21,3,8,7,3,1,5,1,2,2,30,16,7,10,0,6,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Kwame' and last_name like 'Brown')
	,9,9,1,6,2,2,4,1,2,2,30,9,1,8,1,7,2);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,82,13,20,12,9,5,13,2,4,13,90,24,11,28,11,29,17);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,31,5,13,1,3,1,3,1,1,4,30,11,3,6,2,17,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,21,8,5,4,3,1,5,0,2,5,30,6,2,13,5,6,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Jerome' and last_name like 'Williams')
	,30,0,2,7,3,4,5,1,2,4,30,7,6,8,4,6,4);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,63,17,27,10,9,9,12,2,4,23,90,25,6,24,7,30,15);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,28,1,14,5,1,4,0,1,2,9,30,11,2,8,3,8,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,21,7,7,1,4,3,6,0,1,6,30,10,3,12,2,13,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Cook')
	,14,9,6,3,3,1,6,1,1,8,30,4,0,5,1,9,4);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,67,20,20,6,8,5,3,4,4,13,90,27,12,29,9,22,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,34,5,8,3,1,3,3,1,2,3,30,4,3,11,5,10,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,11,9,5,2,5,1,0,2,1,5,30,11,2,12,2,8,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Ruben' and last_name like 'Patterson')
	,22,5,7,1,2,1,0,2,1,5,30,12,6,6,2,4,2);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,48,13,19,20,6,11,8,4,2,18,90,31,10,15,3,31,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,7,7,6,8,2,4,1,0,0,9,30,8,0,3,1,8,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,28,1,5,8,3,2,2,2,0,5,30,17,8,8,1,13,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1498946400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Marcus' and last_name like 'Banks')
	,14,5,8,4,1,4,5,2,2,4,30,5,2,3,1,9,2);
# 3 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,79,15,24,19,13,6,5,4,4,10,90,31,21,32,14,27,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,25,5,13,4,5,5,1,2,1,8,30,7,7,14,6,10,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,22,2,7,7,4,1,1,1,1,1,30,14,6,13,5,6,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Jerome' and last_name like 'Williams')
	,32,8,4,8,4,0,4,2,1,1,30,10,7,6,2,10,5);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,54,13,6,18,7,4,9,4,3,5,90,24,3,30,12,28,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,7,6,1,5,2,2,1,1,1,1,30,6,0,13,4,10,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,25,2,4,9,1,1,3,1,1,2,30,8,1,11,5,8,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Kwame' and last_name like 'Brown')
	,22,5,2,4,4,2,5,1,1,3,30,10,1,6,4,9,5);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,50,13,15,25,6,10,9,5,2,16,90,32,9,29,11,22,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,21,6,6,8,4,2,1,1,2,2,30,12,4,15,6,7,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,8,7,5,9,1,5,3,2,0,7,30,8,2,10,3,9,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Cook')
	,21,0,4,8,2,4,4,2,0,6,30,12,4,4,2,6,4);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,89,16,26,12,10,7,13,3,3,9,90,27,13,27,14,30,16);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,42,1,14,2,1,2,4,1,0,3,30,12,7,13,6,11,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,28,8,5,3,5,2,5,1,1,5,30,6,5,9,4,8,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'James')
	,20,7,7,8,5,2,5,1,1,0,30,8,1,5,5,11,4);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,72,9,14,15,10,10,8,5,4,11,90,38,15,21,8,30,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,34,4,9,8,3,3,0,2,2,3,30,15,7,11,3,12,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,33,1,2,4,5,2,4,2,1,4,30,16,8,7,3,12,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Derrick' and last_name like 'Byars')
	,5,3,3,4,2,5,3,2,2,4,30,7,0,3,1,6,1);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,70,8,21,5,5,10,7,4,3,11,90,37,19,19,7,29,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,29,0,11,1,2,4,1,2,2,5,30,18,9,10,3,12,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,21,2,5,3,3,1,1,0,1,2,30,16,8,6,2,10,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Marcus' and last_name like 'Banks')
	,20,6,6,1,0,4,5,2,0,4,30,3,2,4,2,8,5);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,66,25,21,20,7,6,8,4,5,21,90,30,11,19,7,27,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,33,8,8,6,5,0,2,1,2,7,30,14,6,11,4,9,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,20,6,7,6,1,4,1,2,1,9,30,11,5,7,2,6,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Rashad' and last_name like 'McCants')
	,13,10,6,8,2,1,5,2,2,5,30,5,1,2,1,12,3);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,78,11,18,23,9,10,7,4,4,6,90,24,17,22,11,26,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,29,4,15,9,3,2,3,0,2,1,30,8,6,13,7,9,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,21,0,3,7,4,5,4,2,0,4,30,10,6,3,2,5,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1499551200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Ruben' and last_name like 'Patterson')
	,28,7,0,6,2,3,0,2,1,1,30,7,6,6,3,11,4);
# 4 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,81,15,9,21,7,8,11,4,2,10,90,34,21,17,6,16,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,32,5,1,10,2,3,2,1,1,2,30,11,10,5,1,4,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,24,6,4,5,3,2,4,2,0,4,30,15,5,3,0,6,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,25,3,4,6,2,3,5,1,1,4,30,8,5,9,4,5,3);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,69,17,15,13,7,7,6,5,2,18,90,20,9,10,4,35,16);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,25,3,8,0,1,4,2,2,1,9,30,4,0,1,0,9,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,23,7,5,10,4,1,1,2,0,3,30,7,6,4,3,12,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,21,6,2,3,2,2,3,2,1,6,30,9,2,5,1,14,5);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,77,10,21,28,8,6,10,4,4,13,90,37,20,24,4,30,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,27,0,13,9,3,2,4,1,1,3,30,14,4,8,1,14,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,30,8,4,10,0,5,1,2,2,1,30,13,8,8,1,6,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,20,2,4,9,5,0,4,1,1,8,30,9,8,9,2,9,1);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,78,21,12,23,7,4,6,2,2,17,90,32,16,18,8,22,13);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,37,6,2,9,3,1,4,1,1,4,30,7,6,6,3,9,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,27,8,6,8,3,2,0,1,1,3,30,14,5,3,2,13,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,14,7,4,5,1,2,3,0,1,10,30,11,5,8,3,1,0);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,71,18,16,20,7,8,9,2,3,9,90,26,14,23,9,24,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,32,7,3,9,4,3,5,1,1,0,30,10,6,8,3,9,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,26,9,7,6,2,3,1,1,1,1,30,9,2,6,4,11,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,13,2,6,5,1,2,3,1,1,8,30,7,5,9,2,4,0);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,95,10,17,15,10,5,9,4,4,14,90,37,18,20,8,31,17);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,41,3,12,7,5,1,3,1,1,4,30,13,7,7,4,8,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,27,2,5,1,4,2,3,1,2,7,30,11,7,4,0,8,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,27,5,1,7,2,2,2,2,1,3,30,13,4,8,4,15,5);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,85,15,20,24,6,3,5,2,2,7,90,26,14,28,11,37,15);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,39,8,15,8,3,0,4,1,1,3,30,11,6,14,5,16,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,21,5,3,6,1,1,2,0,1,2,30,6,1,5,3,12,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,25,3,2,10,2,2,0,1,1,2,30,8,7,9,4,10,2);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,56,16,16,22,7,6,8,3,4,10,90,36,12,30,10,19,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,24,8,5,9,1,0,4,0,1,5,30,11,2,11,3,9,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,18,2,4,8,1,4,3,2,2,3,30,14,7,8,4,7,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1500156000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,13,6,7,5,5,2,1,0,0,2,30,12,4,11,3,3,1);
# 5 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,81,7,19,16,9,9,7,4,3,18,90,44,23,31,10,23,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,37,2,4,10,2,2,4,2,1,3,30,18,8,11,3,6,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,21,3,7,6,2,5,1,1,1,7,30,10,7,10,2,11,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,24,3,8,1,4,2,2,2,2,8,30,17,8,11,4,6,1);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,73,17,23,6,7,12,5,4,4,17,90,39,17,32,8,29,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,45,9,12,3,1,5,2,1,2,0,30,17,10,7,3,17,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,17,7,5,1,3,3,1,2,2,8,30,14,7,10,0,11,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,11,0,5,3,3,4,2,1,0,9,30,7,1,14,5,2,2);
# --
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,76,7,15,2,10,7,6,2,2,17,90,45,16,15,7,32,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,21,3,9,2,2,1,1,1,0,1,30,17,7,1,1,11,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,27,2,3,0,5,4,1,0,2,10,30,13,3,6,3,8,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,28,2,2,1,3,2,4,1,0,6,30,16,6,8,3,13,4);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,49,15,8,23,8,3,7,3,5,22,90,33,12,18,7,19,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,16,9,0,10,4,1,2,1,2,8,30,12,6,4,4,2,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,29,5,5,6,2,1,5,1,1,6,30,14,6,6,3,6,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,4,2,2,8,2,1,0,1,1,7,30,7,0,8,1,11,1);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,75,18,16,11,9,6,10,3,3,13,90,33,16,25,9,16,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,20,7,7,3,3,5,3,1,1,6,30,10,1,15,6,4,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,29,9,6,1,2,0,3,2,2,1,30,15,7,7,2,6,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,26,3,3,7,3,1,4,0,1,6,30,9,8,2,1,6,3);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,59,17,11,19,4,6,12,3,4,14,90,32,7,25,14,17,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,30,7,2,7,2,4,2,1,1,4,30,12,4,12,8,7,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,21,9,7,8,2,1,5,0,2,5,30,11,1,6,3,6,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,7,1,2,5,1,1,5,2,1,6,30,10,2,8,3,4,1);
#--
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,35,15,13,16,10,12,5,4,4,17,90,22,7,23,9,27,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,13,1,1,9,1,5,0,2,1,5,30,11,5,12,3,9,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,8,5,4,3,5,2,0,2,1,8,30,9,1,4,3,10,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,14,9,7,4,4,5,5,1,2,5,30,2,1,6,3,9,3);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,76,16,14,19,9,8,9,1,1,19,90,27,21,28,12,29,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,33,6,11,4,1,3,5,1,0,3,30,11,9,17,8,12,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,25,3,3,5,5,3,2,0,1,6,30,9,7,7,2,11,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501365600000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,18,7,0,10,4,2,2,0,0,9,30,7,5,4,2,6,2);
#6 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,86,10,10,18,8,11,11,3,4,18,90,36,14,20,4,43,18);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,40,2,3,10,4,3,2,1,1,6,30,16,7,11,3,14,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,24,4,4,3,2,3,5,0,1,5,30,8,4,1,0,15,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Lee' and last_name like 'Nailon')
	,22,4,4,5,2,5,4,1,2,7,30,12,3,8,1,14,5);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,52,16,19,15,6,5,6,3,3,18,90,9,5,26,13,22,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,15,8,13,8,1,0,2,1,1,1,30,7,4,10,5,4,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,16,3,4,4,4,4,0,1,0,9,30,1,1,10,4,6,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ivan' and last_name like 'Johnson')
	,21,5,2,2,1,0,3,2,1,8,30,1,1,6,3,13,6);
#--2
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,58,9,24,14,9,11,15,2,5,8,90,34,15,24,7,17,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,19,5,14,2,5,5,5,1,2,5,30,17,8,12,3,6,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,12,1,7,10,1,4,6,0,1,2,30,3,2,5,1,3,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Dion' and last_name like 'Glover')
	,27,3,4,2,3,2,4,1,1,1,30,15,5,7,3,8,5);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,64,12,22,16,4,9,6,4,3,15,90,20,15,22,5,32,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,28,3,10,3,2,2,0,2,1,6,30,6,4,5,1,15,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,18,5,4,4,0,5,5,2,1,8,30,6,6,7,2,8,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Moochie' and last_name like 'Norris')
	,18,4,8,9,2,2,2,1,0,1,30,8,5,10,3,9,1);
#--3
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,68,7,19,21,4,5,10,2,3,20,90,37,19,38,11,20,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,26,5,14,6,2,1,2,0,0,5,30,15,9,15,6,6,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,13,1,2,7,1,4,3,2,2,6,30,11,5,11,2,7,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Dominic' and last_name like 'McGuire')
	,29,1,4,8,1,1,5,0,1,9,30,11,5,11,4,7,5);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,74,13,7,11,5,8,10,3,5,13,90,30,12,26,8,37,14);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,28,7,1,4,4,3,4,2,2,10,30,4,0,12,5,17,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,13,3,5,2,0,2,0,1,1,2,30,11,5,10,1,9,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Eddie' and last_name like 'Badsen')
	,33,4,1,5,1,2,6,0,2,2,30,16,7,3,2,11,6);
#--4
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,39,17,18,21,11,4,6,4,3,21,90,18,8,13,4,15,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,12,4,10,9,3,2,1,1,1,10,30,6,2,9,2,4,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,13,9,7,6,3,2,1,1,1,7,30,1,0,3,2,10,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Reggie' and last_name like 'Evans')
	,14,3,2,6,5,1,4,1,2,4,30,11,6,2,0,1,1);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,55,10,22,17,8,11,8,2,3,7,90,29,7,16,5,32,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,28,4,15,7,2,4,0,0,1,2,30,11,3,0,0,15,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,17,3,2,9,4,3,2,1,0,5,30,12,3,5,2,7,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1501970400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Sweetney')
	,10,3,5,1,2,4,6,0,2,0,30,7,2,10,2,10,2);
# 7 Week
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,71,14,23,17,8,5,14,4,2,11,90,33,16,30,12,32,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,45,4,13,9,2,0,5,1,0,6,30,17,9,9,8,16,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,14,3,7,2,4,0,4,1,1,2,30,8,3,10,2,10,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,12,8,3,6,3,4,5,2,1,3,30,8,5,11,2,5,0);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,57,21,22,20,8,12,8,4,3,7,90,31,19,18,11,25,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,21,9,11,9,3,5,1,1,1,2,30,13,6,7,6,10,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,20,7,6,10,2,5,4,2,1,2,30,11,7,8,2,7,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,16,5,6,0,3,2,2,1,1,4,30,7,6,4,2,8,0);
#--2
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,41,10,16,24,2,7,8,1,4,15,90,24,9,17,5,22,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,15,7,14,5,1,3,0,0,1,6,30,10,2,2,1,13,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,16,3,1,9,0,0,4,1,1,1,30,7,6,9,1,3,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,10,0,1,10,0,4,4,0,2,8,30,7,0,6,3,7,2);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,69,20,17,21,10,11,4,3,4,18,90,30,17,22,11,20,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,18,9,7,7,3,4,0,1,2,8,30,15,5,8,3,6,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,26,10,2,8,3,3,4,0,1,1,30,8,7,8,4,4,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,26,1,8,6,4,5,0,2,2,8,30,8,5,6,4,9,4);
#--3
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,80,20,20,12,8,12,6,3,4,20,90,37,19,25,10,24,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,30,6,9,4,3,3,0,1,1,9,30,16,9,4,0,6,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,31,8,6,2,1,4,4,1,1,4,30,17,7,11,5,9,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,19,5,5,6,4,5,2,1,2,8,30,4,2,9,5,9,4);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,57,10,14,17,9,10,7,4,4,13,90,18,9,27,16,31,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,26,1,4,5,3,3,2,1,1,1,30,4,4,12,7,13,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,12,7,3,2,3,4,5,2,1,5,30,4,1,8,4,10,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,19,2,7,10,4,3,0,2,1,7,30,10,4,7,5,8,2);
#--4
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,64,11,18,15,4,8,11,4,3,6,90,27,8,9,4,30,15);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,29,1,5,8,0,2,3,1,0,1,30,13,4,4,1,7,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,17,2,5,5,3,3,2,2,2,2,30,3,2,2,2,12,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,18,8,7,2,1,3,5,2,1,4,30,11,1,3,2,11,4);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,78,24,26,18,6,9,9,3,2,11,90,27,11,20,12,27,15);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,31,9,13,7,2,1,3,1,0,1,30,5,3,11,6,12,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,13,8,8,3,4,4,5,2,1,6,30,6,0,2,2,9,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1502575200000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,34,7,5,8,1,4,1,0,1,4,30,16,7,6,4,6,5);
# Playoffs
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,66,15,6,21,7,12,9,2,4,10,90,31,15,27,5,25,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,34,9,2,3,0,5,4,1,1,1,30,8,6,10,1,10,7);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,12,2,1,8,2,3,0,0,1,7,30,10,3,12,3,8,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,21,4,2,10,4,3,5,0,2,2,30,13,6,5,1,7,3);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs'))
	,49,18,21,21,8,9,14,4,1,16,90,20,12,28,7,27,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Brian' and last_name like 'Scalabrine')
	,8,8,10,8,1,3,5,2,0,5,30,2,1,12,5,11,1);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Josh' and last_name like 'Childress')
	,25,4,7,5,5,5,5,1,0,4,30,5,5,6,2,9,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ball Hogs')))
	,(SELECT id from players where first_name like 'Rasual' and last_name like 'Butler')
	,16,6,4,8,3,2,4,1,1,7,30,13,7,9,0,7,1);
#--2
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,71,16,20,13,5,5,8,3,5,11,90,29,15,33,15,25,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,26,8,11,2,2,1,2,1,2,2,30,7,5,12,8,13,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,28,7,8,2,1,1,1,1,1,5,30,6,3,11,4,8,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,18,1,1,9,3,3,5,0,2,5,30,17,7,10,3,4,0);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers'))
	,48,5,10,21,7,10,12,3,2,9,90,22,6,22,9,24,9);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mike' and last_name like 'Bibby')
	,29,2,5,5,1,4,5,1,1,6,30,10,3,4,4,10,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Ricky' and last_name like 'Davis')
	,10,2,4,9,3,4,4,1,0,2,30,5,2,11,2,5,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Ghost Ballers')))
	,(SELECT id from players where first_name like 'Mo' and last_name like 'Evans')
	,9,0,2,8,3,2,2,0,1,1,30,6,1,7,3,9,1);
#--3
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy'))
	,37,16,17,17,11,4,9,3,2,14,90,25,6,20,8,26,6);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Kenyon' and last_name like 'Martin')
	,8,8,3,2,3,3,2,0,1,3,30,9,2,7,4,8,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'Al' and last_name like 'Harrington')
	,20,1,8,10,3,1,5,2,1,4,30,11,4,8,1,10,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Trilogy')))
	,(SELECT id from players where first_name like 'James' and last_name like 'White')
	,9,7,6,5,5,1,2,1,0,8,30,5,0,5,2,8,2);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s'))
	,64,12,15,12,11,7,10,2,3,19,90,12,9,31,12,23,12);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Chauncey' and last_name like 'Billups')
	,26,10,10,2,2,5,1,1,1,7,30,6,6,10,3,5,4);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Stephen' and last_name like 'Jackson')
	,11,2,3,5,4,2,5,0,2,8,30,3,0,8,5,12,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Killer 3s')))
	,(SELECT id from players where first_name like 'Larry' and last_name like 'Hughes')
	,28,1,2,6,4,0,4,0,1,3,30,4,3,12,4,7,6);
#--4
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power'))
	,58,19,13,10,5,12,10,3,3,15,90,36,14,24,5,16,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Corey' and last_name like 'Maggette')
	,21,8,5,7,0,5,4,0,1,6,30,14,5,10,1,5,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'Cuttino' and last_name like 'Mobley')
	,23,8,5,1,1,3,5,2,1,2,30,10,6,10,2,7,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Power')))
	,(SELECT id from players where first_name like 'DeShawn' and last_name like 'Stevenson')
	,15,2,3,2,4,4,1,1,1,7,30,12,2,4,1,4,3);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State'))
	,64,16,17,17,5,7,6,3,1,6,90,35,18,21,5,24,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Jermaine' and last_name like 'O´Neal')
	,6,9,13,6,0,2,3,1,0,3,30,12,2,6,2,3,0);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Bonzi' and last_name like 'Wells')
	,35,1,3,9,1,0,1,1,1,2,30,14,8,10,3,11,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503180000000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like 'Tri State')))
	,(SELECT id from players where first_name like 'Xavier' and last_name like 'Silas')
	,23,6,1,2,4,4,3,1,0,2,30,9,8,5,0,10,2);
# Finals
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company'))
	,74,21,6,14,10,10,7,2,4,22,90,35,15,25,11,32,11);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Allen' and last_name like 'Iverson')
	,28,5,3,4,2,4,0,0,1,10,30,10,7,15,5,10,3);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'DerMarr' and last_name like 'Johnson')
	,21,9,0,3,3,4,1,1,2,10,30,12,2,6,2,11,5);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_home in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3´s Company')))
	,(SELECT id from players where first_name like 'Andre' and last_name like 'Owens')
	,26,8,3,7,4,1,6,1,1,3,30,13,5,4,4,11,4);
INSERT INTO team_stats (id_game,id_inscription,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters'))
	,56,18,16,8,10,3,7,3,5,19,90,17,9,21,9,14,10);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Rashard' and last_name like 'Lewis')
	,35,8,10,1,4,0,1,2,2,5,30,4,2,8,7,10,8);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Jason' and last_name like 'Williams')
	,17,1,3,6,2,1,5,1,1,7,30,9,6,6,0,3,2);
INSERT INTO player_stats (id_game,id_player,points,off_rebounds,def_rebounds,assists,blocks,steals,fouls,tech_fouls,flag_fouls,turnovers,minutes,fg_attemped,fg_made,ft_attemped,ft_made,t3_attemped,t3_made) VALUES (
	(SELECT id from games WHERE date=1503698400000 and id_visitor in (SELECT id from inscriptions where id_team in (SELECT id from teams where name like '3 Headed Monsters')))
	,(SELECT id from players where first_name like 'Mahmoud' and last_name like 'Abdul-Rauf')
	,5,9,3,1,5,1,1,0,2,7,30,4,1,7,2,1,0);