-- ============================================================
-- Exercise 3: SQL Queries on the Airline Database
-- ============================================================

-- 1. Total number of flights
SELECT COUNT(DISTINCT flight_number) AS total_flights
FROM flights;

-- 2. Average flight distance
SELECT AVG(mileage) AS avg_flight_distance
FROM flights;

-- 3. Average number of seats per aircraft
SELECT AVG(total_seats) AS avg_seats_per_aircraft
FROM aircrafts;

-- 4. Average miles flown by customers, grouped by status
SELECT status, AVG(total_mileage) AS avg_mileage
FROM customers
GROUP BY status;

-- 5. Max miles flown by customers, grouped by status
SELECT status, MAX(total_mileage) AS max_mileage
FROM customers
GROUP BY status;

-- 6. Number of aircrafts with "Boeing" in their name
SELECT COUNT(*) AS boeing_count
FROM aircrafts
WHERE name LIKE '%Boeing%';

-- 7. Flights with distance between 300 and 2000 miles
SELECT *
FROM flights
WHERE mileage BETWEEN 300 AND 2000;

-- 8. Average flight distance booked, grouped by customer status
SELECT c.status, AVG(f.mileage) AS avg_booked_distance
FROM bookings b
JOIN customers c ON b.customer_id = c.id
JOIN flights f ON b.flight_number = f.flight_number
GROUP BY c.status;

-- 9. Most booked aircraft among Gold status members
SELECT a.name, COUNT(*) AS total_bookings
FROM bookings b
JOIN customers c ON b.customer_id = c.id
JOIN flights f ON b.flight_number = f.flight_number
JOIN aircrafts a ON f.aircraft_id = a.id
WHERE c.status = 'Gold'
GROUP BY a.name
ORDER BY total_bookings DESC
LIMIT 1;
