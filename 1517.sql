--1517. Find Users With Valid E-Mails
select
    user_id,
    name,
    mail
from
    users
where
    mail regexp '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$';
