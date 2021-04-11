use sakila;

#Using multiple JOIN() clauses display the store ID, city, and country of each store.

use sakila;
select s.store_id, i.city, c.country from country c
join city i on c.country_id = i.country_id
join address a on i.city_id = a.city_id
join store s on a.address_id = s.address_id
group by city, store_id, country;

select * from store;

#Display the total payment amount for each store.

use sakila;
select st.store_id, sum(p.amount) as total from payment p
join staff st on p.staff_id = st.staff_id
group by store_id;

#What is the average film length per each category? Which category of films are the longest?

use sakila;
select c.name, avg(f.length) as avglength from film f
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by name
order by avglength DESC;

#Display the 2 most frequently rented movies in descending order.

use sakila;
select f.title, count(i.inventory_id) as total_rent from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
group by title
order by total_rent DESC;

select f.title, count(i.inventory_id) as total_rent from rental r
join inventory i on r.inventory_id = i.inventory_id
join film f on i.film_id = f.film_id
group by title
order by total_rent DESC
limit 2;

#display the top 5 categories with highest revenue (payment amount) in DESC order

use sakila;

SELECT
	name            AS category,
	SUM(amount)     AS `gross revenue`
FROM sakila.payment
	JOIN (sakila.rental
		JOIN (sakila.inventory
			JOIN (sakila.film_category
				JOIN sakila.category USING (category_id))
			USING (film_id))
		USING (inventory_id))
	USING (rental_id)
GROUP BY category_id
ORDER BY `gross revenue` DESC
LIMIT 5;

#Is the Academy Dinosaur movie available for rent from Store 1?
#If yes, display the title, store_id and inventory_id of the available copies of that movie.

use sakila;

select distinct(i.inventory_id), i.store_id, f.title, r.rental_date, r.return_date from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
where title like '%academy dinosaur%' and store_id like 1 and return_date > rental_date
#group by inventory_id
order by title, store_id, inventory_id DESC;

select * from film
where title like '%dinosaur%';