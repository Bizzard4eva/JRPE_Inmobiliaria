USE dbBienesRaices;

-- SP listCardInmueble
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
        ImagenesInmuebles AS IG
    ON 
        I.idInmueble = IG.idInmueble
    WHERE 
        IG.idImagen = (
            SELECT MIN(idImagen) 
            FROM ImagenesInmuebles 
            WHERE idInmueble = I.idInmueble
        );
END$$
DELIMITER ;

DROP PROCEDURE sp_cardInmueble;
CALL sp_cardInmueble();

-- SP listFilteredCardInmueble
DELIMITER $$
CREATE PROCEDURE sp_filteredCardInmueble()
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
        ImagenesInmuebles AS IG
    ON 
        I.idInmueble = IG.idInmueble
    WHERE 
        IG.idImagen = (
            SELECT MIN(idImagen) 
            FROM ImagenesInmuebles 
            WHERE idInmueble = I.idInmueble
        );
END$$
DELIMITER ;

DROP PROCEDURE sp_filteredCardInmueble;
CALL sp_filteredCardInmueble();