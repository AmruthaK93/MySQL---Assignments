create database subquery;
use subquery;

	create table COUNTRY(
		country_id int primary key auto_increment,
		country_name varchar(50),
		population int,
		area decimal(5,2));
		
	desc COUNTRY;
    
    
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
        
        
	insert into PERSONS(person_id,fname,lname,population,rating,country_id,country_name) values
			(1,'Alice','Johnson',21, 2.5,110,'Brazil'),
			(2,'Bob', 'Smith',144,5,101,'India'),
			(3,'Charlie', 'Davis', 14,3.2,105,'Russia'),
			(4,'Diana', 'Miller', 33,4.2,102,'US'),
			(5,'Ethan', 'Brown',2,4.8,106,'Australia'),
			(6,'John', 'Done', 6,3.9,108,'UK'),
			(7,'Aalia', 'Duke', 12,4,107,'Japan'),
			(8,'Diana', 'Charlie',4,4.1,103,'Canada'), 
			(9,'David', 'Francis', 33,3.5,102,'US'),
			(10,'Michel', 'Jack',141,2.1,104,'China'),
			(11,'Johan','Mathew',33, 1.5,109,'France'),
			(12,'Alex','Patrick',144, 4,101,'India'),
                        (13,'Carolin','Marshel',33, 3,102,'US');
	select * from PERSONS;
    
    
    
    # 1. Find the number of persons in each country.
		 select country_name, count(person_id) as Number_of_Persons from PERSONS group by country_name order by number_of_persons;
        
        
	# 2. Find the number of persons in each country sorted from high to low. 
		select country_name, count(person_id) as number_of_persons from PERSONS group by country_name order by number_of_persons desc;
          
          
	# 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
         select country_name, avg(rating) as Average_Rating from PERSONS group by country_name having Average_Rating>3.0 order by Average_Rating;
         
      
	# 4. Find the countries with the not same rating as the USA. (Use Subqueries) 
         SELECT country_name, AVG(rating) AS average_rating FROM persons 
         GROUP BY country_name HAVING AVG(rating) != (SELECT AVG(rating) FROM persons WHERE country_name = 'US') ORDER BY average_rating ;
         
         select country_name,rating from PERSONS where rating=(select rating from persons where country_name='US');
         
         
	 # 5. Select all countries whose population is greater than the average population of all nations
          select avg(population) from COUNTRY;

select country_name, population from COUNTRY 
where
population > (select avg(population) from COUNTRY);









create database PRODUCTS;
use PRODUCTS;


create table CUSTOMER (
	customer_id int primary key,
    fname varchar(20),
    lname varchar(20),
    email varchar(50),
    phone_no varchar(20),
    address varchar(200),
    city varchar(30),
    state varchar(30),
    zip_code varchar(30),
    country varchar(30)); 
    
desc CUSTOMER;

-- Inserting 12 records into the Customer table 
insert into  CUSTOMER (customer_id,fname,lname,email, phone_no, address, city,state, zip_code, country)
values 
		(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
		(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St', 'Los Angeles', 'California', '90001', 'USA'),
		(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', '789 Pine St', 'London', 'KYC', 'SW1A 1AA', 'UK'),
		(4, 'Bob', 'Brown', 'bob.brown@example.com', '555-4321', '101 Maple St', 'Toronto', 'ON', 'M5H 2N2', 'Canada'),
		(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '555-1122', '202 Cedar St', 'Berlin', 'MJK', '10115', 'Germany'),
		(6, 'David', 'Miller', 'david.miller@example.com', '555-2233', '303 Birch St', 'Paris', 'Ile-de-France', '75001', 'France'),
		(7, 'Eva', 'Wilson', 'eva.wilson@example.com', '555-3344', '404 Redwood St', 'Sydney', 'NSW', '2000', 'Australia'),
		(8, 'Frank', 'Moore', 'frank.moore@example.com', '555-4455', '505 Pineapple St', 'Tokyo', 'Kanto', '100-0001', 'Japan'),
		(9, 'Grace', 'Taylor', 'grace.taylor@example.com', '555-5566', '606 Lemon St', 'Cape Town', 'WC', '8001', 'South Africa'),
		(10, 'Henry', 'Anderson', 'henry.anderson@example.com', '555-6677', '707 Apple St', 'Dalas', 'DHMK', '01000', 'USA'),
 		(11, 'Irene', 'King', 'irene.king@example.com', '555-7788', '808 Cherry St', 'Chicago', 'IL', '60610', 'USA'),
		(12, 'Jack', 'Lee', 'jack.lee@example.com', '555-8899', '909 Ash St', 'San Francisco', 'CA', '94102', 'USA');

select * from CUSTOMER;



#  1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
    
	  create view customer_info as select concat(fname,' ',lname) as Full_Name, email from CUSTOMER;
      select * from customer_info;
      
      
#  2. Create a view named US_Customers that displays customers located in the US.

	  create view US_Customers as select fname,country from CUSTOMER where country = 'USA';
      select * from US_Customers;
     
     
#  3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.

	  create view Customer_Details as select concat(fname,' ',lname) as Full_Name,email,phone_no,state from CUSTOMER;
      select * from Customer_Details ;
      
      
# 4. Update phone numbers of customers who live in California for Customer_details view
	 
     update Customer_Details SET Phone_no = '222-2222' WHERE State = 'california';
	 select * from Customer_Details ;
     
     
#  5. Count the number of customers in each country and show only country with more than 4 customers

	  select country, COUNT(*) as Customer_Count FROM customer group by country having COUNT(*) > 4;
      
      
#  6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view

	  select state, COUNT(*) as Customer_Count from Customer_Details group by state;
      
      
#  7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order

	  select * from Customer_Details order by state asc;

