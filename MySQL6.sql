select * from buytbl inner join usertbl on buytbl.userid = usertbl.userid where buytbl.userid = "KYM";
select * from buytbl, usertbl where buytbl.userid = usertbl.userid and buytbl.userid = "KYM";
select * from buytbl inner join usertbl on buytbl.userid = usertbl.userid;

select userid, username, prodname, addr, concat(mobile1, mobile2) as "연락처" from buytbl inner join usertbl on buytbl.userid = usertbl.userid; -- select 할 때 두 테이블에 같은 이름의 속성이 있을 수 있으므로 .을 사용해야한다(중복이 되어있는 속성만 사용하면 된다)
select buytbl.userid, username, prodname, addr, concat(mobile1, mobile2) as "연락처" from buytbl inner join usertbl on buytbl.userid = usertbl.userid;
select buytbl.userid, usertbl.username, buytbl.prodname, usertbl.addr, concat(usertbl.mobile1, usertbl.mobile2) as "연락처" from buytbl inner join usertbl on buytbl.userid = usertbl.userid;
select B.userid, U.username, B.prodname, U.addr, concat(U.mobile1, U.mobile2) as "연락처" from buytbl B inner join usertbl U on B.userid = U.userid;

select B.userid, U.username, B.prodname, U.addr, concat(u.mobile1, u.mobile2) as "연락처" from buytbl B inner join usertbl U on B.userid = u.userid where b.userid = "kym";
select u.userid, U.username, B.prodname, U.addr, concat(u.mobile1, u.mobile2) as "연락처" from usertbl u inner join buytbl b on B.userid = u.userid where b.userid = "kym";

select u.userid, u.username, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as "연락처" from usertbl u inner join buytbl b on u.userid = b.userid order by u.userid;

select distinct u.userid, u.username, u.addr from usertbl u inner join buytbl b on u.userid = b.userid order by u.userid;
select u.userid, u.username, u.addr from usertbl u where exists (select * from buytbl b where u.userid = b.userid);


use cookdb;
create table stdtbl (stdname varchar(10) not null primary key, addr char(4) not null);
create table clubtbl (clubname varchar(10) not null primary key, roomno char(4) not null);
create table stdclubtbl (num int auto_increment not null primary key, stdname varchar(10) not null, clubname varchar(10) not null);
insert into stdtbl values ("강호동", "경북"), ("김제동", "경남"), ("김용만", "서울"), ("이휘재", "경기"), ("박수홍", "서울");
insert into clubtbl values ("수영", "101호"), ("바둑", "102호"), ("축구", "103호"), ("봉사", "104호");
insert into stdclubtbl values (null, "강호동", "바둑"), (null, "강호동", "축구"), (null, "김용만", "축구"), (null, "이휘재", "축구"), (null, "이휘재", "봉사"), (null, "박수홍", "봉사");

select s.stdname, s.addr, c.clubname, c.roomno from stdtbl s inner join stdclubtbl sc on s.stdname = sc.stdname inner join clubtbl c on sc.clubname = c.clubname order by s.stdname;
select c.clubname, c.roomno, s.stdname, s.addr from stdtbl s inner join stdclubtbl sc on sc.stdname = s.stdname inner join clubtbl c on sc.clubname = c.clubname order by c.clubname;

select u.userid, u.username, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as "연락처" from usertbl u left outer join buytbl b on u.userid = b.userid order by u.userid;
select u.userid, u.username, b.prodname, u.addr, concat(u.mobile1, u.mobile2) as "연락처" from usertbl u left outer join buytbl b on u.userid = b.userid where b.prodname is null order by u.userid;

select s.stdname, s.addr, c.clubname, c.roomno from stdtbl s left outer join stdclubtbl sc on s.stdname = sc.stdname left outer join clubtbl c on sc.clubname = c.clubname order by s.stdname;
select c.clubname, c.roomno, s.stdname, s.addr from stdtbl s left outer join stdclubtbl sc on sc.stdname = s.stdname right outer join clubtbl c on sc.clubname = c.clubname order by c.clubname;
select s.stdname, s.addr, c.clubname, c.roomno from stdtbl s left outer join stdclubtbl sc on s.stdname = sc.stdname left outer join clubtbl c on sc.clubname = c.clubname union select s.stdname, s.addr, c.clubname, c.roomno from stdtbl s left outer join stdclubtbl sc on sc.stdname = s.stdname right outer join clubtbl c on sc.clubname = c.clubname;

