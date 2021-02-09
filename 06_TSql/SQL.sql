-- testTBL insert

use sqlDB;
go

-- DML �� select 
select * from testTBL;

-- DBL �� insert
insert into testTBL values (1, '������', 27);
insert into testTBL (id, userName) values (2, '������');
insert into testTBL values (3, '�տ���'); -- ����

insert into testTBL (age, id) values (30, 4);
insert into testTBL (userName, age) values ('������', 29);


EXEC sp_help 'testTBL';

--
select IDENT_CURRENT('testTBL');

select @@IDENTITY;



select * from BikeStores.sales.order_items;

--sale.order_items ���̺� ����
CREATE TABLE [sales_order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
);

-- BikeStores.sales.order_items�� �ִ� �����͸� sales_order_items ���̺� �ֱ�Te
insert into sales_order_items
select * from BikeStores.sales.order_items;

select * from sales_order_items;

-- UPDATE
select * from testTBL;

update testTBL
set userName = '����ȭ', age = 25 
where id = 1;