create database School;
use School;
create table STUDENTS(
	Roll_No int,
    Full_Name varchar(50),
    Gender char(1),
    Date_of_Birth date,
    Email_ID varchar(100),
    Mark int,
    Grade char(1) 
    );
	desc STUDENTS;
    
    # 1.  Use the select command to display the table
    select * from STUDENTS;
    
    # 2. Add a column named Contact to the STUDENT table
    alter table STUDENTS add column Contact varchar(15);
    
    # 3. Remove the Grade column from the Student table
    alter table STUDENTS drop column Grade;
     
     # 4. Rename the table to CLASSTEN
     rename  table STUDENTS to CLASSTEN;
     
     desc CLASSTEN;
     
     # 5. Delete all rows from the table
     truncate table CLASSTEN;
     
     # 6. Remove the table from the database
     drop table CLASSTEN;
     
   