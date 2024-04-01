//Devuelve todas las películas que hay de género documental

SELECT M.MOVIE_ID, M.MOVIE_NAME, G.GENRE_NAME  FROM MOVIES AS M
INNER JOIN GENRES AS G
ON M.GENRE_ID = G.GENRE_ID 
WHERE G.GENRE_NAME  = 'Documentary'
