/*Query 1 - query used for first insight */

SELECT DISTINCT film_title,category_name,COUNT(*) OVER (PARTITION BY film_title ORDER BY category_name)  as rental_count  
FROM ( 
SELECT f.title as film_title,c.name as category_name
FROM film f 
JOIN film_category fc
ON f.film_id = fc.film_id 
JOIN category c 
ON c.category_id = fc.category_id 
JOIN inventory i 
ON i.film_id = f.film_id 
JOIN rental r 
ON r.inventory_id = i.inventory_id 
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family' , 'Music' ) ) sub
ORDER BY 2,1