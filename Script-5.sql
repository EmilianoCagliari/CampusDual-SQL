//Devuelve las 20 duraciones de películas más frecuentes, ordenados de mayor a menor.

SELECT COUNT(MOVIE_NAME) AS Peliculas, MOVIE_DURATION  FROM MOVIES GROUP BY MOVIE_DURATION  ORDER BY MOVIE_DURATION DESC LIMIT 20