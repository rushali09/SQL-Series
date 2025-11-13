select u.city, count(distinct t.order_id) as total_orders
from trades t 
left join users u 
on t.user_id = u.user_id
where status = 'Completed'
group by u.city
order by total_orders desc
limit 3