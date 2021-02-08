use sqlDB;
go

select * from userTbl where addr = '�λ�';

-- ����⵵�� 1990�� �����̰� Ű�� 160�̻��� ���
select userID, userName from userTbl where birthYear >=1990 and height >= 160;

-- ����⵵�� 1995�� �����̰ų� Ű�� 170�̻��� ���
select * from userTbl
where birthYear >= 1995 or height >=170;

--Ű�� 160~170 ������ ����� ��ȸ
select userID, userName, height from userTbl
where height >=160 and height <=170;
-- between ~ and
select userID, userName, height from userTbl
where height between 160 and 170;


-- ������ ����, �뱸, ���
select userID, userName, addr from userTbl
where addr='����' or addr='�뱸' or addr='���';
-- in
select userID, userName, addr from userTbl
where addr in('����', '�뱸', '���');


-- like
select userId, userName, addr from userTbl
where userName like '��%';

select userId, userName, addr from userTbl
where userName like '_����';

-- SUBQUERY
select userName, height from userTbl
where height > 170;

-- ���������� ū ��� �̸��� Ű ��ȸ
select userName, height from userTbl
where height > (select height from userTbl where userName = '������');


select userName, height from userTbl
where height > all (select height from userTbl where addr = '�λ�');


select userName, height from userTbl
where height in (select height from userTbl where addr = '����');

-- order by �ʵ�� (asc : �⺻ ����) ��������
select userName, mDate from userTbl
order by userName;

-- order by �ʵ�� desc ��������
select userName, mDate from userTbl
order by userName desc;

select * from userTbl
order by birthYear asc;


-- distinct
select distinct addr from userTbl;

-- �ֽ� ��¥ ���� 5���� ���
select top(5) * from userTbl
order by mDate desc;

-- ���̵�, �̸�, ����⵵�� ����⵵ ������ ��ȸ�ؼ� ���� 4���� ������ ����� ������ ���
select userID, userName, birthYear from userTbl
order by birthYear
offset 4 rows;

-- ����
-- select ���ÿ��� into ���� ���̺�� from �����ϴ� ���̺��
select * into buyTbl2 from buyTbl;
select userID, prodName into buyTbl3 from buyTbl;


-- GROUP BY
select userID, amount from buyTbl
order by userID;

-- sum(�ʵ��) : �ش� �ʵ��� �հ踦 ���Ѵ�.(���ڸ� ����)
-- �Լ���(�ʵ��) as '���̸�' : ��ȸ�ϴ� �Լ��� �߰��Ǵ� ���� �̸�
select userID, sum(amount) as '�����հ�'
from buyTbl
group by userID;


-- min, max
select min(height) as '�ּ�Ű' 
from userTbl;

select max(height) as '�ִ�Ű'
from userTbl;

select userID, min(height) as '����Ű', max(height) as '�ִ�Ű'
from userTbl
group by userID, userName;

select userID, userName, height
from userTbl
where height = (select min(height) from userTbl) 
or height = (select max(height) from userTbl);