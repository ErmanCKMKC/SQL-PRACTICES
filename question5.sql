with empty_department as(
    SELECT d.department_name, 
    Listagg(substr(department_name, -LEVEL,1), ’’)
	Within group (order by level) as reversed
FROM hr.departments d
LEFT JOIN hr.employees e 
    ON d.department_id = e.department_id
Where e.employee_id is null
Connect by level <= length(department_name)
And prior department_name = department_name
And prior sys_guid() is not null
GROUP BY d.department_name
)
SELECT *
From reversed;
