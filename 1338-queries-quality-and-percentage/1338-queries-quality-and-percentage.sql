# Write your MySQL query statement below
WITH QueryStats AS (
    SELECT
        COALESCE(query_name, 'Unknown') AS query_name,
        AVG(rating * 1.0 / position) AS quality,
        100.0 * SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*) AS poor_query_percentage
    FROM Queries
    GROUP BY COALESCE(query_name, 'Unknown')
)
SELECT
    query_name,
    ROUND(quality, 2) AS quality,
    ROUND(poor_query_percentage, 2) AS poor_query_percentage
FROM QueryStats
WHERE query_name != 'Unknown'

