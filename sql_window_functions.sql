use bank;
select * from loan;

select loan_id, account_id, amount, payments, duration,
 amount-payments as "Balance",
 #window function
 round(avg(amount-payments) over (partition by duration)) as "Avg_Balance", 
 
from bank.loan
where amount > 100000
order by duration, balance desc;

select *, rank() over (partition by status order by amount desc) as 'Rank'
from bank.loan;

