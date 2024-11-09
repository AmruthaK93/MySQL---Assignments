create database EMPLOYEE;
use EMPLOYEE;
create table MANAGERS(
	manager_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50),
    date_of_birth date not null,
    age int check (age > 35),
    last_update date,
    gender char(1) check (gender in("M","F","O")),
    department varchar(30),
    salary int not null);
desc MANAGERS;


# 1. Insert 10 rows record
insert into MANAGERS (manager_id, first_name,last_name,date_of_birth,age,last_update,gender,department,salary)  values
(1, 'Alice', 'Johnson', '1988-01-15', 36,'2024-01-06' ,'F', 'IT', 40000),
(2,'Bob', 'Smith', '1983-06-05', 41, '2024-02-12' ,'M', 'HR', 45000), 
(3, 'Charlie', 'Davis', '1984-04-25', 40, '2024-01-12' ,'M', 'IT', 65000),
(4,'Diana', 'Miller', '1982-02-10', 42, '2024-04-22' ,'F', 'Sales', 70000),
(5,'Ethan', 'Brown', '1981-03-25', 41, '2024-05-27' ,'M', 'HR', 75000),
(6,'John', 'Done', '1983-06-25', 41, '2024-08-20' ,'O', 'Marketing', 60000),
(7,'Aalia', 'Duke', '1987-09-28', 37, '2024-09-24' ,'F', 'IT', 40000),
(8,'Diana', 'Charlie', '1985-10-10', 39, '2024-10-02' ,'F', 'HR', 50000),
(9,'David', 'Francis', '1980-06-15', 44, '2024-03-05' ,'M', 'Sales', 80000),
(10,'Michel', 'Jack', '1986-06-15', 38, '2024-01-12' ,'F', 'Marketing', 45000);

select * from MANAGERS;

# 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1
select first_name,date_of_birth from MANAGERS where manager_id=1;


# 3. Write a query to display the annual income of all managers
select first_name, salary, salary * 12 as "annual income" from MANAGERS;


# 4. Write a query to display records of all managers except ‘Aaliya'
select * from MANAGERS where first_name <> "Aalia";


# 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month
select * from MANAGERS where department='IT' and salary>25000;


# 6.  Write a query to display details of managers whose salary is between 10000 and 35000
select * from MANAGERS where salary between 10000 and 35000;
