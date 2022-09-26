--Deliverable 1
select e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
into retirement_titles
from employee as e
inner join titles as t
on (e.emp_no = t.emp_no)
where (e.birth_date between '1952-01-01' and '1955-12-31')

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO new_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

--Creating the count for the employees in each department
select count(ne.title), ne.title
into retiring_titles
from  new_titles as ne
group by ne.title
order by count(ne.title) desc;

--Deliverable 2
select distinct on (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
into test
from employee as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join titles as t
on (e.emp_no = t.emp_no)
where (de.to_date = '9999-01-01')
and (e.birth_date between '1965-01-01' and '1965-12-31')
order by e.emp_no;

SELECT DISTINCT ON (e.emp_no) e.emp_no,
 e.first_name,
 e.last_name,
 e.birth_date,
 de.from_date,
 de.to_date,
 ti.title
INTO test
FROM employee as e
INNER JOIN dept_emp as de
 ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
 ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;