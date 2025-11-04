BEGINNER SQL KEYWORDS LIST
1. Data Selection ( what to show)
| Keyword    | Meaning                                     | Example                                |
| ---------- | ------------------------------------------- | -------------------------------------- |
| `SELECT`   | Choose which columns or data to display     | `SELECT name, age`                     |
| `FROM`     | Choose which table to get the data from     | `FROM employees`                       |
| `DISTINCT` | Show only unique values (remove duplicates) | `SELECT DISTINCT city FROM customers;` |
| `AS`       | Rename a column or table (alias)            | `SELECT name AS employee_name`         |

2. Filtering Data (which rows to show)
| Keyword / Operator | Meaning                                      | Example                                        |
| ------------------ | -------------------------------------------- | ---------------------------------------------- |
| `WHERE`            | Add a condition/filter                       | `WHERE age > 30`                               |
| `AND`              | Combine conditions (both must be true)       | `WHERE age > 30 AND city = 'Delhi'`            |
| `OR`               | Combine conditions (either can be true)      | `WHERE city = 'Delhi' OR city = 'Mumbai'`      |
| `NOT`              | Negates a condition                          | `WHERE NOT city = 'Delhi'`                     |
| `IN`               | Check if value is in a list                  | `WHERE department IN ('HR', 'Tech')`           |
| `NOT IN`           | Check if value is **not** in a list          | `WHERE department NOT IN ('HR', 'Tech')`       |
| `BETWEEN`          | Check if value is within a range (inclusive) | `WHERE salary BETWEEN 30000 AND 50000`         |
| `NOT BETWEEN`      | Check if value is outside a range            | `WHERE age NOT BETWEEN 20 AND 40`              |
| `IS NULL`          | Check if value is missing (empty)            | `WHERE email IS NULL`                          |
| `IS NOT NULL`      | Check if value is not missing                | `WHERE email IS NOT NULL`                      |
| `LIKE`             | Match a text pattern                         | `WHERE name LIKE 'A%'` (names starting with A) |
| `NOT LIKE`         | Exclude a pattern                            | `WHERE name NOT LIKE 'A%'`                     |
| `=`                | Equals                                       | `WHERE city = 'Delhi'`                         |
| `<>` or `!=`       | Not equal                                    | `WHERE city <> 'Delhi'`                        |
| `>`                | Greater than                                 | `WHERE salary > 50000`                         |
| `<`                | Less than                                    | `WHERE salary < 50000`                         |
| `>=`               | Greater than or equal to                     | `WHERE age >= 18`                              |
| `<=`               | Less than or equal to                        | `WHERE age <= 60`                              |

3. Sorting Data (Order of Output)
| Keyword    | Meaning                          | Example                |
| ---------- | -------------------------------- | ---------------------- |
| `ORDER BY` | Sort rows by one or more columns | `ORDER BY salary DESC` |
| `ASC`      | Ascending order (default)        | `ORDER BY name ASC`    |
| `DESC`     | Descending order                 | `ORDER BY salary DESC` |

4. Limiting Data


| Keyword | Meaning                                   | Example                          |
| ------- | ----------------------------------------- | -------------------------------- |
| `LIMIT` | Show only first N rows (MySQL/PostgreSQL) | `LIMIT 5`                        |
| `TOP`   | Show first N rows (SQL Server)            | `SELECT TOP 5 * FROM employees;` |

5. Simple Data Operations


| Keyword / Operator | Meaning            | Example                                               |
| ------------------ | ------------------ | ----------------------------------------------------- |
| `*`                | Select all columns | `SELECT * FROM students;`                             |
| `()`               | Group conditions   | `WHERE (age > 25 AND city='Delhi') OR salary > 60000` |
| `;`                | End a statement    | `SELECT * FROM table;`                                |

6. Optional Keywords

| Keyword  | Meaning                                            | Example                                            |
| -------- | -------------------------------------------------- | -------------------------------------------------- |
| `ALL`    | Compare a value to all values of a subquery        | `WHERE salary > ALL (SELECT salary FROM interns)`  |
| `ANY`    | Compare a value to any value in a list or subquery | `WHERE salary > ANY (SELECT salary FROM interns)`  |
| `EXISTS` | Check if a subquery returns results                | `WHERE EXISTS (SELECT * FROM sales WHERE id = 10)` |
