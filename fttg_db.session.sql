-- SELECT table_name 
-- FROM information_schema.tables
-- WHERE table.schema = 'public';

-- SELECTION AND FILTERING
-- Imagine a student table

-- Create student table
CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    grade VARCHAR(10)
);

-- Insert Value into student table
INSERT INTO student (name, age, grade) VALUES
('Alice', 20, 88),
('Bob', 22, 92),
('Charlie', 21, 85),
('David', 23, 90),
('Eve', 20, 95);

-- Confirm student table was created and exists
SELECT table_name
FROM information_schema.tables
WHERE table_schema ='public'
ORDER BY table_name;

-- View the data in the student table, order by id
SELECT * FROM student ORDER BY id;
)
-- TASK :   Show only the name and grade,
-- and age of students
--  who are less than 20
-- select columns name and grade
-- filterby age < 20

SELECT name, grade, age
FROM student
WHERE age < 20;

Outcome: We display a subset of our student with only the name and grade columns.

-- Change one student age to less than 20 - Bob
UPDATE student
SET age = 19
WHERE name ='Bob';

-- JOIN - INNER. LEFT,RIGHT
DELETE FROM student
WHERE id = 5;

--Imagine tables student and score
-- Student with id 3 has no value in score table
-- There is a score for student with id 5, but there
-- is no mathchiing student in student table

-- TASK A : Show all/only rows with matching ids 
--in both tables - student and score
-- INNER JOIN

-- Create the score table
CREATE TABLE score (
    student_id INT, 
    score INT,
    FOREIGN KEY (student_id) REFERENCES student(id)
);

-- Insert values into score table
INSERT INTO score (student_id, score) VALUES
(1, 85),
(2, 90),
(4,75),
(5, 88);

INSERT INTO student (name) VALUES
('Femi');

--Verify table was created and values were inserted
SELECT * FROM score ORDER BY student_id;

-- Verify the schema of the score table
SELECT column_name,data_type
FROM information_schema.columns
WHERE table_name = 'score';

-- See current state of student and score tables respectively
SELECT * FROM student
ORDER BY id;

SELECT * FROM score
ORDER BY student_id;


UPDATE student
SET id = 5
WHERE name ='Femi';

INSERT INTO score (student_id, score) VALUES
(5, 88);


)
UPDATE score
SET student_id = 6
WHERE student_id = 5;

DELETE FROM student
WHERE id = 5;

-- TASK A : Show all/only rows with matching ids 
--in both tables - student and score
-- INNER JOIN
SELECT student.id, student.name, score.score
FROM student
INNER JOIN score ON student.id = score.student_id
ORDER BY id;


SELECT current_database();


--TASK B : Show all rows from student (left table) + 
-- matching rows from score (right table) - if any.
-- Use null when not present 
-- LEFT JOIN

SELECT student.id, student.name, score.score
FROM student
LEFT JOIN score ON student.id = score.student_id
ORDER BY id;


--TASK C : Show all roes from score(right table) + matching 
-- students (left table)(if any). Use null when not present
-- RIGHT JOIN

SELECT student.id, student.name, score.score
FROM student
RIGHT JOIN score ON student.id = score.student_id
ORDER BY id;


ALTER TABLE score
DROP CONSTRAINT score_student_id_fkey;


-- GROUP & AGGREGATION
-- Imagine a sales databas with individual salesperson
-- and amount sold in singular row after row

-- TASK : Find the total sales per salesperson
-- Create sales table

CREATE TABLE sales(
    id SERIAl PRIMARY KEY,
    salesperson VARCHAR(25),
    amount_sold INT
);

INSERT INTO sales (salesperson, amount_sold)
VALUES
('Alice', 500),
('Bob', 700),
('Alice', 300),
('Bob', 400),
('Cara', 600);

-- Verify the sales table was created
--  and values were inserted
SELECT * FROM sales ORDER BY id;

-- Verify the schema of the sales table
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales';

-- TASK : Find the total sales per salesperson
-- GROUP BY salesperson, AGGREGATE using SUM()
SELECT salesperson, SUM(amount_sold) AS total_sales
FROM sales
GROUP BY salesperson
ORDER BY total_sales ASC;

SELECT table_name
FROM information_schema.tables
WHERE table_schema ='public'
ORDER BY table_name

-- SUBQUERIES
-- Imagine an employees table which shows salry for each employee

-- TASK  : Find the employees with salary greater
--  than the average salary

-- Create employees table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    SALARY INT
);

-- Insert values into employees table
INSERT INTO employees (name, salary)
VALUES ('Alice', 50000),
    ('Bob', 70000),
    ('Charlie', 55000),
    ('Dan', 48000);

-- Verify the employees table was created
--  and values were inserted
SELECT * FROM employees ORDER BY id;
-- Verify the schema of the employees table
SELECT column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'employees';

