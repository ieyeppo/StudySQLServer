-- select, insert, update, delete

insert into usertbl values(
'CHH', '������', 1995, '�λ�', 
'010', '3951', '3000', 158, '2021-02-08');

insert into usertbl values(
'LMG', '�̹̰�', 1968, '�λ�', 
'010', '4910', '1000', 160, '1999-05-21');

insert into usertbl values(
'KMK', '��ΰ�', 1991, '����', 
'010', '4887', '2584', 172, '2001-08-02');

insert into usertbl values(
'BKR', '�ڰ���', 1990, 'â��', 
'010', '9458', '1654', 161, '2003-04-17');

insert into usertbl values(
'HAY', 'Ȳ�ƿ�', 1996, '�뱸', 
'010', '7515', '5432', 155, '2020-06-29');

insert into usertbl values(
'LYJ', '������', 1990, '���', 
'010', '4585', '9814', 162, '2017-03-03');

-------------------------------------------------------------------

insert into buyTbl values('CHH', '�ȭ', null, 30, 2);
insert into buyTbl values('LMG', '��Ʈ��', '����', 1000, 1);
insert into buyTbl values('KMK', '�����', '����', 200, 1);
insert into buyTbl values('BKR', '�����', '����', 200, 5);
insert into buyTbl values('HAY', 'û����', '�Ƿ�', 50, 3);
insert into buyTbl values('LYJ', '���ǽ�', '�Ƿ�', 80, 10);
insert into buyTbl values('CHH', 'å', '����', 15, 5);
insert into buyTbl values('LMG', '�̾���', '����', 40, 2);
insert into buyTbl values('KMK', 'å', '����', 15, 1);
insert into buyTbl values('BKR', '���ǽ�', '�Ƿ�', 80, 3);
go

-----------------------------------------------------------------

select * from usertbl;
select * from buyTbl;