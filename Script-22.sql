//Indica cuántas películas ha realizado cada director antes de cumplir 41 años

/*SELECT M.MOVIE_ID, DIR_TABLE.DIRECTOR_NAME, DIR_TABLE.Age FROM MOVIES AS M
INNER JOIN (
	SELECT DIRECTOR_ID, DIRECTOR_NAME, YEAR(NOW())- YEAR(DIRECTOR_BIRTH_DATE) AS Age, DIRECTOR_DEAD_DATE 
	FROM DIRECTORS
) AS DIR_TABLE
ON M.MOVIE_ID = DIR_TABLE.DIRECTOR_ID
WHERE DIR_TABLE.Age <= 40 AND DIR_TABLE.DIRECTOR_DEAD_DATE IS NULL 
GROUP BY DIR_TABLE.DIRECTOR_NAME
*/


SELECT COUNT(*), director_name
FROM (SELECT 
m.movie_name,
m.movie_launch_date,
DATEDIFF(YEAR, d.DIRECTOR_BIRTH_DATE, m.MOVIE_LAUNCH_DATE) AS years,
d.DIRECTOR_ID,
d.DIRECTOR_NAME 
FROM movies AS m
JOIN directors AS d
ON m.DIRECTOR_ID  = d.DIRECTOR_ID 
WHERE DATEDIFF(YEAR, d.DIRECTOR_BIRTH_DATE, m.MOVIE_LAUNCH_DATE) < 41
) edad_peliculas
GROUP BY director_id, director_name

