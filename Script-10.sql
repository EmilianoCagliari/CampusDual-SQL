//Devuelve el nombre y la edad de todos los actores menores de 50 años que hayan fallecido

SELECT ACTOR_NAME, Age FROM (
	SELECT ACTOR_NAME, YEAR(NOW())- YEAR(ACTOR_BIRTH_DATE) AS Age, ACTOR_DEAD_DATE 
	FROM ACTORS
) WHERE Age < 50 AND ACTOR_DEAD_DATE IS NOT NULL