--Create Data Tables--
create table department(
	dept_no varchar(6) not null,
	dept_name varchar not null,
	primary key (dept_no),
	unique (dept_name)
);

create table dept_emp(
	emp_no varchar(7) not null,
	dept_no varchar(6) not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employee (emp_no),
	foreign key (dept_no) references department (dept_no),
	primary key (emp_no, dept_no)
);

create table employee(
	emp_no varchar(7) not null,
	birth_date date not null,
	first_name varchar not null,
	last_name varchar not null,
	gender varchar(3) not null,
	hire_date date not null,
	foreign key (emp_no) references employee (emp_no),
	primary key (emp_no)
);

create table dept_manager(
	dept_no varchar(6) not null,
	emp_no varchar(7) not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employee (emp_no),
	foreign key (dept_no) references department (dept_no),
	primary key (emp_no)
);

create table salary(
	emp_no varchar(7) not null,
	salary int not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employee (emp_no),
	primary key (emp_no)
);

create table titles(
	emp_no varchar(7) not null,
	title varchar not null,
	from_date date not null,
	to_date date not null,
	foreign key (emp_no) references employee (emp_no)
);