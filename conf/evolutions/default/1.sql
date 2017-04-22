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
    ,CONSTRAINT season_pk PRIMARY KEY (id)
);
create table teams(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,abbreviation VARCHAR(3) NOT NULL
    ,id_country BIGINT
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT team_pk PRIMARY KEY (id)
    ,CONSTRAINT team_country_fk FOREIGN KEY (id_country) REFERENCES countries(id)
);

create table players(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,first_name VARCHAR(50)
    ,last_name VARCHAR(50) NOT NULL
    ,nick_name VARCHAR(50)
    ,number INT
    ,height FLOAT
    ,weight FLOAT
    ,description VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT player_pk PRIMARY KEY (id)
);
create table arenas(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(50) NOT NULL
    ,direction VARCHAR(150)
    ,id_country BIGINT
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
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
    ,CONSTRAINT competition_pk PRIMARY KEY (id)
    ,CONSTRAINT competition_season_fk FOREIGN KEY (id_season) REFERENCES seasons(id)
    ,CONSTRAINT competition_country_fk FOREIGN KEY (id_country) REFERENCES countries(id)
);
create table groups(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_competition BIGINT NOT NULL
    ,name VARCHAR(50) NOT NULL
    ,notes VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT group_pk PRIMARY KEY (id)
    ,CONSTRAINT group_competition_fk FOREIGN KEY (id_competition) REFERENCES competitions(id)
);
create table subgroups(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_group BIGINT NOT NULL
    ,name VARCHAR(50) NOT NULL
    ,notes VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT subgroup_pk PRIMARY KEY (id)
    ,CONSTRAINT subgroup_group_fk FOREIGN KEY (id_group) REFERENCES groups(id)
);
create table inscriptions(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_team BIGINT NOT NULL
    ,id_subgroup BIGINT NOT NULL
    ,id_arena BIGINT
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
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
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT contract_pk PRIMARY KEY (id)
    ,CONSTRAINT contract_player_fk FOREIGN KEY (id_player) REFERENCES players(id)
    ,CONSTRAINT contract_team_fk FOREIGN KEY (id_team) REFERENCES teams(id)
);
create table games(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_home BIGINT NOT NULL
    ,id_visitor BIGINT NOT NULL
    ,date BIGINT
    ,id_arena BIGINT
    ,winner VARCHAR(1)
    ,mvp BIGINT
    ,description VARCHAR(250)
    ,creation_date BIGINT NOT NULL
    ,modified_date BIGINT
    ,CONSTRAINT game_pk PRIMARY KEY (id)
    ,CONSTRAINT game_home_fk FOREIGN KEY (id_home) REFERENCES inscriptions(id)
    ,CONSTRAINT game_visitor_fk FOREIGN KEY (id_visitor) REFERENCES inscriptions(id)
    ,CONSTRAINT game_arena_fk FOREIGN KEY (id_arena) REFERENCES arenas(id)
    ,CONSTRAINT game_mpv_fk FOREIGN KEY (mvp) REFERENCES players(id)
);
create table team_stats(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_game BIGINT NOT NULL
    ,id_inscription BIGINT NOT NULL
    ,points INT
    ,off_rebounds INT
    ,def_rebounds INT
    ,assists INT
    ,blocks INT
    ,steals INT
    ,fouls INT
    ,tech_fouls INT
    ,flag_fouls INT
    ,turnovers INT
    ,minutes INT
    ,fg_attemped INT
    ,fg_made INT
    ,ft_attemped INT
    ,ft_made INT
    ,t3_attemped INT
    ,t3_made INT
    ,CONSTRAINT tstats_pk PRIMARY KEY (id)
    ,CONSTRAINT tstats_game_fk FOREIGN KEY (id_game) REFERENCES games(id)
    ,CONSTRAINT tstats_inscription_fk FOREIGN KEY (id_inscription) REFERENCES inscriptions(id)
);
create table player_stats(
    id BIGINT NOT NULL AUTO_INCREMENT
    ,id_game BIGINT NOT NULL
    ,id_player BIGINT NOT NULL
    ,points INT
    ,off_rebounds INT
    ,def_rebounds INT
    ,assists INT
    ,blocks INT
    ,steals INT
    ,fouls INT
    ,tech_fouls INT
    ,flag_fouls INT
    ,turnovers INT
    ,minutes INT
    ,fg_attemped INT
    ,fg_made INT
    ,ft_attemped INT
    ,ft_made INT
    ,t3_attemped INT
    ,t3_made INT
    ,CONSTRAINT pstats_pk PRIMARY KEY (id)
    ,CONSTRAINT pstats_game_fk FOREIGN KEY (id_game) REFERENCES games(id)
    ,CONSTRAINT pstats_player_fk FOREIGN KEY (id_player) REFERENCES players(id)
);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

