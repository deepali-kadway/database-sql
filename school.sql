-- What is a Database and Data?
-- Data is a fact about an object or event.
-- A database is a collection of related data records.

-- What are Database Management Systems (DBMS)?
-- A DBMS is a software that allows users to create, stire, retrieve, update and manage data in a database.
-- Examples of DBMS include MySQL, PostgreSQL, Oracle, and SQLite.
-- There are different types of DBMS: Hierarchical, Network, Relational, and Object-oriented, and NoSQL.

-- What is a relational DBMS?
-- This is essentially when we store data in tables which have rows and columns.

-- What is SQL?
-- SQl stands for Structured Query Language. It is a standard language for accessing and manipulating databases.

-- What is database schema?
-- It is like a blueprint of how the database is constructed. It defines tabels, fields, relationships, etc.

-- What makes up an SQL query?
-- clauses, expressions, predicates, queries and statements.
-- Queries: used to retrieve data from a database. They are used to perform operations like SELECT, FROM, WHERE.
-- Statements: used to perform operations like CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, TRUNCATE.
-- Predicates: used to filter records based on conditions. They are used in WHERE clauses.
-- Clauses: used to specify conditions in a query. They are used in SELECT, FROM, WHERE, ORDER BY, GROUP BY, HAVING.

-- Data Definition Language (DDL)?
-- DDL is used to define the structure of a database. It includes commands like CREATE, ALTER, DROP,RENAME and TRUNCATE.
-- Common datatypes: INT, VARCHAR, CHAR, TEXT, DATE, TIME, TIMESTAMP and BLOB.

-- CReating a database:
CREATE DATABASE school;

-- The USE statement selects a database to work with.
USE school;

-- Create a students Table:
CREATE TABLE students(
    id int,
    name varchar(50), -- varchar is used to store variable-length character strings.
    email varchar(50),
    age int
);

-- Alter students table to add a new column
ALTER TABLE students
ADD password varchar(100);

-- MODIFY the data type of a column
ALTER TABLE students
MODIFY column `name` varchar(150);

-- Renaming a column
ALTER Table students
CHANGE COLUMN name fullname varchar(50);

-- Drop/Delete a column
ALTER Table students
DROP column age;

-- Drop/Delete Table
-- DROP TABLE students;

-- Data Manipulation Language (DML)?
-- DML is used to manipulate data in the database.

-- Insert data in the students table
INSERT into students (id, fullname, email, password)
VALUES (1, "John", "john@gmail.com", "John123");

-- Insert multiple rows in the students table
INSERT into students (id, fullname, email, password)
VALUES (1, "John", "john@gmail.com", "John123"),
(2, "George", "george@gmail.com", "george123"),
(3, "Jade", "jade@gmail.com", "Jade123");

-- Selecting all data columns from the students table
SELECT * from students;
SELECT * from students where id > 1;

-- selecting specific columns from the students table
select id, fullname from students;

-- update students data
update students
set `password` = "NewPass123"
where id = 2;

update students
set `password` = "NewPass123"
where id in (1, 2);

-- delete students data
delete from students where id=1;

-- what is a primary key(PK)?
-- A primary key is a unique identifier for a record in a table. Used to establish relationship between tables.alter
-- Autoincrements: automatically generate a unique value for the primary key

-- change id column to primary key
alter table students
change column id id int primary key auto_increment;

-- insert multiple rows into table without an id
INSERT into students (fullname, email, password)
VALUES ("Damon", "damon@gmail.com", "Damon123"),
("Rue", "rue@gmail.com", "Rue123");

-- what is a foreign key(FK)?
-- A foreign key is a column in a table which references the primary key of another table. It's used to establish a relationship between tables.

-- what are cascading actions?
-- They are used to define what happens when a record in a parent table is deleted.
-- There are different types of cascading actions: RESTRICT, CASCADE, SET NULL and NO ACTION.
-- RESTRICT: This is the default behaviour. It prevents the deletion or update of a record in the parent table(students) if there are related records in child table(courses)
-- CASCADE: This will automatically delete or update related records in child table when the parent table deleted or updates the record.
-- SET NULL: This will set the foreign key column in the child table to NULL when a record in the parent table is deleted.
-- NO ACTION: This is a similar to RESTRICT. prevents the deletion or update of a record in the parent table if there are related records in the child table.

-- Courses Table
create table courses(
id int primary key auto_increment,
`name` varchar(100),
student_id int,
foreign key (student_id) references students(id)
-- on delete cascade
-- on update cascade
);

-- insert data into courses
insert into courses (name, student_id)
values("Maths", 2), ("Science", 3), ("History", 5), ("English", 2), ("Art", 5);

-- inserting student_id which does not exists in the students table, we will get error
insert into courses (name, student_id) values ("Math", 10);

-- ordering by a column in descending or ascending order
select * from courses order by `name` asc;
select * from courses order by student_id desc;

-- limiting the number of rows returned
select * from courses order by `name` asc limit 3;

-- aggregate functions
-- count and group data based on a column
select student_id from courses;
select count(student_id) from courses;
select student_id, count(*) from courses group by student_id;
select student_id, GROUP_CONCAT(name) as course_name, count(student_id) as course_count 
from courses group by student_id; -- show course name enrolled by number of students. Every column in the SELECT clause must either be:Included in the GROUP BY clause, OR An aggregate function (like COUNT, SUM, AVG, etc.
-- in original query: (select name, count(student_id) from courses group by student_id;), we were selecting name (course name) without including it in GROUP BY and hence SQL didn't know which name to show for each student_id group.

-- Joining tables
-- There are different ways to join tables: Inner Join, Left join, right join and full join.
-- Inner Join: This returns rows when there is at least one match in both tables.
select *
from students
join courses
on students.id = courses.student_id;

select c.id, c.name, s.fullname, s.email
from students s
join courses c
on s.id = c.student_id;