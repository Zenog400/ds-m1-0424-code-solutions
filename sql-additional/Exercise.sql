USE hr;

SELECT attrition, department, gender, JobRole, MonthlyIncome FROM employee; #ex1

SELECT attrition att, department dep, gender gen, JobRole job, MonthlyIncome min FROM employee; #ex2

SELECT MaritalStatus marital_status, OverTime over_time, TotalWorkingYears total_years FROM employee; #ex3

SELECT JobRole, MonthlyIncome FROM employee #ex4
	ORDER BY MonthlyIncome desc
	limit 3;

SELECT department, TotalWorkingYears FROM employee #ex5
	ORDER BY TotalWorkingYears desc
	limit 3;

SELECT department, age FROM employee #ex6
	ORDER BY age
	limit 5;

select distinct(Department) from employee; #ex7

select count(*) as total_rows from employee; #ex8

select count(distinct(JobRole)) as number_unique_jobrole from employee; #ex9

select Attrition, Department, Gender, EmployeeNumber FROM employee #ex10
	where Department = "Sales";

select EmployeeNumber, Department, EducationField, MaritalStatus, Attrition FROM employee #ex11
	where EducationField = "Life Sciences"

select EmployeeNumber, Department, HourlyRate, JobRole, Attrition from employee #ex12
    where HourlyRate > 65
    order by HourlyRate desc;

select EmployeeNumber, JobRole from employee #ex13
	where JobRole like "%Technician%";

select EmployeeNumber, JobRole from employee #ex14
	where JobRole like "%Representative";

select EmployeeNumber, JobRole from employee #ex15
	where JobRole like "Research%";