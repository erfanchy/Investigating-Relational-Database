/*Query 2 - query used for second insight */

SELECT DISTINCT film_title,category_name,rental_duration,
NTILE(4) OVER (ORDER BY rental_duration) as standard_quartile
FROM ( 
SELECT f.title as film_title,c.name as category_name,f.rental_duration as rental_duration
FROM film f 
JOIN film_category fc
ON f.film_id = fc.film_id 
JOIN category c 
ON c.category_id = fc.category_id 
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family' , 'Music' ) ) sub
ORDER BY 4,3