select 
  sum(case when device_type = 'laptop' then 1 else 0 end) as laptop_views,
  sum(case when device_type IN ('tablet', 'phone') then 1 else 0 end) as mobile_views
from viewership
