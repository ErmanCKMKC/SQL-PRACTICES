with department_location as (
    select 
        loc.location_id,
        loc.city,
        emp.employee_id
    from hr.EMPLOYEES emp
join hr.departments dep
    on emp.department_id = dep.department_id
join hr.LOCATIONS loc
    on dep.location_id = loc.location_id
)
select
    location_id,
    city,
    count(employee_id) as total_people
from(department_location)
group by location_id,city
order by location_id;

--Q2:Return number of employees registered for each location.
