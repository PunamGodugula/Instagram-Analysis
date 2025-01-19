# 5. Write a CTE that calculates the total number of 'likes’ for each 'post_category' during the month of 'July' and subsequently, arrange the 
#            'post_category' values in descending order according to their total likes.

WITH july_data AS (
SELECT post_category,
       SUM(likes) AS "likes"
FROM gdb0120.fact_content
WHERE MONTH(date)= "7"
GROUP BY post_category
)

SELECT * 
FROM july_data
ORDER BY likes DESC;