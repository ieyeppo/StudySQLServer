use sqlDB;
go

select * from userTbl where addr = '부산';

-- 출생년도가 1990년 이후이고 키가 160이상인 사람
select userID, userName from userTbl where birthYear >=1990 and height >= 160;

-- 출생년도가 1995년 이후이거나 키가 170이상인 사람
select * from userTbl
where birthYear >= 1995 or height >=170;

--키가 160~170 사이인 사람만 조회
select userID, userName, height from userTbl
where height >=160 and height <=170;
-- between ~ and
select userID, userName, height from userTbl
where height between 160 and 170;


-- 지역이 서울, 대구, 울산
select userID, userName, addr from userTbl
where addr='서울' or addr='대구' or addr='울산';
-- in
select userID, userName, addr from userTbl
where addr in('서울', '대구', '울산');


-- like
select userId, userName, addr from userTbl
where userName like '김%';

select userId, userName, addr from userTbl
where userName like '_혀나';

-- SUBQUERY
select userName, height from userTbl
where height > 170;

-- 최혀나보다 큰 사람 이름과 키 조회
select userName, height from userTbl
where height > (select height from userTbl where userName = '최혀나');


select userName, height from userTbl
where height > all (select height from userTbl where addr = '부산');


select userName, height from userTbl
where height in (select height from userTbl where addr = '서울');

-- order by 필드명 (asc : 기본 생략) 오름차순
select userName, mDate from userTbl
order by userName;

-- order by 필드명 desc 내림차순
select userName, mDate from userTbl
order by userName desc;

select * from userTbl
order by birthYear asc;


-- distinct
select distinct addr from userTbl;

-- 최신 날짜 상위 5개만 출력
select top(5) * from userTbl
order by mDate desc;

-- 아이디, 이름, 출생년도를 출생년도 순으로 조회해서 상위 4명을 제외한 사람의 정보를 출력
select userID, userName, birthYear from userTbl
order by birthYear
offset 4 rows;

-- 복사
-- select 선택영역 into 없는 테이블명 from 존재하는 테이블명
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;


-- GROUP BY
select userID, amount from buyTbl
order by userID;

-- sum(필드명) : 해당 필드의 합계를 구한다.(숫자만 가능)
-- 함수명(필드명) as '열이름' : 조회하는 함수가 추가되는 열의 이름
select userID, sum(amount) as '구매합계'
from buyTbl
group by userID;


-- min, max
select min(height) as '최소키' 
from userTbl;

select max(height) as '최대키'
from userTbl;

select userID, min(height) as '작은키', max(height) as '최대키'
from userTbl
group by userID, userName;

select userID, userName, height
from userTbl
where height = (select min(height) from userTbl) 
or height = (select max(height) from userTbl);