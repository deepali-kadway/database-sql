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

