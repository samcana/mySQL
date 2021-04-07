Use bank ;
-- select distinct a2 as district_name from district
-- show table status
-- #select count(*) from trans t

-- select d.A2 as district_name, d.A3 as region 
-- from district d
-- order by district_name ASC
-- limit 30

-- select max(t.amount) as max_cash_withd from trans t
-- where t.operation = 'VYBER' and t.type = 'VYDAJ'

select * from loan l
where l.status in ( 'B', 'D')
order by l.status, l.amount DESC;

select * from bank.order o
where o.amount > 1000 and o.k_symbol = 'SIPO'
order by amount DESC
limit 50;

select *, amount - payments as balance
FROM bank.loan;

select *, round((payments/amount) *100, 2) as balance
from bank.loan;
#contract finished, loan not fully repaid, amount over 100k

#step 1 identify table, step 2 which fields
#step 3 apply where statement to filter (look at case study)
#step 4 - sort and then limit

use bank;
select loan_id, amount, payments, amount-payments as balanceos
from bank.loan
where status='B' and amount >100000
order by balanceos DESC
limit 10;
#I want to see a list of the biggest/worst 10

select a2 as district_name, a11 as average_salary
from bank.district
where a11 > 10000;

select status, date, amount, duration
from bank.loan
where status='B';

select card_id, disp_id, type, issued
from bank.card
where type= 'junior'
order by disp_id ASC
limit 10;

select status, date, loan_id, account_id, amount, duration, amount-payments as balanceos
from bank.loan
where status='B';

select a2 as district_name, a4 as no_inhabitants, a10 as urban_inhabitants, round(a4 * (a10/100), 0) as urban_population
from bank.district;

select a2 as district_name, a4 as no_inhabitants, a10 as urban_inhabitants, round(a4 * (a10/100), 0) as urban_population
from bank.district
where a10 > 50
order by a10 DESC;

#floor ceiling

select floor(avg(o.amount)) from bank.order o;

select ceiling(avg(o.amount)) from bank.order o;

# strings
select *, length(k_symbol) as symbollength
from bank.order;

select *, concat(k_symbol, ' ', account_id) as concatd
from bank.order;

select *, lower(k_symbol) as k
from bank.order;

select *, right(left(k_symbol, 3),1) as k
from bank.order;

# Q: for every district, i want to see the lower case district name
#upper case region name, first 5 characters of district name


select *, lower(left(a2,5)) as district_name, upper(a3) as region_name
from bank.district;

use bank;
select *, concat(lower(A2),upper(A3),left(A2,5))
from bank.district;

select a2 as district_name, a4 as no_inhabitants, a10 as urban_inhabitants, round(a4 * (a10/100), 0) as urban_population
from bank.district
where a10 > 50
order by a10 DESC;



select a2 as district_name, a4 as no_inhabitants, a10 as urban_inhabitants, round(a4 * (a10/100), 0) as urban_population
from bank.district
where a10 > 50
order by a10 DESC;

select date from bank.trans;
select account_id, trans_id,
date_format(convert(date,datetime), '%D-%M-%Y')
as fulldate from bank.trans;

select date from bank.trans;
select account_id, trans_id,
convert(substring_index(date, ' ', 1),date)
as fulldate from bank.trans;

#Get card_id and year_issued for all gold cards.
select card_id, date_format(convert(left(issued,6), date),'%Y') as year_issued
from bank.card
where type='Gold';

-- Get card_id and year_issued for all gold cards.

-- When was the first gold card issued? (Year)

-- Get issue date as:

-- date_issued: 'November 7th, 1993'
-- fecha_emision: '07 of November of 1993'

select card_id, date_format(convert(left(issued,6), date),'%Y') as year
from bank.card
where type='Gold'
order by year ASC;

-- Get issue date as:

-- date_issued: 'November 7th, 1993'
-- fecha_emision: '07 of November of 1993'

SELECT card_id, date_format(convert(left(issued,6), date), "%M %D, %Y") as year FROM bank.card;

select * from bank.trans
count isnull(k_symbol)
from bank.trans;


-- select loan_id, account_id,
-- case
-- when status = 'A' then 'Good - Contract Finished'
-- when status = 'B' then 'Defaulter - Contract Finished'
-- when status = 'C' then 'Good - Contract Running'
-- else 'In Debt - Contract Running'
-- end as 'Status_Description'
-- from bank.loan;

select *,
case
when type = 'PRIJEM' then 'credit'
when type = 'VYDAJ' then 'withdrawal'
else 'unknown'
end as 'Type_Description'
from bank.trans;

IF(type='PRIJEM','credit','withdraw') as descr
from bank.trans;

create table bank_demo.account(
account_id int(11) unique not null,
district_id int(11) default null
);

insert into bank_demo.account values
(1,4),(2,4),(3,2) ; 

select account
from bank_demo;