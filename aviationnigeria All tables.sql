/* Airlines Table:

airline_id (Primary Key)
airline_name
country
fleet_size
operating_base */

CREATE TABLE airlines (airline_id INT AUTO_INCREMENT, operator VARCHAR(20) NOT NULL, country VARCHAR(20) DEFAULT 'nigeria' NOT NULL,
 fleet_size INT NOT NULL, operating_base VARCHAR(20) NOT NULL, PRIMARY KEY(airline_id));

DESC airlines;

INSERT INTO airlines (operator, fleet_size, operating_base) VALUES ('northwest_airline', 9, 'kano');

SELECT * FROM airlines;

INSERT INTO airlines (operator, fleet_size, operating_base) VALUES ('northcentral_airline', 5, 'jos'), ('northeast_airline', 7, 'gombe'),
 ('southwest_airline', 15, 'lagos'), ('southsouth_airline', 6, 'portharcourt'), ('southeast_airline', 8, 'enugu'); 
 /* these airlines operate what is known as CABOTAGE - the right for an airline from another country to carryout domestic flight operations
 within the borders of another. */
 
 SELECT * FROM airlines;
 
 INSERT INTO airlines (operator, country, fleet_size, operating_base) VALUES ('portnovo_airline', 'benin', 4, 'lagos'), 
 ('kumasi_airline', 'ghana', 7, 'lagos'), ('akwaba_airline', 'ghana', 5, 'jos');
 
UPDATE airlines SET fleet_size = 14
WHERE airline_id = 1 OR airline_id = 2 OR airline_id = 7;
 
UPDATE airlines SET fleet_size = 15
WHERE airline_id = 3 OR airline_id = 5 OR airline_id = 9;

UPDATE airlines SET fleet_size = 16
WHERE airline_id = 6; 

UPDATE airlines SET fleet_size = 17
WHERE airline_id = 4 OR airline_id = 8;
 
 /* Aircraft Table:

aircraft_id (Primary Key)
aircraft_type
manufacturer
fuel_capacity
cruising speed
seat_capacity
max_range */ 

CREATE TABLE aircraft(aircraft_id INT AUTO_INCREMENT, type VARCHAR(10) NOT NULL, manufacturer VARCHAR(40) NOT NULL, fuel_capacity INT NOT NULL,
cruising_speed INT NOT NULL, seat_capacity INT NOT NULL, max_range INT NOT NULL, PRIMARY KEY(aircraft_id)); 
-- fuel capacity in US gallons, cruising speed in KTS

 desc aircraft;
 
 INSERT INTO aircraft(type, manufacturer, fuel_capacity, cruising_speed, seat_capacity, max_range) VALUES ('B735', 'boeing', 5311, 430,
 140, 2375);
 
 INSERT INTO aircraft(type, manufacturer, fuel_capacity, cruising_speed, seat_capacity, max_range) VALUES 
 ('B734', 'boeing', 5311, 430, 188, 2060), 
 ('B737', 'boeing', 6875, 450, 126, 3010), 
 ('B733', 'boeing', 5311, 430, 149, 2595), 
 ('CRJ9', 'bombadier_aviation', 2351, 447, 90, 1550), 
 ('CRJX', 'bombadier_aviation', 2334, 447, 104, 1650);

SELECT * FROM aircraft;

 INSERT INTO aircraft(type, manufacturer, fuel_capacity, cruising_speed, seat_capacity, max_range) VALUES 
 ('E145', 'embraer', 1580, 461, 50, 2000), 
 ('E195', 'embraer', 3431, 447, 132, 2300), 
 ('Q300', 'de_havilland_canada', 835, 287, 50, 924), 
 ('Q400', 'de_havilland_canada', 1724, 360, 82, 1100), 
 ('A319', 'airbus', 4680, 447, 134, 3750),
 ('A320', 'airbus', 5280, 447, 164, 3300), 
 ('ATR42', 'avion_de_trp_regional', 1190, 289, 48, 726), 
 ('ATR72', 'avion_de_trp_regional', 1320, 280, 70, 825);
 
 DESC aircraft;
 
 ALTER table aircraft MODIFY COLUMN manufacturer VARCHAR(40);
 

