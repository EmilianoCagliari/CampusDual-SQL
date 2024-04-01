//Muestra las películas con los actores que han participado en cada una de ellas


SELECT m.MOVIE_NAME, a.ACTOR_NAME  FROM movies AS m
INNER JOIN PUBLIC.MOVIES_ACTORS AS ma
ON m.MOVIE_ID = ma.MOVIE_ID 
INNER JOIN PUBLIC.ACTORS AS a
ON ma.ACTOR_ID  = a.ACTOR_ID 