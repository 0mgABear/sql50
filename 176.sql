--176. Second Highest Salary
select 
    (select salary
     from (select distinct salary
           from employee
           order by salary desc) as distinct_salaries
     limit 1 offset 1) as secondhighestsalary;
