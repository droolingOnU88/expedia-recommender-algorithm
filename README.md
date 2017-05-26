# An approach to improve recommendations based on real-world data

##General information

This algorithm written for PHP 7.0 can be applied to process the data-set **expedia-full**. Moreover, in the directory results, the processed data of the analysis is documented. The analysis was conducted within the following step:
1. Reduction of the **expedia-full** table. Removal of non booking tuples by sorting on *is_booking*.
2. Split up of the tables into a 2013 and 2014 table.
3. Identification of the relevant data by neglecting users who did less than 10 and more than 30 bookings a year. Based on it, two tables are generated *expedia-all-bookings-2013-reduced* and *expedia-all-bookings-2014-reduced*. This can be reprocessed, by calling the function **findAllRelevantUsers()** and define the variables **$minNumberOfBookingsRequired** and **$maxNumberOfBookingsRequired** accordingly.
4. Subsequently the function **calculateProbability()** needs to be called in order to calculate the probabilities for the two years. Therefore, two tables are being used *expedia-user-hotel-probability-2013* and *expedia-user-hotel-probability-2014*. They will be filled with the respective probabilities.
5. In order to compare the probabilities between the two years, the function **compareProbabilities()** needs to be called. It fills a table called *expedia-user-hotel-probability-comparison-2013-2014* with the duration probabilities.

## Results

The results of the analysis are present in the table *expedia-user-hotel-probability-comparison-2013-2014* within the directory data.

## Important

In order to run the analysis, the tables must be present. Therefore, the SQL file *relevant_tables.sql* needs to be executed.

The initial data-set which is required to run the analysis is available on Kaggle: https://www.kaggle.com/c/expedia-hotel-recommendations/data
