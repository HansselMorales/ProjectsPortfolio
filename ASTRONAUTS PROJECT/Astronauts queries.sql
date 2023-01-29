-- 1. NUMBER OF VALUES
select count(*) as Total_values 
from astronauts;


-- 2. SPACE FLIGHTS AND SPACE WALKS AVERAGE VALUES
SELECT avg (Space_Flights) as avg_Space_Flights, avg (Space_Walks) as avg_Space_Walks 
FROM astronauts;

-- 3. NUMBER OF SPACE FLIGHTS AND WALKS
SELECT sum(Space_Flights) as sum_Space_Flights, sum(Space_Walks) as sum_Space_Walks 
FROM astronauts;

-- 4. MAX SPACE FLIGHTS AND SPACE WALKS VALUES
SELECT max(Space_Flights) as max_Space_Flights, max(Space_Walks) as max_Space_Walks 
FROM astronauts;

-- 5. ASTRONAUT WHO HAVE THE MOST NUMBER OF SPACE FLIGHTS
SELECT name, Space_Flights 
from astronauts where Space_Flights = 7;

-- 6. ASTRONAUT WHO HAVE THE MOST NUMBER OF SPACE WALKS
SELECT name, Space_Walks 
from astronauts where Space_Walks = 10;

-- 7. MIN SPACE FLIGHTS AND SPACE WALKS VALUES
SELECT min(Space_Flights) as min_Space_Flights, min(Space_Walks) as min_Space_Walks 
FROM astronauts;

-- 8. NUMBER OF ASTRONAUTS WITH NO SPACE FLIGHTS
SELECT count(name), Space_Flights 
from astronauts 
where Space_Flights = 0;

-- 9. NUMBER OF ASTRONAUTS WITH NO SPACE WALKS
SELECT count(name), Space_Walks 
from astronauts 
where Space_Walks = 0;

-- 9. NUMBER OF ASTRONAUTS WITH NEITHER SPACE FLIGHTS NOR SPACE WALKS
SELECT count(name) as both_0 
from astronauts 
where Space_Flights = 0 and Space_Walks = 0;

-- 10 NUMBER OF NULL VALUES (YEAR)
select count(Year) 
from astronauts;

select sum(case when year is null then 1 else 0 end) as Total_year_null_values 
from astronauts;

-- 10 NUMBER OF NULL VALUES (MISSIONS)
select * 
from astronauts 
where Missions is null;

select sum(case when Missions is null then 1 else 0 end) as Total_Missions_null_values 
from astronauts;

-- 11. ASTRONAUTS IN MANAGEMENT POSITION WITH NO FLIGHT EXPERIENCE
select name, Space_Flights, Status 
from astronauts 
where Status = 'Management' and Space_Flights = 0;

-- 12. NUMBER OF ASTRONAUTS IN MANAGEMENT POSITION WITH NO FLIGHT EXPERIENCE
select count(*) 
from astronauts 
where Status = 'Management' and Space_Flights = 0;
