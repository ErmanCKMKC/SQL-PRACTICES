with empty_department as(
    SELECT d.department_name, 
    COUNT(e.employee_id) AS calisan_sayisi
FROM hr.departments d
LEFT JOIN hr.employees e 
    ON d.department_id = e.department_id
GROUP BY d.department_name
)
SELECT department_name,
    substr(department_name,5,1) as fifth_letter,
    calisan_sayisi
from empty_department
where calisan_sayisi = 0;

--Q3:Some departments don’t have any registered employee record.	 Return 5th letter of those department names. 
