# 1- How many distinct (different) actors' last names are there?
use sakila;
SELECT 
    COUNT(DISTINCT (last_name)) AS count_distinct_last_name
FROM
    sakila.actor;
    
# 2- In how many different languages where the films originally produced? (Use the column language_id from the film table)    
SELECT 
    COUNT(DISTINCT (language_id)) AS count_distinct_language
FROM
    sakila.language;
    
# 3- How many movies were released with "PG-13" rating?
 use sakila;
SELECT 
    COUNT(*) AS count
FROM
    sakila.film
WHERE
    rating = 'PG-13';   
# 4- Get 10 the longest movies from 2006.
SELECT 
    title, length
FROM
    sakila.film
WHERE
    release_year = '2006'
ORDER BY length DESC
LIMIT 10; 
# How many days has been the company operating (check DATEDIFF() function)?
# the question is unclear to me !
use sakila;
SELECT 
    MAX(DATEDIFF(last_update, rental_date)) AS days
FROM
    sakila.rental;
# 6- Show rental info with additional columns month and weekday. Get 20. 
SELECT 
    *,
    EXTRACT(MONTH FROM rental_date) AS rental_month,
    EXTRACT(DAY FROM rental_date) AS rental_day
FROM
    sakila.rental;  
    
# Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT 
    *,
    (CASE
        WHEN WEEKDAY(rental_date) < 5 THEN 'workday'
        ELSE 'weekend'
    END) AS day_type
FROM
    sakila.rental;
    
 # How many rentals were in the last month of activity?
 
   



    