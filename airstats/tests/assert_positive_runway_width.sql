SELECT runway_id, runway_width_ft
FROM {{ ref('silver_runways') }}
WHERE runway_width_ft < 0