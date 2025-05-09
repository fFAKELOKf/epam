UPDATE film
SET
  rental_duration = 21,  
  rental_rate     = 9.99
WHERE title = 'Кухня';

WITH candidate AS (
  SELECT c.customer_id
  FROM customer c
  JOIN rental  r ON r.customer_id  = c.customer_id
  JOIN payment p ON p.customer_id  = c.customer_id
  GROUP BY c.customer_id
  HAVING COUNT(r.rental_id)   >= 10
     AND COUNT(p.payment_id)  >= 10
  LIMIT 1
)
UPDATE customer
SET
  first_name  = 'Ислам',                       
  last_name   = 'Хажиметов',                     
  email       = 'islam.hajimetov@gmail.com',    
  address_id  = (
    SELECT address_id
      FROM address
     LIMIT 1                                
  ),
  create_date = CURRENT_DATE
WHERE customer_id = (SELECT customer_id FROM candidate);
