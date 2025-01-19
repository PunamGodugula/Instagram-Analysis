# Create a report that includes the quarter, total comments, and total saves recorded for each post category. Assign the following quarter groupings: 
#        (January, February, March) → “Q1” 
#        (April, May, June) → “Q2” 
#        (July, August, September) → “Q3” 
# The final output columns should consist of: 
#          post_category 
#          quarter 
#          total_comments 
#          total_saves

SELECT 
    post_category, 
    CONCAT('Q', QUARTER(date)) AS quarter,
    SUM(comments) AS"total_comments",
    SUM(saves) AS "total_saves"
FROM gdb0120.fact_content
GROUP BY 1,2
ORDER BY 2, 1;
