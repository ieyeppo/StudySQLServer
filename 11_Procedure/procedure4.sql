USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users2]    Script Date: 2021-02-15 오후 2:25:57 ******/
create or alter procedure usp_user4
	@txtValue nvarchar(20),
	@outValue int output
as
	insert into testTBL values (@txtValue);
	select @outValue = IDENT_CURRENT('testTBL'); -- testTBL의 현재 identity값 리턴
go

declare @myValue int;
exec usp_user4 '테스트값 1',@myValue output;

print concat('현재 입력된 값은 ==> ', @myValue);
select @myValue;

select * from testTBL;

declare @pout int;
exec usp_user4 '새로운 텍스트',@pout output;

print concat('현재 입력된 값은 ==> ', @pout);
select @pout;

