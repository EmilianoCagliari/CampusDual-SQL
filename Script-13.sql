//Indica la edad media de los actores que han fallecido

SELECT avg(
	DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, TODAY()) 
)	AS average_director
FROM DIRECTORS
WHERE DIRECTOR_DEAD_DATE IS NOT NULL