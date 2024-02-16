-- Worth of different age groups: billionaires who are between 60 and 69 YO are the most wealthy ones
-- Nonetheless, the group of billionaires with an age over 80 YO have the greatest average worth
select case
when age < 20 then 'under 20'
when age between 20 and 29 then '20s'
when age between 30 and 39 then '30s'
when age between 40 and 49 then '40s'
when age between 50 and 59 then '50s'
when age between 60 and 69 then '60s'
when age between 70 and 79 then '70s'
when age >= 80 then '80 or older'
else 'no age available' end as age_group,
count(*) quantity,
sum(finalWorth) group_worth,
round(avg(finalWorth), 2) avg_group_worth
from billionaires_dataset
group by age_group with rollup
order by group_worth desc;

-- Billionaires per country and category (field)
select coalesce(country, 'No data') country,
coalesce(category, 'Total') category, count(*) billionaires, sum(finalWorth) worth
from billionaires_dataset
group by country, category with rollup
order by country, worth desc;

-- Wealth per gender
select coalesce(gender, 'Total') gender, sum(finalWorth) worth, count(*) billionaires, avg(finalWorth) average_worth
from billionaires_dataset
group by gender with rollup;

-- Worth per field: Technology is the most profitable field
select coalesce(category, 'Total') category, count(*) billionaires, sum(finalWorth) worth
from billionaires_dataset
group by category with rollup
order by worth desc;

-- Categories with the biggest worth per country
select country, category, max(finalWorth) biggest_worth
from billionaires_dataset
group by country
order by biggest_worth desc;

-- Share of the total worth that the 10 most wealthy billionaires represent
select round(((select sum(finalWorth)
from billionaires_dataset
where ranking <= 10)/sum(finalWorth))*100, 2) 'share_of_total_worth'
from billionaires_dataset;

-- Worth per country
select country, sum(finalWorth) total_worth
from billionaires_dataset
group by country
order by total_worth desc;

-- Billionaires' preferred states to live in (US territory only)
select coalesce(state, 'Total residents') state, count(*) billionaires
from billionaires_dataset
where state is not null
group by state with rollup
order by billionaires desc;

select country, sum(finalWorth) billionaires_worth,
cast(replace(substring(gdp_country, 2), ',', '') as double) gdp_country,
round((sum(finalWorth)/cast(replace(substring(gdp_country, 2), ',', '') as double))*100, 8) share_of_country_gdp
from billionaires_dataset
group by country
order by share_of_country_gdp desc