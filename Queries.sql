--Select statements to check the content of the tables--
select *
from department;

select *
from employee;

select *
from dept_emp;

select *
from dept_manager;

select *
from salary;

select *
from titles;

--Queries--
select first_name, last_name
from employee
where birth_date between '1952-01-01' and '1955-12-31';

select first_name, last_name
from employee
where birth_date between '1952-01-01' and '1952-12-31';

select first_name, last_name
from employee
where birth_date between '1953-01-01' and '1953-12-31';

select first_name, last_name
from employee
where birth_date between '1954-01-01' and '1954-12-31';

select first_name, last_name
from employee
where birth_date between '1955-01-01' and '1955-12-31';

select first_name, last_name
from employee
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

select count(first_name)
from employee
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

--Creating a table for the retirement info--
select first_name, last_name
into retirement_info
from employee
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');

select *
from retirement_info;

select emp_no, first_name, last_name
into retirement_info
from employee
where (birth_date between '1952-01-01' and '1955-12-31')
and (hire_date between '1985-01-01' and '1988-12-31');


--Using joins--
select d.dept_name,
    dm.emp_no,
    dm.from_date,
    dm.to_date
from department as d
inner join dept_manager as dm
on department.dept_no = dept_manager.dept_no;

select ri.emp_no,
    ri.first_name,
    ri.last_name,
    de.to_date,
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no;

select ri.emp_no,
    ri.first_name,
    ri.last_name,
    de.to_date
into current_emp
from retirement_info as ri
left join dept_emp as de
on ri.emp_no = de.emp_no
where de.to_date = ('9999-01-01');

--Using count, group by and order by--
select count(ce.emp_no),de.dept_no
into dept_count
from current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;