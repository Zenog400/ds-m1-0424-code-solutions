use telecom;

select volume,
	CASE 
		when volume < 100 then "Low"
		when volume > 100 and volume < 500 then "Medium"
		when volume > 500 then "High"
		else "Error"
	END volume_normalized
from log_feature;

use dsstudent;

DROP table volume_stuff;

create temporary table volume_stuff
select *,
	CASE 
		when volume < 100 then "Low"
		when volume >= 100 and volume <= 500 then "Medium"
		when volume > 500 then "High"
		else "Error"
	END volume_normalized
from telecom.log_feature lf;

select volume_normalized, count(*) as `count`
from volume_stuff
group by volume_normalized;

use hr;

select EmployeeNumber, HourlyRate,
	CASE 
		when HourlyRate < 40 then "Low Hourly Rate"
		when HourlyRate >=40 and HourlyRate < 80 then "Medium Horuly Rate"
		when HourlyRate >= 80 then "High Hourly Rate"
		else "Error"
	END
from employee e;

select Gender,
	CASE 
		when Gender = "Male" then 1
		when Gender = "Female" then 0
		else "Other"
	END gender_1
from employee e;
