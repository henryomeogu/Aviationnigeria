-- cost analysis: Analysing the cost of JET A1 fuel associated with specific routes and Aircraft type

SELECT
    routes.route_id,
    routes.route_name,
    routes.origin_airport_id,
    routes.destination_airport_id,
    routes.distance_in_NM,
    aircraft.aircraft_id,
    aircraft.type,
    aircraft.manufacturer,
    aircraft.fuel_capacity,
    aircraft.cruising_speed,
    aircraft.seat_capacity,
    aircraft.max_range,
    -- Calculating fuel cost based on distance and fuel consumption
    (routes.distance_in_NM / aircraft.max_range) * aircraft.fuel_capacity * 3028 AS 'fuel_cost' -- fuel cost =  N3,028 per gallon
FROM
    routes
JOIN
    aircraft ON routes.distance_in_NM <= aircraft.max_range
ORDER BY
    route_id, aircraft_id;
