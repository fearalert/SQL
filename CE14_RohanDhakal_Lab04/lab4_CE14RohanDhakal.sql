
-- 3. Write Some SQL queries to explore the tables.
SELECT * FROM actors;
SELECT * FROM directors
SELECT * FROM movies;
SELECT * FROM movies2actors;
SELECT * FROM movies2directors;
SELECT * FROM u2base;
SELECT * FROM users;
SELECT DISTINCT rating FROM u2base;
SELECT * FROM movies WHERE movieid NOT IN (SELECT movieid FROM u2base);

-- 4. Create a view for the following
	-- (1) average rating of all movies
	CREATE VIEW ratings AS
	(
		SELECT userid, movieid,
		CAST(rating AS integer) AS Rating
		FROM u2base
	);

	SELECT AVG(Rating) AS average_rating FROM ratings;

	-- (2) number of actors in each movie
	CREATE VIEW actors_in_each_movie AS
	(
		SELECT 
		movies2actors.movieid AS movieId,
		COUNT(movies2actors.actorid) AS actor_count
		FROM
		movies2actors
		GROUP BY movies2actors.movieid
	);
	SELECT * FROM actors_in_each_movie;

	-- (3) number of rating for each movie
	CREATE VIEW no_of_ratings_each_movie AS
	(
		SELECT 
		u2base.movieid AS movieId,
		COUNT(u2base.rating) AS ratings
		FROM
		u2base
		GROUP BY u2base.movieid
	);
	SELECT * FROM no_of_ratings_each_movie;

	-- (4) number of rating by each user
	CREATE VIEW no_of_ratings_by_each_user AS
	(
		SELECT
		u2base.userid AS userId,
		COUNT (u2base.rating) AS rating_count
		FROM
		u2base
		GROUP BY u2base.userid
	);
	SELECT * FROM no_of_ratings_by_each_user;


-- 5 Find the number of users who have rated at least one movie.
SELECT COUNT(ratings.userid) As no_of_users
FROM
ratings
JOIN
users
ON ratings.userid = users.userid
WHERE ratings.rating != 0

-- 6 Find the number of unrated movies
SELECT COUNT(mov.movieid) AS unrated_movies_count
FROM 
movies AS mov
WHERE 
mov.movieid
NOT IN 
(SELECT n.movieid 
FROM no_of_ratings_each_movie AS n
);

-- 7 Find top 10 highest rated movies and the actors who played in those movies.
-- top 10 highest rated movies
CREATE VIEW highest_rated_movies AS (
	SELECT ratings.movieid,
	COUNT(ratings.rating) AS ratings_of_movie
	FROM
	ratings
	GROUP BY(ratings.movieid)
	ORDER BY ratings_of_movie DESC LIMIT 10);

SELECT * FROM highest_rated_movies;

-- actors who have played in those highest rated movies
SELECT 
h.movieid, mov.actorid
FROM
movies2actors AS mov
JOIN
highest_rated_movies AS h
ON 
h.movieid = mov.movieid;


