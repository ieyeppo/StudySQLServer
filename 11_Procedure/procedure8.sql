use sqlDB;
go

create or alter procedure usp_error
	@userID char(8),
	@userName nvarchar(10),
	@birthYear int = 1968,
	@addr nchar(2) = '서울',
	@mobile1 char(3) = null,
	@mobile2 char(4) = null,
	@mobile3 char(4) = null,
	@height smallint = 160,
	@mDate date = '2021-02-15'
as
	declare @err int;
	begin try
		begin tran
			INSERT INTO userTbl  VALUES
				   (@userID, @userName, @birthYear, @addr,
					@mobile1, @mobile2, @mobile3, @height, @mDate);
		commit
	end try
	begin catch
		select @err = ERROR_NUMBER();
		rollback
	end catch
	
	if @err != 0
	begin 
		print '###' + @userName + '을(를) INSERT에 실패했습니다.';
		print concat('에러번호 : ',@err); -- 오류번호 출력
	end
go

exec usp_error 'WDT', '우당탕', 1988, '부산', '019', '3456', '3456', 190, '2021-02-14';

exec usp_error 'TEST2', '테스트2';

select * from userTbl;
