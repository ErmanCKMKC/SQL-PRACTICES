with empty_department as(
    SELECT d.department_name, 
    COUNT(e.employee_id) AS calisan_sayisi
FROM hr.departments d
LEFT JOIN hr.employees e 
    ON d.department_id = e.department_id
GROUP BY d.department_name
)
SELECT department_name,calisan_sayisi
substr(department_name,-1,1)||
substr(department_name,-2,1)||
substr(department_name,-3,1) as output
from empty_department
where calisan_sayisi = 0;

--Q4:(Question 3 cont.) Return the string between 1st letter from the end and 3th letter from the end.  . (For example => input = ‘Benefits’, output = ‘sti’).
