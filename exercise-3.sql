CREATE DATABASE bank;
USE bank;
CREATE TABLE branch(branch_name VARCHAR(20) PRIMARY KEY,brach_city VARCHAR(20),assets VARCHAR(20));
CREATE TABLE customer(customer_name VARCHAR(20) PRIMARY KEY , customer_street VARCHAR(20), customer_city VARCHAR(20));

CREATE TABLE loan(loan_number INT PRIMARY KEY, branch_name VARCHAR(20),amount INT,
FOREIGN KEY (branch_name) REFERENCES branch(branch_name));

CREATE TABLE borrower(customer_name VARCHAR(20) ,loan_number INT ,PRIMARY KEY(customer_name,loan_number),
FOREIGN KEY (customer_name) REFERENCES customer(customer_name),
FOREIGN KEY (loan_number) REFERENCES loan(loan_number));

CREATE TABLE paccount(account_number INT PRIMARY KEY,branch_name VARCHAR(20) ,balance INT,
FOREIGN KEY (branch_name) REFERENCES branch(branch_name)) ;

CREATE TABLE depositor(customer_name VARCHAR(20),account_number INT,PRIMARY KEY(customer_name,account_number),
FOREIGN KEY (customer_name) REFERENCES customer(customer_name),
FOREIGN KEY (account_number) REFERENCES paccount(account_number));

INSERT INTO branch VALUES('clowntown','LA','fixed'),('mahi','mumbai','fixed'),
('MG road','chennai','fixed'),('newtown','hyderabad','fixed'),('newdelhi','delhi','fixed');

INSERT INTO customer VALUES('smith','fashion street','mumbai'),('henry','fashion street','mumbai'),
('rio','asb court','harrison'),('serena','cherrywood court','harrison'),('ruby','broadway','newyork');

INSERT INTO loan VALUES(55456,'clowntown',50000),(55567,'mahi',75000),(55432,'MG road',45000),
(55789,'newtown',25000),(55678,'newdelhi',0);

INSERT INTO borrower VALUES('henry',55432),('rio',55456),('ruby',55567),('serena',55678),('smith',55789);

INSERT INTO paccount VALUES(20385678,'clowntown',20000),(23084567,'mahi',10000),(30564534,'MG road',15000),
(20453345,'newdelhi',5000),(20782216,'newtown',18000);

INSERT INTO depositor VALUES('henry',20385678),('serena',23084567),('smith',30564534),
('rio',20453345),('ruby',20782216);


SELECT c.customer_name FROM 
customer c INNER JOIN borrower b INNER JOIN loan l 
ON c.customer_name = b.customer_name AND l.loan_number = b.loan_number WHERE amount = 0;

SELECT customer_name FROM 
customer where customer_street = 'fashion street' And customer_city = 'mumbai' AND customer_name <> 'smith';

SELECT c.customer_name,a.branch_name FROM 
customer c INNER JOIN  depositor d INNER JOIN paccount a
ON a.account_number = d.account_number AND c.customer_name = d.customer_name
WHERE customer_city = 'harrison';
























