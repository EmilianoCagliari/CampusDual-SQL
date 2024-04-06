

SELECT  
    mem.MEMBER_NAME,
    mov_ren.MEMBER_RENTAL_DATE,
    mem.MEMBER_PHONE,
    RIGHT(mem.MEMBER_PHONE, 1) AS ultimo_valor_numerico,
    nat.NATIONALITY_ID,
    M.MOVIE_NAME
FROM PUBLIC.MEMBERS AS mem
JOIN PUBLIC.MEMBERS_MOVIE_RENTAL AS mov_ren 
ON mem.MEMBER_ID = MOV_REN.MEMBER_ID 
JOIN PUBLIC.MOVIES AS M 
ON M.MOVIE_ID = MOV_REN.MOVIE_ID
JOIN PUBLIC.NATIONALITIES AS nat 
-- Comparar id nacionalidad con el ultimo digito del telefono --
ON nat.NATIONALITY_ID = RIGHT(mem.MEMBER_PHONE, 1)
JOIN (
	-- Obtener y agrupar los ID miembros y fecha de renta con min --
    SELECT MEMBER_ID, MIN(MEMBER_RENTAL_DATE) AS min_rental_date
    FROM PUBLIC.MEMBERS_MOVIE_RENTAL
    GROUP BY MEMBER_ID
) AS min_rental_dates 
-- vincular el member_id y MEMBER_RENTAL_DATE de movie_rental con el ID del member_id y MEMBER_RENTAL_DATE de min_rental_dates ya fultrado--
ON mov_ren.MEMBER_ID = min_rental_dates.MEMBER_ID 
AND mov_ren.MEMBER_RENTAL_DATE = min_rental_dates.min_rental_date;


