select * from stdTBL;
select * from clubTBL;
select * from clubRegTBL;

select * from stdTBL as S inner join clubRegTBL as cr on s.id = cr.std_ID;
select * from clubTBL as c inner join clubRegTBL as cr on c.id = cr.club_ID;

select * 
from stdTBL as S 
inner join clubRegTBL as cr 
on s.id = cr.std_ID 
inner join clubTBL as c 
on cr.club_ID = c.id;


-- inner join 표준

select s.id, s.stdName, c.clubName, c.buildingNum
from clubTBL as c
inner join clubRegTBL as r
on r.club_ID = c.id
inner join stdTBL as s
on s.id = r.std_ID;





-- inner join  (SQL Server T-SQL)

select s.id, s.stdName, c.clubName, c.buildingNum
from stdTBL as s, clubRegTBL as r, clubTBL as c
where s.id=r.std_ID and r.club_ID = c.id;

-- outer join (외부 조인)

select s.id, s.stdName, c.clubName, c.buildingNum
from stdTBL as s
left outer join clubRegTBL as r
on s.id = r.std_ID
left outer join clubTBL as c
on r.club_ID = c.id;


-- userTBL / buyTBL
select u.userName, u.addr, b.prodName, b.price
from userTBL as u
inner join buyTBL as b
on u.userID = b.userID;

select u.userName, u.addr, b.prodName, b.price
from userTBL as u
left outer join buyTBL as b
on u.userID = b.userID;


















