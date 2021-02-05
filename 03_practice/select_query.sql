-- select * from memberTBL;

-- select memberID, memberName from memberTBL
-- where memberID like 'H%';

use BikeStores;

select * from sales.customers;

select * from production.products;

-- DB 조회
exec sp_helpdb;

-- 테이블 조회
exec sp_tables @table_type = "'table'";

exec sp_columns @table_name = 'stocks',
@table_owner = 'production';