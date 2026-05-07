-- Active: 1777968422854@@127.0.0.1@5050@mydb
-- minitask 6
SELECT d.first_name, d.last_name, COUNT(g.genre_id)
FROM movies m
JOIN director d ON m.director_id = d.director_id
JOIN genre g ON m.genre_id = g.genre_id
GROUP BY d.first_name, d.last_name;

SELECT a.actors_id, a.first_name, a.last_name, COUNT(ma.movie_id) AS total_roles
FROM actors a
JOIN movies_actors ma ON a.actors_id = ma.actor_id
GROUP BY a.actors_id, a.first_name, a.last_name
HAVING COUNT(ma.movie_id) > 5
ORDER BY total_roles DESC;

SELECT d.first_name, d.last_name, COUNT(m.id_movies) AS total_movies
FROM director d
JOIN movies m ON d.director_id = m.director_id
GROUP BY d.director_id, d.first_name, d.last_name
ORDER BY total_movies DESC
LIMIT 1;

SELECT extract(YEAR FROM m.release_date ) AS Tahun, count(m.id_movies) AS jumlah_film
FROM movies m
GROUP BY Tahun
ORDER BY jumlah_film DESC
LIMIT 1;

SELECT m.title, STRING_AGG(concat(a.first_name, ' ', a.last_name, ' as ', ma.role), ', ' ORDER BY ma.role) AS actors_with_role
FROM movies m
JOIN movies_actors ma ON m.id_movies = ma.movie_id
JOIN actors a ON ma.actor_id = a.actors_id
GROUP BY m.title, m.id_movies
ORDER BY m.id_movies;
