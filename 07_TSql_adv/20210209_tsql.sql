use sqlDB;
go

declare @myVar1 int;
declare @myVar2 smallint, @myVar3 decimal(10, 6);
declare @myVar4 VARCHAR(20);

set @myVar1 = 33;
set @myVar2 = 3;
set @myVar3 = 3.141592;
set @myVar4 = '유저ㅓ 이름 : ';

select @myVar1 as '@myVar1';
select @myVar2 + @myVar3  as '@myVar2 + @myVar3 : ';
select @myVar4 as '@myVar4', userName from userTbl;

declare @myVar5 tinyint; --225
set @myVar5 = 3;

-- 키가 상위 @myVar5 이하인 유저만 출력
select top(@myVar5) userName, height from userTbl order by height desc;

select @@VERSION;

--

select convert(float, amount) as 'amount' from buyTbl;
select avg(convert(decimal, amount)) as '평균 구매 개수' from buyTbl;

select price, amount, price/amount as [단가/수량]
from buyTbl;


-- '1000' --> 숫자
SELECT PARSE('2021년 2월 39일' as date);
SELECT try_PARSE('2021년 2월 39일' as date);

select parse('123.45' as int);
select try_parse('123.45' as int);

select parse('123.45' as decimal(5,2));
select try_parse('123.45' as float);

select cast('11' as int);


-- 스칼라함수(단일 리턴함수)
select GETDATE() as '현재날짜';

select year(getdate()) as '금년';
select month(getdate()) as '이번달';
select day(getdate()) as '오늘일';

select abs(-100);

select round(3.1415, 3);
select round(1236.5678, -1);

select cast((rand() * 100) as int); 

select iif(20 < 10, '참', '거짓');

-- 문자열함수
select ascii('a'), ascii('A');
select char(98), char(66);
select unicode('나');
select nchar(45909);

-- 진짜진자 많이쓰이는거
-- 문자열 결함
select concat('Microsoft ', 'SQL ', 'Server ', 2019);
-- 문자열 시작위치 리턴
select charindex('Server', 'SQL Server 2019');
-- left, right
select left('SQL Server 2019', 3), right('SQL Server 2019', 4);
-- substring
select substring('Hello World!', 7, 5);
select substring('안녕하세요, SQL서버입니다!', 11, 2);
-- len
select len('안녕하세요'), len('Hello World!');
select len('안녕하세요'), len('Hello World!      ');
-- lower, upper
select lower('abcdeFG'), upper('abcdeFG');
-- ltrim, rtrim
select  len(ltrim('   Hello World!   ')), 
		len(rtrim('   Hello World!   ')), 
		 len(trim('   Hello World!   '));


select replace('(2016년 발표) SQL Server 2016', '2016', '2019');

-- 정말정말정말정말 정말 많이 쓰는 함수
select format(getdate(), ''); -- 기본
select format(getdate(), 'dd/MM/yyyy');
select format(getdate(), 'yyyy-MM-dd hh:mm:ss:ms');
select format(getdate(), 'yyyy-MM-dd');
select format(getdate(), 'hh:mm:ss');
select getdate();