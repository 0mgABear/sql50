-- 584. Find Customer Referee

select name from customer where COALESCE(referee_id, 0) <> 2;