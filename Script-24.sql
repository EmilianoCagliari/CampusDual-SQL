// Indica cuál es el nombre y la duración mínima de la película que ha sido alquilada en los últimos 2 años por los miembros del videoclub 
// (La "fecha de ejecución" en este script es el 25-01-2019)


SELECT  M.MOVIE_NAME, M.MOVIE_DURATION FROM MOVIES AS M
INNER JOIN MEMBERS_MOVIE_RENTAL AS MRENT
ON M.MOVIE_ID = MRENT.MOVIE_ID 
WHERE MRENT.MEMBER_RENTAL_DATE BETWEEN '2017-01-25' AND '2019-01-25' ORDER BY M.MOVIE_DURATION ASC LIMIT 1





