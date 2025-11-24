
## 📊 Add: SQL Aggregations (SUM, COUNT, AVG, MIN, MAX)

### 🔥 Overview

This pull request introduces a comprehensive section on **SQL Aggregate Functions**, expanding the project’s collection of essential SQL concepts. Aggregate functions are fundamental for summarizing and analyzing data in relational databases, especially in data analytics, reporting, and business intelligence workflows.

### 🧩 What’s Included

* Detailed explanations of the most commonly used aggregate functions:

  * `SUM()`
  * `COUNT()`
  * `AVG()`
  * `MIN()`
  * `MAX()`
* Example queries using real-world scenarios
* Grouping and filtering with:

  * `GROUP BY`
  * `HAVING`
* Edge cases and performance considerations
* Notes on NULL handling and data type impacts

### 📘 Sample Content Added

#### **1️⃣ SUM() – Totaling Numeric Values**

```sql
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```

#### **2️⃣ COUNT() – Counting Rows**

```sql
SELECT COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'Completed';
```

#### **3️⃣ AVG() – Calculating Averages**

```sql
SELECT AVG(rating) AS avg_rating
FROM product_reviews;
```

#### **4️⃣ MIN() & MAX() – Finding Range Values**

```sql
SELECT MIN(price) AS cheapest,
       MAX(price) AS most_expensive
FROM products;
```

#### **5️⃣ GROUP BY + HAVING**

```sql
SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5;
```

