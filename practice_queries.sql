--LEVEL 1 — Basic Understanding

  --Q1. Show all columns from the table students.

SELECT *
FROM students;

--Q2. Show the name and age of all employees from the employees table.

SELECT name, age
FROM employees;

--Q3. Show the names of employees from employees table whose salary is greater than 50,000.

SELECT name
FROM employees
WHERE salary > 50,000;

--LEVEL 2 — Adding Order and Multiple Conditions

--Q4.List all students (show name and score) from students table where score is more than 80, and show them in descending order of score.

SELECT name,score
FROM students
Where score > 80
ORDER BY score DESC;

--Q5.Show names of employees who work in the Sales department and have a salary greater than 60,000.

SELECT name
FROM employees
WHERE department = 'sales'
and salary >60,000;

--level 3-slightly tricky interview type

--Q6. From the table products, show the product_name, category, and price for all products in category 'Electronics', sorted by price (lowest first).

select product_name, category, price
from products 
where category ='electronics'
order by price asc;
-- so for filter condition we used where category = 'electronics' and we didn't use 'in' function instead of '=' that's because we just have single category that's needed. so = will be easy to undertsnad. 'in' function will be used when there are multiple categories needed. for examples categorys electronics, toys, food. although 'in ' and '=' function means the same and its correct to use. these tiny deatils will definitely makes huge  difference.

--Q7.find all customers from the customers table whose country is 'USA' and whose age is less than 30. Show their names in alphabetical order.

 select name
from customers 
where country = 'USA'
and age <30
order by name asc;

--Q8 List the top 5 highest-paid employees. (Table: employees, columns: name, salary)

select name, salary 
from employees
order by salary desc
limit 5;

--level 4 advanced beginner  SQL challenge 

-- Q9. You have a table employees with columns:
--id, name, department, salary, age. Show the name and salary of employees not in the "HR" department, and whose salary is between 40,000 and 70,000, ordered by salary (highest first).

select name salary
from employees
where department <> 'HR'
and salary between 40000 and 70000
order by salary desc;

--Q10.Table: students (id, name, class, score) Find the names of students whose class is not “10th” or “12th”, and score is not NULL, sorted by name in ascending order.

select name
from students 
where class not in ('10', '12') 
and score is not null
order by name asc;

--Q11 Table: products (id, product_name, category, price, stock) Show all products that are in the 'Electronics' or 'Appliances' category,
--have a price less than 500,and stock is more than 0,sorted by category (A–Z), then by price (lowest first).

select product_name, category, price, stock
from products
where category in ('electronics', 'appliances')
and price <500
and stock >0
order by stock asc, price asc;

--Q12 Table: customers (id, name, city, age, country)

--Show all customers who live in “New York” or “Los Angeles”, 
--are not from country “Canada”,and are older than 25,
--ordered by city ascending, and then by age descending.

select name, city, age
from customers
where city in ('new york' , 'los angeles')
and country <> canada, age <25
order by city asc, age desc;

--Q13 Table: orders (order_id, customer_name, order_date, total_amount, status)

--Show the latest 10 orders (based on order_date) that are not cancelled,
--and have a total_amount greater than or equal to 1000.
--Display customer_name, total_amount, and order_date.

select customer_name, total_amount,order_date
from orders
where status <> 'cancelled'
and total_amount >=1000
order by order_date desc
limit 10;

--Q14. Table: books (id, title, author, price, year_published)

--Find books published before 2000, whose price is not between 100 and 500, and display them ordered by year_published (newest first), then by title alphabetically. 

select title, author, price, year_published
from books
where published <2000
and price not between  100 and 500
order by year_published desc, title asc;

--Q15 Table: employees (name, department, salary, experience_years)

--Display names of employees who either work in the “Tech” department and earn more than 80,000,
--OR have more than 10 years of experience,
--sorted by salary in descending order.

select name, department, salary, experienec_years
from employees
where (department ='tech' and salary >80000
  or experience_years >10 
order by salary desc;
