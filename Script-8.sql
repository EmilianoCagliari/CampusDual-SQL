//Devuelve los actores nacidos cualquier mes que no sea Junio y que sigan vivos.

SELECT * FROM ACTORS WHERE ACTOR_BIRTH_DATE NOT LIKE '%-07-%' AND ACTOR_DEAD_DATE IS NULL