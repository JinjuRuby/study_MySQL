-- books.sql
drop database if exists book_db;
create database book_db;
use book_db;
create table books(
  book_id  int not null auto_increment,
  title varchar(50),
  publisher varchar(30),
  year  varchar(10),
  price  int,
   primary key(book_id)
);

insert into books(title, publisher, year, price)   values('OperatingSystem','Wirly','2003',30700);
insert into books(title, publisher, year, price)   values('JAVA','Coffee','2014',30000);
insert into books(title, publisher, year, price)   values('DataBase','ELMASLY','2000',35000);
insert into books(title, publisher, year, price)   values('Data Structure','CC','1999',38000);

select * from books;