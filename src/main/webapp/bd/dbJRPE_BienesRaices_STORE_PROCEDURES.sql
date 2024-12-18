USE dbBienesRaices;

-- SP listCardInmueble
DELIMITER $$
CREATE PROCEDURE sp_cardInmueble()
BEGIN
	SELECT I.idInmueble, IG.rutaImagenInmueble,  I.precioInmueble,  I.direccionInmueble, 
	I.habitacionesInmueble, I.banosInmueble, I.areaTotalInmueble, I.areaConstruidaInmueble
	FROM Inmuebles AS I
	INNER JOIN  ImagenesInmuebles AS IG
	ON  I.idInmueble = IG.idInmueble
	WHERE IG.esImagenPrincipal = 1;
END$$
DELIMITER ;

-- DROP PROCEDURE sp_cardInmueble;
-- CALL sp_cardInmueble();

-- SP listFilteredCardInmueble
DELIMITER $$
CREATE PROCEDURE sp_filteredInmueble
(
	IN p_minPrecio DECIMAL(10, 2),
    IN p_maxPrecio DECIMAL(10, 2), 
    IN p_idDistrito INT,
    IN p_idTipoInmueble INT 
)
BEGIN
	SELECT I.idInmueble, IG.rutaImagenInmueble,  I.precioInmueble,  I.direccionInmueble, 
	I.habitacionesInmueble, I.banosInmueble, I.areaTotalInmueble, I.areaConstruidaInmueble
	FROM Inmuebles AS I
	INNER JOIN  ImagenesInmuebles AS IG
	ON  I.idInmueble = IG.idInmueble
	WHERE IG.esImagenPrincipal = 1
	AND I.precioInmueble BETWEEN p_minPrecio AND p_maxPrecio
    AND I.idDistrito = p_idDistrito                          
    AND I.idTipoInmueble = p_idTipoInmueble;
END$$
DELIMITER ;

-- DROP PROCEDURE sp_filteredCardInmueble;
CALL sp_filteredInmueble(65000, 450000, 2, 1);