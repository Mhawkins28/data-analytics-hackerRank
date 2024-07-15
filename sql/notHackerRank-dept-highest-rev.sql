-- this is a mock interview from YT
-- https://www.youtube.com/watch?v=EYxoPVSBKcU&list=TLPQMTMwNzIwMjRTAYN9nrporQ&index=3

/*

ORDERS
order_id INT PK
customer_id INT
order_date TIMESTAMP
order_amount INT
department_Id INT

DEPARTMENTS
department_id PK
department_name VARCHAR(50)

CUSTOMERS
customer_id INT PK
last_name VARCHAR (255)
first_name VARCHAR (255)

*/

-- get departmnet names, total revenue per dpt in the last 12 months
-- order by revenue DESC

SELECT d.dpartment_name, sum(o.order_amount) as total_rev
FROM departments d
JOIN orders o ON d.depatment_id = o.department_Id
WHERE o.order_date >= DATE_SUB(NOW(), INTERVAL 12 MONTH)
GROUP BY d.department_name
ORDER BY total_rev DESC


-- order breakdown by dept. 
-- how many users ordered from fashiosna and electronics dept in 2022

