use sqlDB;
go

create or alter trigger trg_testTbl
on testTbl
after insert, delete, update -- ����, ������ �� Ʈ���� �߻�
as
print '�� Ʈ���� �߻�';

insert into testTbl values ('BTS');
select * from testTBL where txt = '������';
update testTBL set txt = '��������!' where id = 4;


