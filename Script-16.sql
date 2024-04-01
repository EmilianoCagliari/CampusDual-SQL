//Devuelve cuantas películas hay de cada país

SELECT COUNT(M.MOVIE_ID) AS Peliculas, N.NATIONALITY_NAME FROM MOVIES AS M
INNER JOIN NATIONALITIES AS N
ON M.NATIONALITY_ID = N.NATIONALITY_ID 
GROUP BY N.NATIONALITY_ID 