-- 1378. Replace Employee ID With The Unique Identifier

select unique_id, name
from employees e
left join employeeuni u
on e.id = u.id;