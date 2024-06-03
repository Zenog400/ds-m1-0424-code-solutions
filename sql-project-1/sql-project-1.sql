use dsstudent;

create table customer_seraphima_ruiz (
	customer_id smallint,
	name varchar(20),
	location varchar(20),
	total_expenditure varchar(20),
  primary key (customer_id)
);

insert into customer_seraphima_ruiz
values
(1701, "John", "Newport Beach, CA", 2000),
(1707, "Tracy", "Irvine, CA", 1500),
(1711, "Daniel", "Newport Beach, CA", 2500),
(1703, "Ella", "Santa Ana, CA", 1800),
(1708, "Mel", "Orange, CA",1700),
(1716, "Steve", "Irvine, CA", 18000);

update customer_seraphima_ruiz
set total_expenditure = 1800
where customer_id = 1716;

alter table customer_seraphima_ruiz
add gender varchar(20);

update customer_seraphima_ruiz
set gender = "F"
where total_expenditure <= 1800;

update customer_seraphima_ruiz
set gender = "M"
where total_expenditure > 1800 or name = "Steve";

delete from customer_seraphima_ruiz
where name = "Steve";

alter table customer_seraphima_ruiz
add store varchar(20);

alter table customer_seraphima_ruiz
drop column store;

select * from customer_seraphima_ruiz csr;

select name, total_expenditure from customer_seraphima_ruiz csr;

select name n, total_expenditure total_exp from customer_seraphima_ruiz csr;

alter table customer_seraphima_ruiz
modify column total_expenditure smallint;

select total_expenditure from customer_seraphima_ruiz csr
order by total_expenditure desc;

select name, total_expenditure from customer_seraphima_ruiz csr
order by total_expenditure desc
limit 3;

select count(distinct location) as nuniques from customer_seraphima_ruiz csr;

select distinct location as unique_cities from customer_seraphima_ruiz csr;

select * from customer_seraphima_ruiz csr
where gender = "M";

select * from customer_seraphima_ruiz csr
where gender = "F";

select * from customer_seraphima_ruiz csr
where location = "Irvine, CA";

select name, location from customer_seraphima_ruiz csr
where total_expenditure < 2000
order by name;

drop table customer_seraphima_ruiz;
