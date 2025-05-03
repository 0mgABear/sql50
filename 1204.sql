--1204. Last Person to Fit in the Bus
select person_name
from queue
join
(select max(turn) as turn
from (
    select 
        turn,
        sum(weight) over (order by turn) as running_weight
    from queue
) q
where running_weight <= 1000) max_turn
on queue.turn = max_turn.turn
