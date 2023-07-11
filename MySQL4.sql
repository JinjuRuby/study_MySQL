-- use cookdb;
-- create table testtbl1 (id int, username char(3), age int);
-- insert into testTBL1 values (1, '뽀로로', 16);
-- insert into testTBL1(id, username, age) values (1, '뽀로로', 16);

-- insert into testtbl1 (id, username) values (2, '크롱');

-- insert into testtbl1 (username, age, id) values ('루피', 14, 3);



-- use cookdb;
-- create table testtbl2(id int auto_increment primary key, username char(3), age int);
-- insert into testtbl2 values (null, '에디', 15);
-- insert into testtbl2 values (null, '포비', 12);
-- insert into testtbl2 values (null, '통통이', 11);
-- insert into testtbl2 values (null, '뽀삐', 3);
-- select * from testtbl2;

-- alter table testtbl2 auto_increment=100;
-- insert into testtbl2 values (null, '패티', 13);
-- select * from testtbl2;



-- use cookdb;
-- create table testtbl3
-- (id int auto_increment primary key,
-- username char(3),
-- age int
-- );
-- alter table testtbl3 auto_increment=1000;
-- set @@auto_increment_increment=3;
-- insert into testtbl3 values (null, '우디', 20);
-- insert into testtbl3 values (null, '버즈', 18);
-- insert into testtbl3 values (null, '제시', 19);
-- select * from testtbl3;

-- insert into testtbl3 values (null, '토이', 17), (null, '스토리', 18), (null, '무비', 19);
-- select * from testtbl3;



-- use cookdb;
-- select * from usertbl;
-- create table testtbl4 ( uid varchar(50), uname varchar(50));
-- insert into testtbl4 select userid, userName from cookdb.usertbl;

-- create table testtbl5 (select userid, username from cookdb.usertbl);
-- select *from testtbl5 limit 3;
-- create table testtbl6 (select userid as id, username as name from cookdb.usertbl);
-- select * from testtbl6 limit 3;


-- use cookdb;
-- select* from testtbl4;
-- update testtbl4 set uname = '없음' where uid = 'KKJ';

-- update buytbl set price = price * 1.5;
-- select * from buytbl;


-- use cookdb;
-- select * from testtbl4;
-- delete from testtbl4 where uname = '강호동';
-- delete from testtbl4 where uname like '이%' limit 2; -- 삭제를 할 때 where절의 조건에 맞는 상위 몇 건이 삭제 된다.
-- (delete ...'이%' limit 2하면 앞에 이가 붙는 2개를 위에서부터 제거한다는 뜻)


-- use cookdb;
-- create table bigtbl1 (select * from cookdb.usertbl);
-- create table bigtbl2 (select * from cookdb.usertbl);
-- create table bigtbl3 (select * from cookdb.usertbl);

-- delete from bigtbl1;
-- drop table bigtbl2; -- drop문은 테이블이 삭제되고 truncate은 테이블의 구조는 남는다. delete도 구조 남는다.
-- truncate table bigtbl3;


-- use cookdb;
-- create table membertbl (select userid, username, addr from usertbl limit 3);
-- alter table membertbl add constraint pk_membertbl primary key (userid); -- alter table 속성을 지우거나 더하거나 변경할 때 사용 (더하기 add, 지우기 drop column, 변경하기 modify)
-- select * from membertbl;

-- insert into membertbl values ('KHD', '강후덜', '미국');
-- insert into membertbl values ('LSM', '이상민', '서울');
-- insert into membertbl values ('KSJ', '김성주', '경기');

-- insert ignore into membertbl values ('KHD', '강후덜', '미국');
-- insert ignore into membertbl values ('LSM', '이상민', '서울');
-- insert ignore into membertbl values ('KSJ', '김성주', '경기');
-- select * from membertbl;

-- insert into membertbl values ('KHD', '강후덜', '미국') on duplicate key update username = '강후덜', addr='미국';
-- insert into membertbl values ('DJM', '동짜몽', '일본') on duplicate key update username = '동짜몽', addr='일본';
-- select * from membertbl;


-- use cookdb;
-- select row_number() over(order by height desc) "키큰순위", username, addr, height from usertbl;
-- select row_number() over(order by height desc, username asc) "키큰순위", username, addr, height from usertbl;
-- select addr, row_number() over(partition by addr order by height desc, username asc) "지역 별키큰순위", username, height from usertbl;

-- select dense_rank() over(order by height desc) "키큰순위", username, addr, height from usertbl;
-- select rank() over(order by height desc) "키큰순위", username, addr, height from usertbl;

-- select ntile(2) over(order by height desc) "반번호", username, addr, height from usertbl;
-- select ntile(4) over(order by height desc) "반번호", username, addr, height from usertbl;


-- use cookdb;
-- select username, addr, height as "키", height - (lead(height, 1, 0) over (order by height desc)) as "다음 사람과 키 차이" from usertbl;
-- select addr, username, height as "키", height - (first_value(height) over (partition by addr order by height desc)) as "지역별 최대키와 차이" from usertbl;

-- select addr, username, height as "키", (cume_dist() over (partition by addr order by height desc)) * 100 as "누적인원 백분율%" from usertbl;


-- use cookdb;
-- create table pivottest
-- ( uname char(3),
-- season char(2),
-- amount int
-- );

-- insert into pivottest values ('유재석', '겨울', 10);
-- insert into pivottest values ('강호동', '여름', 15);
-- insert into pivottest values ('유재석', '가을', 25);
-- insert into pivottest values ('유재석', '봄', 3);
-- insert into pivottest values ('유재석', '봄', 37);
-- insert into pivottest values ('강호동', '겨울', 40);
-- insert into pivottest values ('유재석', '여름', 14);
-- insert into pivottest values ('유재석', '겨울', 22);
-- insert into pivottest values ('강호동', '여름', 64);
-- select * from pivottest;

-- select uname, sum(case when season='봄' then amount end) as '봄',
--  sum(case when season='여름' then amount end) as '여름',
--  sum(case when season='가을' then amount end) as '가을',
--  sum(case when season='겨울' then amount end) as '겨울'
-- from pivottest
-- group by uname;


-- ************************************* 비재귀적 cte 다시보기 (오류가 많다)*************************************
-- use cookdb;
-- select userid as '사용자', sum(price * amount) as '총구매액' from buytbl group by userid; -- 데이터값이 맞지 않는다

-- select * from abc order by 총구매액 desc; -- abc테이블이 존재하지 않는다라는 오류 발생
-- with abc(userid, total) as (select userid, SUM(price * amount) from buytbl group by userid) select * from abc order by total desc;

-- select addr, max(height) from usertbl group by addr;
-- with cte_usertbl(addr, maxheight) as (select addr, max(height) from usertbl group by addr)
-- select avg(키) from cte_테이블이름;
-- with cte_usertbl(addr, maxheight) as (select addr, max(height) from usertbl group by addr) select avg(maxheight * 1.0) as '각 지역별 최고키의 평균' from cte_usertbl;
