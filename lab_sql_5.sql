# 1- Drop column picture from staff.
use sakila;
ALTER TABLE  staff DROP picture;
# 2- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username)
VALUES (3,'Tammy', 'Sanders','4','Tammy.Sanders@sakilastaff.com','2',1,'Tammy');
-- 3- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
--  select staff_id from sakila.staff
--  where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id,last_update)
VALUES (now(), 1, 130, 1, now());
# 4- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

#Check if there are any non-active users
#Create a table backup table as suggested
#Insert the non active users in the table backup table
#Delete the non active users from the table customer
# checking for non-active users
SELECT 
    *
FROM
    customer
WHERE
    active = 0;   
drop TABLE deleted_users;    
CREATE TABLE deleted_users (
    customer_id INT unique not null primary key,
    store_id INT not null,
    first_name VARCHAR(45) default null,
    last_name VARCHAR(45) default null,
    email VARCHAR(50) default null,
    address_id INT default null,
    active TINYINT(1) default null,
    create_date DATETIME default null,
    last_update TIMESTAMP default null
);
INSERT INTO deleted_users (customer_id, store_id, first_name,last_name, email, address_id, active, create_date,last_update)
select * from 
customer 
where active =0;
# Disabling the foreign key check and make the changes (deleting non-active users from table customer) then re-enable foreign key check.
SET FOREIGN_KEY_CHECKS=0; -- to disable them
DELETE FROM customer 
WHERE
    active = 0;
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them

# checking if non-active users from table customer are deleted!
SELECT * FROM customer 
WHERE
    active = 0;    
