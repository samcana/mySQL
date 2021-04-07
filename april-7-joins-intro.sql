#simple aggregates - SUM, MIN, MAX, COUNT, AVG, DISTINCT

#q: what is the total amount loaned by the bank so far? PER EACH account -- group by
select sum(amount) from bank.loan;

use bank;
select account_id, sum(amount) from bank.loan
group by account_id
order by account_id;

#Q: whats the total amount recovered/received from customers on loans?
select sum(payments) from bank.loan;

#Q whats the avg amount recovered from customers on loans per each status
select status, round(avg(payments),2) as avgpaid from bank.loan
group by status;

#Q whats the avg balance of loans per each status and duration?

select round(avg(amount - payments),2) as balance, status, duration from loan
group by status, duration
order by status, duration;

select round(avg(amount - payments),2) as balance, status, duration from loan
where status in ('B','D')
group by status, duration
order by status, duration;

select round(avg(amount - payments),2) as balance, status, duration from loan
where status not in ('A','C') AND duration = '12'
group by status, duration
order by status, duration;

#order by is in order. in this case first by status, then duration

#Find out how many cards of each type have been issued.

SELECT type, COUNT(1) as count 
FROM card 
GROUP BY type 
ORDER BY count DESC;

#Find out how many customers there are by the district.

select * from client;

SELECT district_id, COUNT(1) as count 
FROM client 
GROUP BY district_id 
ORDER BY count DESC;

#Find out average transaction value by type.

select type, round(avg(amount),2) as avgtrans from trans
group by type;

#As you might have seen in the query shown below, there are 19 rows returned by this query. But there a few places where the column k_symbol is an empty string. Your task it to use a filter to remove those rows of data. After the filter gets applied, you would see that the number of rows have reduced.

select type, operation, k_symbol, round(avg(balance),2)
from bank.trans
#where k_symbol is not null
group by type, operation, k_symbol
order by type, operation, k_symbol;

select * from trans where k_symbol is not null and k_symbol <> '';

select type, operation, k_symbol, round(avg(balance),2)
from trans
WHERE 
    #k_symbol IS NOT NULL AND 
    k_symbol <> ''
group by type, operation, k_symbol
order by type, operation, k_symbol;

select c.district_id, count(client_id) as num_customers
from bank.client c
group by c.district_id
having count(*) > 100
order by num_customers desc;

# per customer, whats the balance, only for high balances (over 10000)

select account_id, sum(round(amount-payments,2)) as bal
from loan
where round(amount-payments, 2) > 10000
group by account_id
having sum(round(amount-payments,2)) > 22000
order by sum(round(amount-payments,2));

# Q - can we return a list of all loan durations which have more than 100000 unpaid (group by duration)?
# status on where
#having on the sum (balance)

select duration, sum(round(amount-payments,0)) as bal
from loan l
#where round(amount-payments, 2) > 10000
group by l.duration
having sum(round(amount-payments,0)) > 1000000;

SELECT l.duration, sum(l.amount-l.payments) as balance
FROM loan l
where l.status in ('B','D')
GROUP BY l.duration
HAVING balance > 1000000;

select * from loan;

select *, IF(A10>80, 'urban', 'suburb') as locale 
from district;


#Q: show all data for all accounts which have any loans of a 12 month duration
select a.account_id, a.district_id, a.frequency from bank.account a
join bank.loan l
on a.account_id = l.account_id
where l.duration = 12

#mwah mwah