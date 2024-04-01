//Indica la edad media de los directores vivos

SELECT avg(
	DATEDIFF(YEAR, DIRECTOR_BIRTH_DATE, TODAY()) 
)	AS average_director
FROM DIRECTORS
WHERE DIRECTOR_DEAD_DATE IS NULL