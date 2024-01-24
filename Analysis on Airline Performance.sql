
    
WITH RankedPassengerCounts AS (
    SELECT DISTINCT
        airlines.airline_id,
        airlines.operator,
        routes.route_name,
        SUM(flights.passenger_count) AS total_passenger_count,
        RANK() OVER (PARTITION BY routes.route_name ORDER BY SUM(flights.passenger_count) DESC) AS rnk
    FROM 
        airlines
    LEFT JOIN flights ON airlines.airline_id = flights.flight_airline_id
    LEFT JOIN routes ON routes.route_id = flights.flight_route_id
    GROUP BY
        airlines.airline_id,
        airlines.operator,
        routes.route_name
)
SELECT DISTINCT
    airline_id,
    operator,
    route_name,
    total_passenger_count
FROM
    RankedPassengerCounts
WHERE
    rnk = 1;
    
    -- b. highest aircraft operation on each route 
    
WITH RankedFlightOperations AS (
	SELECT 
		airlines.airline_id,
		airlines.operator,
		routes.route_name,
		COUNT(flights.flight_id) AS Total_flight_ops,
        RANK() OVER (PARTITION BY routes.route_name ORDER BY COUNT(flights.flight_id) DESC) AS rnk
	FROM
		airlines
	LEFT JOIN flights ON airlines.airline_id = flights.flight_airline_id
	LEFT JOIN routes ON routes.route_id = flights.flight_route_id
	GROUP BY
		airlines.airline_id,
		airlines.operator,
		routes.route_name
	)
    SELECT
    airline_id,
    operator,
    route_name,
    Total_flight_ops
FROM
    RankedFlightOperations
WHERE
    rnk = 1;
