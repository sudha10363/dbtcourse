SELECT airport_ident, airport_lat
FROM {{ ref('silver_airports') }}
WHERE airport_lat < -90 OR airport_lat > 90