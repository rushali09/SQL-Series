select round(count(distinct a1.player_id)/(select count(distinct player_id) from activity),2) as fraction
from activity a1
join activity a2
on a1.player_id = a2.player_id 
where (a1.player_id, date_sub(a1.event_date, interval 1 day) ) in 
(select player_id, min(event_date) as first_login
from activity 
group by player_id)
