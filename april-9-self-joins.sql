select * from bank.disp;

use bank;
select d1.client_id, d1.account_id, d1.type
from disp d1
join disp d2
on d1.account_id = d2.account_id
where d1.type <> d2.type;

# SUB QUERY
#identify the customers who have borrowed an amount which more than the average ampunt borrowed by all
select * from loan
where amount >
#loan > avg loan
(select avg(amount) from loan)
order by amount desc
limit 15;

#find those banks from trans table where average amount of transactions is over 5500;

use bank;

select bank
from trans where bank in
(select bank, avg(amount) as average
from trans
where bank is not null and bank <> ' '
group by bank
having avg(amount) > 5500);

select * from trans;

#Find out the average number of transactions by account. Get those accounts that have more transactions than the average.

select * from trans
where amount >
#loan > avg loan
(select avg(amount) from loan)
order by amount desc
limit 15;

select account_id, count(trans_id) as numtrans
from trans
group by account_id;


select floor(avg(numtrans)) from
(select account_id, count(trans_id) as numtrans
from trans
#where count(distinct(trans_id)) > avg(count(distinct(trans_id))
group by account_id) q1;

select account_id, count(trans_id) as numtrans
 from trans 
 group by account_id
 having numtrans > ( 
 select floor(avg(numtrans)) from
 (select account_id, count(trans_id) as numtrans
 from trans 
 group by account_id) q1);









SELECT t.account_id as id, avg(t.amount) as acavg
FROM trans t
GROUP BY account_id
HAVING acavg >  (SELECT avg(amount) from trans);
