use dsstudent;

create temporary table storage 
select table_name, table_rows
from information_schema.tables
where table_schema = "loandb";

drop table storage;

select amt_income_total annual_income, amt_income_total/12 monthly_income
from loandb.train;

select round(days_birth/-365,0) as age
from loandb.train;

select occupation_type, count(occupation_type) as quantity
from loandb.train
group by occupation_type
order by quantity desc;

select days_employed,
CASE 
	when days_employed = 365243 then "bad data"
	else "normal data"
END flag_for_bad_data
from loandb.train;

select t.target,
	min(ip.DAYS_INSTALMENT) as min_days_installment,
	max(ip.DAYS_INSTALMENT) as max_days_installment,
	min(ip.DAYS_ENTRY_PAYMENT) as min_days_entry_payment,
	max(ip.DAYS_ENTRY_PAYMENT) as max_days_entry_payment
from loandb.installments_payments as ip
left join loandb.train as t
	on ip.SK_ID_CURR = t.SK_ID_CURR
group by t.target;