select * from buytbl cross join usertbl;
select * from buytbl, usertbl;
select count(*) as "데이터개수" from buytbl cross join usertbl;


use cookdb;
create table emptbl(emp char(3), manager char(3), emptel varchar(8));

insert into emptbl values("나사장", null, "0000");
insert into emptbl values("김재무", "나사장", "2222");
insert into emptbl values("김부장", "김재무", "2222-1");
insert into emptbl values("이부장", "김재무", "2222-2");
insert into emptbl values("우대리", "이부장", "2222-2-1");
insert into emptbl values("지사원", "이부장", "2222-2-2");
insert into emptbl values("이영업", "나사장", "1111");
insert into emptbl values("한과장", "이영업", "1111-1");
insert into emptbl values("최정보", "나사장", "3333");
insert into emptbl values("윤차장", "최정보", "3333-1");
insert into emptbl values("이주임", "윤차장", "3333-1-1");

select a.emp as "부하직원", b.emp as "직속상관", b.emptel as "직속상관연락처" from emptbl a inner join emptbl b on a.manager = b.emp where a.emp = "우대리";


select stdname, addr from stdtbl union all select clubname, roomno from clubtbl;

select username, concat(mobile1, "-", mobile2) as "전화번호" from usertbl where username not in (select username from usertbl where mobile1 is null);
select username, concat(mobile1, mobile2) as "전화번호" from usertbl where username in (select username from usertbl where mobile1 is null);


drop procedure if exists ifproc; 
delimiter $$ 
create procedure ifproc() 
begin
 declare var1 int; 
 set var1 = 100;
 if var1 = 100 then 
  select "100입니다.";
  else
   select "100이 아닙니다.";
   end if;
end $$
delimiter ; 
call ifproc();


drop procedure if exists ifproc3;
delimiter $$
create procedure ifproc3()
begin
 declare point int;
 declare credit char(1);
 set point = 77;

 if point <= 90 then
	set credit = "A";
 elseif point <= 80 then
	set credit = "B";
 elseif point <= 70 then
	set credit = "C";
 elseif point <= 60 then
	set credit = "D";
 else
	set credit = "F";
end if;
select concat("취득점수==>", point), concat("학점==>", credit);
end $$
delimiter ;
call ifproc3();



drop procedure if exists caseproc;
delimiter $$
create procedure caseproc()
begin
 declare point int;
 declare credit char(1);
 set point = 77;
 
 case
	when point >= 90 then
		set credit = "A";
	when point >= 80 then
		set credit = "B";
 	when point >= 70 then
		set credit = "C";
 	when point >= 60 then
		set credit = "D";
	else set credit = "F";
 end case;
 select concat("취득점수==>", point), concat("학점==>", credit);
 end $$
 delimiter ;
 call caseproc();
 
 
use cookdb;
select userid, sum(price * amount) as "총구매액" from buytbl group by userid  order by sum(price * amount) desc;
select b.userid, u.username, sum(price * amount) as "총구매액" from buytbl b inner join usertbl u on b.userid = u.userid group by b.userid, u.username order by sum(price * amount) desc;
select b.userid, u.username, sum(price * amount) as "총구매액" from buytbl b right outer join usertbl u on b.userid = u.userid group by b.userid, u.username order by sum(price * amount) desc;
select u.userid, u.username, sum(price * amount) as "총구매액" from buytbl b right outer join usertbl u on b.userid = u.userid group by u.userid, u.username order by sum(price * amount) desc;
select u.userid, u.username, sum(price * amount) as "총구매액", 
	case
		when (sum(price * amount) >= 1500) then "최우수고객"
		when (sum(price * amount) >= 1000) then "우수고객"
		when (sum(price * amount) >= 1) then "일반고객"
		else "유령고객"
	end as "고객등급"
    from buytbl b
    right outer join usertbl u
    on b.userid = u.username
    group by u.userid, u.username
    order by sum(price * amount) desc;







