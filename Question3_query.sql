/*Query 3 - query used for third insight */

SELECT DISTINCT category_name,standard_qu,COUNT (rental_duration) 
FROM (
  SELECT category_name,CASE WHEN standard_quartile = 1 THEN 1 WHEN standard_quartile = 2 THEN '2' WHEN standard_quartile = 3 THEN '3' ELSE '4' END as standard_qu,rental_duration
FROM (
SELECT DISTINCT film_title,category_name,rental_duration,
NTILE(4) OVER (ORDER BY rental_duration) as standard_quartile
FROM ( 
SELECT f.title as film_title,c.name as category_name,f.rental_duration as rental_duration
FROM film f 
JOIN film_category fc
ON f.film_id = fc.film_id 
JOIN category c 
ON c.category_id = fc.category_id 
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family' , 'Music' ))sub) sub2 ) sub3
GROUP BY 1,2
ORDER BY 1,2