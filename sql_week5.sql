 use cookDB;
 
select * from userTBL;
select * from userTBL where userName = '강호동';

select userID, username from usertbl where birthyear >= 1970 and height >= 182; -- 1970년 이후에 출생했고 키가 182cm이상인 사람의 아이디와 이름 조회

select username, height from usertbl where height between 180 and 182;
select username, addr from usertbl where addr = '경남' or addr = '충남' or addr = '경북';
select username, addr from usertbl where addr in ('경남', '충남', '경북'); -- 이산적인(discrete) 값을 조회할 때는 in() 연산자 사용
select username, height from usertbl where username like '김%';
select username, height from usertbl where username like '_경규';

select username, height from usertbl where height = any (select height from usertbl where addr = '경기'); -- =any(서브쿼리)는 in(서브쿼리)와 같다

select username, mdate from usertbl order by mdate; -- 가입한 순서대로 출력(밑으로 오름차순)
select username, mdate from usertbl order by mdate desc;
select username, height from usertbl order by height desc, username asc; -- 이해 X username과 height는 서로 관련있는 데이터인데 각각 정렬할 수 있나?
select addr from usertbl;
select distinct addr from usertbl; -- distinct 중복되는 것은 1번만 보여준다

use cookdb;
create table buytbl2 (select * from buytbl); -- *****buytbl테이블을 이용하여 buytbl2라는 테이블을 생성한다. 복사할 때 기본키와 외래키 등의 제약 조건은 복사되지 않는다.
select * from buytbl2;

create table buytbl3 (select userid, prodname from buytbl);
select * from buytbl3; 

use cookdb;
select userid, amount from buytbl order by userid;
select userid from buytbl group by userid; -- sum은 group by로 합쳐진 userid가 구매한 물건의 개수를 합친다.
select userid as '사용자 아이디', sum(amount) as '총 구매 개수' from buytbl group by userid; -- as는 키의 이름을 변경한다.
select userid as '사용자 아이디', sum(price * amount) as '총구매액' from buytbl group by userid; -- sum 괄호 안에 price와 amount가 들어가야 한다. 왜냐하면 물건에 해당하는 가격이 다 다르기 때문이다.

-- 집계함수(집계함수는 group by절과 같이 사용해야한다): avg() 평균, min() 최솟값, max() 최댓값, count() 행의 개수, count(distinct) 행의 개수(중복은 1개로 취급), stdev() 표준편차, var_samp() 분산
select avg(amount) as '평균 구매 개수' from buytbl;
select userid, avg(amount) as '평균 구매 개수' from buytbl group by userid;
select * from usertbl;
select username, height from usertbl where height = (select max(height) from usertbl);

select username, max(height) from usertbl group by username; -- 오류발생 max(height)는 데이터가 1개인데 username은 데이터가 여러 개라 오류가 난다.
-- 하지만 group by username을 사용하면 오류가 발생하지 않는다 group by는 그룹으로 만들어주는 역할을 하므로 각각이 그룹으로 형성이되어 그중에서 max(height)의 데이터를
-- 보여주는 것이다.
select username, max(height), min(height) from usertbl group by username; -- 오류가 나진 않지만 아무 의미가 없는 데이터이다.
