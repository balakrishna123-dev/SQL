 cte-session?
 
 why cte become to the picture?
 because of complxexity, and reading issues and query level usage  cte become into 
 the picture
 
 what is cte?
 cte is a temporary result set that you can refrenec with in a  SQl-query
 
 syntax: it starts with  and table name
 WITH cte_name AS (
    -- SQL query
)
SELECT * 
FROM cte_name;
##“Here, I am selecting all films where rental_rate > 3 using a CTE.”
example:
WITH high_rate_films AS (
    SELECT film_id, title, rental_rate
    FROM film
    WHERE rental_rate > 3
)
SELECT *
FROM high_rate_films;

recursive cte:
A Recursive CTE is a Common Table Expression that repeats itself
 until a condition is met.
 
  It contains two parts mainly:
  1. Anchor Member
 starting point. (ex:n=1)

2. Recursive Member
 ending  (ex: n=10)
 
 syntax:
 
 WITH RECURSIVE cte_name AS (
    -- 1. Anchor Member (starting row)
    SELECT ...

    UNION ALL

    -- 2. Recursive Member (repeats until stop condition)
    SELECT ...
    FROM cte_name
    WHERE ...
)
SELECT *
FROM cte_name;


Example:
WITH RECURSIVE numbers AS (
    -- Anchor
    SELECT 1 AS n

    UNION ALL

    -- Recursive Part
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT *
FROM numbers;

Temporary Tables:
Temporary tables are used to store intermediate results 
at session level only
reusability 

Example
CREATE TEMPORARY TABLE high_rate_films AS
SELECT film_id, title, rental_rate, rating
FROM film
WHERE rental_rate > 3;

SELECT *
FROM high_rate_films;

SELECT title, rental_rate
FROM high_rate_films
WHERE rating = 'PG-13';

views:
it is a virtual tables which doesnt store physicaly:

Synatx:
CREATE VIEW view_name AS
SELECT columns
FROM table
WHERE condition;

SELECT * FROM view_name;

DROP VIEW view_name;

 Example: 
CREATE VIEW high_rate_films AS
SELECT film_id, title, rental_rate, rating
FROM film
WHERE rental_rate > 3;

SELECT * FROM high_rate_films;





 





