use sakila;

#Get release years.

select * from film;

SELECT release_year, COUNT(release_year)
FROM film
GROUP BY release_year;

#Get all films with ARMAGEDDON in the title.

use sakila;
SELECT * FROM film WHERE title LIKE '%ARMAGEDDON%';

SELECT COUNT(*) FROM film WHERE MATCH(title) AGAINST('%ARMAGEDDON%' IN BOOLEAN MODE);

SELECT title, description, COUNT(*) AS "Number of employees"
FROM film
WHERE title LIKE ARMAGEDDON
GROUP BY title;

#Get all films which title ends with APOLLO

use sakila;
SELECT * FROM film WHERE title LIKE '%APOLLO';

#Get 10 the longest films.

SELECT * FROM film
ORDER BY length DESC
limit 10;

#How many films include Behind the Scenes content?

SELECT * FROM film WHERE special_features LIKE '%behind the scenes%';

#Drop column picture from staff.

ALTER TABLE staff
DROP picture;

select * from staff;

#A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

select * from customer where last_name LIKE '%SANDERS%';

INSERT INTO staff (staff_id, first_name, last_name, address_id, email, store_id, active, username)
VALUES ('3', 'Tammy', 'Sanders', '5', 'tammy@sanders.com', '2', '1', 'TammyS');

select * from rental;

#Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1

INSERT INTO rental
VALUES ('999992', '2020-06-17 11:35:09', '2', '130', NOW(), '1', NOW(), 'Tuesday');

select * from rental where rental_id like 999991;

select * from inventory where film_id LIKE 1;
#Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date

select * from sakila.customer
where active like 0;

CREATE TABLE IF NOT EXISTS deleted_users (customer_id TEXT, email TEXT, date TIMESTAMP);
DESCRIBE deleted_users;

insert into deleted_users select customer_id, email, create_date from customer where active = 0;

select * from deleted_users;

DELETE from customer
where active like 0;