INSERT INTO countries (name,abbreviation) VALUES('', '');
INSERT INTO countries (name,abbreviation) VALUES('Afganistán', 'AFG');
INSERT INTO countries (name,abbreviation) VALUES('Åland', 'ALA');
INSERT INTO countries (name,abbreviation) VALUES('Albania', 'ALB');
INSERT INTO countries (name,abbreviation) VALUES('Alemania', 'DEU');
INSERT INTO countries (name,abbreviation) VALUES('Andorra', 'AND');
INSERT INTO countries (name,abbreviation) VALUES('Angola', 'AGO');
INSERT INTO countries (name,abbreviation) VALUES('Anguila', 'AIA');
INSERT INTO countries (name,abbreviation) VALUES('Antártida', 'ATA');
INSERT INTO countries (name,abbreviation) VALUES('Antigua y Barbuda', 'ATG');
INSERT INTO countries (name,abbreviation) VALUES('Antillas Neerlandesas', 'ANT');
INSERT INTO countries (name,abbreviation) VALUES('Arabia Saudita', 'SAU');
INSERT INTO countries (name,abbreviation) VALUES('Argelia', 'DZA');
INSERT INTO countries (name,abbreviation) VALUES('Argentina', 'ARG');
INSERT INTO countries (name,abbreviation) VALUES('Armenia', 'ARM');
INSERT INTO countries (name,abbreviation) VALUES('Aruba', 'ABW');
INSERT INTO countries (name,abbreviation) VALUES('Australia', 'AUS');
INSERT INTO countries (name,abbreviation) VALUES('Austria', 'AUT');
INSERT INTO countries (name,abbreviation) VALUES('Azerbaiyán', 'AZE');
INSERT INTO countries (name,abbreviation) VALUES('Bahamas', 'BHS');
INSERT INTO countries (name,abbreviation) VALUES('Bahréin', 'BHR');
INSERT INTO countries (name,abbreviation) VALUES('Bangladesh', 'BGD');
INSERT INTO countries (name,abbreviation) VALUES('Barbados', 'BRB');
INSERT INTO countries (name,abbreviation) VALUES('Bielorrusia', 'BLR');
INSERT INTO countries (name,abbreviation) VALUES('Bélgica', 'BEL');
INSERT INTO countries (name,abbreviation) VALUES('Belice', 'BLZ');
INSERT INTO countries (name,abbreviation) VALUES('Benín', 'BEN');
INSERT INTO countries (name,abbreviation) VALUES('Bermudas', 'BMU');
INSERT INTO countries (name,abbreviation) VALUES('Bután', 'BTN');
INSERT INTO countries (name,abbreviation) VALUES('Bolivia', 'BOL');
INSERT INTO countries (name,abbreviation) VALUES('Bosnia y Herzegovina', 'BIH');
INSERT INTO countries (name,abbreviation) VALUES('Botsuana', 'BWA');
INSERT INTO countries (name,abbreviation) VALUES('Isla Bouvet', 'BVT');
INSERT INTO countries (name,abbreviation) VALUES('Brasil', 'BRA');
INSERT INTO countries (name,abbreviation) VALUES('Brunéi', 'BRN');
INSERT INTO countries (name,abbreviation) VALUES('Bulgaria', 'BGR');
INSERT INTO countries (name,abbreviation) VALUES('Burkina Faso', 'BFA');
INSERT INTO countries (name,abbreviation) VALUES('Burundi', 'BDI');
INSERT INTO countries (name,abbreviation) VALUES('Cabo Verde', 'CPV');
INSERT INTO countries (name,abbreviation) VALUES('Islas Caimán', 'CYM');
INSERT INTO countries (name,abbreviation) VALUES('Camboya', 'KHM');
INSERT INTO countries (name,abbreviation) VALUES('Camerún', 'CMR');
INSERT INTO countries (name,abbreviation) VALUES('Canadá', 'CAN');
INSERT INTO countries (name,abbreviation) VALUES('República Centroafricana', 'CAF');
INSERT INTO countries (name,abbreviation) VALUES('Chad', 'TCD');
INSERT INTO countries (name,abbreviation) VALUES('República Checa', 'CZE');
INSERT INTO countries (name,abbreviation) VALUES('Chile', 'CHL');
INSERT INTO countries (name,abbreviation) VALUES('China', 'CHN');
INSERT INTO countries (name,abbreviation) VALUES('Chipre', 'CYP');
INSERT INTO countries (name,abbreviation) VALUES('Islas Cocos', 'CCK');
INSERT INTO countries (name,abbreviation) VALUES('Colombia', 'COL');
INSERT INTO countries (name,abbreviation) VALUES('Comoras', 'COM');
INSERT INTO countries (name,abbreviation) VALUES('República del Congo', 'COG');
INSERT INTO countries (name,abbreviation) VALUES('República Democrática del Congo', 'COD');
INSERT INTO countries (name,abbreviation) VALUES('Islas Cook', 'COK');
INSERT INTO countries (name,abbreviation) VALUES('Corea del Norte', 'PRK');
INSERT INTO countries (name,abbreviation) VALUES('Corea del Sur', 'KOR');
INSERT INTO countries (name,abbreviation) VALUES('Costa de Marfil', 'CIV');
INSERT INTO countries (name,abbreviation) VALUES('Costa Rica', 'CRI');
INSERT INTO countries (name,abbreviation) VALUES('Croacia', 'HRV');
INSERT INTO countries (name,abbreviation) VALUES('Cuba', 'CUB');
INSERT INTO countries (name,abbreviation) VALUES('Dinamarca', 'DNK');
INSERT INTO countries (name,abbreviation) VALUES('Dominica', 'DMA');
INSERT INTO countries (name,abbreviation) VALUES('República Dominicana', 'DOM');
INSERT INTO countries (name,abbreviation) VALUES('Ecuador', 'ECU');
INSERT INTO countries (name,abbreviation) VALUES('Egipto', 'EGY');
INSERT INTO countries (name,abbreviation) VALUES('El Salvador', 'SLV');
INSERT INTO countries (name,abbreviation) VALUES('Emiratos Árabes Unidos', 'ARE');
INSERT INTO countries (name,abbreviation) VALUES('Eritrea', 'ERI');
INSERT INTO countries (name,abbreviation) VALUES('Eslovaquia', 'SVK');
INSERT INTO countries (name,abbreviation) VALUES('Eslovenia', 'SVN');
INSERT INTO countries (name,abbreviation) VALUES('España', 'ESP');
INSERT INTO countries (name,abbreviation) VALUES('España(Ceuta y Melilla)', 'ESP');
INSERT INTO countries (name,abbreviation) VALUES('Estados Unidos', 'USA');
INSERT INTO countries (name,abbreviation) VALUES('Islas ultramarinas de Estados Unidos', 'UMI');
INSERT INTO countries (name,abbreviation) VALUES('Estonia', 'EST');
INSERT INTO countries (name,abbreviation) VALUES('Etiopía', 'ETH');
INSERT INTO countries (name,abbreviation) VALUES('Islas Feroe', 'FRO');
INSERT INTO countries (name,abbreviation) VALUES('Filipinas', 'PHL');
INSERT INTO countries (name,abbreviation) VALUES('Finlandia', 'FIN');
INSERT INTO countries (name,abbreviation) VALUES('Fiyi', 'FJI');
INSERT INTO countries (name,abbreviation) VALUES('Francia', 'FRA');
INSERT INTO countries (name,abbreviation) VALUES('Gabón', 'GAB');
INSERT INTO countries (name,abbreviation) VALUES('Gambia', 'GMB');
INSERT INTO countries (name,abbreviation) VALUES('Georgia', 'GEO');
INSERT INTO countries (name,abbreviation) VALUES('Islas Georgias del Sur y Sandwich del Sur', 'SGS');
INSERT INTO countries (name,abbreviation) VALUES('Ghana', 'GHA');
INSERT INTO countries (name,abbreviation) VALUES('Gibraltar', 'GIB');
INSERT INTO countries (name,abbreviation) VALUES('Granada', 'GRD');
INSERT INTO countries (name,abbreviation) VALUES('Grecia', 'GRC');
INSERT INTO countries (name,abbreviation) VALUES('Groenlandia', 'GRL');
INSERT INTO countries (name,abbreviation) VALUES('Guadalupe', 'GLP');
INSERT INTO countries (name,abbreviation) VALUES('Guam', 'GUM');
INSERT INTO countries (name,abbreviation) VALUES('Guatemala', 'GTM');
INSERT INTO countries (name,abbreviation) VALUES('Guayana Francesa', 'GUF');
INSERT INTO countries (name,abbreviation) VALUES('Guernsey', 'GGY');
INSERT INTO countries (name,abbreviation) VALUES('Guinea', 'GIN');
INSERT INTO countries (name,abbreviation) VALUES('Guinea Ecuatorial', 'GNQ');
INSERT INTO countries (name,abbreviation) VALUES('Guinea-Bissau', 'GNB');
INSERT INTO countries (name,abbreviation) VALUES('Guyana', 'GUY');
INSERT INTO countries (name,abbreviation) VALUES('Haití', 'HTI');
INSERT INTO countries (name,abbreviation) VALUES('Islas Heard y McDonald', 'HMD');
INSERT INTO countries (name,abbreviation) VALUES('Honduras', 'HND');
INSERT INTO countries (name,abbreviation) VALUES('Hong Kong', 'HKG');
INSERT INTO countries (name,abbreviation) VALUES('Hungría', 'HUN');
INSERT INTO countries (name,abbreviation) VALUES('India', 'IND');
INSERT INTO countries (name,abbreviation) VALUES('Indonesia', 'IDN');
INSERT INTO countries (name,abbreviation) VALUES('Irán', 'IRN');
INSERT INTO countries (name,abbreviation) VALUES('Iraq', 'IRQ');
INSERT INTO countries (name,abbreviation) VALUES('Irlanda', 'IRL');
INSERT INTO countries (name,abbreviation) VALUES('Islandia', 'ISL');
INSERT INTO countries (name,abbreviation) VALUES('Israel', 'ISR');
INSERT INTO countries (name,abbreviation) VALUES('Italia', 'ITA');
INSERT INTO countries (name,abbreviation) VALUES('Jamaica', 'JAM');
INSERT INTO countries (name,abbreviation) VALUES('Japón', 'JPN');
INSERT INTO countries (name,abbreviation) VALUES('Jersey', 'JEY');
INSERT INTO countries (name,abbreviation) VALUES('Jordania', 'JOR');
INSERT INTO countries (name,abbreviation) VALUES('Kazajistán', 'KAZ');
INSERT INTO countries (name,abbreviation) VALUES('Kenia', 'KEN');
INSERT INTO countries (name,abbreviation) VALUES('Kirguistán', 'KGZ');
INSERT INTO countries (name,abbreviation) VALUES('Kiribati', 'KIR');
INSERT INTO countries (name,abbreviation) VALUES('Kuwait', 'KWT');
INSERT INTO countries (name,abbreviation) VALUES('Laos', 'LAO');
INSERT INTO countries (name,abbreviation) VALUES('Lesoto', 'LSO');
INSERT INTO countries (name,abbreviation) VALUES('Letonia', 'LVA');
INSERT INTO countries (name,abbreviation) VALUES('Líbano', 'LBN');
INSERT INTO countries (name,abbreviation) VALUES('Liberia', 'LBR');
INSERT INTO countries (name,abbreviation) VALUES('Libia', 'LBY');
INSERT INTO countries (name,abbreviation) VALUES('Liechtenstein', 'LIE');
INSERT INTO countries (name,abbreviation) VALUES('Lituania', 'LTU');
INSERT INTO countries (name,abbreviation) VALUES('Luxemburgo', 'LUX');
INSERT INTO countries (name,abbreviation) VALUES('Macao', 'MAC');
INSERT INTO countries (name,abbreviation) VALUES('ARY Macedonia', 'MKD');
INSERT INTO countries (name,abbreviation) VALUES('Madagascar', 'MDG');
INSERT INTO countries (name,abbreviation) VALUES('Malasia', 'MYS');
INSERT INTO countries (name,abbreviation) VALUES('Malawi', 'MWI');
INSERT INTO countries (name,abbreviation) VALUES('Maldivas', 'MDV');
INSERT INTO countries (name,abbreviation) VALUES('Malí', 'MLI');
INSERT INTO countries (name,abbreviation) VALUES('Malta', 'MLT');
INSERT INTO countries (name,abbreviation) VALUES('Islas Malvinas', 'FLK');
INSERT INTO countries (name,abbreviation) VALUES('Isla de Man', 'IMN');
INSERT INTO countries (name,abbreviation) VALUES('Islas Marianas del Norte', 'MNP');
INSERT INTO countries (name,abbreviation) VALUES('Marruecos', 'MAR');
INSERT INTO countries (name,abbreviation) VALUES('Islas Marshall', 'MHL');
INSERT INTO countries (name,abbreviation) VALUES('Martinica', 'MTQ');
INSERT INTO countries (name,abbreviation) VALUES('Mauricio', 'MUS');
INSERT INTO countries (name,abbreviation) VALUES('Mauritania', 'MRT');
INSERT INTO countries (name,abbreviation) VALUES('Mayotte', 'MYT');
INSERT INTO countries (name,abbreviation) VALUES('México', 'MEX');
INSERT INTO countries (name,abbreviation) VALUES('Micronesia', 'FSM');
INSERT INTO countries (name,abbreviation) VALUES('Moldavia', 'MDA');
INSERT INTO countries (name,abbreviation) VALUES('Mónaco', 'MCO');
INSERT INTO countries (name,abbreviation) VALUES('Mongolia', 'MNG');
INSERT INTO countries (name,abbreviation) VALUES('Montenegro', 'MNE');
INSERT INTO countries (name,abbreviation) VALUES('Montserrat', 'MSR');
INSERT INTO countries (name,abbreviation) VALUES('Mozambique', 'MOZ');
INSERT INTO countries (name,abbreviation) VALUES('Myanmar', 'MMR');
INSERT INTO countries (name,abbreviation) VALUES('Namibia', 'NAM');
INSERT INTO countries (name,abbreviation) VALUES('Nauru', 'NRU');
INSERT INTO countries (name,abbreviation) VALUES('Isla de Navidad', 'CXR');
INSERT INTO countries (name,abbreviation) VALUES('Nepal', 'NPL');
INSERT INTO countries (name,abbreviation) VALUES('Nicaragua', 'NIC');
INSERT INTO countries (name,abbreviation) VALUES('Níger', 'NER');
INSERT INTO countries (name,abbreviation) VALUES('Nigeria', 'NGA');
INSERT INTO countries (name,abbreviation) VALUES('Niue', 'NIU');
INSERT INTO countries (name,abbreviation) VALUES('Norfolk', 'NFK');
INSERT INTO countries (name,abbreviation) VALUES('Noruega', 'NOR');
INSERT INTO countries (name,abbreviation) VALUES('Nueva Caledonia', 'NCL');
INSERT INTO countries (name,abbreviation) VALUES('Nueva Zelanda', 'NZL');
INSERT INTO countries (name,abbreviation) VALUES('Omán', 'OMN');
INSERT INTO countries (name,abbreviation) VALUES('Países Bajos', 'NLD');
INSERT INTO countries (name,abbreviation) VALUES('Pakistán', 'PAK');
INSERT INTO countries (name,abbreviation) VALUES('Palaos', 'PLW');
INSERT INTO countries (name,abbreviation) VALUES('Palestina(ANP)', 'PSE');
INSERT INTO countries (name,abbreviation) VALUES('Panamá', 'PAN');
INSERT INTO countries (name,abbreviation) VALUES('Papúa Nueva Guinea', 'PNG');
INSERT INTO countries (name,abbreviation) VALUES('Paraguay', 'PRY');
INSERT INTO countries (name,abbreviation) VALUES('Perú', 'PER');
INSERT INTO countries (name,abbreviation) VALUES('Islas Pitcairn', 'PCN');
INSERT INTO countries (name,abbreviation) VALUES('Polinesia Francesa', 'PYF');
INSERT INTO countries (name,abbreviation) VALUES('Polonia', 'POL');
INSERT INTO countries (name,abbreviation) VALUES('Portugal', 'PRT');
INSERT INTO countries (name,abbreviation) VALUES('Puerto Rico', 'PRI');
INSERT INTO countries (name,abbreviation) VALUES('Qatar', 'QAT');
INSERT INTO countries (name,abbreviation) VALUES('Reino Unido', 'GBR');
INSERT INTO countries (name,abbreviation) VALUES('Reunión', 'REU');
INSERT INTO countries (name,abbreviation) VALUES('Ruanda', 'RWA');
INSERT INTO countries (name,abbreviation) VALUES('Rumania', 'ROU');
INSERT INTO countries (name,abbreviation) VALUES('Rusia', 'RUS');
INSERT INTO countries (name,abbreviation) VALUES('Sahara Occidental', 'ESH');
INSERT INTO countries (name,abbreviation) VALUES('Islas Salomón', 'SLB');
INSERT INTO countries (name,abbreviation) VALUES('Samoa', 'WSM');
INSERT INTO countries (name,abbreviation) VALUES('Samoa Americana', 'ASM');
INSERT INTO countries (name,abbreviation) VALUES('San Cristóbal y Nieves', 'KNA');
INSERT INTO countries (name,abbreviation) VALUES('San Marino', 'SMR');
INSERT INTO countries (name,abbreviation) VALUES('San Pedro y Miquelón', 'SPM');
INSERT INTO countries (name,abbreviation) VALUES('San Vicente y las Granadinas', 'VCT');
INSERT INTO countries (name,abbreviation) VALUES('Santa Helena', 'SHN');
INSERT INTO countries (name,abbreviation) VALUES('Santa Lucía', 'LCA');
INSERT INTO countries (name,abbreviation) VALUES('Santo Tomé y Príncipe', 'STP');
INSERT INTO countries (name,abbreviation) VALUES('Senegal', 'SEN');
INSERT INTO countries (name,abbreviation) VALUES('Serbia', 'SRB');
INSERT INTO countries (name,abbreviation) VALUES('Seychelles', 'SYC');
INSERT INTO countries (name,abbreviation) VALUES('Sierra Leona', 'SLE');
INSERT INTO countries (name,abbreviation) VALUES('Singapur', 'SGP');
INSERT INTO countries (name,abbreviation) VALUES('Siria', 'SYR');
INSERT INTO countries (name,abbreviation) VALUES('Somalia', 'SOM');
INSERT INTO countries (name,abbreviation) VALUES('Sri Lanka', 'LKA');
INSERT INTO countries (name,abbreviation) VALUES('Suazilandia', 'SWZ');
INSERT INTO countries (name,abbreviation) VALUES('Sudáfrica', 'ZAF');
INSERT INTO countries (name,abbreviation) VALUES('Sudán', 'SDN');
INSERT INTO countries (name,abbreviation) VALUES('Suecia', 'SWE');
INSERT INTO countries (name,abbreviation) VALUES('Suiza', 'CHE');
INSERT INTO countries (name,abbreviation) VALUES('Surinam', 'SUR');
INSERT INTO countries (name,abbreviation) VALUES('Svalbard y Jan Mayen', 'SJM');
INSERT INTO countries (name,abbreviation) VALUES('Tailandia', 'THA');
INSERT INTO countries (name,abbreviation) VALUES('Taiwán', 'TWN');
INSERT INTO countries (name,abbreviation) VALUES('Tanzania', 'TZA');
INSERT INTO countries (name,abbreviation) VALUES('Tayikistán', 'TJK');
INSERT INTO countries (name,abbreviation) VALUES('Territorio Británico del Océano Índico', 'IOT');
INSERT INTO countries (name,abbreviation) VALUES('Territorios Australes Franceses', 'ATF');
INSERT INTO countries (name,abbreviation) VALUES('Timor Oriental', 'TLS');
INSERT INTO countries (name,abbreviation) VALUES('Togo', 'TGO');
INSERT INTO countries (name,abbreviation) VALUES('Tokelau', 'TKL');
INSERT INTO countries (name,abbreviation) VALUES('Tonga', 'TON');
INSERT INTO countries (name,abbreviation) VALUES('Trinidad y Tobago', 'TTO');
INSERT INTO countries (name,abbreviation) VALUES('Túnez', 'TUN');
INSERT INTO countries (name,abbreviation) VALUES('Islas Turcas y Caicos', 'TCA');
INSERT INTO countries (name,abbreviation) VALUES('Turkmenistán', 'TKM');
INSERT INTO countries (name,abbreviation) VALUES('Turquía', 'TUR');
INSERT INTO countries (name,abbreviation) VALUES('Tuvalu', 'TUV');
INSERT INTO countries (name,abbreviation) VALUES('Ucrania', 'UKR');
INSERT INTO countries (name,abbreviation) VALUES('Uganda', 'UGA');
INSERT INTO countries (name,abbreviation) VALUES('Uruguay', 'URY');
INSERT INTO countries (name,abbreviation) VALUES('Uzbekistán', 'UZB');
INSERT INTO countries (name,abbreviation) VALUES('Vanuatu', 'VUT');
INSERT INTO countries (name,abbreviation) VALUES('Ciudad del Vaticano', 'VAT');
INSERT INTO countries (name,abbreviation) VALUES('Venezuela', 'VEN');
INSERT INTO countries (name,abbreviation) VALUES('Vietnam', 'VNM');
INSERT INTO countries (name,abbreviation) VALUES('Islas Vírgenes Británicas', 'VGB');
INSERT INTO countries (name,abbreviation) VALUES('Islas Vírgenes Estadounidenses', 'VIR');
INSERT INTO countries (name,abbreviation) VALUES('Wallis y Futuna', 'WLF');
INSERT INTO countries (name,abbreviation) VALUES('Yemen', 'YEM');
INSERT INTO countries (name,abbreviation) VALUES('Yibuti', 'DJI');
INSERT INTO countries (name,abbreviation) VALUES('Zambia', 'ZMB');
INSERT INTO countries (name,abbreviation) VALUES('Zimbabue', 'ZWE');

