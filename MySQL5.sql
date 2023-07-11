-- select cast('2020-10-19 12:35:29.123' as date) as 'DATE';
-- select cast('2020-10-19 12:35:29.123' as time) as 'TIME';
-- select cast('2020-10-19 12:35:29.123' as datetime) as 'DATETIME';


-- use cookdb;
-- set @myVar1 = 5;
-- set @myVar2 = 3;
-- set @myVar3 = 4.25;
-- set @myVar4 = 'MC 이름==> ';

-- select @myVar1;
-- select @myVar2 + @myVar3;
-- select @myVar4, username from usertbl where height > 180;

-- set @myVar1 = 3;
-- prepare myQuery from 'select username, height from usertbl order by height limit ?';
-- execute myQuery using @myVar1;


-- use cookdb;
-- select avg(amount) as '평균 구매 개수' from buytbl;
-- select cast(avg(amount) as signed integer) as '평균 구매 개수' from buytbl;
-- select convert(avg(amount), signed integer) as '평균 구매 개수' from buytbl;

-- select cast('2020$12$12' as date);
-- select cast('2020/12/12' as date);
-- select cast('2020%12%12' as date);
-- select cast('2020@12@12' as date);

-- select num, concat(cast(price as char(10)), 'X', cast(amount as char(4)), '=') as '단가X수량',
-- price * amount as '구매액' from buytbl;


-- select '100' + '200';
-- select concat('100', '200');
-- select concat(100, '200');
-- select 1 > '3mega';
-- select 4 > '3MEGA';
-- select 0 = 'mega3';


-- select if(100>200, '참이다', '거짓이다');
-- select ifnull(null, '널이군요'), ifnull(100, '널이군요');
-- select nullif(100, 100), ifnull(200, 100);


-- select case 10
--  when 1 then '일'
-- when 5 then '오'
-- when 10 then '십'
-- else '모름'
-- end;


-- select ascii('A'), char(65); -- 머지? 좀이상한데

-- select bit_length('abc'), char_length('abc'), length('abc');
-- select bit_length('가나다'), char_length('가나다'), length('가나다');

-- select concat_ws('/', '2020', '01', '01');


-- select elt(2, '하나', '둘', '셋'), field('둘', '하나', '둘', '셋'), find_in_set('둘', '하나,둘,셋'), 
-- instr('하나둘셋', '둘'), locate('둘', '하나둘셋');

-- select format(123456.123456, 4);


-- select lower('abcdEFGH'), upper('abcdEFGH');

-- select insert('abcdefghi', 3, 4, '@@@@'), insert('abcdefghi', 3, 2, '@@@@');

-- select left('abcdefghi', 3), right('abcdefghi', 3);


-- select bin(31), hex(31), oct(31);

-- select lpad('쿡북', 5, '##'), lpad('쿡북', 5, '##');

-- select ltrim(' 쿡북'), rtrim('쿡북 ');


-- select trim(' 쿡북 '), trim(both'ㅋ'from'ㅋㅋㅋ재미있어요.ㅋㅋㅋ');

-- select repeat('쿡북', 3);

-- select replace('it 쿡북 MySQL', '쿡북', 'CookBook');


-- select reverse('MySQL');

-- select concat('it', space(10), 'CookBook MySQL');

-- select substring('대한민국만세', 3, 2);


