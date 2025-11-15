-- # immediate: preff = order_date
-- # scheduled: preff <> order_date
-- # first order: Min (order_date)
-- # find % of immediate orders in the first orders of all customers


select 
    round(sum(case 
        when order_date = customer_pref_delivery_date then 1 else 0 end)* 100/count(*),2) as immediate_percentage
from delivery
where (customer_id, order_date) in 
(select customer_id,min(order_date) as first_order
from delivery 
group by customer_id)
