# 1- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
use sakila;
select title, length, rank() over (order by length desc) as 'rank'
from film
where length is not null and length <> 0;
# 2- Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.

select title, length, rating, rank() over (order by length desc) as 'rank'
from film
where length is not null and length <> 0
group by 3;

# 3- How many films are there for each of the categories in the category table. Use appropriate join to write this query

SELECT 
    c.`name` AS category_name,
    COUNT(fc.film_id) AS number_of_films
FROM
    category c
        INNER JOIN
    film_category fc ON c.category_id = fc.category_id
GROUP BY 1
ORDER BY 2 DESC;

# 4- Which actor has appeared in the most films?
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(fa.film_id) AS number_of_films
FROM
    actor a
        INNER JOIN
    film_actor fa ON a.actor_id = fa.actor_id
ORDER BY 2 DESC;
# 5- Most active customer (the customer that has rented the most number of films)

SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(r.rental_id) AS number_of_rental
FROM
    customer c
        INNER JOIN
    rental r ON c.customer_id = r.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

# Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.
SELECT
    f.title,
    count(r.rental_id) AS number_of_rents
FROM
    inventory i
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY
    1
ORDER BY
    2 DESC
LIMIT
    1;