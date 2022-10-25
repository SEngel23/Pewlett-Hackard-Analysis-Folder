-- Creating tables for PH-EmployeeDB

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL, 
	dept_name VARCHAR (40) NOT NULL,
	PRIMARY KEY (dept_no), 
	UNIQUE (dept_name)
);

CREATE TABLE employees (
		emp_no INT NOT NULL, 
		birth_date DATE NOT NULL, 
		first_name VARCHAR NOT NULL,
		last_name VARCHAR NOT NULL,
		gender VARCHAR NOT NULL,
		hire_date DATE NOT NULL,
		PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
		dept_no VARCHAR (4) NOT NULL, 
		emp_no INT NOT NULL, 
		from_date DATE NOT NULL, 
		to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries ( 
		emp_no INT NOT NULL, 
		salary INT NOT NULL, 
		from_date DATE NOT NULL, 
		to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	PRIMARY KEY (emp_no, from_date)
);


CREATE TABLE dept_emp (
		emp_no INT NOT NULL,
		dept_no VARCHAR (4) NOT NULL,  
		from_date DATE NOT NULL, 
		to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
	PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE titles ( 
		emp_no INT NOT NULL, 
		title VARCHAR(50) NOT NULL, 
		from_date DATE NOT NULL, 
		to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);

--- Run a table to see it in the output
SELECT * FROM employees;

--- create query to search for employees about to retire born between 1952 and 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--- create query to search for employees about to retire born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

--- create query to search for employees about to retire born in 1953
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

--- create query to search for employees about to retire born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

--- create query to search for employees about to retire born in 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

--- Retirement Elgibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--- Create a new table with the retiring employee information
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--- query the above code to see the table that was created for retiring employees
SELECT * FROM retirement_info;