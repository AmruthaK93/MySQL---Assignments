create database universal;
use universal;
create table COUNTRY(
	country_id int primary key auto_increment,
    country_name varchar(50),
    population_in_Cr int,
    area_in_LKM int);
    
    
    desc COUNTRY;
   
    
    create table PERSONS(
		person_id int primary key auto_increment,
        fname varchar(50),
        lname varchar(50),
        population_in_Cr int,
        rating decimal(3,2),
        country_id int,
        country_name varchar(50),
        foreign key (country_id) references  COUNTRY(country_id));
        
	
      desc PERSONS;
      
      
      
	insert into COUNTRY(country_id,country_name,population_in_Cr,area_in_LKM) values
		(101,'India',144,32),
        (102,'US',33,98),
        (103,'Canada',4,99),
        (104,'China',141,95),
        (105,'Russia',14,101),
        (106,'Australia',2,77),
        (107,'Japan',12,3),
        (108,'UK',6,2),
        (109,'France',7,5),
        (110,'Brazil',21,85);
        
        select * from COUNTRY;
        
       insert into PERSONS(person_id,fname,lname,population_in_Cr,rating,country_id,country_name) values
			(1,'Alice','Johnson',21, 2.5,110,'Brazil'),
            (2,'Bob', 'Smith',144,5,101,'India'),
            (3,'Charlie', 'Davis', 14,3.2,105,null),
            (4,'Diana', 'Miller', 33,4.5,102,'US'),
            (5,'Ethan', 'Brown',2,4.8,106,'Australia'),
            (6,'John', 'Done', 6,3.9,108,'UK'),
            (7,'Aalia', 'Duke', 12,4.6,107,'Japan'),
            (8,'Diana', 'Charlie',4,4.1,103,'Canada'), 
            (9,'David', 'Francis', 33,3.5,109,'US'),
            (10,'Michel', 'Jack',141,4.1,104,'China');
            
            select * from PERSONS;
            
            
            # 1. List the distinct country names from the Persons table
            select distinct(country_name)  from PERSONS ;
            
            
            
            # 2. Select first names and last names from the Persons table with aliases
            select fname,lname,concat(fname, " ", lname) as fullname from PERSONS;
            
            
            
            # 3. Find all persons with a rating greater than 4.0
            select fname,rating from PERSONS where rating>4;
            
            
            
            # 4. Find countries with a population greater than 10 cr
            select country_name,population_in_Cr from COUNTRY where population_in_Cr > 10; 
            
            
            
            # 5. Find persons who are from 'USA' or have a rating greater than 4.5
            select fname,country_name,rating from PERSONS where country_name = 'US' or rating >4.5;
            
            
            
            # 6. Find all persons where the country name is NULL
            select fname from PERSONS where country_name is null;
            
            
            
            # 7. Find all persons from the countries 'USA', 'Canada', and 'UK
            select fname,country_name from PERSONS where country_name in( 'US','Canada','UK');
            
            
            
            # 8. Find all persons not from the countries 'India' and 'Australia' 
            select fname,country_name from PERSONS where country_name not in ('India','Australia') or country_name is null;
            
            
            
            
            # 9. Find all countries with a population between 5 lakhs and 20 lakhs
            select country_name,population_in_Cr from COUNTRY where population_in_Cr between 20 and 50;
            
            
            
            # 10. Find all countries whose names do not start with 'C'
            select country_name from COUNTRY where country_name not like 'C%';
	
 
	 
