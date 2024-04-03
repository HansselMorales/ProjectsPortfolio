-- SQL Analysis

------------------------------------------------------------------------------------------------------

-- Wealth of different age groups: billionaires who are between 60 and 69 YO are the most wealthy ones
-- Nonetheless, the group of billionaires with an age over 80 YO have the greatest average wealth
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
sum(finalWorth) group_wealth,
round(avg(finalWorth), 2) avg_group_wealth
from billionaires_dataset
group by age_group with rollup
order by group_wealth desc;

-- Billionaires per country and industry (US is the country with the most billionaires' wealth, Tech sector is the one with the most billionaires wealth)
select coalesce(country, 'No data') country,
coalesce(category, 'Total') category, count(*) billionaires, sum(finalWorth) wealth
from billionaires_dataset
group by country, category with rollup
order by country, wealth desc;

-- Wealth per gender (Male wealth represents almost 88% of the total billionaires' wealth, there is an immense gap between genders)
select coalesce(gender, 'Total') gender, sum(finalWorth) wealth, count(*) billionaires, avg(finalWorth) average_wealth
from billionaires_dataset
group by gender with rollup;

-- Billionaires' wealth per field: Technology is the most profitable field
select coalesce(category, 'Total') category, count(*) billionaires, sum(finalWorth) wealth
from billionaires_dataset
group by category with rollup
order by wealth desc;

-- Categories with the biggest billionaires' wealth per country: France has the wealthiest individual (Fashion & Retail)
select country, category, max(finalWorth) biggest_wealth
from billionaires_dataset
group by country
order by biggest_wealth desc;

-- Share of the total wealth that the 10 most wealthy billionaires represent: 9.61% of the total billionaires' wealth
select round(((select sum(finalWorth)
from billionaires_dataset
where ranking <= 10)/sum(finalWorth))*100, 2) 'share_of_total_wealth'
from billionaires_dataset;

-- Wealth per country (Top 5: United States, China, India, France, Germany)
select country, sum(finalWorth) total_wealth
from billionaires_dataset
group by country
order by total_wealth desc;

-- Billionaires' preferred states to live in (US territory only): California, 178 individuals
select coalesce(state, 'Total residents') state, count(*) billionaires
from billionaires_dataset
where state is not null
group by state with rollup
order by billionaires desc;

-- Share of the country's GDP
select country, sum(finalWorth) billionaires_wealth,
cast(replace(substring(gdp_country, 2), ',', '') as double) gdp_country,
round((sum(finalWorth)/cast(replace(substring(gdp_country, 2), ',', '') as double))*100, 8) share_of_country_gdp
from billionaires_dataset
group by country
order by share_of_country_gdp desc
