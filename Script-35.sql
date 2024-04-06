SELECT DISTINCT 
    D.DIRECTOR_NAME,
    fav_gen.GENRE_NAME,
    MAX(fav_gen.CANT_GENRE)
FROM PUBLIC.DIRECTORS AS D
JOIN (
    SELECT
        D.DIRECTOR_NAME,
        G.GENRE_NAME,
        COUNT(G.GENRE_ID) AS CANT_GENRE
    FROM PUBLIC.MOVIES AS M
    JOIN PUBLIC.GENRES AS G ON M.GENRE_ID = G.GENRE_ID 
    JOIN PUBLIC.DIRECTORS AS D ON M.DIRECTOR_ID = D.DIRECTOR_ID
    GROUP BY D.DIRECTOR_NAME, G.GENRE_NAME    
) AS fav_gen
ON D.DIRECTOR_NAME = fav_gen.DIRECTOR_NAME
GROUP BY D.DIRECTOR_NAME, fav_gen.GENRE_NAME
