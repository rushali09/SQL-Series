# Write your MySQL query statement below

select user_id, 
    max(datediff(next_date, visit_date)) as biggest_window
from
(select user_id, 
       visit_date,
       coalesce(lead(visit_date) over (partition by user_id order by visit_date), '2021-01-01') as next_date
from UserVisits) as t
group by user_id 

