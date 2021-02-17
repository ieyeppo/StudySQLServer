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