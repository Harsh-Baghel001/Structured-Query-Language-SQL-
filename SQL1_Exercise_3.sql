## Use Database Bank 
## Use table Bank_Inventory

# 1) What is the value of Geo_Location for product : ‘PayCard’?
use bank;
describe bank_inventory;
select * from bank_inventory;
select geo_location from bank_inventory where product='paycard';
# 2) How many characters does the  Product : ‘PayCard’ store in the Bank_Inventory table.
select length(product) from bank_inventory where product='paycard';
# Question 3:
# a) Update the Geo_Location field from NULL to ‘Delhi-City’ 
# b) How many characters does the  Geo_Location field value ‘Delhi-City’ stores in the Bank_Inventory table
set sql_safe_updates=0;
update bank_inventory set geo_location='Delhi-City' where geo_location is null;
select length(geo_location) from bank_inventory where geo_location='Delhi-City';
# Use table Bank_Holidays
 # Question 4:
# 4) Step 1: Insert today’s date details in all fields of Bank_Holidays 
-- Step 2: After step1, perform the below 
-- Postpone Holiday to next day by updating the Holiday field 
insert into bank_holidays values(current_date,current_date,current_date);
update bank_holidays set holiday=adddate(holiday,1);
# Question 5:
# 5) Modify  the Start_time data with today's datetime in the Bank_Holidays table 
update bank_holidays set start_time=now();
# Question 6:
# 6) Update the End_time with UTC time(GMT Time) in the Bank_Holidays table. 
update bank_holidays set end_time=utc_timestamp();
# Question 7:
# 7) Modify  the End_time data with today's datetime in the Bank_Holidays table 
update bank_holidays set end_time=current_timestamp();
# Question 8:
# 8) Display the first five rows of the Geo_location field of Bank_Inventory.
select geo_location from bank_inventory limit 5;
## Use Database Inclass
use inclass;
-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
select * from new_cricket;
-- --------------------------------------------------------
# Q9. Write a MySQL query to display all the NULL values  in the column Charisma imputed with 0.
select ifnull(charisma,0) from new_cricket ;
# Q10. Separate all Player_Id into single numeric ids (example PL1 to be converted as 1, PL2 as 2 , ... PL12 as 12 ).
select trim('PL'from player_id) from new_cricket;
-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------
describe churn_details;
# Q11. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode.
select floor(monthlyservicecharges) MonthlyServiceCharges_new,ceil(totalamount) Total_Amount_new from churn_details where PaymentMethod='Electronic check';
# Q12. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma, 
-- display 0 for whom the charisma value is NULL.
select upper(player_name) Capital_Player_name,ifnull(charisma,0) new_charisma from new_cricket order by player_name;
-- --------------------------------------------------
## Use Database Bank
use bank;
-- ------------------------------------------------
# Pre-Requisites:
# Step 1 : Create table as below.
/*Product string size 15 ,
Quantity integer ,
Price real,
purchase_cost decimal with size 6,2,
Estimated_sale_price float,
Month integer*/
create table bank_inventory_pricing (Product varchar(15),Quantity int,price int,purchase_cost decimal(6,2),estimated_sale_price float,Month_ int);
# Step2: 
# Insert records for above 
Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 300.45, 8000.87, 9000.56, 1 ) ;
Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 800.45, 5000.80, 8700.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayCard'   , 2 , 500.45, 6000.47, 7400.56, 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'PayPoints' , 4 , 390.87, 7000.67, 6700.56, 2)  ;
 Insert into Bank_Inventory_pricing values ( 'SmartPay' , 5  , 290.69, 5600.77, 3200.12 , 1)  ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    3 , NULL, 4600.67, 3233.11 , 1 ) ;
 Insert into Bank_Inventory_pricing values ( 'MaxGain',    6 , 220.39, 4690.67, NULL , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , 560.30, NULL, 4200.13 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 6 , NULL, 2600.77, 3200.13 ,2 ) ;
 Insert into Bank_Inventory_pricing values ( 'SuperSave', 9 , NULL, 5400.71, 9200.13 ,3 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, NULL ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, 5900.97, 8999.34 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'SmartSav',   3 , 250.89, NULL , 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 ,1 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 2 ) ;
 Insert into Bank_Inventory_pricing values ( 'EasyCash',   3 , 250.89, NULL, 5610.82 , 3 ) ;
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 3000.99 , NULL, 3500, 3) ; 
 Insert into Bank_Inventory_pricing values ( "BusiCard"  ,  1, 4000.99 , NULL, 3500, 2) ; 
# Question 13:
# 13) Print sum of Purchase_cost and average of estimated_sale_price of table
# Bank_inventory_pricing  during 2nd month . 
select sum(purchase_cost),avg(estimated_sale_price) from bank_inventory_pricing where month_=2;
# Question 14:
# 14) Print average of estimated_sale_price upto two decimals from bank_inventory_pricing table.
select round(avg(estimated_sale_price),2) from bank_inventory_pricing;
# Question 15:
# 15) Print the sum of  purchase_cost of Bank_Inventory_pricing table with default value of 2000/-
# if there is no value given
select sum(ifnull(purchase_cost,2000)) from bank_inventory_pricing;

# Question 16:
# 16) Print unique records of bank_inventory_pricing without displaying the month.
describe bank_inventory_pricing;
select distinct Product,
Quantity,
price,
purchase_cost,
estimated_sale_price from bank_inventory_pricing;


