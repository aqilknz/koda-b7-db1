CREATE TABLE movies(
    id_movies SERIAL PRIMARY key,
    title VARCHAR(50) NOT NULL,
    release_date TIMESTAMP DEFAULT Now(),
    rating FLOAT,
    director_id INT,
    genre_id INT,
    FOREIGN KEY (director_id) REFERENCES director(director_id),
    FOREIGN KEY (genre_id) REFERENCES genre(genre_id) 
);

CREATE TABLE director(
    director_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE movies_actors(
    movie_id INT,
    actor_id INT,
    role VARCHAR(50),
    -- PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(id_movies),
    FOREIGN KEY (actor_id) REFERENCES actors(actors_id)
);
CREATE TABLE genre(
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(50)
);
CREATE TABLE actors(
    actors_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO director (first_name, last_name) VALUES
('Christopher', 'Nolan'),
('Ahmad', 'Aqil');
INSERT INTO genre (genre_name) VALUES
('Fiksi'), ('Teknologi'), ('Horor'), ('Thriller');
INSERT INTO movies (title, release_date, rating, director_id, genre_id) VALUES 
('Inception', '2010-07-16', 7.3, 1, 1),
('Interstellar', '2008-11-07', 8.7, 1, 1),
('Oppenheimer', '2020-07-21', 8.3, 1, 4),
('Barbie', '2020-07-21', 6.9, 2, 2),
('Lady Bird', '2017-11-03', 7.4, 2, 4),
('Tenet', '2020-08-26', 7.4, 1, 4),
('Dunkirk', '2017-07-21', 7.8, 1, 4),
('The Dark Knight', '2008-07-18', 9.0, 1, 4),
('Memento', '2000-10-11', 8.4, 1, 4),
('Prestige', '2006-10-20', 8.5, 1, 4),
('Gundala', '2019-08-29', 6.5, 2, 1),
('Pengabdi Setan', '2017-09-28', 7.0, 2, 3),
('KKN di Desa Penari', '2022-04-30', 6.8, 2, 3),
('Miracle in Cell No 7', '2022-09-08', 7.6, 2, 1),
('Sewu Dino', '2023-04-19', 6.3, 2, 3);

INSERT INTO actors (first_name, last_name) VALUES
('Al', 'Ghazali'),
('Aqil', 'Khanz'),
('Ikhsan', 'sans'),
('Lucas', 'Legend'),
('Thomas', 'Alvadison'),
('James', 'Bond');

INSERT INTO movies_actors (movie_id, actor_id, role) VALUES
(1, 1, 'Narrator'),
(2, 1, 'Cameo'), 
(3, 1, 'Supporting'),
(4, 1, 'Foil'),
(1, 1, 'Protagonist'),
(1, 2, 'Sidekick'),
(2, 2, 'Protagonist'),     
(2, 3, 'Mentor'),   
(3, 4, 'Antagonist'),
(4, 5, 'Protagonist'), 
(4, 6, 'Love Interest'),
(5, 1, 'Protagonist'),
(1, 4, 'Comic Relief'),
(2, 5, 'Tritagonist'),
(6, 1, 'Protagonist'), (6, 2, 'Sidekick'),
(7, 3, 'Protagonist'), (7, 4, 'Supporting'),
(8, 5, 'Antagonist'), (8, 6, 'Protagonist'),
(9, 1, 'Protagonist'),
(10, 2, 'Protagonist'), (10, 3, 'Antagonist'),
(11, 4, 'Protagonist'),
(12, 5, 'Protagonist'), (12, 6, 'Supporting'),
(13, 1, 'Protagonist'), (13, 2, 'Comic Relief'),
(14, 3, 'Protagonist'), (14, 4, 'Tritagonist'),
(15, 5, 'Protagonist'), (15, 6, 'Antagonist');

table movies;
table director;
table genre;
table actors;
table movies_actors

-- minitask 4
SELECT id_movies, title, release_date, rating
FROM movies
WHERE extract(YEAR FROM release_date) = 2020;

SELECT actors_id, first_name
FROM actors
WHERE first_name LIKE '%s';

SELECT id_movies, title, rating, release_date
FROM movies
-- WHERE rating >= 4.0 AND rating <= 8 AND extract(YEAR FROM release_date) >= 2004 AND extract(YEAR FROM release_date) <= 2010;
WHERE rating BETWEEN 4.0 AND 8.0 AND release_date BETWEEN '2004-01-01' AND '2010-12-31 23:59:59'
