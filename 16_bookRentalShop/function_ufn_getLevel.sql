-- 사용자 레벨 리턴 함수
create or alter function ufn_getLevel(@levels char(1))
returns nvarchar(11)
as
begin
	declare @result nvarchar(11);

	set @result = case @levels
			when 'A' then 'GOLD'
			when 'B' then 'SILVER'
			when 'C' then 'BRONZE'
			when 'D' then 'IRON'
			when 'S' then 'ADMIN'
			else 'NON-MEMBERS'
	end;
	return @result;
end
go