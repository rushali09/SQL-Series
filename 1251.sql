-- # 1251. Average Selling Price
-- # Total Selling Amt. = units * price
-- # Avg = Total selling Amt. (units * price)/ number of products sold (Total Units)
-- # For each product_id there will be no two overlapping periods. 
-- # Imp.: Purchase date should be between products start and end dt.
select  p.product_id,
        ifnull(round(sum(p.price * u.units)/sum(u.units),2),0) as average_price
from prices p 
left join unitssold u
on p.product_id = u.product_id
and u.purchase_date between p.start_date and p.end_date
group by product_id

