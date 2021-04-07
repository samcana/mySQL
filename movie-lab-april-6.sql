Use sakila;
#Select all the actors with the first name ‘Scarlett’.

select * from actor
where first_name = 'Scarlett';

#How many films (movies) are available for rent and how many films have been rented?
select * from film;

select count(distinct film_id) from film;

select count(distinct rental_id) from rental;

#What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select film_id, title, length as max_duration from film
where length =(select MAX(length) from film);

select film_id, title, length as min_duration from film
where length =(select MIN(length) from film);

select MAX(length) from film;

#What's the average movie duration expressed in format (hours, minutes)?

select AVG(length) 'Average Duration'
from film;

SELECT
floor(AVG(f.length)/60),
floor(AVG(f.length)%60)
FROM film f;

select film_id, title, SEC_TO_TIME(length*60) AS ' Duration' from film;

select avg(SEC_TO_TIME(length*60)) AS 'Average Duration' from film;

SELECT AVG( 360*HOUR(length) + 60*MINUTE(length)) from film;

#How many distinct (different) actors' last names are there?

SELECT count(distinct(last_name)) from actor;

#Since how many days has the company been operating (check DATEDIFF() function)?

select DATEDIFF(last_update, rental_date)
from rental;

select DATEDIFF(CURDATE(), rental_date) as days_open
from rental;

#Show rental info with additional columns month and weekday. Get 20 results.

select *, date_format(rental_date, '%M') as formatted_month, date_format(rental_date, '%W') as formatted_day
from rental
limit 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.


SELECT *,
CASE
WHEN date_format(r.rental_date, '%a') in('Mon','Tue','Wed','Thu','Fri') then 'workday'
ELSE 'weekend'
END AS 'day_type'
FROM sakila.rental r;

#How many rentals were made in the last month of renting activity?

SELECT rental_date, COUNT(rental_id) as rental_total 
FROM rental
WHERE DATE(rental_date) > '2006-01-17 11:17:45'
GROUP BY rental_date;

SELECT COUNT(DISTINCT rental_id) as rental_total
FROM rental 
WHERE DATE(rental_date) > "2015-01-30";

select * from rental;
where DATE(rental_date) > '2006-01-31 22:47:45';

select * from rental
where DATE(rental_date) > '2005-06-19 22:47:45';


select *, date_format(rental_date, '%M') as formatted_month, date_format(rental_date, '%W') as formatted_day
where DATE(rental_date) > '2006-01-31 22:47:45'
from rental;
#limit 20;

select * from rental;
where DATE(rental_date) > '2006-01-31 22:47:45';

select * from rental
where rental_date =(select MAX(rental_date) from rental);




select rental_id, last_update, rental_date from rental
where rental_date =(select MAX(rental_date) from film);


select *
add x_day Text(10)
Update rental;




-- select round(length * (a10/100), 0) as urban_population
-- from film;





select count(distinct last_name) from actor;