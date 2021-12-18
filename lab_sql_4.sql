# 1- Get film ratings.
use sakila;
SELECT 
    rating
FROM
    sakila.film;
# 2- Get release years.
SELECT 
    release_year
FROM
    sakila.film;
# 3- Get all films with ARMAGEDDON in the title.
SELECT 
    *
FROM
    sakila.film
WHERE
    title REGEXP 'ARMAGEDDON';
# 4- Get all films with APOLLO in the title
SELECT 
    *
FROM
    sakila.film
WHERE
    title REGEXP 'APOLLO';
# 5- Get all films which title ends with APOLLO.
SELECT 
    *
FROM
    sakila.film
WHERE
    title LIKE '%APOLLO';
# 6- Get all films with word DATE in the title.
SELECT 
    *
FROM
    sakila.film
WHERE
    title REGEXP 'DATE';
# 7- Get 10 films with the longest title.
SELECT 
    title, LENGTH(title) AS title_length
FROM
    sakila.film
ORDER BY 2 DESC
LIMIT 10;

# 8- Get 10 the longest films.
SELECT 
    title, length
FROM
    sakila.film
ORDER BY 2 DESC
LIMIT 10;
# 9- How many films include Behind the Scenes content?
SELECT 
    COUNT(*)
FROM
    sakila.film
WHERE
    special_features REGEXP 'Behind the Scenes';
# 10- List films ordered by release year and title in alphabetical order.
SELECT 
    title, release_year
FROM
    sakila.film
ORDER BY 1 , 2; 


