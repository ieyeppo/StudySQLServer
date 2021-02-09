-- union
select clubName as bName, buildingNum as bLocation
union
select stdName, region from stdTBL;

-- union all
select stdName, region from stdTBL
intersect -- union all
select stdName, region from stdTBL;