# Test
# McGrady

# Season
INSERT INTO seasons (id,year, creation_date) VALUES (1,'2017', 0);

#Emptys
INSERT INTO teams (id, name, abbreviation, creation_date) VALUES (61,' N#A','N#A',0);
INSERT INTO arenas(id,name,creation_date) VALUES (9,' N#A',0);
INSERT INTO competitions (id,id_season,name,abbreviation,division,type,init_date,end_date,creation_date)
VALUES (4,1,'N#A','N#A','1',' N#A',1472680800000,1472680800000,0);

# Teams
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (1,'Atlanta Hawks','ATL',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (2,'Charlotte Hornets','CHA',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (3,'Miami Heat','MIA',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (4,'Orlando Magic','ORL',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (5,'Washington Wizards','WAS',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (6,'Boston Celtics', 'BOS',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (7,'Brooklyn Nets', 'BKN',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (8,'New York Knicks', 'NYK',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (9,'Philadelphia 76ers','PHI',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (10,'Toronto Raptors','TOR',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (11,'Chicago Bulls','CHI',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (12,'Cleveland Cavaliers','CLE',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (13,'Detroit Pistons','DET',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (14,'Indiana Pacers','IND',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (15,'Milwaukee Bucks','MIL',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (16,'Denver Nuggets','DEN',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (17,'Minnesota TimberWolves','MIN',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (18,'Oklahoma City Thunder','OKC',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (19,'Portland Trail Blazers','POR',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (20,'Utah Jazz','UTA',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (21,'Golden State Warriors','GSW',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (22,'Los Ángeles Clippers','LAC',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (23,'Los Ángeles Lakers','LAL',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (24,'Phoenix Suns','PHO',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (25,'Sacramento Kings','SAC',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (26,'Dallas Maverics','DAL',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (27,'Houston Rockets','HOU',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (28,'Memphis Grizzlies','MEM',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (29,'New Orleans Pelicans','NOP',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (30,'San Antonio Spurs','SAS',74,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (31,'Real Madrid Baloncesto','RMB',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (32,'Barcelona Lassa','FCB',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (33,'Valencia Basket','VAL',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (34,'Unicaja Málaga','UNI',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (35,'Saski Baskonia','BSK',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (36,'IberoStar Tenerife','IBT',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (37,'Herbalife Gran Canaria','HGC',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (38,'MoraBanc Andorra','MBA',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (39,'RETAbet Bilbao Basket','BBB',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (40,'Movistar Estudiantes','EST',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (41,'UCAM Murcia','UCM',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (42,'Montakit Fuenlabrada','FUE',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (43,'Rio Natura Monbus Obradoiro','OBR',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (44,'Divina Seguros Joventut','JOV',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (45,'Basket Zaragoza','BZG',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (46,'Real Betis Energía Plus','BET',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (47,'ICL Manresa','ICL',72,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (48,'Andalou Efes Istanbul','IST',230,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (49,'Brose Bamberg','BAM',5,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (50,'Crvena Zvezda mts Belgrade','RED',202,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (51,'CSKA Moscow','CSK',189,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (52,'Darussafaka Dogus Istanbul','DAR',230,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (53,'EA7 Emporio Armani Milan','MIL',1,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (54,'Fenerbahce Istanbul','ULK',230,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (55,'Galatasaray Odeabank Istanbul','GAL',230,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (56,'Maccabi FOX Tel Aviv','TEL',230,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (57,'Olympiacos Piraeus','OLY',90,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (58,'Panathinaikos Superfoods Athens','PAN',90,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (59,'Unics Kazan','UNK',189,0);
INSERT INTO teams (id, name, abbreviation, id_country, creation_date) VALUES (60,'Zalgiris Kaunas','ZAL',130,0);

# Players
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(1,'Elfrid','Payton','','4',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(2,'Aaron','Gordon','','00',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(3,'Evan','Fournier','Don´t Google my name','10',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(4,'Terrence','Ross','T-Ross','31',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(5,'Nikola','Vucevich','Vooch','4',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(6,'Sergi','Llull','Mandarinas','23',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(7,'Rodolfo','Fernández','Rudy','5',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(8,'Luka','Doncic','','7',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(9,'Anthony','Randolph','','3',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(10,'Gustavo','Ayon','Titán de Nayarit','14',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(11,'De´Angelo','Russel','Ice on my Veins','1',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(12,'Isaiah','Thomas','Mr 4º Quarter','4',0);
INSERT INTO players(id, first_name, last_name, nick_name, number,creation_date) VALUES(13,'Juan Carlos','Navarro','La Bomba','11',0);

# Arenas
INSERT INTO arenas(id,name,id_country,creation_date) VALUES (1,'TD Garden',74,0);
INSERT INTO arenas(id,name,id_country,creation_date) VALUES (2,'Staples Center',74,0);
INSERT INTO arenas(id,name,id_country,creation_date) VALUES (3,'Amway Arena',74,0);
INSERT INTO arenas(id,name,id_country,creation_date) VALUES (4,'Oracle Arena',74,0);
INSERT INTO arenas(id,name,id_country,creation_date) VALUES (5,'Madison Square Garden',74,0);
INSERT INTO arenas(id,name,id_country,creation_date) VALUES (6,'Palacio de los Deportes de la Comunidad de Madrid',72,0);
INSERT INTO arenas(id,name,id_country,creation_date) VALUES (7,'Palau Sant Jordi',72,0);
INSERT INTO arenas(id,name,id_country,creation_date) VALUES (8,'Martin Carpena',72,0);

# Competitions
INSERT INTO competitions (id,id_season,name,abbreviation,division,id_country,type,init_date,end_date,creation_date)
VALUES (1,1,'National Basketball Asociation','NBA','1',74,'Liga',1472680800000,1472680800000,0);
INSERT INTO competitions (id,id_season,name,abbreviation,division,id_country,type,init_date,end_date,creation_date)
VALUES (2,1,'Asociacion Clubs Baloncesto','ACB','1',72,'Liga',1472680800000,1472680800000,0);
INSERT INTO competitions (id,id_season,name,abbreviation,division,id_country,type,init_date,end_date,creation_date)
VALUES (3,1,'Turkish Airlines Euroleague','EUR','1',1,'Liga',1472680800000,1472680800000,0);

# Groups

INSERT INTO groups (id,id_competition,name,creation_date) VALUES (1,1,'West',0);
INSERT INTO groups (id,id_competition,name,creation_date) VALUES (2,1,'East',0);
INSERT INTO groups (id,id_competition,name,creation_date) VALUES (3,2,'ACB',0);
INSERT INTO groups (id,id_competition,name,creation_date) VALUES (4,3,'Euroliga',0);

# SubGroups

INSERT INTO subgroups (id,id_group,name,creation_date) VALUES (1,1,'NorthWest',0);
INSERT INTO subgroups (id,id_group,name,creation_date) VALUES (2,1,'SouthWest',0);
INSERT INTO subgroups (id,id_group,name,creation_date) VALUES (3,1,'Pacific',0);
INSERT INTO subgroups (id,id_group,name,creation_date) VALUES (4,3,'ACB',0);
INSERT INTO subgroups (id,id_group,name,creation_date) VALUES (5,4,'Euroliga',0);
INSERT INTO subgroups (id,id_group,name,creation_date) VALUES (6,2,'Atlantic',0);
INSERT INTO subgroups (id,id_group,name,creation_date) VALUES (7,2,'SouthEast',0);
INSERT INTO subgroups (id,id_group,name,creation_date) VALUES (8,2,'Central',0);

# Inscriptions

INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (1,1,7,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (2,2,7,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (3,3,7,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (4,4,7,3,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (5,5,7,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (6,6,7,1,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (7,7,6,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (8,8,6,5,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (9,9,6,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (10,10,6,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (11,11,6,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (12,12,6,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (13,13,8,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (14,14,8,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (15,15,8,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (16,16,8,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (17,17,8,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (18,18,8,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (19,19,1,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (20,20,1,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (21,21,1,4,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (22,22,1,2,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (23,23,1,2,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (24,24,1,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (25,25,3,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (26,26,3,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (27,27,3,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (28,28,3,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (29,29,3,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (30,30,3,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (31,31,4,6,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (32,32,4,7,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (33,33,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (34,34,4,8,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (35,35,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (36,36,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (37,37,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (38,38,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (39,39,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (40,40,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (41,41,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (42,42,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (43,43,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (44,44,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (45,45,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (46,46,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (47,47,4,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (48,48,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (49,49,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (50,50,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (51,51,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (52,52,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (53,53,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (54,54,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (55,55,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (56,56,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (57,57,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (58,58,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (59,59,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (60,60,5,9,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (62,31,5,6,0);
INSERT INTO inscriptions (id,id_team,id_subgroup,id_arena,creation_date) VALUES (63,32,5,7,0);

#Contracts


