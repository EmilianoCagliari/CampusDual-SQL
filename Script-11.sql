//Devuelve el nombre de todos los directores menores o iguales de 40 años que estén vivos

SELECT DIRECTOR_NAME FROM (
	SELECT DIRECTOR_NAME, YEAR(NOW())- YEAR(DIRECTOR_BIRTH_DATE) AS Age, DIRECTOR_DEAD_DATE 
	FROM DIRECTORS
) WHERE Age <= 40 AND DIRECTOR_DEAD_DATE IS NULL