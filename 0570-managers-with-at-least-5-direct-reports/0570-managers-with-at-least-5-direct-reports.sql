# Write your MySQL query statement below
SELECT
    e.name AS name
FROM
    Employee e
JOIN
    (
        SELECT
            managerId
        FROM
            Employee
        WHERE
            managerId IS NOT NULL
        GROUP BY
            managerId
        HAVING
            COUNT(id) >= 5
    ) AS m
ON
    e.id = m.managerId;
