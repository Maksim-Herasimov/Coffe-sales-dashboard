SELECT 
 ROUND(SUM(money),2) AS total_revenue,
 ROUND(AVG(money),2) AS avg_revenue,
COUNT(money) AS total_transactions
  FROM `graphical-tape-436606-c6.art_house_coffe.art_coffe`;

SELECT coffee_name,
 ROUND(SUM(money),2) AS total_revenue,
 ROUND(AVG(money),2) AS avg_revenue,
COUNT(money) AS total_transactions
  FROM `graphical-tape-436606-c6.art_house_coffe.art_coffe`
 GROUP BY coffee_name
 ORDER BY total_revenue DESC;


WITH top_hour_of_day as (
 SELECT 'Hour of Day' as name_of_indicator, hour_of_day, COUNT(*) as total_transactions
 FROM `graphical-tape-436606-c6.art_house_coffe.art_coffe`
 GROUP BY hour_of_day
 ORDER BY total_transactions DESC
 LIMIT 1), top_time_of_Day as (
  SELECT 'Time of Day', Time_of_Day, COUNT(*) as total_transactions
  FROM `graphical-tape-436606-c6.art_house_coffe.art_coffe`
  GROUP BY Time_of_Day
  ORDER BY total_transactions DESC
 LIMIT 1), top_weekday as(
 SELECT 'Weekday', Weekday, COUNT(*) as total_transactions
  FROM `graphical-tape-436606-c6.art_house_coffe.art_coffe`
  GROUP BY Weekday
  ORDER BY total_transactions DESC
 LIMIT 1),	top_month_name as (
  SELECT 'Month Name', Month_name, COUNT(*) as total_transactions
  FROM `graphical-tape-436606-c6.art_house_coffe.art_coffe`
  GROUP BY Month_name
  ORDER BY total_transactions DESC
 LIMIT 1)
SELECT name_of_indicator, hour_of_day as top_indicators, total_transactions FROM top_hour_of_day
UNION ALL
SELECT * FROM top_time_of_Day
UNION ALL
SELECT * FROM top_weekday
UNION ALL
SELECT * FROM top_month_name;


