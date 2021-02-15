use sqlDB;
GO


-- userTBL에는 있지만 buyTBL에 구매 내역이 없는 유저는 출력되지 않음
select  b.userID, 
        u.userName,
        sum(price * amount) as '합계 금액'
from buyTbl as b
inner join userTbl as u
    on b.userID = u.userID
group by b.userID, u.userName
order by sum(price * amount) desc;

-----

-- userTBL에는 있지만 buyTBL에 구매 내역이 없는 유저까지 출력함
select  u.userID, 
        u.userName,
        sum(price * amount) as '합계 금액'
from buyTbl as b
right outer join userTbl as u
    on b.userID = u.userID
group by u.userID, u.userName
order by sum(price * amount) desc;

select  u.userID, 
        u.userName,
        iif(sum(price * amount) is null, 0, sum(price*amount)) as '합계 금액',
        case
            when (sum(price * amount) >= 1500) then 'VVIP'
            when (sum(price * amount) >= 1000) then 'VIP'
            when (sum(price * amount) >= 1) then 'Person'
            else 'Ghost'
        end as '맴버쉽등급'
from buyTbl as b
right outer join userTbl as u
    on b.userID = u.userID
group by u.userID, u.userName
order by sum(price * amount) desc;

select * from userTBL;