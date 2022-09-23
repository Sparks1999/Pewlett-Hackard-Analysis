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
select department.dept_name,
    dept_manager.emp_no,
    dept_manager.from_date,
    dept_manager.to_date
from department
inner join dept_manager
on department.dept_no = dept_manager.dept_no;

