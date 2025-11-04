-- # confirmation rate = count(confirmed messages)/total count(request confirmation msg)
-- # CR for user (without a request) = 0
-- # 1934. Confirmation Rate

select  s.user_id, 
        round(sum(case 
                when c.action = 'confirmed' then 1 else 0 end)/count(*),2) as confirmation_rate

from signups s
left join confirmations c
on s.user_id = c.user_id 
group by s.user_id






