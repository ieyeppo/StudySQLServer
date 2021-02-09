use sqlDB;
go

select RANK() over(partition by addr order by height desc) as '키 순위',
userName, addr, height from userTbl;

-- PIVOT
/*
create table pivotTBL
(
    userName nvarchar(10),
    season nvarchar(2),
    amount int
);
*/

insert into pivotTBL values 
( '최혀나', '겨울', 10 ),
( '김민경', '여름', 50 ),
( '이수인', '가을', 40 ),
( '박가람', '겨울', 20 ),
( '황아영', '봄', 30 );

insert into pivotTBL values 
( '최혀나', '봄', 52 ),
( '김민경', '겨울', 44 ),
( '이수인', '여름', 45 ),
( '박가람', '여름', 54 ),
( '황아영', '가을', 4 );

select * from pivotTBL;

select * from pivotTBL 
pivot (sum(amount) for season 
in ([봄], [여름], [가을], [겨울])) as resultPriovt;


-- json
select userName, height from userTbl for json  auto;
