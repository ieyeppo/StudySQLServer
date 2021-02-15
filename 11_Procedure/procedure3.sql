USE [sqlDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_users]    Script Date: 2021-02-15 오후 2:12:30 ******/
create or alter procedure usp_users2
	@birthYear int,
	@height smallint
as
	select * 
	from userTbl 
	where birthYear > @birthYear and height > @height;
go

exec usp_users2 1991, 150;