//Indica cual es el nombre del director del que más películas se han alquilado

SELECT director_name, cantidad_alquilada FROM (
SELECT DISTINCT m.MOVIE_NAME, d.DIRECTOR_NAME, COUNT(m.MOVIE_ID) AS cantidad_alquilada  
FROM PUBLIC.MOVIES AS m
INNER JOIN PUBLIC.MEMBERS_MOVIE_RENTAL AS mmr
ON m.MOVIE_ID = mmr.MOVIE_ID 
INNER JOIN PUBLIC.DIRECTORS AS d
ON m.DIRECTOR_ID  = d.DIRECTOR_ID 
GROUP BY m.MOVIE_NAME, d.DIRECTOR_NAME 
) ORDER BY cantidad_alquilada DESC LIMIT 1


