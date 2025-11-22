-- Q3: Return all flights that have never been booked.
SELECT 
    f.flight_id,
    f.flight_number,
    f.origin,
    f.destination
FROM Flights f
LEFT JOIN Bookings b 
    ON f.flight_id = b.flight_id
WHERE b.booking_id IS NULL;


--toughest inner join question 

WITH emp_totals AS (
    SELECT 
        e.emp_id,
        e.name AS emp_name,
        d.dept_name,
        SUM(s.amount) AS total_sales
    FROM Employees e
    INNER JOIN Departments d 
        ON e.dept_id = d.dept_id
    INNER JOIN Sales s 
        ON e.emp_id = s.emp_id
    GROUP BY e.emp_id, e.name, d.dept_name
),
dept_max AS (
    SELECT 
        dept_name,
        MAX(total_sales) AS max_sales
    FROM emp_totals
    GROUP BY dept_name
)
SELECT 
    t.dept_name,
    t.emp_name,
    t.total_sales
FROM emp_totals t
INNER JOIN dept_max m
    ON t.dept_name = m.dept_name
   AND t.total_sales = m.max_sales;
