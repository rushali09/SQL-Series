select p.page_id
from pages p 
left join page_likes pl 
on p.page_id = pl.page_id
where p.page_id not in(select page_id from page_likes)
