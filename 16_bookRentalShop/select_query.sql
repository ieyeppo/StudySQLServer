use BookRentalShopDB;
go

select * from cateTBL;

select * from booksTBL;

select * from memberTBL;


-- 시스템 함수사용 쿼리
select memberID, 
		concat(right(memberName, 2), ', ',left(memberName, 1)) as 'AMERICAN STYLE NAME', 
		case levels
			when 'A' then 'GOLD'
			when 'B' then 'SILVER'
			when 'C' then 'BRONZE'
			when 'D' then 'IRON'
			when 'S' then 'ADMIN'
			else 'NON-MEMBERS'
		end as 'LEVEL',
		 mobile, 
		 upper(email) as 'E-MAIL'
from memberTBL
where levels <> 'S'
order by levels, memberName;


-- 사용자 정의 함수사용 쿼리
select memberID, 
		concat(right(memberName, 2), ', ',left(memberName, 1)) as 'AMERICAN STYLE NAME', 
		dbo.ufn_getLevel(levels) as '회원레벨',
		 mobile, 
		 upper(email) as 'E-MAIL'
from memberTBL
where levels <> 'S'
order by levels, memberName;


-- 책 정보, 시스템 함수, 포맷 함수 쿼리
SELECT 
	   concat(N'책 제목 > ', title) as TITLE
      ,author
      ,isnull(interpreter, '(역자없음)') as '번역가'
      ,company
      ,format(price, '￦#,#.0')
      ,amount
      ,descriptions
	  ,format(releasDate, 'yyyy년 MM월 dd일') as '출판일'
  FROM booksTBL


  -- 책정보 조인
  SELECT	b.bookIdx
--		  , b.cateIdx
		  , c.genre
		  , b.title
		  , b.author
		  , isnull(b.interpreter, '(역자없음)') as '번역가'
		  , b.company
  FROM dbo.booksTBL as b
  inner join cateTBL as c
  on b.cateIdx = c.cateIdx;


  -- 대여된 책의 정보 쿼리 조인
  SELECT   r.rentalIdx
--		  , r.memberIdx
		  , m.memberName
--		  , r.bookIdx
		  , b.title
		  , b.author
		  , format(r.rentalDate, 'yyyy년 MM월 dd일') as '대여일'
		  , format(r.returnDate, 'yyyy년 MM월 dd일') as '반납일'
		  , dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
  inner join booksTBL as b
  on r.bookIdx = b.bookIdx
  inner join memberTBL as m
  on r.memberIdx = m.memberIdx;


  
  -- 책을 안빌린 회원 조회
  SELECT   r.rentalIdx
--		  , r.memberIdx
		  , m.memberName
--		  , r.bookIdx
		  , b.title
		  , b.author
		  , format(r.rentalDate, 'yyyy년 MM월 dd일') as '대여일'
		  , format(r.returnDate, 'yyyy년 MM월 dd일') as '반납일'
		  , dbo.ufn_getState(r.rentalState) as '대여상태'
  FROM dbo.rentalTBL as r
  right outer join booksTBL as b
  on r.bookIdx = b.bookIdx
  right outer join memberTBL as m
  on r.memberIdx = m.memberIdx;