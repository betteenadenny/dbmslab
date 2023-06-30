CREATE DATABASE company;
USE company;
CREATE TABLE jobs (job_id INT PRIMARY KEY,job_title VARCHAR(20),min_salary INT,max_salary INT);
CREATE TABLE employees (employee_id INT PRIMARY KEY,first_name VARCHAR(20),last_name VARCHAR(20),email_id VARCHAR(20),phone_number BIGINT,hire_date DATE,job_id INT,salary INT,manager_id INT,department_id INT);
CREATE TABLE dependents (dependent_id INT PRIMARY KEY,first_name VARCHAR(20),last_name VARCHAR(20),relationship VARCHAR(20),employee_id INT);
CREATE TABLE departments (department_id INT PRIMARY KEY,department_name VARCHAR(20),location_id INT);
CREATE TABLE regions (region_id INT PRIMARY KEY,region_name VARCHAR(20));
CREATE TABLE countries (country_id INT PRIMARY KEY,country_name VARCHAR(20),region_id INT);
CREATE TABLE locations (lacation_id INT PRIMARY KEY, street_address VARCHAR(20),postel_code VARCHAR(20),city VARCHAR(20),state_province VARCHAR(20),country_id INT);

ALTER TABLE employees ADD FOREIGN KEY (job_id) REFERENCES jobs (job_id);
ALTER TABLE employees ADD FOREIGN KEY (department_id) REFERENCES departments (department_id);
ALTER TABLE employees ADD FOREIGN KEY (manager_id) REFERENCES employees(employee_id);
ALTER TABLE dependents ADD FOREIGN KEY (employee_id) REFERENCES employees (employee_id);
ALTER TABLE countries ADD FOREIGN KEY (region_id) REFERENCES regions (region_id);
ALTER TABLE lacations ADD FOREIGN KEY (country_id) REFERENCES countries (country_id);
ALTER TABLE departments ADD FOREIGN KEY (location_id) REFERENCES locations (lacation_id);

ALTER TABLE departments RENAME dept;

ALTER TABLE employees MODIFY salary SMALLINT;

ALTER TABLE employees ADD commission VARCHAR(20);



