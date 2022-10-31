CREATE SCHEMA flight_system;
USE flight_system;

-- DROP TABLE customers;
CREATE TABLE customers (	
	id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255), 
	customer_status VARCHAR(15),
	total_customer_mileage INT,  
    PRIMARY KEY (id)    
);

-- DROP TABLE travel;
CREATE TABLE travel (
	id INT NOT NULL AUTO_INCREMENT,
    customer_id INT,
    flight_number VARCHAR(15),
	PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (flight_number) REFERENCES flights(flight_number)
);

-- DROP TABLE aircrafts;
CREATE TABLE aircrafts (
	aircraft_type VARCHAR(30),
	aircraft_seats SMALLINT,    
    PRIMARY KEY (aircraft_type)   
);

-- DROP TABLE flights;
CREATE TABLE flights (	
	aircraft_type VARCHAR(30),
	flight_number VARCHAR(15),
    flight_mileage SMALLINT,   
    PRIMARY KEY (flight_number),
    FOREIGN KEY (aircraft_type) REFERENCES aircrafts(aircraft_type)    
);

INSERT INTO aircrafts (aircraft_type, aircraft_seats) VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);

INSERT INTO customers (customer_name, customer_status, total_customer_mileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO flights (aircraft_type, flight_number, flight_mileage) VALUES
('Boeing 747', 'DL143', 135),
('Airbus A330', 'DL122', 4370),
('Boeing 777', 'DL53', 2078),
('Boeing 777', 'DL222', 1765),
('Boeing 747', 'DL37', 531);

INSERT INTO travel (customer_id, flight_number) VALUES
(1, 'DL143'),
(1, 'DL122'),
(2, 'DL122'),
(3, 'DL122'),
(3, 'DL53'),
(4, 'DL143'),
(3, 'DL222'),
(5, 'DL143'),
(6, 'DL222'),
(7, 'DL222'),
(5, 'DL122'),
(4, 'DL37'),
(8, 'DL222');

-- #3 In the Airline database write the SQL script to get the total number of flights in the database.
SELECT COUNT(1) AS 'Total flights' FROM flights;

-- #4 In the Airline database write the SQL script to get the average flight distance.
SELECT AVG(flight_mileage) AS 'Average Flight Distance' FROM flights;

-- #5 In the Airline database write the SQL script to get the average number of seats.
SELECT AVG(aircraft_seats) AS 'Average Nº of seats' FROM aircrafts;

-- #6 In the Airline database write the SQL script to get the average number of miles flown by customers grouped by status.
SELECT AVG(total_customer_mileage) AS 'Average Miles by Customer', customer_status FROM customers GROUP BY customer_status;

-- #7 In the Airline database write the SQL script to get the maximum number of miles flown by customers grouped by status.
SELECT MAX(total_customer_mileage) AS 'Average Miles by Customer', customer_status FROM customers GROUP BY customer_status;

-- #8 In the Airline database write the SQL script to get the total number of aircraft with a name containing Boeing.
SELECT COUNT(1) AS 'Boeing' FROM aircrafts WHERE aircraft_type LIKE 'B%';

-- #11 In the Airline database write the SQL script to find all flights with a distance between 300 and 2000 miles.
SELECT * FROM flights WHERE flight_mileage BETWEEN 200 AND 2000;

-- #12 In the Airline database write the SQL script to find the average flight distance booked grouped by customer status (this should require a join).
SELECT AVG(flights.flight_mileage) AS 'Average Booked Distance',customers.customer_status AS 'Customer Status'
FROM customers
INNER JOIN travel
ON customers.id = travel.customer_id 
INNER JOIN flights
ON travel.flight_number = flights.flight_number
GROUP BY customers.customer_status;

-- #13 In the Airline database write the SQL script to find the most often booked aircraft by gold status members (this should require a join).
SELECT flights.aircraft_type AS 'Favorite Aircraft', COUNT(flights.aircraft_type) AS 'Total Aircrafts Booked',customers.customer_status AS 'Member Status'
FROM customers
INNER JOIN travel
ON customers.id = travel.customer_id
INNER JOIN flights
ON travel.flight_number = flights.flight_number
WHERE customers.customer_status LIKE 'G%';
