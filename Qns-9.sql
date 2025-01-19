# List the top three dates in each month with the highest number of new followers. The final output should include the following columns: 
# • month 
# • date 
# • new_followers 


 WITH highest_followers AS (
 SELECT MONTH(date) AS "month",
       date,
       new_followers,
	   RANK() OVER(PARTITION BY MONTH(date) ORDER BY new_followers DESC) AS "rank_order"
FROM 
    gdb0120.fact_account)

SELECT dates.month_name,
       hf.date,
       hf.new_followers
FROM highest_followers hf
INNER JOIN gdb0120.dim_dates dates
ON dates.date = hf.date
WHERE hf.rank_order = 1;
