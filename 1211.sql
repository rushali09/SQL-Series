# query rating < 3 = poor query 
# query = query rating/ position
# 1211. Queries Quality and Percentage
select  query_name, 
        round(sum(rating/position)/ count(*),2) as quality,
        round(sum(case 
            when rating < 3 then 1 else 0 end)/count(*) * 100,2) as poor_query_percentage
from queries
group by query_name


