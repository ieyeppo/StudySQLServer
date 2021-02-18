use bookrentalshop;
go


-- 1-1번 회원정보
-- email / mobile / names / addr
select 
	LOWER(m.Email) as 'email', 
	m.Mobile as 'mobile', 
	m.Names as 'names', 
	m.Addr as 'addr'
from membertbl as m
order by m.Names desc;


-- 1-2번 책정보
-- names / author / releasDate / price
select 
	b.Names as 'names', 
	b.Author as 'author', 
	b.ReleaseDate as 'releaseDate',
	b.Price as 'price'						-- 시험 원본 가격
	-- , format(b.Price, '#,#원' )as 'price'	-- 가격에 쉼표추가
from bookstbl as b
order by b.Idx;


-- 2-1번 시스템 내장함수 사용
-- 변경이름 / levels / 도시 / 이메일
-- 상위 10개 행 출력
select TOP 10
	concat(right(m.Names, 2), ', ', left(m.Names, 1)) as '변경이름',
	m.Levels as 'levels',
	left(m.Addr, 2) as '도시',
	LOWER(m.Email) as '이메일'
from membertbl as m;


-- 2-2번 책정보 출력
-- Idx / Names / Author / 출판일 / ISBN / 가격
select 
	b.Idx,
	concat(N'제목 : ', b.Names) as 'Names',
	concat(N'저자 > ', b.Author) as 'Author',
	format(b.ReleaseDate, 'yyyy년 MM월 dd일') as '출판일',
	b.ISBN,
	format(b.Price, '#,#원' )as '가격'
from bookstbl as b
order by b.Idx desc;


-- 3-1번 Inner Join 사용
-- 번호 / 장르번호 / 장르 / 책제목 / 저자
-- 상위 10개 행
select TOP 10
	b.Idx as '번호',
	b.Division as '장르번호',
	d.Names as '장르',
	b.Names as '책제목',
	b.Author as '저자'
from bookstbl b
inner join divtbl as d
on b.Division = d.Division
where d.Division = 'B002';


-- 3-2번 Outer Join 사용
-- 서점에서 책을 한번도 빌리지 않은 회원 출력
-- Names / Levels / Addr / rentalDate
-- 11개 행
select 
	m.Names,
	m.Levels,
	m.Addr,
	r.rentalDate
from rentaltbl as r
right outer join bookstbl as b
on r.memberIdx = b.Idx
right outer join membertbl as m
on r.memberIdx = m.Idx
where r.Idx is null;


-- 4-1번 책장르 테이블에 INSERT
begin tran

INSERT INTO divtbl(Division, Names)
     VALUES ('I002', '자기개발서');

select * from divtbl;

rollback;
commit;


-- 4-2번 회원정보테이블에서 성명건 회원의 등급과 주소를 변경
-- 결과 : 부산시 해운대구 010-6683-7732
begin tran

update membertbl
	set 
		Mobile = '010-6683-7732',
		Addr = '부산시 해운대구 '
	where Names = '성명건';

update membertbl
	set 
		Addr = CONCAT(Addr, mobile)
	where Names = '성명건';

select * from membertbl as m where m.Names = '성명건';

rollback;
commit;


-- 5번 집계쿼리, 통계쿼리를 사용
-- names / 총합계금액
select 
	d.Names as 'names',
	SUM(b.Price) as '총합계금액'						-- 원본
	-- format(SUM(b.Price), '#,#원') as '총합계금액'	-- 가격 쉼표 추가
from bookstbl as b
inner join divtbl as d
on b.Division = d.Division
group by d.Names
with rollup;


-- 5번문제 null부분 '합계' 넣기 
select 
	case 
	when d.Names is null then '총합계금액'
	else d.Names
	end as 'names' 
	, format(SUM(b.Price), '#,#원') as '합계금액'

from bookstbl as b
inner join divtbl as d
on b.Division = d.Division
group by rollup(d.Names);


-- 17_Test\20210218_최현화_시험쿼리.sql