--570. Managers with at Least 5 Direct Reports
select e1.name
from employee e1
inner join employee e2
on e1.id = e2.managerId
group by e2.managerId
having count(*)>=5


