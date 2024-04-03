-- Analysis of 1000 Indian companies.

-- Number of companies per type
select
	coalesce(Company_type, 'No data available') company_type,
	count(*) companies,
    round(avg(Avg_salary), 2) avg_salary,
    max(Avg_salary) max_salary
from
	1000_companies
group by
	Company_type
order by companies desc;
-- Public companies are the largest group of analyzed companies (1783 companies).

-- Grouping the age of companies into intervals and counting the number of companies per interval
select
	case
		when years between 0 and 20 then '0-20 years'
		when years between 21 and 40 then '21-40 years'
		when years between 41 and 60 then '41-60 years'
		when years between 61 and 80 then '61-80 years'
		when years between 81 and 100 then '81-100 years'
		when years > 100 then 'older than 100 years'
	end as years_from_foundation, count(*) companies
from (
select *, substring(company_age, 1, position(' ' in company_age)-1) years
from 1000_companies) a
group by
	years_from_foundation
order by companies desc;
-- Most companies are between 0 and 20 years old (3567 companies). The second place is held by the 21-40 age group (3412 companies). That means there is a increasing number of new companies.

-- Top 10 companies with the highest average salaries and what they were criticized for
select
	Company_name,
	Avg_salary,
	Critically_rated_for
from
	1000_companies
order by Avg_salary desc
limit 10;

-- Number of companies criticized for promotion motives, and their average salary
select
	count(*) companies_criticized_for_promotions,
	round(avg(Avg_salary), 2) avg_salary
from
	1000_companies
where
	Critically_rated_for like '%Promotions%';
-- 2570 companies were criticized for promotion motives.

-- Company size and number of companies per group
select
	coalesce(Employees, 'Total employees') employees,
	count(*) companies,
    round(avg(Avg_salary), 2) avg_salary,
    max(Avg_salary) max_salary
from
	1000_companies
group by
	Employees with rollup
order by companies desc;
-- Most companies have between 1000 and 5000 employees across all their branches (2654 companies). Nonetheless, as one may expect, the bigger the company, the bigger the salary.

-- Companies' branches
select
	Company_name,
	substring(Locations, 1, position('+' in Locations) - 1) headquarters_location,
	cast(substring((substring(Locations, position('+' in Locations) + 1)), 1, position(' ' in substring(Locations, position('+' in Locations) + 1))) as double) branches,
	cast(substring((substring(Locations, position('+' in Locations) + 1)), 1, position(' ' in substring(Locations, position('+' in Locations) + 1))) as double) + 1 total_branches,
	Avg_salary
from
	1000_companies
order by branches desc;

-- Top 100 companies with the highest average salaries that have Work-Life Balance among the characteristics they were highly rated on
select
	Company_name,
	rank_based_on_avgsalary
from (
select Company_name, Highly_rated_for, rank() over(order by Avg_Salary desc) rank_based_on_avgsalary
from 1000_companies) a
where
	rank_based_on_avgsalary <= 100 and Highly_rated_for like '%Work Life Balance%';

-- Top 100 companies with the highest average salaries that have Work-Life Balance among the characteristics they were critically evaluated on
select
	Company_name,
	rank_based_on_avgsalary
from (
select Company_name, Critically_rated_for, rank() over(order by Avg_Salary desc) rank_based_on_avgsalary
from 1000_companies) a
where
	rank_based_on_avgsalary <= 100 and Critically_rated_for like '%Work Life Balance%';
-- Only 3 of the top 100 companies with the highest average salaries were rated critically on Work-Life Balance.

-- Top 100 companies with the highest average salaries where employees complained about Salary and Benefits
select
	Company_name,
	rank_based_on_avgsalary
from (
select Company_name, Critically_rated_for, rank() over(order by Avg_Salary desc) rank_based_on_avgsalary
from 1000_companies) a
where
	rank_based_on_avgsalary <= 100 and Critically_rated_for like '%Salary & Benefits%';
-- It is worth noting that 7 of the top 10 companies with the highest average salaries were rated critically on Salary & Benefits. This should be analyzed by these companies.

-- Number of companies in each sector
select
	coalesce(Industry, 'no data available') industry,
	count(*) companies,
	round(avg(Avg_salary), 2) avg_salary,
    max(Avg_salary) max_salary
from
	1000_companies
group by
	Industry
order by companies desc;
-- IT Services & Consulting is the sector with the largest number of companies (1299 companies) and the biggest salaries (5938.46 avg salary, 856900 max salary).

-- Ranking of characteristics for which companies were critically rated
select
	Critically_rated_for,
	sum(companies) companies,
	round(sum(sum_salary)/sum(companies), 2) avg_salary
from (
select Critically_rated_for, count(*) companies, sum(Avg_salary) sum_salary
from 1000_companies
group by Critically_rated_for
having Critically_rated_for like '%Company Culture%'
order by Critically_rated_for) a
union
select
	'Job Security',
	sum(companies),
	round(sum(sum_salary)/sum(companies), 2) avg_salary
from (
select Critically_rated_for, count(*) companies, sum(Avg_salary) sum_salary
from 1000_companies
group by Critically_rated_for
having Critically_rated_for like '%Job Security%'
order by Critically_rated_for) b
union
select
	'Promotions / Appraisal',
	sum(companies),
	round(sum(sum_salary)/sum(companies), 2) avg_salary
from (
select Critically_rated_for, count(*) companies, sum(Avg_salary) sum_salary
from 1000_companies
group by Critically_rated_for
having Critically_rated_for like '%Promotions / Appraisal%'
order by Critically_rated_for) c
union
select
	'Salary & Benefits',
	sum(companies),
	round(sum(sum_salary)/sum(companies), 2) avg_salary
from (
select Critically_rated_for, count(*) companies, sum(Avg_salary) sum_salary
from 1000_companies
group by Critically_rated_for
having Critically_rated_for like '%Salary & Benefits%'
order by Critically_rated_for) d
union
select
	'Skill Development / Learning',
	sum(companies),
	round(sum(sum_salary)/sum(companies), 2) avg_salary
from (
select Critically_rated_for, count(*) companies, sum(Avg_salary) sum_salary
from 1000_companies
group by Critically_rated_for
having Critically_rated_for like '%Skill Development / Learning%'
order by Critically_rated_for) e
union
select
	'Work Life Balance',
	sum(companies),
	round(sum(sum_salary)/sum(companies), 2) avg_salary
from (
select Critically_rated_for, count(*) companies, sum(Avg_salary) sum_salary
from 1000_companies
group by Critically_rated_for
having Critically_rated_for like '%Work Life Balance%'
order by Critically_rated_for) f
union
select
	'Work Satisfaction',
	sum(companies),
	round(sum(sum_salary)/sum(companies), 2) avg_salary
from (
select Critically_rated_for, count(*) companies, sum(Avg_salary) sum_salary
from 1000_companies
group by Critically_rated_for
having Critically_rated_for like '%Work Satisfaction%'
order by Critically_rated_for) g
order by companies desc;
-- The most cited characteristic was Promotions / Appraisal. It was present among the assessment of 2570 companies.
