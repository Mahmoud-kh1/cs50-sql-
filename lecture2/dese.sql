--q1
select name, city from schools where type like "Public School";

--q2
select name from districts where name like "%(non-op)";

-- q3
select avg(per_pupil_expenditure) as "Average District Per-Pupil Expenditure" from expenditures;

-- q4
select city, count(type) from schools where type like "public school" group by city order by count(type) desc, city limit 10;

-- q5
select city, count(type) from schools where type like "public school" group by city having count(type) <= 3 order by count(type) desc, city ;

-- q6
select s.name from schools s join graduation_rates g on s.id = g.school_id where g.graduated = 100;

-- q7
select s.name  from schools s join districts d ON s.district_id = d.id where d.name like "Cambridge";

-- q8 
select d.name , e.pupils from districts d  join expenditures e on d.id = e.district_id;

-- q9
select d.name from districts d join  expenditures e on d.id = e.district_id
where 	e.pupils In(
    select min(	pupils) from expenditures
)
;

-- q10
select d.name , e.per_pupil_expenditure from districts d join expenditures e
ON d.id = e.district_id
where d.type like "Public School District"
order by e.per_pupil_expenditure desc limit 10;


-- q11
select s.name , e.per_pupil_expenditure, g.graduated from schools s join expenditures e using(district_id)
join graduation_rates g On s.id = g.school_id order by e.per_pupil_expenditure desc , s.name;

-- q12
select d.name, e.per_pupil_expenditure, s.exemplary from districts d join expenditures e
ON d.id = e.district_id
join staff_evaluations s ON d.id = s.district_id
where d.type like "Public School District" and s.exemplary >= (
    select avg(exemplary) from staff_evaluations
)
and e.per_pupil_expenditure >= (
    select avg(per_pupil_expenditure) from expenditures
)
order by s.exemplary desc,  e.per_pupil_expenditure desc
;
