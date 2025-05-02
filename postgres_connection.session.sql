SELECT datname
FROM pg_database
WHERE datname = 'postgres';

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';

SELECT * FROM mytable;
SELECT DISTINCT somevalue FROM mytable;
SELECT somevalue, anothervalue
FROM mytable;

ALTER TABLE mytable
ADD COLUMN num_value INT,
ADD COLUMN isAlive BOOLEAN DEFAULT FALSE;

-- See a table's schema

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'mytable';

SELECT somevalue, isAlive FROM mytable
WHERE isAlive  = FALSE;

-- Use case senstive column names
-- using double quotes" " , not ' ' 
ALTER TABLE mytable
RENAME COLUMN isalive TO "isAlive";

UPDATE mytable
SET "isAlive" = TRUE
WHERE somevalue = 'Bye';

UPDATE mytable
SET num_value = 1
WHERE somevalue = 'Bye' 
AND "isAlive" = TRUE;

UPDATE mytable
SET num_value = 2
WHERE somevalue = 'Hello'
AND "isAlive" = FALSE;
 

SELECT anothervalue, somevalue, num_value
FROM mytable
ORDER BY num_value ASC;

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE teacher (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    hire_date DATE DEFAULT CURRENT_DATE,
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT table_name
FROM information_schema.tables
WHERE table_schema ='public';

SELECT *
FROM information_schema.tables
WHERE table_schema ='public';

SELECT * FROM student;


SELECT * 
FROM information_schema.columns
WHERE table_name = 'student';


SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'student';


SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'student';

INSERT INTO student (age, name)
VALUES (20, 'John Doe'),
       (22, 'Jane Smith'),
       (19, 'Alice Johnson'),
       (21, 'Bob Brown'),
       (23, 'Charlie Davis'
);

SELECT * FROM student;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'teacher';


INSERT INTO teacher (name, address)
VALUES ('Mr. Smith', '123 Main St'),
       ('Ms. Johnson', '456 Elm St'),
       ('Dr. Brown', '789 Oak St'),
       ('Prof. Davis', '101 Pine St'),
       ('Mrs. Wilson', '202 Maple St');

SELECT * FROM student;
SELECT * FROM teacher;


-- Add a foreign key to the student table that references the teacher table

ALTER TABLE student
ADD COLUMN teacher_id INT REFERENCES teacher(id);


-- Update the student table to assign teachers to students
UPDATE student 
SET teacher_id = CASE 
    WHEN name = 'John Doe' THEN 1     -- Assigned to Mr. Smith
    WHEN name = 'Jane Smith' THEN 2    -- Assigned to Ms. Johnson
    WHEN name = 'Alice Johnson' THEN 3 -- Assigned to Dr. Brown
    WHEN name = 'Bob Brown' THEN 4     -- Assigned to Prof. Davis
    WHEN name = 'Charlie Davis' THEN 5 -- Assigned to Mrs. Wilson
END;


UPDATE student
SET teacher_id = 4
WHERE id = 5;

-- Verify the updates
SELECT s.name as student_name, 
       s.age, 
       t.name as teacher_name
FROM student s
INNER JOIN teacher t ON s.teacher_id = t.id;

-- INNER JOIN
SELECT s.id as student_id, s.name as student_name, 
       t.id as teacher_id, t.name as teacher_name
FROM student s
INNER JOIN teacher t ON s.teacher_id = t.id;

-- LEFT JOIN
SELECT s.id as student_id, s.name as student_name, 
       t.id as teacher_id, t.name as teacher_name
FROM student s
LEFT JOIN teacher t ON s.teacher_id = t.id;

-- RIGHT JOIN
SELECT s.id as student_id, s.name as student_name, 
       t.id as teacher_id, t.name as teacher_name
FROM student s
RIGHT JOIN teacher t ON s.teacher_id = t.id;

-- AGGREGATION AND FILTERING

-- Count students per teacher
SELECT 
    t.name as teacher_name,
    COUNT(s.id) as number_of_students,
    AVG(s.age) as average_student_age
FROM teacher t
LEFT JOIN student s ON t.id = s.teacher_id
GROUP BY t.id, t.name
ORDER BY number_of_students DESC;

-- Find youngest and oldest student per teacher
SELECT 
    t.name as teacher_name,
    MIN(s.age) as youngest_student,
    MAX(s.age) as oldest_student
FROM teacher t
LEFT JOIN student s ON t.id = s.teacher_id
GROUP BY t.id, t.name;

-- Count teachers and students, with average age
SELECT 
    COUNT(DISTINCT t.id) as total_teachers,
    COUNT(DISTINCT s.id) as total_students,
    ROUND(AVG(s.age), 2) as average_student_age
FROM teacher t
LEFT JOIN student s ON t.id = s.teacher_id;

-- Group students by age and count
SELECT 
    s.age,
    COUNT(*) as students_in_age_group,
    STRING_AGG(s.name, ', ') as student_names
FROM student s
GROUP BY s.age
ORDER BY s.age;

-- SUBQUERIES

-- Find teachers who have students with above-average age
SELECT DISTINCT t.name as teacher_name
FROM teacher t
JOIN student s ON t.id = s.teacher_id
WHERE s.age > (
    SELECT AVG(age)
    FROM student
);

-- Find students who are older than their teacher's average student age
SELECT s.name, s.age
FROM student s
WHERE s.age > (
    SELECT AVG(s2.age)
    FROM student s2
    WHERE s2.teacher_id = s.teacher_id
);

-- Find teachers with the most students
SELECT t.name, student_count.count
FROM teacher t
JOIN (
    SELECT teacher_id, COUNT(*) as count
    FROM student
    GROUP BY teacher_id
) student_count ON t.id = student_count.teacher_id
WHERE student_count.count = (
    SELECT COUNT(*)
    FROM student
    GROUP BY teacher_id
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Find students who are the oldest in their teacher's class
SELECT s.name, s.age, t.name as teacher_name
FROM student s
JOIN teacher t ON s.teacher_id = t.id
WHERE s.age = (
    SELECT MAX(age)
    FROM student s2
    WHERE s2.teacher_id = s.teacher_id
);

-- CASE STATEMENTS
-- Categorize students by age groups
SELECT 
    name,
    age,
    CASE 
        WHEN age < 20 THEN 'Freshman'
        WHEN age < 21 THEN 'Sophomore'
        WHEN age < 22 THEN 'Junior'
        ELSE 'Senior'
    END as student_level
FROM student
ORDER BY age;

-- Classify teachers by number of students
SELECT 
    t.name as teacher_name,
    COUNT(s.id) as student_count,
    CASE 
        WHEN COUNT(s.id) = 0 THEN 'No Students'
        WHEN COUNT(s.id) <= 1 THEN 'Small Class'
        WHEN COUNT(s.id) <= 3 THEN 'Medium Class'
        ELSE 'Large Class'
    END as class_size
FROM teacher t
LEFT JOIN student s ON t.id = s.teacher_id
GROUP BY t.id, t.name
ORDER BY student_count DESC;

-- Grade students based on age relative to average
SELECT 
    s.name,
    s.age,
    CASE 
        WHEN s.age > (SELECT AVG(age) + 2 FROM student) THEN 'Above Average'
        WHEN s.age < (SELECT AVG(age) - 2 FROM student) THEN 'Below Average'
        ELSE 'Average'
    END as age_category
FROM student s;

-- Teacher experience level based on number of students
SELECT 
    t.name,
    CASE 
        WHEN t.id IN (
            SELECT teacher_id 
            FROM student 
            GROUP BY teacher_id 
            HAVING COUNT(*) >= 2
        ) THEN 'Senior Teacher'
        ELSE 'Junior Teacher'
    END as experience_level
FROM teacher t;

-- WINDOW FUNCTION
-- Rank students by age overall
SELECT 
    name,
    age,
    RANK() OVER (ORDER BY age DESC) as age_rank,
    DENSE_RANK() OVER (ORDER BY age DESC) as age_dense_rank
FROM student;

-- Rank students by age within each teacher's class
SELECT 
    s.name as student_name,
    t.name as teacher_name,
    s.age,
    RANK() OVER (PARTITION BY s.teacher_id ORDER BY s.age DESC) as age_rank_in_class
FROM student s
JOIN teacher t ON s.teacher_id = t.id;

-- Running total of students by age
SELECT 
    age,
    COUNT(*) as students_at_age,
    SUM(COUNT(*)) OVER (ORDER BY age) as running_total
FROM student
GROUP BY age
ORDER BY age;

-- Calculate age difference from class average for each teacher
SELECT 
    s.name as student_name,
    t.name as teacher_name,
    s.age,
    ROUND(AVG(s.age) OVER (PARTITION BY s.teacher_id), 2) as class_avg_age,
    s.age - ROUND(AVG(s.age) OVER (PARTITION BY s.teacher_id), 2) as diff_from_avg
FROM student s
JOIN teacher t ON s.teacher_id = t.id;

-- First and last student in each teacher's class by age
SELECT DISTINCT
    t.name as teacher_name,
    FIRST_VALUE(s.name) OVER (PARTITION BY t.id ORDER BY s.age DESC) as oldest_student,
    LAST_VALUE(s.name) OVER (
        PARTITION BY t.id 
        ORDER BY s.age DESC
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) as youngest_student
FROM teacher t
JOIN student s ON t.id = s.teacher_id;