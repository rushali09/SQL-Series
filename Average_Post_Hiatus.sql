select user_id, datediff(MAX(post_date), MIN(post_date)) as days_between
from posts 
where year(post_date) = 2021
group by user_id
having count(*)>=2


   