Use sakila;
select distinct last_name from actor;
#show table status;
select count(distinct last_name) from actor;

select * from actor
order by last_name ASC;

#select * from actor

#order by last_name, last_name DESC

SELECT password,LENGTH(password) from staff;

select distinct title, description from film
order by title, title DESC;

#select count(*) from film 

select distinct name as language from language
order by language ASC;

select count(distinct store_id) from store;

select count(distinct staff_id) from staff;

select * from staff
order by last_name ASC;

select distinct first_name from staff
order by first_name ASC;

select count(distinct rental_date) from rental;

select * from rental
order by rental_date ASC;

SELECT DATE(rental_date), TIME(rental_date) FROM rental;

select distinct date(rental_date) from rental;

select count(distinct DATE(rental_date)) from rental;