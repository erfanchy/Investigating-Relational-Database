/*Query 4 - query used for final insight */

SELECT DATE_PART('month',r.rental_date) as month,DATE_PART('year',r.rental_date) as year,s.store_id,COUNT(*) 
FROM rental r 
JOIN staff s 
ON r.staff_id = s.staff_id
JOIN store st 
ON st.store_id=s.store_id
GROUP BY 1,2,3
ORDER BY 4 DESC
