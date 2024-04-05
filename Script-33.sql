SELECT 
	D.DIRECTOR_NAME,
	D.DIRECTOR_BIRTH_DATE,
	D.DIRECTOR_DEAD_DATE,
	M.MOVIE_LAUNCH_DATE
FROM PUBLIC.MOVIES AS M
JOIN PUBLIC.DIRECTORS AS D
ON M.DIRECTOR_ID = D.DIRECTOR_ID
WHERE (D.DIRECTOR_BIRTH_DATE > M.MOVIE_LAUNCH_DATE)	OR (D.DIRECTOR_DEAD_DATE < M.MOVIE_LAUNCH_DATE);