# Write your MySQL query statement below
select t0.name,t1.unique_id from Employees t0 left join EmployeeUNI t1 on t0.id=t1.id