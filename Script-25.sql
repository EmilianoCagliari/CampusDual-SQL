//Indica el número de películas que hayan hecho los directores durante las décadas de los 60, 70 y 80 que contengan la palabra "The" en cualquier parte del título


SELECT 
count(MOVIE_NAME),
decada
FROM (
SELECT	
	M.MOVIE_NAME AS MOVIE_NAME, 
	CONCAT(
	SUBSTR(CAST(YEAR(MOVIE_LAUNCH_DATE) AS VARCHAR(4)), 3,1),
	'0s'
	) AS decada
FROM PUBLIC.MOVIES AS M 
INNER JOIN PUBLIC.DIRECTORS AS D
ON M.DIRECTOR_ID = D.DIRECTOR_ID
WHERE YEAR(MOVIE_LAUNCH_DATE) < '1990' AND M.MOVIE_NAME LIKE '%The%'
) GROUP BY decada;

