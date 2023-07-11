create table high_salary (
name char(8) not null,
title char(8),
salary int
);
insert into high_salary(name, title, salary) select name, title, salary from employee where salary >= 5000000;

select * from high_salary;

