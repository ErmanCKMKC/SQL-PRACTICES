WITH empty_departments AS (
    SELECT d.department_name
    FROM hr.departments d
    LEFT JOIN hr.employees e
        ON d.department_id = e.department_id
    WHERE e.employee_id IS NULL
),
reversed_departments AS (
    SELECT department_name,
           LISTAGG(SUBSTR(department_name, -LEVEL, 1), '')
               WITHIN GROUP (ORDER BY LEVEL) AS reversed_name
    FROM empty_departments
    CONNECT BY LEVEL <= LENGTH(department_name)
       AND PRIOR department_name = department_name
       AND PRIOR SYS_GUID() IS NOT NULL
    GROUP BY department_name
)
SELECT *
FROM reversed_departments;


--Q5:(Question 3 cont.) Return reverse of those department names. (For example => input = ‘Benefits’, output = ‘stifeneB’). (HINT: do not use reverse function)

