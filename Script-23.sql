//Indica cuál es la media de duración de las películas de cada director

SELECT AVG(	M.MOVIE_DURATION ) AS AVG_DURATION, D.DIRECTOR_NAME FROM MOVIES AS M
INNER JOIN DIRECTORS AS D
ON M.DIRECTOR_ID = D.DIRECTOR_ID
GROUP BY D.DIRECTOR_NAME 