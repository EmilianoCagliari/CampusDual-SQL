//Devuelve el nombre de todas las películas y el nombre del estudio que las ha realizado

SELECT M.MOVIE_NAME, ST.STUDIO_NAME  FROM MOVIES AS M
INNER JOIN STUDIOS AS ST
ON M.STUDIO_ID = ST.STUDIO_ID 