use BookRentalShopDB;
go

create or alter view uv_nonerentalMember
as
	SELECT  r.rentalIdx
		  --, r.memberIdx
		  , m.memberName
		  --, r.bookIdx
		  , c.cateIdx
		  , b.title
		  , format(r.rentalDate, 'yyyy년 MM월 dd일') as '대여일'
		  , format(r.returnDate, 'yyyy년 MM월 dd일') as '반납일'
		  , dbo.ufn_getState(r.rentalState) as '대여상태'

	FROM rentalTBL as r

	right outer join memberTBL as m
	on r.memberIdx = m.memberIdx
	left outer join booksTBL as b
	on r.bookIdx = b.bookIdx
	left outer join cateTBL as c
	on b.cateIdx = c.cateIdx
	where r.rentalIdx is null;


/*
select n.* 
from uv_nonerentalMember as n
where n.memberName like '최%'
order by n.memberName;
*/