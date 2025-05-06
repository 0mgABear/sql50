--185. Department Top Three Salaries
--Hard Leetcode Question
with salary_ranks as (
  select 
    e.name as employee,
    d.name as department,
    e.salary,
    dense_rank() over (
      partition by e.departmentId 
      order by e.salary desc
    ) as salary_rank
  from employee e
  join department d on e.departmentId = d.id
)
select department, employee, salary
from salary_ranks
where salary_rank <= 3;