/* Airports Table:

airport_id (Primary Key)
airport_name
city
country
latitude
longitude */ 

CREATE TABLE airports(airport_id INT AUTO_INCREMENT, name VARCHAR(20) NOT NULL, city VARCHAR(20) NOT NULL, 
country VARCHAR(20) NOT NULL DEFAULT 'nigeria', latitude DECIMAL(10, 8), longitude DECIMAL(10, 8), PRIMARY KEY(airport_id));

DESC airports;

SELECT * FROM airlines;

INSERT INTO airports(name, city, latitude, longitude) VALUES ('aminu_kano', 'kano', 12 + (2/60) + (55/3600), 8 + (31/60) + (20/3600));

SELECT * FROM airports;

DROP TABLE airports;

CREATE TABLE airports(airport_id INT AUTO_INCREMENT, name VARCHAR(20) NOT NULL, city VARCHAR(20) NOT NULL, 
country VARCHAR(20) NOT NULL DEFAULT 'nigeria', latitude DECIMAL(10, 8), lat_direction CHAR(1) NOT NULL DEFAULT 'N', 
longitude DECIMAL(10, 8), long_direction CHAR(1) NOT NULL DEFAULT 'E', PRIMARY KEY(airport_id));

INSERT INTO airports(name, city, latitude, longitude) VALUES ('aminu_kano', 'kano', CAST(12 + (2/60) + (55/3600) AS DECIMAL(10,8)),
 CAST(8 + (31/60) + (20/3600) AS DECIMAL(10,8)));

INSERT INTO airports(name, city, latitude, longitude) VALUES 
('nnamdi_azikiwe', 'abuja', CAST(9 + (0/60) + (24/3600) AS DECIMAL(10, 8)), CAST(7 + (15/60) + (47/3600) AS DECIMAL (10,8))),
('murtala_mohammed', 'lagos', CAST(6 + (34/60) + (38/3600) AS DECIMAL(10, 8)), CAST(3 + (19/60) + (16/3600)AS DECIMAL (10,8))),
('portharcout_intl', 'portharcourt', CAST(5 + (0/60) + (55/3600) AS DECIMAL(10, 8)), CAST(6 + (57/60) + (0/3600)AS DECIMAL (10,8))),
('akanu_ibiam', 'enugu', CAST(6 + (28/60) + (26/3600) AS DECIMAL(10, 8)), CAST(7 + (33/60) + (40/3600)AS DECIMAL (10,8))), 
('maiduguri_intl', 'maiduguri', CAST(11 + (51/60) + (20/3600) AS DECIMAL(10, 8)), CAST(13 + (4/60) + (55/3600) AS DECIMAL(10,8)));

/* Routes Table:
route_id (Primary Key)
origin_airport_id (Foreign Key)
destination_airport_id (Foreign Key)
distance
travel_time */

