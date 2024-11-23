create database joints;
use joints;

create table COUNTRY(
	country_id int primary key auto_increment,
    country_name varchar(50),
    population int,
    area decimal(5,2));
    
    desc COUNTRY;
    
    
    insert into COUNTRY(country_id,country_name,population,area) values
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
    
    
		
        
	create table PERSONS(
	person_id int primary key auto_increment,
	fname varchar(50),
	lname varchar(50),
	population int,
	rating decimal(3,2),
	country_id int,
	country_name varchar(50),
	foreign key (country_id) references  COUNTRY(country_id));
    
    desc PERSONS;
    
    
      insert into PERSONS(person_id,fname,lname,population,rating,country_id,country_name) values
			(1,'Alice','Johnson',21, 2.5,110,'Brazil'),
            (2,'Bob', 'Smith',144,5,101,'India'),
            (3,'Diana', 'Miller', 33,4.5,109,null),
            (4,'Ethan', 'Brown',2,4.8,106,'Australia'),
            (5,'John', 'Done', 6,3.9,108,'UK'),
            (6,'Aalia', 'Duke', 12,4.6,107,'Japan'),
            (7,'Diana', 'Charlie',4,4.1,103,'Canada'), 
            (8,'David', 'Francis', 33,3.5,102,'US'),
            (9,'Michel', 'Jack',141,4.1,104,'China'),
			(10,'Jovan','James',33, 4.5,102,'US'),
			(11,'Alex','Patrick',144, 4,101,'India');
            
            select * from PERSONS;
            
            
    
    # 1. Inner Join
    
    select c.country_id, c.country_name,c.population,p.person_id,p.rating from country c
    inner join persons p on c.country_id = p.country_id;
    
    
    # 1. Left Join
    
    select c.country_id, c.country_name, c.population,p.person_id,p.fname,p.rating from country c    
    left join persons p on c.country_id = p.country_id;
    
    
    # 1. Right Join
    
      select c.country_id, c.country_name, c.population,p.person_id,p.fname,p.rating from country c    
      right join persons p on c.country_id = p.country_id;
      
      
	# 2. List all distinct country names from both the Country and Persons tables
        select distinct country_name as Distinct_Country_Name from COUNTRY union select distinct country_name as Distinct_Country_Name from PERSONS ;
        
        
	# 3. List all country names from both the Country and Persons tables, including duplicates
          select country_name as All_Country_Name from COUNTRY union all select country_name as All_Country_Name from PERSONS ;
          
          
	 # 4. Round the ratings of all persons to the nearest integer in the Persons table
		  select rating, round(rating,0) as Rounded_Rating from PERSONS;