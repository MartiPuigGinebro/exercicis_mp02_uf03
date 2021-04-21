USE videoclub;
DROP FUNCTION IF EXISTS act12;
DELIMITER //
CREATE FUNCTION act12(CodiPeli SMALLINT UNSIGNED) 
       RETURNS Smallint
       DETERMINISTIC
BEGIN
   DECLARE idActor Smallint UNSIGNED;
DECLARE final int default false;
 
DECLARE elcursor cursor for
       SELECT   id_actor
   FROM     ACTORS_PELLICULES
   WHERE    id_peli = CodiPeli
   AND principal = 1;
   
 DECLARE continue handler for not found SET final = 1;
   open elcursor;
   elbucle:loop
      fetch elcursor into idActor;

      if final = 1 then
         leave elbucle;
      end if;
	
	RETURN idActor;
   END loop elbucle;
   close elcursor;
   
END//
DELIMITER ;

SELECT ACTORS.nom_actor, PELLICULES.titol_peli
FROM ACTORS , PELLICULES
WHERE id_actor = act12(2) AND id_peli = 2;