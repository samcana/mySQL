use sakila;

select p.amount, c.address_id, a.city_id, ci.city from city ci
join address a on ci.city_id = a.city_id
join customer c on a.address_id = c.address_id
join payment p on c.customer_id = p.customer_id
group by amount, address_id, city_id, city;


select sum(p.amount) as total, c.address_id, a.city_id, ci.city from city ci
join address a on ci.city_id = a.city_id
join customer c on a.address_id = c.address_id
join payment p on c.customer_id = p.customer_id
group by city, amount, address_id, city_id;







use sakila;

select * from payment
