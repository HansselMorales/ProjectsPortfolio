SELECT * FROM astronauts limit 3;

SELECT avg (Space_Flights) as avg_Space_Flights, avg (Space_Walks) as avg_Space_Walks FROM astronauts;

SELECT sum(Space_Flights) as sum_Space_Flights, sum(Space_Walks) as sum_Space_Walks FROM astronauts;

SELECT max(Space_Flights) as max_Space_Flights, max(Space_Walks) as max_Space_Walks FROM astronauts;

SELECT name, Space_Flights from astronauts where Space_Flights = 7;
SELECT name, Space_Walks from astronauts where Space_Walks = 10;

SELECT min(Space_Flights) as min_Space_Flights, min(Space_Walks) as min_Space_Walks FROM astronauts;

SELECT count(name), Space_Flights from astronauts where Space_Flights = 0;

SELECT count(name), Space_Walks from astronauts where Space_Walks = 0;

SELECT count(name) as both_0 from astronauts where Space_Flights = 0 and Space_Walks = 0;

select count(*) as Total_values from astronauts;

select count(Year) from astronauts;

select sum(case when year is null then 1 else 0 end) as Total_year_null_values from astronauts;

select * from astronauts where Missions is null;

select sum(case when Missions is null then 1 else 0 end) as Total_Missions_null_values from astronauts;


select name, Space_Flights from astronauts group by name having(Space_Flights = 1) limit 5;

select name, Space_Flights, Status from astronauts where Status = 'Management' and Space_Flights = 0;

select count(*) from astronauts where Status = 'Management' and Space_Flights = 0;