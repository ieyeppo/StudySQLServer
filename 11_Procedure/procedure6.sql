use sqlDB;
go

create or alter procedure usp_iselse
	@userName nvarchar(10)
as
	declare @birthYear int; -- ����⵵ ���� ����
	select @birthyear = birthYear
	from userTBL
	where userName = @userName;

	if(@birthYear > 1990)
	begin 
		print '���� ������...';
	end
	else 
	begin 
		print '���̰� ����...';
	end
go

exec usp_iselse '�ڰ���';