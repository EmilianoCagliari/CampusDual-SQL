//Devuelve el nombre y la edad de todos los directores menores o iguales de 50 años que estén vivos

SELECT DIRECTOR_NAME, YEAR(NOW())- YEAR(DIRECTOR_BIRTH_DATE) AS Age 
FROM directors 
WHERE (YEAR(NOW())- YEAR(DIRECTOR_BIRTH_DATE)) <= 50
AND DIRECTOR_DEAD_DATE IS NULL