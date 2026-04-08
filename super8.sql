use hotel;


select * from hotel_report limit 15;
-- avg revenue by day
select 
	dow,
	avg(Revenue) ''
from hotel_report 
group by dow;

-- avg revenue by day by year
select 
	extract(Year from Date) as year,
	dow,
	avg(Revenue)
from hotel_report 
group by dow, year;

-- avg revenue by day by year i april
SELECT 
    EXTRACT(YEAR FROM Date)  AS year,
    EXTRACT(MONTH FROM Date) AS month,
    dow,
    ROUND(AVG(Revenue), 2) AS 'average revenue'
FROM hotel_report 
WHERE EXTRACT(MONTH FROM Date) = 4
GROUP BY dow, year, month;




-- revenue by day by year
WITH revenue_by_day as(
	select 
		dow,
		EXTRACT(year from Date) as year,
        EXTRACT(day from Date) as day,
        EXTRACT(Month from Date) as month,
		revenue,
        revpar,
        adr,
        revenue/adr as avg_room,
        occupancy
	from hotel_report
)

-- April revenue by day 2023, 2024,2025
SELECT  * 
from revenue_by_day 
where month = 4
group by dow, year, day, month, revenue, revpar, adr,avg_room,  occupancy;

-- view for revpar metrics
CREATE VIEW revpar_and_revpar_diff as (
	select
		EXTRACT(year from Date) as year,
        EXTRACT(day from Date) as day,
        EXTRACT(Month from Date) as month,
        dow,
        revpar,
        adr,
        `Revpar Ly`,
        `Revpar Diff`
	from hotel_report
);
-- Max adr and rev par by in  in April by year

select
	year,
    month,
    day,
	Dow,
	max(adr),
	max(`Revpar Diff`)
from revpar_and_revpar_diff
group by year, month,day, Dow;