-- TASK  : Find the employees with salary greater
--  than the average salary 
-- (50000+70000+55000+48000)/4 = 55750


SELECT name,
    salary
FROM employees
WHERE salary > (
        SELECT AVG(salary)
        FROM employees
    )
ORDER BY salary DESC;

-- Details: The SUB query calculates the average salaryfirst
-- and then the outer query selects employees with salary
-- greater than the average salary. The result is ordered by
-- salary in descending order.

SELECT * FROM employees
WHERE salary > 55750
ORDER BY id;


UPDATE employees
SET salary = 66000
WHERE name = 'Charlie';

-- See current entries in employees table
SELECT * FROM
employees ORDER BY id;


-- CASE STATEMENTS

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    amount INT
);

-- Insert values into orders table
INSERT INTO orders (amount) -- TASK : Create a tabl e with orders and amount
VALUES (150),
    (50),
    (300),
    (90);

-- Verify the orders table was created
--  and values were inserted
SELECT * FROM orders ORDER BY id;
-- Verify the schema of the orders table
SELECT column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'orders';

-- Imagine an orders table with with id and amount  of items
-- We can rant the kind of order we have into high medium and low
-- depending on the amount of items. 
-- Our cases there are 3 - high, medium and low
-- This helps up to categorize our orders
-- based on these ranges 
-- CASE High :amout > 200
-- Case Medium :amount  >=100 || amount  <= 200
-- Case Low : amount <100
-- Create orders table
-- Write the case statement to categorize the orders
SELECT id,
    amount,
    CASE
        WHEN amount > 200 THEN 'High'
        WHEN amount >= 100
        AND amount <= 200 THEN 'Medium'
        ELSE 'Low'
    END AS order_size
FROM orders;

-- We could also rewrite like this

SELECT id,
    amount,
    CASE
        WHEN amount > 200 THEN 'High'
        WHEN amount >= 100 THEN 'Medium'
        ELSE 'Low'
    END AS order_size
FROM orders;

--Details: The CASE statement checks the amount of each order
-- and assigns a category based on the specified conditions.
-- The result includes the order id, amount, and the corresponding
-- order size category.
-- The result is ordered by id in ascending order.


--WINDOW FUNCTIONS
-- Imagine a sales_b table with salesperson and amount sold
-- TASK : We want to show each sale and the total sales by salesperson
-- Without grouping the rows ( SEE Grouping and Aggregation)

-- Create sales_b table
CREATE TABLE sales_b (
    id SERIAL PRIMARY KEY,
    salesperson VARCHAR(25),
    amount INT
);

-- Insert values into sales_b table
INSERT INTO sales_b (salesperson, amount)
VALUES
('Alice', 500),
('Bob', 700),
('Alice', 300),
('Bob', 400),
('Cara', 600);
-- Verify the sales_b table was created
--  and values were inserted
SELECT * FROM sales_b ORDER BY id;
-- Verify the schema of the sales_b table
SELECT column_name,
    data_type
FROM information_schema.columns
WHERE table_name = 'sales_b';

-- TASK : We want to show each sale and the total sales by salesperson 
-- Without grouping the rows ( SEE Grouping and Aggregation)
-- Use window function SUM() OVER()
SELECT id,
    salesperson,
    amount,
    SUM(amount) OVER (PARTITION BY salesperson) 
    AS total_sales
FROM sales_b
ORDER BY id;
--Details: The window function calculates the total sales for each
-- salesperson without grouping the rows. The result includes the
-- order id, salesperson, amount, and the total sales for each
-- salesperson. The result is ordered by id in ascending order.
-- The PARTITION BY clause divides the result set into partitions
-- based on the salesperson, and the SUM() function calculates
-- the total sales for each partition.
-- The result is ordered by id in ascending order. 
-- SUM(amount) calculates the total per person.
-- PARTITION BY salesperson tells SQL to restart the
--  calculation for each salesperson.
-- But rows stay separate — not grouped into one.
-- 	•	OVER() tells SQL “don’t collapse the rows, 
-- just calculate alongside them.”
--  Think of PARTITION BY like:“Do this 
-- calculation separately for each group.”


-- TASK : Number each sale starting at 1 for each salesperson based
--  on the amount descending (biggest sale first).

-- Use window function ROW_NUMBER() OVER()
SELECT id,
    salesperson,
    amount,
    ROW_NUMBER() OVER (PARTITION BY salesperson ORDER BY amount DESC) 
    AS sale_rank
FROM sales_b;
--Details: The window function assigns a unique rank to each sale
-- for each salesperson based on the amount sold in descending order.
-- The result includes the order id, salesperson, amount, and the
-- rank of each sale. The result is ordered by id in ascending order.
-- The PARTITION BY clause divides the result set into partitions
-- based on the salesperson, and the ROW_NUMBER() function assigns
-- a unique rank to each row within each partition based on the
-- specified order. The result is ordered by id in ascending order.
-- The result is ordered by id in ascending order.

