1. What is an Index (Simple Definition)

An Index is like a shortcut that helps the database find data quickly without searching the entire table.

--Why we use indexes?

Fast searching

Fast filtering

Fast sorting

Fast joining

Reduces query time
-- But remember:

Indexes make SELECT fast,
BUT slow down:

INSERT

UPDATE

DELETE

Because the index also needs to update.

-- 2. Types of Indexes (Beginner Level)

There are two main types you must understand:

1. Clustered Index
2. Non-Clustered Index



3. What is a Clustered Index? 

A Clustered Index decides the actual physical order of data in the table.

Example:

A library keeps books in alphabetical order:
A → B → C → D → …
The books are physically arranged in that order.

This is Clustered Index.

--Important:

Only ONE clustered index per table
(Because data can be sorted physically only once.)

Usually created on PRIMARY KEY

--Example --

Table: Students
Rows:
101 – Ravi
102 – Priya
103 – Arjun

If student_id is the clustered index →
Rows are stored in sorted order of student_id.

-- When to use Clustered Index?

When data needs sorting

When using:

ORDER BY

GROUP BY

BETWEEN

Range queries

Example:

SELECT * FROM sales
WHERE sale_date BETWEEN '2024-01-01' AND '2024-01-30';


Here sale_date should be clustered index.
 4. What is a Non-Clustered Index? (Simple Explanation)

A Non-Clustered Index is like an index page at the back of a book.
It does NOT change the physical order of data.

It only stores:

The indexed column

A pointer (address) to the actual row

Example:

Index:

Ravi → Row 1
Arjun → Row 3
Priya → Row 2


Actual table order remains unchanged.

 Visual Difference
 Clustered Index

 Data is sorted physically.

Non-Clustered Index

 Only index is sorted, not the table.

 When to use Non-Clustered Index?

Use for:

Columns frequently used in search

Columns used in WHERE

Columns used in JOIN

Columns that have unique values
(email, phone number)

Example:

SELECT * FROM users WHERE email='test@gmail.com';


 Create non-clustered index on email.

5. Difference Between Clustered & Non-Clustered (BEGINNER TABLE)
Clustered Index	Non-Clustered Index
Sorts actual table	Does NOT sort table
One per table	Many allowed
Fast for range queries	Fast for searching
Big (whole table)	Small (only index)
Usually primary key	Usually search columns
 6. Why indexes are important?

Because without indexes:

 Query is slow
 Database reads everything
 More CPU
 More I/O
 Index makes SELECT 10x–100x faster

--7. Fine-Tuning Techniques--

These are used to make your SQL faster.

A. Choose the right columns for indexing

Good for indexing:

ID columns

Email

Date columns

Columns used frequently in WHERE

Columns with many unique values

Bad for indexing:

Gender (only M/F)

Status (Active/Inactive)

Flags (Yes/No)

Small tables

-- Do NOT use functions on indexed columns

 Bad:

WHERE YEAR(order_date) = 2024


Good:

WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'

-- C. Use SELECT of required columns (Avoid *)

SELECT * makes the query slow.

 Good:

SELECT name, city FROM employee;

--D. Use Joins instead of Subqueries

Joins are faster and optimized.

-- E. Use Composite Index

When you filter by multiple columns.

Example:

WHERE country = 'US' AND city = 'NY'


Use index:

(country, city)

--F. Avoid too many indexes

Indexes make SELECT fast
BUT
INSERT/UPDATE/DELETE SLOW.

Always keep only important indexes.

--G. Use EXPLAIN PLAN (Execution Plan)

Check:

Index Seek (fast)

Index Scan (slow)

Table Scan (very slow)

--8. Simple Real Life Example

Table: Employees
Columns:

emp_id

name

email

department

joining_date

Best Indexes:

 Clustered Index → emp_id
 Non-Clustered Index → email
Composite Index → (department, joining_date)

