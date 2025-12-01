what are the stored procedures?
A Stored Procedure is a prepared  sql code  that you can save in the database
 and you use it whenever you need it or repeat

why we need stored procedure?

1. Performance
2. Security
3. Reusability
4. Easy Maintenance



types of parameters:
1:IN Parameter (Input)
2:out parameter(Output)
3:INOUT parameter

-- Basic Syntax of Stored procedure:

DELIMITER //

CREATE PROCEDURE procedure_name()
BEGIN
    -- SQL statements go here
END //

DELIMITER ;

CALL procedure_name();


Example:

-- In Parameter Synatx-- 

DELIMITER //

CREATE PROCEDURE procedure_name(IN param1 datatype)
BEGIN
    -- SQL statements using param1
END //

DELIMITER ;

example:
DELIMITER //

CREATE PROCEDURE get_films_by_rating(IN p_rating VARCHAR(10))
BEGIN
    SELECT film_id, title, rating
    FROM film
    WHERE rating = p_rating;
END //

DELIMITER ;
CALL get_films_by_rating('G');




-- out parameter syntax--

DELIMITER // 
CREATE PROCEDURE procedure_name(OUT param1 datatype)
BEGIN
    -- assign output value
    SELECT ... INTO param1;
END //

DELIMITER ;

Example:

DELIMITER //

CREATE PROCEDURE total_films(OUT film_count INT)
BEGIN
    SELECT COUNT(*) INTO film_count
    FROM film;
END //

DELIMITER ;




-- inout paramater Syntax

DELIMITER //

CREATE PROCEDURE procedure_name(INOUT param1 datatype)
BEGIN
    -- update param1
    SET param1 = param1 + 10;
END //

DELIMITER ;

Example:
DELIMITER //

CREATE PROCEDURE multiply_by_ten(INOUT num INT)
BEGIN
    SET num = num * 10;
END //

DELIMITER ;

-- Dynamic Stored Procedure

Dynamic SQL allows us to build SQL statements at runtime.”
 Syntax:
 DELIMITER //

CREATE PROCEDURE dynamic_proc(IN tbl_name VARCHAR(50))
BEGIN
    SET @sql = CONCAT('SELECT * FROM ', tbl_name);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;






Natural Key

A natural key is a real-world column
 that already uniquely identifies a record.

Examples:

Email
SSN,Passport number
Phone number

Surrogate Key

A surrogate key is an artificial ID created by the database.
→ NOT from real world
→ Only used for identification

Examples:

Auto-increment ID

UUID

Customer_ID (generated)

 
