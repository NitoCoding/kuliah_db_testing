\set random_film_id random(:client_id * 1000 + 1001, :client_id * 1000 + 2000)
\set random_actor_id random(:client_id * 1000 + 1001, :client_id * 1000 + 2000)

BEGIN;

SELECT * FROM film
WHERE film_id = :random_film_id;

SELECT * FROM actor
WHERE actor_id = :random_actor_id;

SELECT f.title, a.first_name, a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.film_id = :random_film_id;

COMMIT;
