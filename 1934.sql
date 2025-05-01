--1934. Confirmation Rate

select s.user_id,
       round(coalesce(sum(case when c.action = 'confirmed' then 1 else 0 end) / nullif(total.total, 0), 0), 2) as confirmation_rate
from signups s
left join confirmations c on s.user_id = c.user_id
left join
    (select s.user_id, count(c.action) as total
    from signups s
    left join confirmations c on s.user_id = c.user_id
    group by s.user_id) as total on total.user_id = s.user_id
group by s.user_id, total.total;