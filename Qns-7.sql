# 7. What is the percentage breakdown of total reach by post type?  The final output includes the following fields: 
# • post_type 
 # • total_reach 
# • reach_percentage

SELECT 
post_type,
SUM(reach) AS "total_reach",
concat(ROUND((SUM(reach)/(SELECT SUM(reach) FROM gdb0120.fact_content))*100,2),"%") AS "reach_percentage"
FROM gdb0120.fact_content
GROUP BY post_type
ORDER BY 2 DESC;