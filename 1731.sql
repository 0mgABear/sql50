--1731. The Number of Employees Which Report to Each Employee

select e.employee_id, e.name, reports.reports_count, reports.age as average_age
from employees e
    join (select reports_to as id, count(reports_to)as reports_count, round(AVG(age)) as age
    from employees
    where reports_to is not null
    group by reports_to) reports
on e.employee_id = reports.id
order by e.employee_id