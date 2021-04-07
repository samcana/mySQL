#which are the actors whose last names are not repeated?


use sakila;
select distinct last_name from actor
order by last_name;

#Which last names appear more than once?

select * from actor t1 
where (select count(*) from actor t2 
  where t1.last_name = t2.last_name) > 1 
order by last_name;

#Using the rental table, find out how many rentals were processed by each employee.

select * from rental;

SELECT staff_id, COUNT(rental_id) as rental_per_staff
FROM rental
GROUP BY staff_id;

#Using the film table, find out how many films were released each year

select count(distinct(film_id)), count(distinct(release_year)), release_year from film
group by release_year;

#Using the film table, find out for each rating how many films were there.

select * from film;

select count(distinct(film_id)), rating from film
group by rating;

#What is the average length of films for each rating?
#Round off the average lengths to two decimal places.

select count(distinct(film_id)), round(avg(distinct(length)),2) as average_length, rating from film
group by rating;

#Which kind of movies (based on rating) have an average duration of two hours or more?

select count(distinct(film_id)), round(avg(length),2), rating from film
group by rating;

SELECT rating, round(avg(length),2) as avg_length
FROM film
GROUP BY rating
HAVING avg(length) >= 120
ORDER BY avg(length);