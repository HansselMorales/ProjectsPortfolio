-- Number of rows: 607 rows
select
	count(*)
from
	data_salaries;

-- Number of distict values per column
select
	count(distinct experience_level) distinct_experience_levels,
    count(distinct job_title) distinct_job_titles,
    count(distinct employee_residence) distinct_employee_residence,
    count(distinct company_location) distinct_company_locations
from
	data_salaries;

-- Sum of salaries per group of data field: Data Scientists group is the one with the largest salary (15.5 M)
select
	coalesce(job_title, 'Total') job_title,
	count(*) professionals,
	sum(salary_in_usd) total_salary_in_usd
from
	data_salaries
group by
	job_title with rollup
order by sum(salary_in_usd) desc;

-- Top salaries per data field: Top Principal Data Engineer earns the largest salary (600 K)
select
	job_title,
    top_salary_in_usd,
    experience_level,
    company_location
from 
	(
	select
		job_title,
        max(salary_in_usd) top_salary_in_usd,
        experience_level,
        company_location
	from
		data_salaries
	group by
		job_title, experience_level, company_location
	order by top_salary_in_usd desc
    ) a
group by job_title
order by top_salary_in_usd desc;

-- Number of data-field's top earners per experience level: Senior-experienced employees are the largest group among the top earners per
-- data field (25 top earners)
select
	experience_level,
    count(experience_level) number_of_top_earners
from (
	select
		job_title,
		top_salary_in_usd,
		experience_level,
		company_location
	from (
		select
			job_title,
			max(salary_in_usd) top_salary_in_usd,
			experience_level,
			company_location
		from
			data_salaries
		group by
			job_title, experience_level, company_location
		order by top_salary_in_usd desc) a
	group by job_title
	order by top_salary_in_usd desc) b
group by experience_level
order by number_of_top_earners desc;

-- Top earners per country: The US is the country where professionals of each data field can make the most money (36 top earners)
select
	company_location,
    count(company_location) number_of_top_earners
from (
	select
		job_title,
		top_salary_in_usd,
		experience_level,
		company_location
	from (
		select
			job_title,
			max(salary_in_usd) top_salary_in_usd,
			experience_level,
			company_location
		from
			data_salaries
		group by
			job_title, experience_level, company_location
		order by top_salary_in_usd desc) a
	group by job_title
	order by top_salary_in_usd desc) b
group by company_location
order by number_of_top_earners desc;

-- Top earners per company size: Large companies are the ones where professionals of each data field can make the most money (24 top earners)
select
	company_size,
    count(company_size) number_of_top_earners
from (
	select
		job_title,
		top_salary_in_usd,
		experience_level,
		company_location,
        company_size
	from (
		select
			job_title,
			max(salary_in_usd) top_salary_in_usd,
			experience_level,
			company_location,
            company_size
		from
			data_salaries
		group by
			job_title, experience_level, company_location
		order by top_salary_in_usd desc) a
	group by job_title
	order by top_salary_in_usd desc) b
group by company_size
order by number_of_top_earners desc;

-- Remote workers: Data Scientists are the largest group of data professionals that work remotely (11 professionals)
select
	coalesce(job_title, 'Total') job_title,
    count(*) remote_data_professionals
from (
	select
		job_title,
		employee_residence,
		company_location
	from
		data_salaries
	where employee_residence != company_location
    ) a
group by job_title with rollup
order by remote_data_professionals desc;

-- Currency that most data professionals are paid in
select
	coalesce(salary_currency, 'Total') salary_currency,
    count(salary_currency) professionals,
    sum(salary_in_usd) salary_in_usd
from
	data_salaries
group by
	salary_currency with rollup
order by professionals desc;

select *
from data_salaries
