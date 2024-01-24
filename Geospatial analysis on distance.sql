-- Geospatial Analysis: Exploring Geospatial Patterns to find the distance between Airports

SELECT
  airport1.airport_id AS airport1_id,
  airport1.name AS airport1_name,
  airport2.airport_id AS airport2_id,
  airport2.name AS airport2_name,
  ST_Distance(POINT(airport1.longitude, airport1.latitude),
              POINT(airport2.longitude, airport2.latitude)) AS distance -- measured in degrees of arc
FROM
  airports AS airport1, airports AS airport2
WHERE
  airport1.airport_id <> airport2.airport_id
ORDER BY
  distance;

-- from the analysis Akanu_ibiam Enugu airport to Portharcourt Intl is the shortest distance while murtala mohammed to maiduguri int'l is the longest ditance



