\set random_language_id random(:client_id * 10 + 10, :client_id * 10 + 20)
\set random_film_id random(:client_id * 1000 + 1001, :client_id * 1000 + 2000)
\set random_actor_id random(:client_id * 1000 + 1001, :client_id * 1000 + 2000)
\set random_inventory_id random(:client_id * 1000 + 1001, :client_id * 1000 + 2000)
\set random_store_id random(1, 2)

BEGIN;

-- Insert new language only if it doesn't exist
INSERT INTO language (language_id, name, last_update)
SELECT :random_language_id, 'LanguageName', NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM language WHERE language_id = :random_language_id
);

-- Insert new film associated with the new language only if it doesn't exist
INSERT INTO film (film_id, title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, last_update)
SELECT :random_film_id, 'Test Movie', 'Test Description', 2023, :random_language_id, 5, 4.99, 120, 19.99, 'PG', NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM film WHERE film_id = :random_film_id
);

-- Insert new actor only if it doesn't exist
INSERT INTO actor (actor_id, first_name, last_name, last_update)
SELECT :random_actor_id, 'FirstName', 'LastName', NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM actor WHERE actor_id = :random_actor_id
);

-- Insert new inventory associated with the new film only if it doesn't exist
INSERT INTO inventory (inventory_id, film_id, store_id, last_update)
SELECT :random_inventory_id, :random_film_id, :random_store_id, NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM inventory WHERE inventory_id = :random_inventory_id
);

-- Insert relation between the actor and the film only if it doesn't exist
INSERT INTO film_actor (actor_id, film_id, last_update)
SELECT :random_actor_id, :random_film_id, NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM film_actor WHERE actor_id = :random_actor_id AND film_id = :random_film_id
);

COMMIT;
