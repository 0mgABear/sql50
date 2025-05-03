--1907. Count Salary Categories
select 
  categories.category,
  count(a.account_id) as accounts_count
from 
  (select 'Low Salary' as category
   union all
   select 'Average Salary'
   union all
   select 'High Salary') categories
left join 
  accounts a
on 
  (case
     when a.income < 20000 then 'Low Salary'
     when a.income >= 20000 and a.income <= 50000 then 'Average Salary'
     else 'High Salary'
  end = categories.category)
group by 
  categories.category;