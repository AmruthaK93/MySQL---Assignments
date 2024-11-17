create database Sales;
use Sales;
create table ORDERS(
	Order_id int auto_increment primary key,
    Customer_name   varchar(50),
    Product_category varchar(20) default 'General',
    Ordered_item varchar(30) not null,
    Contact_no varcharacter(15) unique
    );
    desc ORDERS;
    
    # 1. Add a new column named “order_quantity” to the orders table.
    alter table ORDERS add column Order_quantity int;
    
    # 2.  Rename the orders table to the sales_orders table.
    rename table ORDERS to SALES_ORDERS;
    
    # 3. Insert 10 rows into the sales_orders table
    insert into SALES_ORDERS (Order_id,Customer_name,Product_category, Ordered_item,Contact_no ,Order_quantity)
		values('101','John', 'Electronics', 'Laptop', '965632785298',2),
			('102','Adam', 'Electronics', 'Television', '965655785298',3),
                         ('103','Ravi', 'Furniture', 'Table', '965632785346',4),
			('104','Aleena', 'Electronics', 'Refrigerator', '99565578529',2),
			('105','Sara', 'Electronics', 'AC', '965655775298',1),
			('106','Rayan', 'Apparel', 'Shoe', '96565578558',4),
			('107','Govind', default, 'Books', '995656785298',15),
			('108','Fathima', 'General', 'Pen', '965655733298',25),
			('109','Jack', 'Food', 'Cookies', '985655785298',8),
			('110','Smith', default, 'Pencil', '964655785298',10);
            
            select * from SALES_ORDERS;
            
    # 4. Retrieve customer_name and Ordered_Item from the sales_orders table
    select Customer_name,Ordered_item from SALES_ORDERS;
    
    
    # 5.  Use the update command to change the name of the product for any row
    update SALES_ORDERS set Ordered_item='Bag' where Order_id =110;
    
    
    # 6.  Delete the sales_orders table from the database
    drop table SALES_ORDERS;
    
