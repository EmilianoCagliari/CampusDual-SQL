//Devuelve las películas del año 2000 en adelante que empiecen por la letra A.

SELECT * FROM MOVIES WHERE MOVIE_LAUNCH_DATE >= '2000-01-01' AND MOVIE_NAME LIKE 'A%' 
