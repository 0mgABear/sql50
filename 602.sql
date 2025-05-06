--602. Friend Requests II: Who Has the Most Friends
select id, count(*) as num
from (
    select requester_id as id from requestaccepted
    union all
    select accepter_id as id from requestaccepted
) as all_friends
group by id
order by num desc
limit 1;
