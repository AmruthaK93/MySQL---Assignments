create database userfunction;
use userfunction;


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
            (3,'Charlie', 'Davis', 14,3.2,105,'Russia'),
            (4,'Diana', 'Miller', 33,4.5,102,'US'),
            (5,'Ethan', 'Brown',2,4.8,106,'Australia'),
            (6,'John', 'Done', 6,3.9,108,'UK'),
            (7,'Aalia', 'Duke', 12,4.6,107,'Japan'),
            (8,'Diana', 'Charlie',4,4.1,103,'Canada'), 
            (9,'David', 'Francis', 33,3.5,102,'US'),
            (10,'Michel', 'Jack',141,4.1,104,'China'),
			(11,'Johan','Mathew',33, 4.5,109,'France'),
			(12,'Alex','Patrick',144, 4,101,'India');
            
            
            select * from PERSONS;
            
            
            # 1. Add a new column called DOB in Persons table with data type as Date.
            
              alter table PERSONS add column dob date;
              
              desc PERSONS;
              
              
			UPDATE PERSONS
						SET dob = CASE
						 WHEN person_id = 1 THEN '1988-01-15'
						 WHEN person_id = 2 THEN '1985-03-25'
						 WHEN person_id = 3 THEN '1983-06-05'
						 WHEN person_id = 4 THEN '1982-02-10'
						 WHEN person_id = 5 THEN '1981-04-25'
						 WHEN person_id = 6 THEN '1987-09-28'
						 WHEN person_id = 7 THEN '1990-10-10'
						 WHEN person_id = 8 THEN '1986-08-15'
						 WHEN person_id = 9 THEN '1980-12-09'
						 WHEN person_id = 10 THEN '1991-07-03'
						 WHEN person_id = 11 THEN '1984-04-02'
						 WHEN person_id = 12 THEN '1992-11-09'
						 ELSE dob  
					   END
			WHERE person_id IS NOT NULL AND dob IS NULL; 
            
            select * from PERSONS;

			 # 2. Write a user-defined function to calculate age using DOB. 
                  
                  DELIMITER $$

					CREATE FUNCTION calculate_age(dob DATE)
					RETURNS INT
					DETERMINISTIC
					BEGIN
						DECLARE current_year INT;
						DECLARE birth_year INT;
						DECLARE birth_month INT;
						DECLARE birth_day INT;
						DECLARE age INT;
    
					-- Get the current year, month, and day
						SET current_year = YEAR(CURDATE());
						SET birth_year = YEAR(dob);
						SET birth_month = MONTH(dob);
						SET birth_day = DAY(dob);
						
					-- Calculate the initial age difference
						SET age = current_year - birth_year;
																																							
					-- Adjust if the birthday hasn't happened yet this year
						IF (birth_month > MONTH(CURDATE())) OR 
						   (birth_month = MONTH(CURDATE()) AND birth_day > DAY(CURDATE())) THEN
							SET age = age - 1;
						END IF;
                        
						RETURN age;
						END $$

                     DELIMITER ;

             
      # 3. Write a select query to fetch the Age of all persons using the function that has been created          
           select fname as name, calculate_age(dob) as age from PERSONS;
           
	
     # 4. Find the length of each country name in the Country table.
          select country_name, length(country_name) as LengthOfCountryName from COUNTRY;
          
          
	 # 5. Extract the first three characters of each country's name in the Country table.
          select country_name,substring(country_name,1,3) as First_3_Characters_of_CountryName from COUNTRY;
          
          
     #  6. Convert all country names to uppercase and lowercase in the Country table  	
          -- Uppercase
          select country_name, upper(country_name) as Uppercase_CountryName from COUNTRY; 
          
          
          -- Lowercase
          select country_name, lower(country_name) as Uppercase_CountryName from COUNTRY;

          
                         
    
 
