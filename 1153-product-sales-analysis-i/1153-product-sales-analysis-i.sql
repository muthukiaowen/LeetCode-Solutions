# Write your MySQL query statement below
Select p.Product_name,s.year,s.price from sales s inner join product p on s.product_id=p.product_id;