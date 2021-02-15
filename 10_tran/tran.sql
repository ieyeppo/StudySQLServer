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

insert into bankbook values (N'구매자', 1000);
insert into bankbook values (N'판매자', 0);

select * from bankbook;

----------------------------------------------------------------------------------------------

update bankbook set uMoney = uMoney - 600 where uName = N'구매자';
update bankbook set uMoney = uMoney + 600 where uName = N'판매자';

select * from bankbook;

----------------------------------------------------------------------------------------------

begin tran -- 1번 트랙잭션
	update bankbook set uMoney = uMoney - 600 where uName = N'구매자';
	-- 오류가 발생되어 수행이 안됨(현재 트랜잭션인 1번 트랜잭션에 롤백이 일어날 것으로 예상됨.)
commit tran


begin tran -- 2번 트랙잭션
	update bankbook set uMoney = uMoney + 600 where uName = N'판매자';
	-- 정상적으로 수행됨
commit tran

select * from bankbook;

----------------------------------------------------------------------------------------------








