select sender_id, count(content) as message_count
from messages
where year(sent_date) = 2022 and month(sent_date) = 08
group by sender_id
order by count(content) desc
limit 2