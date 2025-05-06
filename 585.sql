--585. Investments in 2016
select round(sum(tiv_2016), 2) as tiv_2016
from insurance i
join (
    select tiv_2015
    from insurance
    group by tiv_2015
    having count(*) > 1
) dup
using (tiv_2015)
join (
    select pid
    from insurance
    group by lat, lon
    having count(*) = 1
) unique_city
using (pid);

--Solution 2:
select round(sum(tiv_2016), 2) as tiv_2016
from insurance i
where 
    exists (
        select 1
        from insurance
        where tiv_2015 = i.tiv_2015
        and pid != i.pid
    )
    and not exists (
        select 1
        from insurance
        where lat = i.lat and lon = i.lon
        and pid != i.pid
    );
