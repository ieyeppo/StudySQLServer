use sqlDB;
go

create or alter procedure usp_iselse
	@userName nvarchar(10)
as
	declare @birthYear int; -- 출생년도 저장 변수
	select @birthyear = birthYear
	from userTBL
	where userName = @userName;

	if(@birthYear > 1990)
	begin 
		print '아직 젊군요...';
	end
	else 
	begin 
		print '나이가 지긋...';
	end
go

exec usp_iselse '박가람';