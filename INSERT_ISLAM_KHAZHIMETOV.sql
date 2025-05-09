INSERT INTO film (
  title,
  description,
  release_year,
  language_id,
  rental_duration, 
  rental_rate,
  length,
  replacement_cost,
  rating,
  special_features
) VALUES (
  'Кухня',
  'Российский комедийный сериал о повседневной жизни сотрудников ресторана',
  2012,
  1,     
  14,   
  4.99,
  25,    
  19.99,
  'PG',
  '{Behind the Scenes}'::text[]
);

INSERT INTO actor (first_name, last_name)
VALUES
  ('Dmitry', 'Nagiev'),
  ('Elena',  'Podkaminskaya'),
  ('Dmitriy','Nazarov');

INSERT INTO film_actor (actor_id, film_id)
SELECT a.actor_id, f.film_id
  FROM actor a
  JOIN film  f ON f.title = 'Кухня'
 WHERE (a.first_name, a.last_name) IN (
   ('Dmitry','Nagiev'),
   ('Elena', 'Podkaminskaya'),
   ('Dmitriy','Nazarov')
 );

INSERT INTO inventory (film_id, store_id)
SELECT film_id, 1
  FROM film
 WHERE title = 'Кухня';
