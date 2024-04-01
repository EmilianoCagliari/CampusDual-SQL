//Indica cuantos premios han ganado cada uno de los estudios con las películas que han creado

SELECT count(a.AWARD_WIN), s.STUDIO_NAME  FROM PUBLIC.AWARDS AS A
INNER JOIN PUBLIC.MOVIES  AS M
ON A.MOVIE_ID = M.MOVIE_ID 
INNER JOIN PUBLIC.STUDIOS AS S
ON M.STUDIO_ID  = s.STUDIO_ID 
GROUP BY s.STUDIO_NAME 