use dsstudent;

CREATE TEMPORARY TABLE merged_tables
	(id SMALLINT,
	 location VARCHAR(20),
	 fault_severity SMALLINT,
	 event_type VARCHAR(20),
	 severity_type VARCHAR(20),
	 resource_type VARCHAR(20),
	 log_feature VARCHAR(20),
	 volume SMALLINT);


use telecom;

insert into dsstudent.merged_tables
	(id, location, fault_severity, event_type, severity_type, resource_type, log_feature, volume)
	SELECT t.id, location, fault_severity, event_type, severity_type, resource_type, log_feature, volume
		FROM train t
		left join event_type et on et.id=t.id
		left join severity_type st on st.id=t.id
		left join resource_type rt on rt.id=t.id
		left join log_feature lf on lf.id=t.id;

use dsstudent;
	
select location, count(distinct(event_type)) as num_event_types
from merged_tables
group by location;


select location, sum(volume) as total_volume
from merged_tables
group by location
order by total_volume desc
limit 3;

select fault_severity, count(distinct(location)) as num_locations
from merged_tables
group by fault_severity;


select fault_severity, count(distinct(location)) as num_locations
from merged_tables
group by fault_severity
having fault_severity>1;

use hr;

select Attrition, min(Age) as min_age, max(Age) as max_age, avg(Age) as avg_age
from employee
group by Attrition;

select Attrition, Department, count(*) as num_quantity
from employee e
group by Attrition, Department
order by Attrition asc, Department asc;

select Attrition, Department, count(*) as num_quantity
from employee e
group by Attrition, Department
having num_quantity > 100
order by Attrition asc, Department asc;