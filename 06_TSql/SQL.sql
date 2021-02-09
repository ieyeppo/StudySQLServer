-- testTBL insert

use sqlDB;
go

-- DML 중 select 
select * from testTBL;

-- DBL 중 insert
insert into testTBL values (1, '최혀나', 27);
insert into testTBL (id, userName) values (2, '양지희');
insert into testTBL values (3, '손원정'); -- 에러

insert into testTBL (age, id) values (30, 4);
insert into testTBL (userName, age) values ('아이유', 29);


EXEC sp_help 'testTBL';

--
select IDENT_CURRENT('testTBL');

select @@IDENTITY;



select * from BikeStores.sales.order_items;

--sale.order_items 테이블 복사
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
);

-- BikeStores.sales.order_items에 있는 데이터를 sales_order_items 테이블에 넣기Te
insert into sales_order_items
select * from BikeStores.sales.order_items;

select * from sales_order_items;

-- UPDATE
select * from testTBL;

update testTBL
set userName = '최현화', age = 25 
where id = 1;