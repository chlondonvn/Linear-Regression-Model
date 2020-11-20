#Create a database called house_price_regression.
#Create a table house_price_data with the same columns as given in the csv file. Please make sure you use the correct data types for the columns.
#Import the data from the csv file into the table. Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. To not modify the original data, if you want you can create a copy of the csv file as well. Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk: SHOW VARIABLES LIKE 'local_infile'; -- This query would show you the status of the variable ‘local_infile’. If it is off, use the next command, otherwise you should be good to go
#SET GLOBAL local_infile = 1;

#Select all the data from table house_price_data to check if the data was imported correctly

SELECT *
FROM house_price_data;

#Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. Select all the
# data from the table to verify if the command worked. Limit your returned results to 10. 

ALTER TABLE house_price_data
DROP COLUMN date;

SELECT *
FROM house_price_data
LIMIT 10;


#Use sql query to find how many rows of data you have

SELECT COUNT(*) 
FROM house_price_data;

#creating connection to view results on notebook
#connection_string = 'mysql+pymysql://root:' + password + '@localhost/house_price_regression'
#engine = create_engine(connection_string)
#data = pd.read_sql_query('SELECT * FROM house_price_regression.house_price_data', engine)

#Work was done after this point on jupyter Notebook, please see jupyter notebook.

#In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
#What is the average sqft_living of the houses grouped by bedrooms? The returned result should have only two columns, bedrooms and Average of the sqft_living. Use an alias to change the name of the second column.

SELECT AVG(sqft_living) AS avg_sqft,d.bedrooms
FROM house_price_regression.house_price_data d 
GROUP BY bedrooms
ORDER BY bedrooms DESC;

#What is the average price of the houses with a waterfront and without a waterfront? The returned result should have only two columns, waterfront and Average of the prices.
# Use an alias to change the name of the second column.

SELECT AVG(price) AS avg_price,
waterfront
FROM house_price_data
GROUP BY waterfront
ORDER BY avg_price DESC;

#Is there any correlation between the columns condition and grade? You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. Visually check if there is a positive correlation 
#or negative correlation or no correlation between the variables.

SELECT AVG(d.condition) AS AVG_condition,
d.grade
FROM house_price_data d
GROUP BY grade
ORDER BY grade DESC;
corr_data = pd.read_sql_query(query1, engine) #This was run on Jupyter Notebook!

## Cheking for correlation visually with AVG(condition): 
#corr_con_grd= corr_data.corr(method='pearson')  
#fig, ax = plt.subplots(figsize=(12, 8))
#ax = sns.heatmap(corr_con_grd, annot=True)
#plt.show()


#One of the customers is only interested in the following houses:
#Number of bedrooms either 3 or 4
#Bathrooms more than 3
#One Floor
#No waterfront
#Condition should be 3 at least
#Grade should be 5 at least
#Price less than 300000

SELECT *
FROM house_price_data d
WHERE d.bedrooms = 3 OR 4
AND d.bathrooms > 3
AND d.floors = 1
AND d.waterfront = 0
AND d.condition >= 3
AND d.grade >= 5
AND d.price < 300000;

#Your manager wants to find out the list of properties whose prices are twice more than the average of 
#all the properties in the database. Write a query to show them the list of such properties. 
#You might need to use a sub query for this problem.

SELECT d.id, d.price, 
(SELECT AVG(price) FROM house_price_data e) AS average_price
FROM house_price_data d
WHERE d.price > 1080593.1470
ORDER BY d.price DESC;
USE house_price_regression;

#Since this is something that the senior management is regularly interested in, create a view of the same query.

USE house_price_regression;
CREATE VIEW houses_above_average AS
SELECT d.id, d.price, (SELECT AVG(price) FROM house_price_data e) AS average_price,
(SELECT (AVG(price)*2) FROM house_price_data e) AS double_average_price
FROM house_price_data d
WHERE d.price > 1080593.1470
ORDER BY d.price DESC;

#Most customers are interested in properties with three or four bedrooms. 
#What is the difference in average prices of the properties with three and four bedrooms?

SELECT  AVG(d.price) AS avg_4,
(SELECT AVG(e.price) FROM house_price_data e WHERE bedrooms = 3) AS avg_3
FROM house_price_data d
WHERE bedrooms = 4

#What are the different locations where properties are available in your database? (distinct zip codes)

SELECT  DISTINCT(zipcode)
FROM house_price_data;

#Show the list of all the properties that were renovated.

SELECT d.id AS Renovated_Properties, 
sqft_lot, sqft_lot15
FROM house_price_data d
WHERE sqft_lot != sqft_lot15;

SELECT d.id AS Renovated_Properties,
yr_renovated
FROM house_price_data d
WHERE yr_renovated != 0;

#Provide the details of the property that is the 11th most expensive property in your database.
SELECT *
FROM house_price_data d
ORDER BY d.price DESC
LIMIT 11;