use sqlDB;
go

create or alter trigger trg_backupUserTbl
on userTbl
after update, delete
as
	declare @modType nchar(2);
	
	if(COLUMNS_UPDATED() > 0)	-- ������Ʈ
		begin
			set @modType = '����';
		end
	else	-- ����
		begin
			set @modType = '����';
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
   SET [userName] = '����ȭ'
 WHERE userID = 'CHH';
 go

 select * from backup_userTbl;

 select * from userTbl;

 delete from userTbl
 where userID = 'CHH';