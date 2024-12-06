    \set random_film_id random(:client_id * 1000 + 1001, :client_id * 1000 + 2000)
    \set random_actor_id random(:client_id * 1000 + 1001, :client_id * 1000 + 2000)

    BEGIN;

    -- Update actor only if the actor exists
    UPDATE actor
    SET first_name = 'UpdatedName', last_update = NOW()
    WHERE actor_id = :random_actor_id
    AND EXISTS (
        SELECT 1 FROM actor WHERE actor_id = :random_actor_id
    );

    -- Update film only if the film exists
    UPDATE film
    SET rental_rate = LEAST(rental_rate + 1, 99.99), last_update = NOW()
    WHERE film_id = :random_film_id
    AND EXISTS (
        SELECT 1 FROM film WHERE film_id = :random_film_id
    );

    COMMIT;
