-- # 1633. Percentage of Users Attended a Contest
select  contest_id, 
         ROUND(COUNT(DISTINCT USER_ID)/ (SELECT COUNT(USER_ID) FROM USERS) * 100,2) AS percentage
from users 
right join register using(user_id)
group by contest_id
ORDER BY PERCENTAGE DESC, CONTEST_ID
