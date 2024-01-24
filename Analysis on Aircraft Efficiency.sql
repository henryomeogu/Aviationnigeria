-- 2. Aircraft Efficiency: compare the fuel efficiency per seat mile of different Aircraft types

SELECT * FROM aircraft;

SELECT 
	type,
    fuel_capacity,
    seat_capacity,
    max_range,
    (fuel_capacity/(max_range * seat_capacity)) AS 'fuel_efficiency_per_seat_mile' -- formula: consumption/distance x 1/no of seats
FROM
	aircraft
ORDER BY fuel_efficiency_per_seat_mile;

-- Airbus A319 is the most fuel efficient per seat mile. that is; how much fuel is consumed for each seat for a given distance traveled