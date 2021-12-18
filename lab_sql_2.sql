# 1- Select all the actors with the first name ‘Scarlett’.
use sakila;
SELECT 
    first_name, last_name
FROM
    sakila.actor
WHERE
    first_name = 'Scarlett';
# 2- Select all the actors with the last name ‘Johansson’.    
 SELECT 
    first_name, last_name
FROM
    sakila.actor
WHERE
    last_name = "Johansson"; 
    
# 3- How many films (movies) are available for rent?

SELECT 
    COUNT(*)
FROM
    sakila.inventory;

# 4- How many films have been rented? 

SELECT 
    COUNT(*)
FROM
    sakila.rental;
 

    
# 5- What is the shortest and longest rental period?
SELECT 
    MIN(return_date - rental_date) AS shortest_rental_period,
    MAX(return_date - rental_date) AS longest_rental_period
FROM
    sakila.rental; 
    
# 6- What are the shortest and longest movie duration? Name the values max_duration and min_duration    
SELECT 
    MAX(length) AS max_duration, MIN(length) AS min_duration
FROM
    sakila.film;
    
#7- What's the average movie duration?
 SELECT 
    AVG(length) AS average_length_minutes
FROM
    sakila.film;   
# 8- What's the average movie duration expressed in format (hours, minutes)?use sakila; 
select avg(length),  concat(floor(avg(length)/60), " h, ", floor(avg(length)% 60)," m")  
 as average_duration 
FROM sakila.film;

 # 9- How many movies longer than 3 hours?   
 SELECT 
    COUNT(*)
FROM
    sakila.film
WHERE
    length / 60 > 3;

SELECT 
    CONCAT(CONCAT(UPPER(SUBSTRING(first_name, 1, 1)),
                    LOWER(SUBSTRING(first_name, 2))),
            ' ',
            UPPER(last_name)) AS name,
    LOWER(email)
FROM
    sakila.customer;
# 11- What's the length of the longest film title? 
SELECT 
    title, LENGTH(title)
FROM
    sakila.film
ORDER BY 2 DESC
LIMIT 1;   