create database job;
use job;

create table WORKER (
	worker_id int,
    first_name char(25),
    last_name char(25),
    salary int,
    joining_date datetime,
    department char(25));
    
    
insert into WORKER (worker_id, first_name, last_name, salary, joining_date, department)
VALUES
	(1, 'John', 'Doe', 50000, '2022-01-15 08:30:00', 'HR'),
	(2, 'Jane', 'Smith', 60000, '2023-03-22 09:00:00', 'Finance'),
	(3, 'James', 'Brown', 55000, '2021-07-10 08:45:00', 'Engineering'),
	(4, 'Emily', 'Davis', 62000, '2022-11-05 09:15:00', 'Marketing'),
	(5, 'Michael', 'Wilson', 58000, '2023-06-30 10:00:00', 'Sales'),
	(6, 'Laura', 'Taylor', 51000, '2023-02-10 08:30:00', 'HR'),
	(7, 'David', 'Moore', 65000, '2022-09-20 09:30:00', 'Finance'),
	(8, 'Sophia', 'Miller', 57000, '2020-12-15 08:50:00', 'Engineering'),
	(9, 'Olivia', 'Garcia', 64000, '2022-04-25 09:00:00', 'Marketing'),
	(10, 'Ethan', 'Martinez', 59000, '2021-08-11 10:10:00', 'Sales');


select * from WORKER;


delimiter //
create procedure Display_Workers()
begin
select * from WORKER;
end //
delimiter ;

call Display_Workers();


# 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call.
	
delimiter //
create procedure  AddWorker (
    IN p_worker_id int,
    IN p_first_name char(25),
    IN p_last_name char(25),
    IN p_salary int,
    IN p_joining_date datetime,
    IN p_department char(25))

begin
	insert into WORKER (worker_id, first_name, last_name, salary, joining_date, department)
	values (p_worker_id, p_first_name, p_last_name, p_salary, p_joining_date, p_department);
end  //
delimiter ;

call AddWorker(11, 'Alice', 'Johnson', 62000, '2024-01-05 09:00:00', 'HR');


#  2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.

delimiter //
create procedure Workers_Salary( in working_id int, out p_salary int)
begin
	select worker_id,salary from WORKER where worker_id = working_id;
end //
delimiter ;

set @p_salary = 0;
call Workers_Salary(11, @p_salary);


# 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.

delimiter //
create procedure Department_Update ( in p_workerid int, in p_department char(25))
begin
	update WORKER set department = p_department where worker_id=p_workerid;
end //
delimiter ;

call Department_Update(11,'sales');

call Display_Workers();


# 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call

delimiter //
create procedure Count_of_Worker(in p_department char(25), out p_WorkerCount int)
begin
	select department,count(worker_id) as No_of_Workers from WORKER where department = p_department group by department;
end //
delimiter ;

set @p_WorkerCount = 0;
call Count_of_Worker('Sales',@p_Workercount);




# . 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

delimiter //
create procedure Average_Salary(in p_department char(25) , out p_avgsalary decimal(10,3))
begin
	select department, avg(salary) as Avg_Salary from WORKER where department = p_department group by department;
end //
delimiter ;

set @p_avgsalary = 0;
call Average_Salary('HR',@p_avgsalary);


















