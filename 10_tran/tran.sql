use sqlDB;
go

-- set implicit_transactions on

create table bankbook
(
	uName nvarchar(10),
	uMoney int,
	constraint CK_money
	CHECK (uMoney >= 0)
);
go

insert into bankbook values (N'������', 1000);
insert into bankbook values (N'�Ǹ���', 0);

select * from bankbook;

----------------------------------------------------------------------------------------------

update bankbook set uMoney = uMoney - 600 where uName = N'������';
update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���';

select * from bankbook;

----------------------------------------------------------------------------------------------

begin tran -- 1�� Ʈ�����
	update bankbook set uMoney = uMoney - 600 where uName = N'������';
	-- ������ �߻��Ǿ� ������ �ȵ�(���� Ʈ������� 1�� Ʈ����ǿ� �ѹ��� �Ͼ ������ �����.)
commit tran


begin tran -- 2�� Ʈ�����
	update bankbook set uMoney = uMoney + 600 where uName = N'�Ǹ���';
	-- ���������� �����
commit tran

select * from bankbook;

----------------------------------------------------------------------------------------------








