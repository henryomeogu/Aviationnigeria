/* Time Analysis: 
1. Analysing Peak and Off-Peak Travel Times at Each Airport.
2. Identifying peak days for every single week at each airport. */

SELECT
    airports.airport_id,
    airports.name,
    HOUR(flights.departure_time) AS hour_of_day,
    COUNT(*) AS flight_count
FROM
    flights
JOIN
    routes ON flights.flight_route_id = routes.route_id
JOIN 
	airports ON routes.origin_airport_id = airports.airport_id
GROUP BY
    airports.airport_id, airports.name, hour_of_day
ORDER BY
    airports.airport_id, flight_count DESC;
    
-- Analysing Peak Days and Hours for Each Airport:

-- Identifying peak days for every single week at each airport.

WITH RankedFlights AS (
    SELECT
        routes.origin_airport_id,
        airports.name AS airport_name,
        flights.flight_date,
        DAYNAME(flights.flight_date) AS day_of_week,
        COUNT(*) AS flight_count,
        ROW_NUMBER() OVER (PARTITION BY routes.origin_airport_id, WEEK(flights.flight_date) ORDER BY COUNT(*) DESC) AS WeekRank
    FROM
        flights
    JOIN
        routes ON flights.flight_route_id = routes.route_id
    JOIN 
        airports ON routes.origin_airport_id = airports.airport_id
    GROUP BY
        routes.origin_airport_id, airports.name, flights.flight_date, day_of_week
)
SELECT
    origin_airport_id AS airport_id,
    airport_name,
    flight_date,
    day_of_week,
    flight_count,
    CONCAT('Week ', WEEK(flight_date)) AS week_label
FROM
    RankedFlights
WHERE
    WeekRank = 1
ORDER BY
    origin_airport_id, flight_date;