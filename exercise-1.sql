CREATE DATABASE insurance;
use insurance;
CREATE TABLE person (driver_id VARCHAR(30) PRIMARY KEY , fname VARCHAR(30) , address VARCHAR(30));
CREATE TABLE car (licence VARCHAR(30) PRIMARY KEY , model VARCHAR(30) , myear year);
CREATE TABLE accident (report_no int PRIMARY KEY , kdate date , location VARCHAR(30));

CREATE TABLE owns (driver_id VARCHAR(30)  , licence VARCHAR(30) ,PRIMARY KEY(driver_id,licence),
FOREIGN KEY (driver_id) REFERENCES person(driver_id),
FOREIGN KEY (licence) REFERENCES car(licence));

CREATE TABLE participated (report_no int , licence VARCHAR(30) ,driver_id VARCHAR(30) ,damage_amount int, PRIMARY KEY(report_no,licence),
FOREIGN KEY (report_no) REFERENCES accident(report_no),
FOREIGN KEY (licence) REFERENCES car(licence));

ALTER TABLE car RENAME vechicle;

ALTER TABLE accident RENAME COLUMN report_no to report_number;

ALTER TABLE person ADD COLUMN gender VARCHAR(30);

ALTER TABLE accident drop column location; 

ALTER TABLE participated MODIFY damage_amount NUMERIC(6,2);

INSERT INTO person values ("d1", "anitta", "Aranattukarakkaran","F"),
("d2", "ann", "Aranattukarakkaran","F"),
("d3", "betteena", "Aranattukarakkaran","F"),
("d4", "naijo", "Aranattukarakkaran","M"),
("d5", "edwin", "Aranattukarakkaran","M"),
("d6", "john", "Aranattukarakkaran","M"); 

INSERT INTO vechicle VALUES ("L1", "Honda" , 2019),
("L2", "Hyundai" , 2020),
("L3", "MG hector" , 2017),
("L4", "Audi" , 2016),
("L5", "Benz" , 2025),
("L6", "Tata" , 2024);

INSERT INTO accident VALUES (1,'2018-03-26'),
(2 , '2002-06-16' ),
(3 , '2006-12-07' ),
(4 , '2019-11-30'),
(5 , '2007-08-05' ),
(6 , '1999-05-25' );

INSERT INTO owns VALUES ("d1", "L3" ),("d2", "L2" ),("d3", "L5" ),("d4", "L4" ),
("d5", "L6" ),("d6", "L1" );

INSERT INTO participated VALUES (1, "L3" ,"d1", 345.77),(3, "L2" ,"d2", 1000.99),
(4, "L5" ,"d3", 1111.99),(6, "L4" ,"d4", 399.99),
(2, "L6" ,"d5", 8945.99),(5, "L1" ,"d6", 348.99);

select * FROM person WHERE fname like "a%";

SELECT * FROM participated WHERE damage_amount > 1000;

SELECT * FROM accident where kdate BETWEEN '2006-01-21' AND '2018-12-31';

SELECT v.licence,v.model,v.myear,p.fname,p.address FROM person p JOIN vechicle v JOIN owns w 
ON p.driver_id = w.driver_id AND v.licence=w.licence; 






