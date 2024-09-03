SELECT title FROM cyberchase WHERE season = 1;

SELECT season , title from episodes where episode_in_season = 1;

SELECT production_code FROM episodes WHERE title LIKE "Hackerized!";

SELECT title FROM episodes WHERE topic IS NULL;

SELECT title FROM episodes WHERE air_date = "2004-12-31";

SELECT title FROM episodes WHERE season = 6 AND air_date < "2008-01-01";

SELECT title, topic FROM episodes WHERE topic LIKE "%fraction%";

SELECT COUNT(id) FROM episodes WHERE air_date >= "2018-01-01" AND air_date  <= "2023-12-31";

SELECT COUNT(title) FROM episodes WHERE air_date >= "2002-01-01" AND air_date  <= "2007-12-31";

SELECT id, title , production_code FROM episodes ORDER BY production_code;

SELECT title FROM episodes WHERE season  = 5 ORDER BY title desc;

SELECT COUNT(DISTINCT(title)) from episodes;

select title from episodes where id >= 1 or topic like "a7a";



