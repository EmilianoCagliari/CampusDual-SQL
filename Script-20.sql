//Devuelve el nombre y el año de todas las películas que han sido producidas por un estudio que actualmente no esté activo

SELECT M.MOVIE_NAME, M.MOVIE_LAUNCH_DATE  FROM MOVIES AS M
INNER JOIN STUDIOS AS S
ON M.STUDIO_ID = S.STUDIO_ID 
WHERE S.STUDIO_ACTIVE = 0
ORDER BY S.STUDIO_NAME DESC
