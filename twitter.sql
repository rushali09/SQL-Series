-- employes earning more than their direct managers
-- e.employee_id = m.manager_id
-- 3 = William.manager_id (which is NULL)
-- 3 = NULL  → FALSE
SELECT e.employee_id,
       e.name AS employee_name
FROM employee e
JOIN employee m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;


