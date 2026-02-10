USE SQL_Performance;


CREATE TABLE waterfall(
	name varchar(100),
	height_ft int,
	river varchar(100)

)DEFAULT CHARSET="utf8";

CREATE TABLE owner(
	owner_name varchar(255),
	type enum('State', 'Private', 'Federal'),
	id_waterfall int

)DEFAULT CHARSET="utf8";


CREATE TABLE county(
	county_name varchar(175),
	region varchar(200),
	id_waterfall int

)DEFAULT CHARSET="utf8";

CREATE TABLE tour(
	tour_type enum('Boat_Tour', 'Photography_Workshop', 'Hiking_Trail', 'Ice_Climbing', 'Forest_Walk', 'Viewpoint_Trek'),
	duraiton_hrs int,
	difficulty enum('Easy', 'Medium', 'Hard'),
	id_waterfall int
)DEFAULT CHARSET='utf8';

ALTER TABLE waterfall ADD id_waterfall INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE owner ADD id_owner INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE county ADD id_county INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE tour ADD id_tour INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;



LOAD DATA LOCAL INFILE '/home/dns/projects/SQL_Learning-/SQL_Performance/waterfall.csv'
INTO TABLE waterfall
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_waterfall, name, height_ft, river);


LOAD DATA LOCAL INFILE '/home/dns/projects/SQL_Learning-/SQL_Performance/owner.csv'
INTO TABLE owner
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_owner, owner_name, type, id_waterfall);


LOAD DATA LOCAL INFILE '/home/dns/projects/SQL_Learning-/SQL_Performance/county.csv'
INTO TABLE county
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_county, county_name, region, id_waterfall);


LOAD DATA LOCAL INFILE '/home/dns/projects/SQL_Learning-/SQL_Performance/tour.csv'
INTO TABLE tour
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_tour, tour_type, duration_hrs, difficulty, id_waterfall);

