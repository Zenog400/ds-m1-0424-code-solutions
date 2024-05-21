USE telecom;

#select/from/as
Select id, log_feature log, volume vol
from log_feature lf;

#Sorting
select id, resource_type from resource_type rt order by id limit 5;

select id, resource_type from resource_type rt order by id desc limit 5;

select id, resource_type from resource_type rt order by id, resource_type desc limit 5;

#Count/distinct
select count(*) as numbers_row, count(distinct id) as id_nunique, count(distinct severity_type) as severity_type_nunique
from severity_type st;

#Where filtering
select id, log_feature, volume
from log_feature lf
where log_feature = "feature 201"
	and volume > 100
	and volume < 300
order by volume;