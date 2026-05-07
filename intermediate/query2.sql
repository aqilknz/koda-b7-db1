-- minitask 5
SELECT m.title, d.first_name, d.last_name, g.genre_name
FROM movies m
JOIN director d ON m.director_id = d.director_id
JOIN genre g ON m.genre_id = d.director_id
LIMIT 50;

SELECT m.title, a.first_name, a.last_name, ma.role
FROM movies m
JOIN movies_actors ma ON m.id_movies = ma.movie_id
JOIN actors a ON ma.actor_id = a.actors_id;