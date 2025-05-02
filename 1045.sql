--1045. Customers Who Bought All Products
select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select count(*) from product);