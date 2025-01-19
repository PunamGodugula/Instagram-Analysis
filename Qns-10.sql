CREATE DEFINER=`root`@`localhost` PROCEDURE `get_total_shares`(IN in_week_no CHAR(3))
BEGIN
    SELECT content.post_type,
       SUM(content.shares) AS "total_shares"
FROM
      gdb0120.fact_content content
INNER JOIN 
      gdb0120.dim_dates dates
ON content.date = dates.date
WHERE dates.week_no = in_week_no
GROUP BY 1
ORDER BY 2 DESC;
    
END