create database store;
use store;

create table product(pdtid varchar(20) primary key,
pname varchar(20),
price numeric(10,2),
quantity int);

DELIMITER //
create procedure InsertProduct(in barcode varchar(20), in productName varchar(20),
in price numeric(10,2),in quantityInStock int)
begin
IF price > 0 and quantityInStock >=0 then
INSERT INTO product (pdtid,pname,price,quantity) VALUES (barcode,productName,price,quantityInStock);
END IF;
end //
DELIMITER ;

CALL insertproduct('123','Pen',10.33,500);
CALL insertproduct('124','Pencil',5,10);
CALL insertproduct('12G','Pen',-99,10);
CALL insertproduct('12G','Pen',99,-2);
select * from product;
