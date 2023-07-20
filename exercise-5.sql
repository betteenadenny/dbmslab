create database trig;
use trig;
create table product (pdtid int primary key,pname varchar(30),price int,qtyinstock int);
create table sale (saleid int primary key,deliveryaddress varchar(40));
create table saleitem(saleid int,pdtid int,qty int,primary key(saleid,pdtid),
foreign key (pdtid) references product(pdtid),
foreign key (saleid) references sale(saleid));

create trigger updateAvaliableQuantityOne after insert on saleitem for each row 
UPDATE product,saleitem SET product.qtyinstock = product.qtyinstock - saleitem.qty 
WHERE saleitem.pdtid = product.pdtid;

insert into product values(101,'soap',30,25),(102,'chocolate',100,100),(103,'pen',10,10000),(104,'pencil',5,2000),(105,'notebook',28,1000);
insert into sale values (1,'xyz'),(2,'abc'),(3,'def'),(4,'mno'),(5,'pqr');
insert into saleitem values (1,101,5),(2,102,50);

