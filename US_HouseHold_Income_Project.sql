SELECT * FROM 
us_income_project.us_household_income_statistics;

ALTER TABLE us_income_project.us_household_income_statistics rename column `ï»¿id` to `id`;

select *
from us_household_income;

SELECT *
FROM us_income_project.us_household_income_statistics;

SELECT count(id)
FROM us_income_project.us_household_income_statistics;



select id, count(id)
from us_household_income
group by id
having count(id) > 1
;


select *
from (
select row_id,
id,
row_number() over(partition by id order by id) as row_num
from us_household_income
) duplicates
where row_num > 1
;

delete from us_household_income
where row_id in (
	select row_id
	from (
		select row_id,
		id,
		row_number() over(partition by id order by id) row_num
		from us_household_income
		) duplicates
	where row_num > 1)
;

SET SQL_SAFE_UPDATES = 0;


select state_name, count(state_name)
from us_household_income
group by state_name
;

select distinct State_Name
from us_household_income
group by 1
;

update us_household_income
set State_name = 'Georgia'
where State_Name = 'georia'
;

select *
from us_household_income
where county = 'Autauga County'
order by 1
;

update us_household_income
set Place = 'Autaugaville'
where county = 'Auatuaga County'
and city = 'Vinemont'
;

select type, count(type)
from us_household_income
group by type
;

update us_household_income
set type = 'Borough'
where type = 'Boroughs';

select ALand, AWater
from us_household_income
WHERE (ALand = 0 or ALand = '' or ALand is null)
;

select * 
from us_household_income;

select *
from us_household_income_statistics;

select State_Name, sum(ALand), sum(AWater)
from us_household_income
group by State_Name
order by 3 desc
limit 10;

select * 
from us_household_income;

select *
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where mean <> 0;



select u.State_name, County, Type, `Primary`, Mean, Median
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where mean <> 0;

select u.State_name, round(avg(Mean),1), round(avg(Median),1)
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where mean <> 0
GROUP BY State_Name
order by 3 desc
Limit 10
;

select u.State_name, County, Type, `Primary`, Mean, Median
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where mean <> 0; 

select Type, round(avg(Mean),1), round(avg(Median),1)
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where mean <> 0
GROUP BY 1
order by 2 desc
limit 10
;

select Type, count(type), round(avg(Mean),1), round(avg(Median),1)
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
where mean <> 0
GROUP BY 1
having count(type) > 100
order by 4 desc
limit 20
;

select *
from us_household_income
where type = 'Community';


select u.State_Name, City, Round(avg(mean),1),Round(avg(median),1)
from us_household_income u
inner join us_household_income_statistics us
	on u.id = us.id
group by u.State_Name, City
Order by Round(avg(mean),1) desc;
    
    
    
    