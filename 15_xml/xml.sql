use sqlDB;
go

insert into xmlTbl values('Hello World');
select * from xmlTbl;

select u.userId, u.userName, u.birthYear, u.addr, u.height
from userTbl as u
inner join buyTBl as b
on u.userID = b.userId
where height > 150
--for xml auto;
for json auto;