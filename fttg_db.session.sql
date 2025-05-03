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
