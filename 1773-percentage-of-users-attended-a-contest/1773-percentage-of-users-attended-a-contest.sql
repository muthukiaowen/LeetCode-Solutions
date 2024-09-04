# Write your MySQL query statement below
WITH UserCount AS (
    SELECT COUNT(*) AS total_users
    FROM Users
),
ContestUserCount AS (
    SELECT
        r.contest_id,
        COUNT(DISTINCT r.user_id) AS registered_users
    FROM Register r
    GROUP BY r.contest_id
)
SELECT
    c.contest_id,
    ROUND(100.0 * c.registered_users / u.total_users, 2) AS percentage
FROM ContestUserCount c
CROSS JOIN UserCount u
ORDER BY percentage DESC, c.contest_id ASC;
