### Use Databse Inclass (Created on Day1)
### Import all the files given in the dataset
use Inclass;
select * from churn1;
-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------

# Q1. Find all the players who were present in either the test match 1 or in the test match 2.
select player_name from cricket_1 union select player_name from cricket_2;
# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50
select player_id,runs,player_name from cricket_1 where runs>50;
# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.
select * from cricket_1 where player_name like 'y%v';
# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.
 select * from cricket_1 where player_name not like '%t';
-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------
describe cric_combined;
# Q5. Write a MySQL query to add a column PC_Ratio to the table that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)
alter table cric_combined add PC_Ratio decimal(10,2);
set sql_safe_updates=0;
update cric_combined set Pc_Ratio=popularity/charisma; 
# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.
select pc_ratio from cric_combined order by pc_ratio desc limit 5;
# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it.
select player_id,player_name from cric_combined where player_name like '%d%'; 
# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.
select player_id,pc_ratio from cric_combined where pc_ratio between 0.12 and 0.25;

-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------

# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null.
 select player_id,player_name from new_cricket where charisma is null;
# Q10. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.
 select player_id,player_name,Charisma from new_cricket where charisma >25;
-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------
rename table churn1 to churn_details;
# Q11. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
select customerid,internetconnection,gender from churn_details where internetconnection like '_i%';
# Q12. Find the records where the tenure is 6x, where x is any number.
select * from churn_details where tenure like '6_';
## Use Bank Database
use bank;
# 13) Select all columns from Bank_Inventory without mentioning any column name
select * from Bank_inventory ;
# 14)  Display output of PRODUCT field as NEW_PRODUCT in  Bank_Inventory table 
select product as New_product from Bank_inventory;
# 15)  Display only one record from bank_Inventory 
select * from bank_inventory limit 1;