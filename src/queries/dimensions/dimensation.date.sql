CREATE TABLE IF NOT EXISTS rivadataplatform.dataproducts.dim_date 
(

date_key	    INT 	Not null,
date	        DATE	Not null,
year	        INT	    Not null,
quarter     	INT	    Not null,
month	        INT	    Not null,
month_name	    STRING	Not null,
week_of_year	INT	    Not null,
day	            INT	    Not null, 
day_name	    STRING	Not null,
day_of_week	    INT	    Not null,
is_weekend	    BOOLEAN	Not null,

CONSTRAINT pk_dim_date PRIMARY KEY (date_key)
);

--Inserting Data
INSERT INTO rivadataplatform.dataproducts.dim_date (
    date_key,
    date,
    year,
    quarter,
    month,
    month_name,
    week_of_year,
    day,
    day_name,
    day_of_week,
    is_weekend
)



with dates as
(

select

explode(
    sequence(
        to_date ("2020-08-1" ),
        to_date ("2030-07-30"),
        interval 1 day
    )
) As Date

)

select 
cast(Date_Format(date, 'yyyyMMdd') as int),
date, year(date) as Year,
quarter(date) as Quarter, month(date) as Month,
date_format(date, 'MMM') as MonthName,
weekofyear(date) as WeekOfYear,
day(date),
date_format (date, 'EEEE') as day_name,
dayofweek(date) as DayOfWeek,
case
when dayofweek(date) in (1,7) then True
else False
end as IsWeekend
 from dates