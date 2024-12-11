DELIMITER $$

CREATE PROCEDURE sp_cardInmueble()
BEGIN
    SELECT 
        I.idInmueble, 
        IG.rutaImagenInmueble, 
        I.precioInmueble, 
        I.direccionInmueble, 
        I.habitacionesInmueble, 
        I.banosInmueble, 
        I.areaTotalInmueble, 
        I.areaConstruidaInmueble
    FROM 
        Inmuebles AS I
    INNER JOIN 
        (SELECT idInmueble, MIN(idImagen) AS idImagen
         FROM ImagenesInmuebles
         GROUP BY idInmueble) AS IG_MIN
    ON 
        I.idInmueble = IG_MIN.idInmueble
    INNER JOIN 
        ImagenesInmuebles AS IG
    ON 
        IG.idImagen = IG_MIN.idImagen;
END$$

DELIMITER ;

CALL sp_cardInmueble()