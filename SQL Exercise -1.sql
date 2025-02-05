# Question 1:
# 1) Create a Database Bank.
create database Bank;
# Question 2:
# 2) Use the bank databse and create a table with the name “Bank_Inventory” with the following columns
-- Product  with string data type and size 10 --
-- Quantity with numerical data type --
-- Price with data type that can handle all real numbers
-- purchase_cost with data type which always shows two decimal values --
-- estimated_sale_price with data type float --
use Bank;
create table Bank_Inventory
(Product varchar(10) , Quantity int , price int , purchase_cost decimal(8,2) , estimated_sale_price float);
# Question 3:
# 3) Display all column names and their datatype and size in Bank_Inventory.
describe Bank_Inventory;
# Question 4:
# 4) Insert the below two records into Bank_Inventory table .
-- 1st record with values --
			-- Product : PayCard
			-- Quantity: 2 
			-- price : 300.45 
			-- Puchase_cost : 8000.87
			-- estimated_sale_price: 9000.56 --
-- 2nd record with values --
			-- Product : PayPoints
			-- Quantity: 4
			-- price : 200.89 
			-- Puchase_cost : 7000.67
			-- estimated_sale_price: 6700.56
insert into Bank_Inventory values ("PayCard",2,300.45,8000.87,9000.56),
("PayPoints",4,200.89,7000.67,6700.56);
select * from Bank_Inventory;
# Question 5:
# 5) Add a column : Geo_Location to the existing Bank_Inventory table with data type varchar and size 20 .
Alter table Bank_Inventory
add Geo_Location varchar(20);
# Question 6:
# 6) update the Product field from CHAR to VARCHAR size 10 in Bank_Inventory 
alter table Bank_Inventory modify product varchar(10);
# Question 7:
# 7) Reduce the size of the Product field from 10 to 6 and check if it is possible. 
alter table Bank_inventory modify product varchar(6); -- it is not possible because we assigned a value to it that has size more than 6.
# Question 8:
# 8) Bank_inventory table consists of ‘PayCard’ product details .
-- For ‘PayCard’ product, Update the quantity from 2 to 10  
set sql_safe_updates=0;
update bank_inventory set quantity=10 where product='Paycard';

 # Question 9:
# 9) Create a table named as Bank_Holidays with below fields 
-- a) Holiday field which displays or accepts only date 
-- b) Start_time field which also displays or accepts date and time both.  
-- c) End_time field which also displays or accepts date and time along with the timezone also. 
create table Bank_Holidays (Holiday date,start_time datetime, end_time timestamp);
describe bank_holidays;
# Question 10:
# 10) Create Databse Inclass. Use it
create database Inclass;
use inclass;
# Question 11.
# 11) Import File churn1.csv
select * from churn1;
# Q12) Rename the table churn1 to “Churn_Details”.
rename table churn1 to churn_details;
# Q13) Write a query to create  a column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.
select totalamount,monthlyservicecharges,totalamount+monthlyservicecharges new_amount from churn_details;
alter table churn_details add New_Amount decimal(10,2);
set sql_safe_updates=0;
update churn_details set New_Amount=totalamount+monthlyservicecharges;
# Q14) Rename column new_Amount to Amount.
alter table churn_details
rename column New_Amount to Amount;
# Q15) Drop the column “Amount” from the table “Churn_Details”.
alter table churn_details
drop column Amount;