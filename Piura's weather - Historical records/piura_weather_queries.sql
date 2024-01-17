SELECT * FROM piura_weather.piura_weather;

-- Max temperature ever recorded in Piura
select concat(year,'-',month,'-',date) Date, max_temp
from piura_weather
where max_temp = (select max(max_temp)
from piura_weather);

-- Min temperature ever recorded in Piura
select concat(year,'-',month,'-',date) Date, min_temp
from piura_weather
where min_temp = (select min(min_temp)
from piura_weather);


-- Select max and min temp and precipitation per year
select year, max(max_temp) max_annual_temp, min(min_temp) min_annual_temp,
max(precipitation) max_annual_prec, min(precipitation) min_annual_prec
from piura_weather
group by year
order by year;

-- Select max and min temp and precipitation per month
select year, month, max(max_temp) max_monthly_temp, min(min_temp) min_monthly_temp,
max(precipitation) max_monthly_prec, min(precipitation) min_monthly_prec
from piura_weather
group by year, month
order by year, month;


-- Dates when max_temp was greater than max_temp at same date, previous year
select concat(p1.year, '-', p1.month, '-', p1.date) prev_date, p1.max_temp prev_date_temp,
concat(p2.year, '-', p2.month, '-', p2.date) next_date, p2.max_temp next_date_temp,
round(p2.max_temp - p1.max_temp, 2) temp_diff
from piura_weather p1
left join piura_weather p2
on p1.year = p2.year - 1 and p1.month = p2.month and p1.date = p2.date
where p2.max_temp > p1.max_temp;

-- Number of years recorded
select count(distinct year) count_of_years
from piura_weather;

-- Max and min temp and precipitation per decade
select decade, max(max_temp) max_decade_temp, min(min_temp) min_decade_temp,
max(precipitation) max_prec, min(precipitation) min_prec
from
(select *, case
when year between 1970 and 1979 then '70s'
when year between 1980 and 1989 then '80s'
when year between 1990 and 1999 then '90s'
when year between 2000 and 2009 then '2000s'
else '2010s' end as decade
from piura_weather) a
group by decade;