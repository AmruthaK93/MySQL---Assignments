create database continents;
use continents;
create table COUNTRY(
	country_id int primary key auto_increment,
    country_name varchar(50),
    population_in_Cr int,
    area_in_LKM decimal(5,2));
    
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
            (3,'Charlie', 'Davis', 14,3.2,105,'Russia'),
            (4,'Diana', 'Miller', 33,4.5,102,'US'),
            (5,'Ethan', 'Brown',2,4.8,106,'Australia'),
            (6,'John', 'Done', 6,3.9,108,'UK'),
            (7,'Aalia', 'Duke', 12,4.6,107,'Japan'),
            (8,'Diana', 'Charlie',4,4.1,103,'Canada'), 
            (9,'David', 'Francis', 33,3.5,109,'US'),
            (10,'Michel', 'Jack',141,4.1,104,'China');
            
            
            select * from PERSONS;
            
            
            
          # 1. Write an SQL query to print the first three characters of Country_name from the Country table.
                 select left(country_name,3) as first_3_characters_of_Country_name from COUNTRY;
          
          
         # 2. Write an SQL query to concatenate first name and last name from Persons table.
              select concat(fname," ",lname) as fullname from PERSONS;
         
         
        # 3. Write an SQL query to count the number of unique country names from Persons table.
             select distinct(country_name) as distinct_country_name from PERSONS;
        
        
       # 4. Write a query to print the maximum population from the Country table.
            SELECT country_name, population_in_Cr as Maximum_Population FROM COUNTRY WHERE  population_in_Cr = (SELECT MAX(population_in_Cr) FROM COUNTRY);
       
       
      # 5. Write a query to print the minimum population from Persons table.
           select country_name,population_in_Cr as Minimum_Population from PERSONS where population_in_Cr = (SELECT min(population_in_Cr) from PERSONS);
       
       
       # 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
			  insert into PERSONS(person_id,fname,lname,population_in_Cr,rating,country_id,country_name) values
						 (11,'Johan',null,33, 4.5,109,'US'),
                         (12,'Alex',null,144, 4,101,'India');
                         
		select * from PERSONS;	
        
        
			select count( case when lname is null then 1 end) as NullLnameCount, 
                  count( case when lname is not null then 2 end) as NonNullLnameCount,
                   count(lname is null) as TotalLnameCount from PERSONS;



      #  7. Write a query to find the number of rows in the Persons table. 
      select  count(*) as Total_no_of_Rows from PERSONS;
      
      
     #  8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT)
           select country_name,population_in_Cr from COUNTRY limit 3;
     
     
     #  9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
           select * from Country order by RAND() LIMIT 3;
           
           
	#  10. List all persons ordered by their rating in descending order.
           select fname,rating  from  PERSONS order by rating desc; 
           
           
    #  11. Find the total population for each country in the Persons table.   
		   select distinct country_name,population_in_Cr from PERSONS;
           
           
	#  12. Find countries in the Persons table with a total population greater than 50,000 
           select distinctrow country_name,population_in_Cr from PERSONS where population_in_Cr > 20;
           
           
	#  13. List the total number of persons and average rating for each country, but only for countries with more than 1 persons, ordered by the average rating in ascending order.
        select country_name, count(*) as Total_Persons, avg(Rating) as Average_Rating from PERSONS
		group by country_name having count(*) > 1 order by Average_Rating ASC;

     