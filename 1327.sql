select p.product_name, sum(unit) as unit
from products p 
left join orders o 
on p.product_id = o.product_id 
where Year(o.order_date) = 2020 and month(o.order_date) = 2
group by p.product_name
having unit>= 100