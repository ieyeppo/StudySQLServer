use sqlDB;
go

create or alter trigger trg_testTbl
on testTbl
after insert, delete, update -- 삭제, 수정할 때 트리거 발생
as
print '새 트리거 발생';

insert into testTbl values ('BTS');
select * from testTBL where txt = '마마무';
update testTBL set txt = '마마무뉴!' where id = 4;


