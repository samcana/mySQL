use sakila;

#Use the RANK() and the table of your choice rank films by length (filter out the rows that have nulls or 0s in length column).
#In your output, only select the columns title, length, and the rank.

select *, rank() over (partition by status order by amount desc) as 'Rank'
from bank.loan;

select title, length, Rank() over (order by length DESC) as 'Rank'
from film
where length <> '';

#Build on top of the previous query and rank films by length within the rating category
#(filter out the rows that have nulls or 0s in length column).
#In your output, only select the columns title, length, rating and the rank.

select title, length, rating, Rank() over (partition by rating order by length ASC) as 'Rank'
from film
where length is not null and length <> '';

#How many films are there for each of the categories?
#Inspect the database structure and use appropriate join to write this query.

select * from category;

select c.name, count(f.film_id) as amount_films
from sakila.category as c
join sakila.film_category as f
on c.category_id = f.category_id
group by c.name;

SELECT c.name, count(fc.film_id) as amount_films
FROM sakila.category as c 
JOIN sakila.film_category as fc 
ON c.category_id = fc.category_id
GROUP BY c.name;

#Which actor has appeared in the most films?

SELECT a.last_name, count(fa.film_id) as amount_films
FROM sakila.actor as a
JOIN sakila.film_actor as fa
ON a.actor_id = fa.actor_id
GROUP BY a.last_name
ORDER BY amount_films DESC;

#Most active customer (the customer that has rented the most number of films)

SELECT c.last_name, count(r.rental_id) as amount_rentals
FROM sakila.customer as c
JOIN sakila.rental as r
ON c.customer_id = r.customer_id
GROUP BY c.last_name
ORDER BY amount_rentals DESC;



select * from category;