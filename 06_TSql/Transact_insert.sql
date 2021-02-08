-- select, insert, update, delete

insert into usertbl values(
'CHH', '최혀나', 1995, '부산', 
'010', '3951', '3000', 158, '2021-02-08');

insert into usertbl values(
'LMG', '이미경', 1968, '부산', 
'010', '4910', '1000', 160, '1999-05-21');

insert into usertbl values(
'KMK', '김민경', 1991, '서울', 
'010', '4887', '2584', 172, '2001-08-02');

insert into usertbl values(
'BKR', '박가람', 1990, '창원', 
'010', '9458', '1654', 161, '2003-04-17');

insert into usertbl values(
'HAY', '황아영', 1996, '대구', 
'010', '7515', '5432', 155, '2020-06-29');

insert into usertbl values(
'LYJ', '이유진', 1990, '울산', 
'010', '4585', '9814', 162, '2017-03-03');

-------------------------------------------------------------------

insert into buyTbl values('CHH', '운동화', null, 30, 2);
insert into buyTbl values('LMG', '노트북', '전자', 1000, 1);
insert into buyTbl values('KMK', '모니터', '전자', 200, 1);
insert into buyTbl values('BKR', '모니터', '전자', 200, 5);
insert into buyTbl values('HAY', '청바지', '의류', 50, 3);
insert into buyTbl values('LYJ', '원피스', '의류', 80, 10);
insert into buyTbl values('CHH', '책', '서적', 15, 5);
insert into buyTbl values('LMG', '이어폰', '전자', 40, 2);
insert into buyTbl values('KMK', '책', '서적', 15, 1);
insert into buyTbl values('BKR', '원피스', '의류', 80, 3);
go

-----------------------------------------------------------------

select * from usertbl;
select * from buyTbl;