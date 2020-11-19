<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Linear Regression Model


    
  *19.11.2020*

*[DATA ANALYSIS 10-20 Cohort, Berlin]*

## Content
- [Project Description](#project-description)
- [Dataset](#dataset)
- [Workflow](#workflow)
- [Review](#review)
- [File Structure](#file-structure)


## Project Description

Assignment to complete three main tasks, firstly build a linear regression model to predict the housing price using the given dataset, completing a set of 18 tasks of MySQL queries and a set of 10 Tableau data visualization tasks. 


## Dataset


### Data Housing 

This dataset contains house sale prices for King County, which includes Seattle. It includes homes sold between May 2014 and May 2015.
The dataframe consist of:  21597 rows × 20 columns
No Null/NaN values were found.

Structure of columns:

  -id :a notation for a house
  
  -date: Date house was sold
  
  -price: Price is prediction target
  
  -bedrooms: Number of Bedrooms/House
  
  -bathrooms: Number of bathrooms/bedrooms
  
  -sqft_living: square footage of the home
  
  -sqft_lot: square footage of the lot
  
  -floors :Total floors (levels) in house
  
  -waterfront :House which has a view to a waterfront
  
  -view: Has been viewed
  
  -condition :How good the condition is Overall
  
  -grade: overall grade given to the housing unit, based on King County grading system
  
  -sqft_above :square footage of house apart from basement
  
  -sqft_basement: square footage of the basement
  
  -yr_built :Built Year
  
  -yr_renovated :Year when house was renovated
  
  -zipcode:zip code
  
  -lat: Latitude coordinate
  
  -long: Longitude coordinate
  
  -sqft_living15 :Living room area in 2015(implies-- some renovations) This might or might not have affected the lotsize area
  
  -sqft_lot15 :lotSize area in 2015(implies-- some renovations)

## Workflow:

As with any project, the libraries and tools to achieve the tasks were imported in first place. Since getting to know the data is one of the first things to do, the MySQL tasks were chosen to be worked on as introduction. As a start, the dataset was worked on MySQLWorkbench then later the dataset was brought to Jupyter Notebook thorugh a connector. The process was throughly evidenced with screenshots and attached to the Notebook. After the completion of the MySQL tasks, the data was throughly explored and understood with EDA, several correlation matrixes and visuals were produced in order to identify possible outliers or columns that needed to be modified. As a result outlier values were identified and categorical columns were understood and transformed, firstly binned and then dummies of these columns were obtained in order to be normalized and be useful for building the linear regression model. The process of the model was quite straight forward, for the purpose of compliance with deadline, the model was thorughly built, it is to be noted that variations in the adjusted R squared were obtained, the model could be optimized. 



 
## Review


### Insights

From the process of building the first linear regression model, a lot of insights and information were obtained. From the start of day one on (16.11.2020) to the end of the project (19.11.2020) a deep understanding of the process and work that a Data Analyst might go thorugh in order to effectively draw conclusions or build models was obtained. Not included in the Jupyter Notebooks as would not pair directly with the tasks, an in-depth research of different methods of normalization, standarization, plotting and accuracy measures was made. In fact most of the knowledge gathered in the process comes from the constant search for understanding of the taks at hand in order to respond to it. Particulary the correlation and managing of data effectively to analyse it  was one of the strongest grasped concepts.


### Challenges

The main challenge of the project would be time management, the amount of time spent reading and watching videos to undertsand what was the task at hand, consumed most of the project's time. Another one was the process of binning data using Python, since Python skills were identified as skills to work on during the project, a vast amount of time was spent trying to solve with Python what later was solved with pandas. The constant twitching back and forward for the model was not a big challenge in itself since there's still space to improve the model, but understanding why the results varied so greatly, sometimes drastically with small changes in data was a challenge and lastly the last three tasks of Tableau were not submitted due to time restrictions




### Further exploration

   - Further group columns
   - Group the locations more effectively (e.g. combine Manhattan and New York)
   - Correlate average salary of position title with location and living cost to get location based purchasing power 
   - Get review rating, not only number (4 out of 5 stars) to get rating of employer



## File structure

    In the repository the following files are included:
        - regression_data_clean.csv
        - Linear-Regression-House-Price.ipynb
        - png files of images used
        - README




