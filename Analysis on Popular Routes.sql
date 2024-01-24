/* 1. Popular Routes: Identifying the most popular routes, based on
a. passenger count
b. number of flights/ Aircraft movement */

SELECT
	routes.route_id,
    routes.route_name,
    SUM(flights.passenger_count) AS 'Total_passenger_count'
FROM
	routes
LEFT JOIN flights ON routes.route_id = flights.flight_route_id
GROUP BY
	routes.route_id,
	routes.route_name
ORDER BY
	Total_passenger_count DESC;
    
    /*  Based on passenger count, Route_id 27 - 'MIU-UG626-ABC' from Maiduguri int'l airport to Nnamdi Azikiwe Abuja Airport is the most popular route
    with 14,433 Total passenger count within the period under review while Route_id 14 - 'LAG-UJ333-ENG' from Murtala Muhammed airport Lagos to Akanu Ibiam Airport Enugu
    is the least popular route with 10,192 Total passenger count */ 

    SELECT
	routes.route_id,
    routes.route_name,
    COUNT(flights.flight_id) AS 'Number_of_flights'
FROM
	routes
LEFT JOIN flights ON routes.route_id = flights.flight_route_id
GROUP BY
	routes.route_id,
	routes.route_name
ORDER BY
	Number_of_flights DESC;
    
	/*  Based on Aircraft Movement, Route_id 27 - 'MIU-UG626-ABC' from Maiduguri int'l airport to Nnamdi Azikiwe Abuja Airport is the most popular route
    with 207 flight operations within the period under review while Route_id 6 - 'ABC-UV456-KAN' from Nnamdi Azikiwe Abuja Airport to Mallam Aminu Kano Airport
    is the least popular route with 144 flight operations count */ 
    
    