CREATE TABLE routes 
	(route_id INT AUTO_INCREMENT NOT NULL,
    route_name CHAR(10) NOT NULL,
	origin_airport_id INT NOT NULL, 
	destination_airport_id INT NOT NULL,
    distance_in_NM INT NOT NULL,
	FOREIGN KEY(origin_airport_id) REFERENCES airports(airport_id), 
	FOREIGN KEY(destination_airport_id) REFERENCES airports(airport_id),
    PRIMARY KEY(route_id));
    
    DESC routes;
    
    ALTER TABLE routes MODIFY COLUMN route_name CHAR(20);
    
    INSERT INTO routes(route_name, origin_airport_id, destination_airport_id, distance_in_NM) 
    VALUES ('KAN-UV456-ABC', 1, 2, 185), ('KAN-UR778-LAG', 1, 3, 449), ('KAN-NANUV-POT', 1, 4, 430), 
    ('KAN-NANUV-ENG', 1, 5, 338), ('KAN-UG660-MIU', 1, 6, 268);
    
    SELECT * FROM routes;
    
    INSERT INTO routes(route_name, origin_airport_id, destination_airport_id, distance_in_NM) 
    VALUES ('ABC-UV456-KAN', 2, 1, 185), ('ABC-UH340-LAG', 2, 3, 278), ('ABC-UV456-POT', 2, 4, 239), 
    ('ABC-UV456-ENG', 2, 5, 152), ('ABC-UG626-MIU', 2, 6, 384), ('LAG-UR778-KAN', 3, 1, 449), ('LAG-UR778-ABC', 3, 2, 278),
    ('LAG-UR984-POT', 3, 4, 236), ('LAG-UJ333-ENG', 3, 5, 253), ('LAG-UT457-MIU', 3, 6, 659);
    
	INSERT INTO routes(route_name, origin_airport_id, destination_airport_id, distance_in_NM) 
    VALUES ('POT-UJ707-KAN', 4, 1, 430), ('POT-UJ707-ABC', 4, 2, 239), ('POT-UL433-LAG', 4, 3, 236), 
    ('POT-UH206-ENG', 4, 5, 94), ('POT-UJ707-MIU', 4, 6, 547), ('ENG-UJ707-KAN', 5, 1, 338), ('ENG-UJ707-ABC', 5, 2, 152),
    ('ENG-UL433-LAG', 5, 3, 253), ('ENG-UV456-POT', 5, 4, 94), ('ENG-UJ707-MIU', 5, 6, 536), ('MIU-UG660-KAN', 6, 1, 268), 
    ('MIU-UG626-ABC', 6, 2, 384), ('MIU-UG626-LAG', 6, 3, 659), ('MIU-UV472-POT', 6, 4, 547), ('MIU-UV472-ENG', 6, 5, 536);
    
    
/* Flights Table:

flight_id (Primary Key)
airline_id (Foreign Key)
route_id (Foreign Key)
aircraft_id (Foreign Key)
flight date
departure_time
arrival_time
passenger_count */  

CREATE TABLE flights
(flight_id INT AUTO_INCREMENT NOT NULL,
flight_airline_id INT NOT NULL,
flight_route_id INT NOT NULL,
flight_aircraft_id INT NOT NULL,
flight_date DATE NOT NULL,
departure_time TIME NOT NULL,
arrival_time TIME NOT NULL,
passenger_count INT NOT NULL,
PRIMARY KEY(flight_id), 
FOREIGN KEY(flight_airline_id) REFERENCES airlines(airline_id), 
FOREIGN KEY(flight_route_id) REFERENCES routes(route_id), 
FOREIGN KEY(flight_aircraft_id) REFERENCES aircraft(aircraft_id)
);

DESC flights;


INSERT INTO Flights (flight_id, flight_airline_id, flight_route_id, flight_aircraft_id, flight_date, departure_time, 
arrival_time, passenger_count)
SELECT
    NULL flight_id,
    ROUND(GREATEST(1,RAND() * 9)) flight_airline_id,
    ROUND(GREATEST(1,RAND() * 30)) flight_route_id,
    ROUND(GREATEST(1,RAND() * 14)) flight_aircraft_id, 
    DATE_ADD('2023-01-01', INTERVAL ROUND(RAND() * 89) DAY) flight_date,
    SEC_TO_TIME(RAND() * 86400) departure_time, 
    SEC_TO_TIME(RAND() * 86400 + 3600) arrival_time, 
    ROUND(RAND() * 150) passenger_count 
FROM
    information_schema.tables t1,
    information_schema.tables t2
LIMIT 5000;

DESC flights;

SELECT *
FROM flights;












