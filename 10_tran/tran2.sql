USE [sqlDB]
GO

begin try
	begin tran
		UPDATE [dbo].[userTbl]
		   SET [userID] = 'JELLY'
			  ,[userName] = '������'
			  ,[birthYear] = 1998
			  ,[addr] = '����'
			  ,[mobile1] = 010
			  ,[mobile2] = 9876
			  ,[mobile3] = 5432
			  ,[height] = 160
			  ,[mDate] = getdate()
		 WHERE userid='HGD'
	commit tran
end try
begin catch
	rollback tran
end catch

begin tran
	UPDATE [dbo].[userTbl]
		   SET [userID] = 'JELLY'
			  ,[userName] = '������'
			  ,[birthYear] = 1998
			  ,[addr] = '����'
			  ,[mobile1] = 010
			  ,[mobile2] = 9876
			  ,[mobile3] = 5432
			  ,[height] = 160
			  ,[mDate] = getdate()
		 WHERE userid='HGD'
commit


select * from userTbl;



