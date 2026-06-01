-- ============================================================
-- Exercise 2: Normalize an Airline Database
-- ============================================================

-- STEP 1 & 2: Analysis and functional dependencies
--
-- Raw table has three independent entities mixed together:
--   - Customer (name, status, total_mileage) → depends only on customer
--   - Aircraft (name, total_seats) → depends only on aircraft
--   - Flight (flight_number, mileage, aircraft) → depends only on flight
--   - Booking → junction between customer and flight
--
-- Decomposition into 4 tables (3NF):

-- STEP 3: DDL with FOREIGN KEY constraints

-- Aircrafts table
CREATE TABLE aircrafts (
    id          INT PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(100) NOT NULL,
    total_seats INT NOT NULL
);

-- Customers table
CREATE TABLE customers (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(255) NOT NULL,
    status          VARCHAR(50),
    total_mileage   INT
);

-- Flights table (references aircraft)
CREATE TABLE flights (
    flight_number   VARCHAR(10) PRIMARY KEY,
    aircraft_id     INT NOT NULL,
    mileage         INT NOT NULL,
    FOREIGN KEY (aircraft_id) REFERENCES aircrafts(id)
);

-- Bookings table (junction: customer ↔ flight)
CREATE TABLE bookings (
    id              INT PRIMARY KEY AUTO_INCREMENT,
    customer_id     INT NOT NULL,
    flight_number   VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (flight_number) REFERENCES flights(flight_number)
);

-- STEP 4: Insert sample data

INSERT INTO aircrafts (name, total_seats) VALUES
('Boeing 747',  400),
('Airbus A330', 236),
('Boeing 777',  264);

INSERT INTO customers (name, status, total_mileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', NULL,     6008),
('Tom Jones',        'Gold',   205767),
('Sam Rio',          NULL,     2653),
('Jessica James',    'Silver', 127656),
('Ana Janco',        'Silver', 136773),
('Jennifer Cortez',  'Gold',   300582),
('Christian Janco',  'Silver', 14642);

INSERT INTO flights (flight_number, aircraft_id, mileage) VALUES
('DL143', 1, 135),
('DL122', 2, 4370),
('DL53',  3, 2078),
('DL222', 3, 1765),
('DL37',  1, 531);

INSERT INTO bookings (customer_id, flight_number) VALUES
(1, 'DL143'),
(1, 'DL122'),
(2, 'DL122'),
(3, 'DL122'),
(3, 'DL53'),
(3, 'DL222'),
(4, 'DL143'),
(4, 'DL37'),
(5, 'DL143'),
(5, 'DL122'),
(6, 'DL222'),
(7, 'DL222'),
(8, 'DL222');
