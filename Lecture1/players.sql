select birth_city, birth_state , birth_country from players where CONCAT(first_name, last_name) like "JackieRobinson";

select bats from players where concat (first_name , last_name) like "BabeRuth";

select id from players where debut IS null;


SELECT first_name, last_name
FROM players
WHERE birth_country != 'USA'
ORDER BY first_name ASC, last_name ASC;


select first_name , last_name from players where bats like "R" order by first_name, last_name;

SELECT first_name, last_name, debut
FROM players
WHERE birth_city = 'Pittsburgh'
  AND birth_state = 'PA'
ORDER BY debut DESC, first_name ASC, last_name ASC;

select
    COUNT(id) from players
where
    (bats like "R" and throws like "L")
     or
     (bats = 'L' and throws = 'R')
     ;

select avg(height) as "Average Height", avg(weight) as "Average Weight" from players where debut >= "2000-01-01";


select first_name, last_name from players where final_game   like "2022%" order by first_name, last_name;


select first_name, last_name, debut from players where birth_city like "Pittsburgh" And birth_state like "Pennsylvania" order by first_name, last_name, debut;



