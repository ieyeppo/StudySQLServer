declare @year int;
set @year = 1995;

if @year >= 1980
begin 
    select * from userTBL where birthYear >= @year;
End
else 
begin 
    print '검색을 할 수 없습니다.';
end