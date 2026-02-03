with max_salary as (
    select
        department_id,
        employee_id,
        salary,
        rank() over (
            PARTITION by department_id
            order by salary desc
        ) as salary_rank
    from hr.EMPLOYEES
    where department_id is not null
)
SELECT
    department_id,
    employee_id,
    salary,
    salary_rank
from max_salary

where salary_rank = 1;

--Q1:Return all employees who earns the highest salary in each department. (Hint: use analytic functions)
