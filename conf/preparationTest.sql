# Preparación de Tests
use threeplusone;
# Seasons
INSERT INTO seasons (year, creation_date) VALUES ('2017', 0);
# Arenas
# EEUU
# NBA
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('American Airlines Center','Dallas, Texas',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Barclays Center','Brooklyn, New York',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Wells Fargo Center','Philadelphia,Philadelphia',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Staples Center','Los Ángeles, California',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Key Arena','Seattle, Washington',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Amway Arena','Orlando, Florida',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('American Airlines Arena','Miami, Florida',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('TD Garden','Boston, Massachusetts',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Madison Suare Garden','New York, New York',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Air Canada Center','Toronto, Canada',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Phillips Arena','Atlanta, Georgia',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Time Warner Cable Arena','Charlotte, North Carolina',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Verizon Center','Washington, D.C.',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('United Center','Chicago, Illinois',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Quicken Loans Arena','Cleveland, Ohio',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('The Palace of Auburn Hills','Auburn Hills, Michigan',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Bankers Life Fieldhouse','Indianápolis, Indiana',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('BMO Harris Bradley Center','Milwaukee, Wisconsin',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Toyota Center','Houston, Texas',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('FedEx Forum','Memphis, Tennessee',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Smoothie King Center','New Orleans, Louisiana',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('AT&T Center','San Antonio, Texas',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Pepsi Center','Denver, Colorado',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Target Center','Minneapolis, Minnesota',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Moda Center','Portland, Oregon',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Vivint Smart Home Arena','Salt Lake City, utah',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Oracle Center','Oakland, California',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Talking Stick Resort Arena','Phoenix, Arizona',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Sleep Train Arena','Sacramento, California',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Chesapeake Energy Arena','Oklahoma City, Oklahoma',(SELECT id FROM countries where name like ('Estados Unidos')),0);

# BIG 3
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Spectrum Center','Charlotte, North Carolina',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Bok Center','Tulsa, Oklahoma',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Rupp Arena','Lexington, Kentucky',(SELECT id FROM countries where name like ('Estados Unidos')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('T-Mobile Arena','Las Vegas, Nevada',(SELECT id FROM countries where name like ('Estados Unidos')),0);
# Europa
# ACB
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Palacio Vistalegre','Madrid, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Bizkaia Arena','Bilbao, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('San Sebastián Arena 2016','San Sebastián, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Madrid Arena','Madrid, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Jose Mª Martín Carpena','Málaga, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Fernando Buesa Arena','Vitoria, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Pavelló Font de Sant Lluís','Valencia, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Palau Municipal d´Esports','Badalona, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Palacio Municipal de Deportes San Pablo','Sevilla, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Palau Blaugrana','Barcelona, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Palacio Municipal de Deportes de Murcia','Murcia, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Palacio Municipal de Deportes de Granada','Granada, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Pabellón Multiusos Fontes do Sar','Santiago de Compostela, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Pabellón Polideportivo Pisuerga','Valladolid, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Centre de Tecnificació i Arts Gimnàstiques','Alicante, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Polideportivo Fernando Martín','Fuenlabrada, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Pavelló Nou Congost','Manresa, España',(SELECT id FROM countries where name like ('España')),0);
INSERT INTO arenas(name,direction,id_country,creation_date) VALUES ('Centro Insular de Deportes','Las Palmas de Gran Canaria, España',(SELECT id FROM countries where name like ('España')),0);
