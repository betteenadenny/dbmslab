-- create database insurance;
-- use insurance; 
-- create table person(driver_id int,name varchar(20),address varchar(20),primary key(driver_id));
-- create table car(licence int,model varchar(20),year int,primary key(licence)); 
-- create table accident(report_no int,Date_ date,location varchar(20),primary key(report_no));
-- create table owns(driver_id int,licence int,primary key(driver_id,licence));
-- create table participated(report_no int,licence int,driver_id int,damage_amount int,primary key(report_no,licence));
-- alter table owns add constraint foreign key f1(driver_id) references person(driver_id); 
-- alter table owns add constraint foreign key f2(licence) references car(licence); 
-- alter table participated add constraint foreign key f1(report_no) references accident(report_no); 
-- alter table participated add constraint foreign key f2(licence) references car(licence); 
-- alter table car rename vehicle;
-- alter table accident change report_no report_number int; 
-- alter table person add gender varchar(7);
-- alter table accident drop location;
-- alter table participated change damage_amount damage_amount numeric(10,3);

-- insert into person values("7856","Anuja","home","female"),("1896","Anu","home","male"),("9856","Aysha","home","female"),("5856","Ann","home","female");
-- insert into vehicle values("1294","honda",2021),("18364","i10",1998),("1454","innova",2023),("1456","city",2020);
-- insert into accident values("5689","2000-12-03"),("7896","1999-12-03"),("8523","2022-12-03"),("8527","2023-12-03");
-- insert into owns values("7856","1294"),("1896","18364"),("9856","1454"),("5856","1456");
-- insert into participated values("5689","1294","7856","10768.67"),("7896","18364","1896","11678.67"),("8523","1454","9856","34436.67"),("8527","1456","5856","459.67");

-- select * from person where name like "a%";
select * from participated where damage_amount > 10000;
select * from accident where Date_ between '2021-01-01' and '2023-12-31';
-- select * from vehicle inner join owns;





























