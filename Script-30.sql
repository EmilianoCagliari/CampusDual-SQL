// Indica el número de premios a los que estuvo nominado un actor, pero que no ha conseguido 
// (Si una película está nominada a un premio, su actor también lo está)

-- QUERY de actor nominado --
SELECT 
count(aw.AWARD_NOMINATION) AS nomination,
ac.ACTOR_NAME  FROM PUBLIC.AWARDS AS aw
 JOIN PUBLIC.ACTORS AS ac
ON aw.AWARD_NOMINATION  = ac.ACTOR_ID 
GROUP BY ac.ACTOR_NAME
ORDER BY ac.ACTOR_NAME ASC

-- QUERY de casi gana pero NO GANA --
SELECT count(aw.AWARD_ALMOST_WIN) AS almost, ac.ACTOR_NAME  FROM PUBLIC.AWARDS AS aw
INNER JOIN PUBLIC.ACTORS AS ac
ON aw.AWARD_ALMOST_WIN  = ac.ACTOR_ID 
GROUP BY ac.ACTOR_NAME  
ORDER BY ac.ACTOR_NAME ASC

--QUERY i una película está nominada a un premio, su actor también lo está --
SELECT COUNT(ac.ACTOR_ID) AS actorid, ac.ACTOR_NAME  FROM PUBLIC.AWARDS AS aw
INNER JOIN PUBLIC.MOVIES_ACTORS AS ma
ON aw.MOVIE_ID = ma.MOVIE_ID
INNER JOIN PUBLIC.ACTORS AS ac
ON ma.ACTOR_ID = ac.ACTOR_ID 
GROUP BY ac.ACTOR_NAME
ORDER BY ac.ACTOR_NAME ASC


-- QUERY FINAL con la suma de las 3 tablas -- 

SELECT 
    COALESCE(nomination, 0) + COALESCE(almost, 0) + COALESCE(actorid, 0) AS total,
    ac.ACTOR_NAME  
FROM PUBLIC.ACTORS AS ac
LEFT JOIN (
    SELECT COUNT(AWARD_NOMINATION) AS nomination, ac.ACTOR_ID
    FROM PUBLIC.AWARDS AS aw
    JOIN PUBLIC.ACTORS AS ac ON aw.AWARD_NOMINATION = ac.ACTOR_ID 
    GROUP BY ac.ACTOR_ID
) AS nom_counts ON ac.ACTOR_ID = nom_counts.ACTOR_ID
LEFT JOIN (
    SELECT COUNT(AWARD_ALMOST_WIN) AS almost, ac.ACTOR_ID
    FROM PUBLIC.AWARDS AS aw
    JOIN PUBLIC.ACTORS AS ac ON aw.AWARD_ALMOST_WIN = ac.ACTOR_ID 
    GROUP BY ac.ACTOR_ID
) AS almost_counts ON ac.ACTOR_ID = almost_counts.ACTOR_ID
LEFT JOIN (
    SELECT COUNT(ma.ACTOR_ID) AS actorid, ac.ACTOR_ID
    FROM PUBLIC.AWARDS AS aw
    INNER JOIN PUBLIC.MOVIES_ACTORS AS ma ON aw.MOVIE_ID = ma.MOVIE_ID
    INNER JOIN PUBLIC.ACTORS AS ac ON ma.ACTOR_ID = ac.ACTOR_ID 
    GROUP BY ac.ACTOR_ID
) AS actorid_counts ON ac.ACTOR_ID = actorid_counts.ACTOR_ID
ORDER BY ac.ACTOR_NAME ASC;
