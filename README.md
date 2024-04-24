The codebase is set up so that you just need to enter the data into the queries in the CLI. The CLI automatically connects to the database. The following shows the instructions for each query. 

How to Setup Your Codebase for Each Option:

INSERT
Select an option (1-11): 1 (enter)
Which table would you like to insert data: [any valid table name from database] (enter)
Which columns would you like to insert into (comma-separated): [any list of columns from the table listed prior, ex: Column1, Column2, …, ColumnK] (enter)
What are your values (comma-separated): [list of values that meet the constraints on each column] (enter)
Inserted Successfully! : Data correctly inserted into the table, error from postgre will show here if inputs are not correct or fails

DELETE
Select an option (1-11): 2 (enter)
Which table would you like to delete data from: [any valid table name from database] (enter)
What are your conditions to delete data (ENTER if none): [any valid condition from postgresql ex: tenure>10, gender=“Male”, tenure>10 AND gender=“Male”, etc.], if there are no conditions or you wrote all your conditions, then (enter)
Data deleted successfully: Data correctly deleted from the table, error from postgre will show here if inputs are not correct or fails. 

UPDATE
Select an option (1-11): 3 (enter)
Which table name would you like to update: [any valid table name from database] (enter)
What are the columns and values you would like to update: [columns from table = value you would like to insert into that column ex: column1=value1, column2=value2, …] (enter)
What are your conditions to update data (ENTER if none): [any valid condition from postgresql ex: tenure>10, gender=“Male”, tenure>10 AND gender=“Male”, etc.], if there are no conditions or you wrote all your conditions, then (enter)
Data updated successfully: Data correctly updated in the table, error from postgre will show here if inputs are not correct or fails.

SEARCH 
Select an option (1-11): 4 (enter)
Which table would you like to view: [any valid table name from database] (enter)
Which columns would you like to select from (comma-separated), or ‘*’ for all: [any list of columns from the table listed prior, ex: Column1, Column2, …, ColumnK; or * if you want the entire table] (enter)
Enter the conditions (ENTER if none): [any valid condition from postgresql,  ex: tenure>10, gender=“Male”, tenure>10 AND gender=“Male”, etc.], if there are no conditions or you wrote all your conditions, then (enter)
The columns of the table, or the entire table will be displayed. Error from postgre will show here if inputs are not correct or fails. 

AGGREGATE
Select an option (1-11): 5 (enter)
Which table would you like to perform the aggregation: [any valid table name from database] (enter)
Which columns would you like to perform the aggregation on (comma-separated), or ‘*’ for all: [any list of columns from the table listed prior, ex: Column1, Column2, …, ColumnK; or * if you want the entire table] (enter)
Enter the aggregation function:  [any function from postgre that can be done on the columns provided, ex: SUM, MAX, MIN, AVG, COUNT, etc. ] (enter)
The output from applying the function to the table will be displayed. Error from postgre will show here if inputs are not correct or fails.

SORTING
Select an option (1-11): 6 (enter)
Which table would you like to view: [any valid table name from database] (enter)
Which columns would you like to sort by: [any list of columns from the table listed prior, ex: Column1, Column2, …, ColumnK] (enter)
What sorting order: [ASC or DESC] (enter)
The output from applying the sorting order to the table will be displayed. Error from postgre will show here if inputs are not correct or fails. 

JOINS
Select an option (1-11): 7 (enter)
What is the first table name:  [any valid table name from database] (enter)
What is the second table name: [table name that has a matching column to table 1] (enter)
What is your join condition: [name of column that matches in both tables] (enter)
The output from applying the join to the tables will be displayed. Error from postgre will show here if inputs are not correct or fails. 

GROUPING
Select an option (1-11): 8 (enter)
What is the table you would like to group:  [any valid table name from database] (enter)
What column would you like to group by: [any column from the table listed prior] (enter)
Would you like a column to aggregate by (* if not): [any column from the table listed prior, or ‘*’ ] (enter)
The output from applying the group by to the table will be displayed. Error from postgre will show here if inputs are not correct or fails. 

SUBQUERIES
Select an option (1-11): 9 (enter)
What is the main table you would like to search in: [any valid table name from database] (enter)
What column would you like to search in: [any column from the table listed prior] (enter)
Would you like to check in or not in (IN/NOT IN): [IN or NOT IN] (enter)
What is the sub table you would like to search in: [any valid table name from database, but most likely something related to the first table entered] (enter)
The output from the query with the applied subquery will be displayed. Error from postgre will show here if inputs are not correct or fails.

TRANSACTION
Select an option (1-11): 10 (enter)
What command are you looking to perform? [any number in the range (1-3)]
If the transaction operation is performed correctly, nothing will be displayed. Error from postgre will show here if inputs are not correct or fails.

EXIT
Select an option (1-11): 11 (enter)
CLI will stop running and the python file will close. 
