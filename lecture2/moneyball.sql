-- q1
select year , round(avg(salary), 2) as "avarage salary" from salaries group by year order by year desc;

--q2
select year, salary from salaries where player_id = (
    select id from players where concat(first_name, last_name) like "calripken"
)
order by year desc
;

--q3
select year , HR from performances where player_id = (
    select id from players where concat(first_name, last_name) like "KenGriffey"
    and birth_year = 1969
)
order by year desc
;


--q4
select
    p.first_name,
    p.last_name,
    s.salary
from
    players p
Join salaries s
on s.player_id = p.id
where s.year = 2001
order by s.salary, p.first_name, p.last_name, p.id
LIMIT 50;





--q5
select name from teams where id IN (
    select team_id from performances where  player_id = (
        select id from players where concat(first_name, last_name) like "SatchelPaige"
    )
)
;



--q6
select t.name , sum(p.H) from teams t join performances p
on t.id = p.team_id
where p.year = 2001
group by t.id order by sum(p.H) desc limit 5;



--q7
select first_name, last_name from players where id = (
    select player_id from salaries where salary = (
        select max(salary) from salaries
    )
)
;



--q8
select salary from salaries where player_id = (
    select player_id from performances where HR = (
        select max(HR) from performances where year = 2001
    )
)
and year = 2001
;




--q9
select name , round(avg(salary), 2) as "average salary"
from teams join salaries  on teams.id = salaries.team_id
where salaries.year = 2001
group by teams.id
order by "average salary" limit 5
;

--q10
select p.first_name , p.last_name , s.salary ,s.year, pr.HR from players p join
salaries s on s.player_id = p.id
join performances pr on pr.player_id = p.id and s.year = pr.year
order by p.id , s.year desc, pr.HR desc , s.salary desc
;

--q11
SELECT p.first_name, p.last_name, s.salary / pr.H AS 'dollars per hit'
FROM players p
JOIN salaries s ON s.player_id = p.id
JOIN (
    SELECT * FROM performances WHERE H != 0 and year = 2001
) pr ON pr.player_id = p.id AND pr.year = s.year
order by "dollars per hit" , p.first_name, p.last_name limit 10
;



--q12
select first_name , last_name from (
    -- Use subqueries with LIMIT and then perform the INTERSECT
SELECT first_name, last_name,id
FROM (
    -- First Query: Get the least 10 players based on salary / RBI
    SELECT p.first_name, p.last_name, p.id
    FROM players p
    JOIN salaries s ON s.player_id = p.id AND s.year = 2001
    JOIN performances pr ON pr.player_id = p.id AND pr.year = s.year
    WHERE pr.RBI > 0
    ORDER BY s.salary / pr.RBI, p.id
    LIMIT 10
)

INTERSECT

SELECT first_name, last_name,id
FROM (
    -- Second Query: Get the least 10 players based on salary per hit
    SELECT p.first_name, p.last_name, p.id
    FROM players p
    JOIN salaries s ON s.player_id = p.id
    JOIN (
        SELECT * FROM performances WHERE H != 0 AND year = 2001
    ) pr ON pr.player_id = p.id AND pr.year = s.year
    ORDER BY s.salary / pr.H, p.id
    LIMIT 10
)


)
order by id;




