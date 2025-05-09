SELECT s.store_id,
       st.staff_id,
       st.first_name,
       st.last_name,
       SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff st ON p.staff_id = st.staff_id
JOIN store s ON st.store_id = s.store_id
WHERE EXTRACT(YEAR FROM p.payment_date) = 2017
GROUP BY s.store_id, st.staff_id, st.first_name, st.last_name
HAVING SUM(p.amount) = (
    SELECT MAX(sub.total_revenue)
    FROM (
        SELECT SUM(p2.amount) AS total_revenue
        FROM payment p2
        JOIN staff st2 ON p2.staff_id = st2.staff_id
        WHERE EXTRACT(YEAR FROM p2.payment_date) = 2017
          AND st2.store_id = s.store_id
        GROUP BY st2.staff_id
    ) AS sub
);

SELECT f.title,
       COUNT(r.rental_id) AS rental_count,
       f.rating AS expected_audience
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title, f.rating
ORDER BY rental_count DESC
LIMIT 5;

SELECT a.actor_id,
       a.first_name,
       a.last_name,
       MAX(f.release_year) AS last_appearance_year
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY last_appearance_year ASC
LIMIT 5;