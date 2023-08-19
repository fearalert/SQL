USE imdb;
-- 
-- 3. Update the tables to add primary and foreign key constraints.
ALTER TABLE actors ADD CONSTRAINT PRIMARY KEY (id);
ALTER TABLE directors ADD CONSTRAINT PRIMARY KEY (id);
ALTER TABLE movies ADD CONSTRAINT PRIMARY KEY (id);

ALTER TABLE roles ADD FOREIGN KEY (movie_id) REFERENCES movies(id);
ALTER TABLE roles ADD FOREIGN KEY (actor_id) REFERENCES actors(id);
ALTER TABLE directors_genres ADD FOREIGN KEY (director_id) REFERENCES directors(id);
ALTER TABLE movies_directors ADD FOREIGN KEY (director_id) REFERENCES directors(id);
ALTER TABLE movies_genres ADD FOREIGN KEY (movie_id) REFERENCES movies(id);

ALTER TABLE directors_genres ADD CONSTRAINT PRIMARY KEY(director_id, genre);
ALTER TABLE movies_genres ADD CONSTRAINT PRIMARY KEY(movie_id, genre);
ALTER TABLE movies_directors ADD CONSTRAINT PRIMARY KEY(director_id, movie_id);


-- 4. Remove film_count from actors table.
ALTER TABLE actors DROP COLUMN film_count;

-- 5. Write SQL queries for the following:
-- 1. Find the number of actors, movies, genres, and directors.
SELECT
	(SELECT COUNT(a.id) FROM actors as a) AS no_of_actors,
	(SELECT COUNT(m.id) FROM movies as m) AS no_of_movies,
	(SELECT COUNT(DISTINCT genre) FROM directors_genres as dg) AS no_of_director_genres,
	(SELECT COUNT(DISTINCT genre) FROM movies_genres as g) AS no_of_movie_genres,
	(SELECT COUNT(d.id) FROM directors AS d) AS no_of_directors;
 
 
-- 2. List the full name, and role of all actors who played in Titanic.
SELECT 
	CONCAT(a.first_name,' ',a.last_name) AS actors_in_titanic, 
	r.role AS role_in_movie
FROM roles AS r
JOIN actors AS a 
ON a.id = r.actor_id
JOIN movies AS m 
ON m.id = r.movie_id
WHERE m.name = 'Titanic';
 
 
-- 3. Find the number of movies in all genres. 
SELECT 
	g.genre, 
    COUNT(m.id) AS no_of_movies 
FROM movies AS m
JOIN movies_genres AS g 
ON g.movie_id = m.id
GROUP BY g.genre;


-- 4. Find the average number of movies played by the actors.
SELECT AVG(average.no_of_movies_played_by_the_actors) 
AS average_no_of_movies_played_by_the_actors 
FROM(
	SELECT r.actor_id, COUNT(r.movie_id) 
    AS no_of_movies_played_by_the_actors 
	FROM roles As r
	GROUP BY r.actor_id
    ) AS average; 


-- 5. Find the average number of actors in a movie. 
SELECT AVG(average.no_of_actors_in_a_movie) 
AS average_no_of_actors_in_a_movie 
FROM(
	SELECT r.movie_id, COUNT(r.actor_id)
    AS no_of_actors_in_a_movie
    FROM roles as r
    GROUP BY r.movie_id
    ) AS average;
 
 
-- 6. Find top 5 movies based on the rank. 
SELECT * FROM 
	movies AS m
ORDER BY m.rank 
DESC LIMIT 5;


-- 7. Find 20 directors who have directed at least 2 movies. 
SELECT 
	CONCAT(d.first_name,' ',d.last_name) AS director_name, 
    d.id,
    COUNT(*) AS total_movies_directed
FROM movies_directors AS md
JOIN directors AS d
ON d.id = md.director_id
GROUP BY md.director_id
HAVING COUNT(md.director_id) >= 2
ORDER BY total_movies_directed DESC LIMIT 20;


-- 8. Find all movies played by Kevin Bacon. 
SELECT 
	CONCAT(a.first_name,' ',a.last_name) AS actor_name, 
	m.name AS movies_played, 
	r.role AS role_in_movie,
    m.year
FROM roles AS r 
JOIN actors AS a
ON a.id = r.actor_id
JOIN movies AS m
ON m.id = r.movie_id
WHERE
	a.first_name = 'Kevin' AND a.last_name = 'Bacon'
ORDER BY m.year;


-- 9. Find all movies released from 1990 to 2000.
SELECT * FROM 
	movies AS m 
WHERE m.year
BETWEEN 1990 AND 2000
ORDER BY m.year;

