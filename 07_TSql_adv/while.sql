declare @i int, @hap bigint = 0;

while (@i <= 100)
begin 
    set @hap += @i;
    set @i += 1;
END

print @hap;
