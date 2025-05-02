--1070. Product Sales Analysis III
select S.product_id, S.year as first_year, S.quantity, S.price
from sales S
join (select MIN(year) as FirstYear, product_id from sales group by product_id) FY
on S.product_id = FY.product_id and S.year = FY.FirstYear;
