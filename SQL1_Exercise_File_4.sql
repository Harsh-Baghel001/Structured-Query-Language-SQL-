### Use Databse Bank
use bank;
# Create table
Create table Bank_branch_PL
(Branch   varchar(15),
  Banker   Int,
  Product varchar(15) ,
  Cost  Int,
  revenue Int, 
  Estimated_profit Int,   
  month  Int);
  select * from bank_branch_pl;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SuperSave', 30060070, 50060070,  20050070, 1 ) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'SmartSav',   45060070, 57060070, 30050070, 2) ;
Insert into Bank_branch_PL values ( 'Delhi', 99101, 'EasyCash',   66660070, 50090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 99101, 'SmartSav',   66660070, 79090090, 10050077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'EasyCash',   55560070, 61090090, 9950077, 3) ;
Insert into Bank_branch_PL values ( 'Banglr', 77301, 'SmartSav',   54460090, 53090080, 19950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 77301, 'SmartSav',   53060090, 63090080, 29950077, 3) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	40030070, 60070080, 10050070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'BusiCard',  	70030070, 60070080, 25060070,1) ;
Insert into Bank_branch_PL values ( 'Hyd', 88201, 'SmartSav', 	40054070, 60070080, 20050070, 2) ;
Insert into Bank_branch_PL values ( 'Banglr', 99101, 'SmartSav',   88660070, 79090090, 10050077, 3) ;

############################################ Questions ############################################


# Question 1:
# 1) Print the Products which are appearing in bank_inventory_pricing more than once during the month : 1
select product,count(*) from bank_inventory_pricing where month_ = 1 group by product having count(*)>1;
# Question 2:
# 2) Print Products that are appearing more than once in bank_inventory_pricing and whose purchase_cost is
# greater than  estimated_sale_price , assuming estimated_sale_price is 0 when there is no value given
select product,count(*) from bank_inventory_pricing where purchase_cost>ifnull(estimated_sale_price,0) group by product having count(*)>1 ;

# Question 3:
# 3) Print product and the difference of maximum and minimum purchase_cost of each product in Bank_Inventory_Pricing.
select product,max(purchase_cost)-min(purchase_cost) diff from bank_inventory_pricing group by product;
# Question 4:
# 4) Print the sum of Purchase_cost of Bank_inventory_pricing during 1st and 2nd month
select month_,sum(purchase_cost) from bank_inventory_pricing where month_ in (1,2) group by month_;
# Question 5:
# 5) Print Products with an average value of Purchase_cost per product only when exceeding average of 6000.
select product,avg(purchase_cost) from bank_inventory_pricing group by product having avg(purchase_cost)>6000;
# Question 6:
# 6) Print  products whose average of purchase_cost is less than sum of purchase_cost of  Bank_inventory_pricing.
select product,avg(purchase_cost),sum(purchase_cost) from bank_inventory_pricing group by product having avg(purchase_cost)<sum(purchase_cost);
# Question 7:
# 7) Print product and its average of Estimated_sale_price when  purchase_cost is not mentioned.
select product,avg(estimated_sale_price) from bank_inventory_pricing where purchase_cost is null group by product;
# Question 8:
# 8) Display maximum estimated_sale_price of each product  when the product total quantity is exceeding 4 
# and its purchase_cost has some value given.
select product,max(estimated_sale_price) from bank_inventory_pricing where quantity>4 and purchase_cost is null group by product;
# Question 9:
# 9) Print products whose average of purchase_cost per product is less than 200
#  from the table Bank_inventory_pricing
select product,avg(purchase_cost) from bank_inventory_pricing group by product having avg(purchase_cost)<200;
# Question 10:
# 10) Print each Product with its highest estimated_sale_price in bank_inventory_pricing
select product,max(estimated_sale_price) from bank_inventory_pricing group by product;
# Question 11:
# 11) Print product with an increase in  average of estimated_sale_price  by 15% when average product_cost is more than average 
# estimated_sale_price
select product,avg(estimated_sale_price)+((avg(estimated_sale_price)*15)/100) from bank_inventory_pricing
 group by product having avg(purchase_cost)>avg(estimated_sale_price);
# Question 12:
# 12) For product = ‘BusiCard’,  print average of purchase_cost on condition that when purchase_cost  
# is not given, choose any of the higher value between price  and estimated_sale_price
select product,avg(ifnull(purchase_cost,if(price>estimated_sale_price,purchase_cost,price))) from bank_inventory_pricing
 where product='BusiCard' group by product;
# Question 13:
# 13) Calculate average estimated_sale_price for each product .
# For any null estimated_sale_price, replace the value with purchase_cost
select product,avg(ifnull(estimated_sale_price,purchase_cost)) from bank_inventory_pricing group by product ;
# Question 14:
# 14) Print products and their avg price on condition that products appeared in at least three different months.
select product,avg(price) from bank_inventory_pricing group by product having count(distinct(month_))>2;

# Question 15:
# 15) print the average of Purchase_cost from the table Bank_inventory_pricing.If the purchase_cost has  no value given
#   then it’s value is equal to estimated_sale_price.
select avg(ifnull(purchase_cost,estimated_sale_price)) from bank_inventory_pricing ;
# Question 16:
# 16) Print the count of unique Products used in  Bank_inventory_pricing
select count(product),product from bank_inventory_pricing group by product;
