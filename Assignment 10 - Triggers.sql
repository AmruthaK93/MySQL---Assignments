create database school;
use school;


# 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 

create table TEACHERS(
	teacher_id int primary key,
    name varchar(50),
    subject varchar(25),
    experience int,
    salary int);
    
    
-- Insert 8 rows  into the teachers table
insert into TEACHERS (teacher_id, name, subject, experience, salary)
values	(1, 'John Doe', 'Mathematics', 5, 50000),
		(2, 'Jane Smith', 'English', 8, 55000),
		(3, 'Emily Johnson', 'Science', 6, 53000),
		(4, 'Michael Brown', 'History', 10, 60000),
		(5, 'Sara Davis', 'Geography', 3, 48000),
		(6, 'David Wilson', 'Computer Science', 7, 65000),
		(7, 'Jessica Taylor', 'Music', 4, 47000),
		(8, 'Robert Martinez', 'Physical Education', 9, 59000);



#  2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.

	delimiter //
    create trigger  Before_Insert_Teacher 
    before insert on TEACHERS
    for each row
    begin
		if new.salary < 0 then 
		signal sqlstate '45000'
		set message_text = 'Salary Cannot Be Negative';
		end if ;
	end //
	delimiter ;
    
    
-- Insert a new row into teachers
insert into TEACHERS (teacher_id, name, subject, experience, salary) 
values (9, 'Anna Lee', 'Art', 2, -46000);


# 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.
	
    create table TEACHERSLOG(
	logid int auto_increment primary key,
    teacher_id int, 
    actiontype varchar(50),
    actiontime datetime,
    details varchar(250));
    
    
	delimiter //
	create trigger After_Insert_Teachers
	after insert on TEACHERS
	for each row 
	begin
	insert into TEACHERSLOG(teacher_id,actiontype,actiontime,details)
	values(new.teacher_id,'Insert',now(),concat('Teacher ',new.name, ' added' ));
	end //
	delimiter ;
    
    
-- Insert a new row into teachers
insert into TEACHERS (teacher_id, name, subject, experience, salary) 
values (9, 'Anna Lee', 'Art', 2, 46000);


-- Check the teachers_log table
select * from TEACHERSLOG;



# 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 5 years.

	delimiter //
	create trigger Before_Delete_Teachers
	before Delete on TEACHERS
	for each row
	begin
		if old.experience > 5 then 
		signal sqlstate '45000'
		set message_text = 'Cann not Delete the Teachers with More than 5 Years Experience';
		end if ;
	end //
	delimiter ;
    
    
    delete from TEACHERS where teacher_id = 9;
    
    
    
#  5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

	delimiter //
	create trigger After_Delete_Teacher
	after delete on TEACHERS
	for each row 
	begin
		insert into TEACHERSLOG(teacher_id,actiontype,actiontime,details)
		values(old.teacher_id,'Delete',now(),concat('Teacher ',old.name, ' deleted' ));
	end //
	delimiter ;
    
    -- Delete a row from Teachers Table
    delete from TEACHERS where teacher_id = 9;
    
    
-- Check the teachers_log table
select * from TEACHERSLOG;
    