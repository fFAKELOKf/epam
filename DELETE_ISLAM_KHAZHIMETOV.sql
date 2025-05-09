DELETE FROM rental
WHERE inventory_id IN (
  SELECT i.inventory_id
    FROM inventory i
    JOIN film      f ON f.film_id = i.film_id
   WHERE f.title = 'Кухня'
);

DELETE FROM inventory
 WHERE film_id = (SELECT film_id FROM film WHERE title = 'Кухня');

DELETE FROM payment p
USING customer c
WHERE p.customer_id = c.customer_id
  AND c.first_name = 'Ислам'
  AND c.last_name  = 'Хажиметов';

DELETE FROM rental r
USING customer c
WHERE r.customer_id = c.customer_id
  AND c.first_name = 'Ислам'
  AND c.last_name  = 'Хажиметов';

