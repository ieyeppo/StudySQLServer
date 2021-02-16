use sqlDB;
go

create or alter trigger trg_backupUserTbl
on userTbl
after update, delete
as
	declare @modType nchar(2);
	
	if(COLUMNS_UPDATED() > 0)	-- 업데이트
		begin
			set @modType = '수정';
		end
	else	-- 삭제
		begin
			set @modType = '삭제';
		end

	insert into backup_userTbl
	SELECT [userID]
      ,[userName]
      ,[birthYear]
      ,[addr]
      ,[mobile1]
      ,[mobile2]
      ,[mobile3]
      ,[height]
      ,[mDate]
      ,@modType
      ,GETDATE()
      ,USER_NAME()
  FROM deleted;
go


UPDATE [dbo].[userTbl]
   SET [userName] = '최현화'
 WHERE userID = 'CHH';
 go

 select * from backup_userTbl;

 select * from userTbl;

 delete from userTbl
 where userID = 'CHH';