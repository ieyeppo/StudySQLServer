select * from userTbl;
select * from buyTbl;

select * from userTbl where userID = 'CHH';
select * from buyTbl where userID = 'CHH';

select * from buyTbl where userID = 'HAY';\



-- INNER JOIN

select * FROM buyTbl inner join userTbl on buyTbl.userID = userTbl.userID;

select userTbl.userName, userTbl.addr, concat(userTbl.mobile1, '-', userTbl.mobile2, '-', userTbl.mobile3) as mobile,
buyTbl.prodName, buyTbl.price, buyTbl.amount from buyTbl
inner join userTbl
on buyTbl.userID = userTbl.userID
where buyTbl.userID = 'CHH';

select u.userName, u.addr, concat(u.mobile1, '-', u.mobile2, '-', u.mobile3) as mobile,
b.prodName, b.price, b.amount from b
inner join u
on b.userID = u.userID
where b.userID = 'CHH';