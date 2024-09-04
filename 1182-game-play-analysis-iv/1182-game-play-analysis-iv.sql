# Write your MySQL query statement below
WITH FirstLogins AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login_date
    FROM
        Activity
    GROUP BY
        player_id
),
ConsecutiveLogins AS (
    SELECT
        f.player_id
    FROM
        FirstLogins f
    JOIN
        Activity a
    ON
        f.player_id = a.player_id
        AND a.event_date = DATE_ADD(f.first_login_date, INTERVAL 1 DAY)
    GROUP BY
        f.player_id
),
TotalPlayers AS (
    SELECT
        COUNT(DISTINCT player_id) AS total_count
    FROM
        FirstLogins
),
PlayersWithConsecutiveLogins AS (
    SELECT
        COUNT(DISTINCT player_id) AS consecutive_count
    FROM
        ConsecutiveLogins
)
SELECT
    ROUND(
        (p.consecutive_count * 1.0 / t.total_count),
        2
    ) AS fraction
FROM
    TotalPlayers t
CROSS JOIN
    PlayersWithConsecutiveLogins p;
