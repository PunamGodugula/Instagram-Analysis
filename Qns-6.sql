# 6. Create a report that displays the unique post_category names alongside their respective counts for each month. The output should have three columns:  
# • month_name 
# • post_category_names  
# • post_category_count 

WITH report AS (SELECT dates.month_name,
       content.post_category
FROM 
      gdb0120.dim_dates dates
INNER JOIN 
      gdb0120.fact_content content
ON dates.date = content.date)

SELECT month_name,
      group_concat(distinct post_category ORDER BY post_category ASC separator ' , ') AS "post_category_names",
      COUNT(DISTINCT(post_category)) AS "post_category_count"
FROM report
GROUP BY month_name
ORDER BY month_name;