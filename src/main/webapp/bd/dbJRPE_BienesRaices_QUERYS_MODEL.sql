USE dbBienesRaices;


SELECT * FROM Inmuebles;
SELECT * from Usuarios;
SELECT * FROM TiposInmueble;
SELECT * FROM EstadosInmueble;

SELECT DISTINCT tipoInmueble FROM Inmuebles;

SELECT rutaImagenInmueble FROM ImagenesInmuebles WHERE idInmueble = 2;

-- -- -- DistritoModel

-- listDistrito()
SELECT * FROM Distritos;
-- getDistrito()
SELECT * FROM Distritos 
WHERE idDistrito = ?;


-- -- -- UsuarioModel


-- listUsuario()
SELECT U.idUsuario,U.nombreUsuario,U.emailUsuario,R.nombreRol,
U.telefonoUsuario,U.fechaCreacionUsuario 
FROM Usuarios AS U
INNER JOIN Roles AS R
ON U.idRol = R.idRol;


-- getUsuario()
SELECT U.idUsuario,U.nombreUsuario,U.emailUsuario,R.nombreRol,
U.telefonoUsuario,U.fechaCreacionUsuario
FROM Usuarios AS U
INNER JOIN Roles AS R
ON U.idRol = R.idRol 
WHERE U.idUsuario = ?;

-- addUsuario()
INSERT INTO Usuarios (nombreUsuario, emailUsuario, passwordUsuario, telefonoUsuario, idRol) 
VALUES (?, ?, ?, ?, ?);

-- updateUsuario()
UPDATE Usuarios SET 
nombreUsuario = ?, emailUsuario = ?, 
passwordUsuario = ?, telefonoUsuario = ? 
WHERE idUsuario = ?;
SELECT * FROM Inmuebles WHERE idInmueble = 2;
SELECT * FROM Inmuebles;
-- validateUsuario()
SELECT U.idUsuario,U.nombreUsuario,U.emailUsuario,R.nombreRol,
U.telefonoUsuario,U.fechaCreacionUsuario 
FROM Usuarios AS U
INNER JOIN Roles AS R
ON U.idRol = R.idRol
WHERE U.emailUsuario = ? 
and U.passwordUsuario = ?;


-- -- -- InmuebleModel

-- listCardInmueble()


SELECT I.idInmueble, IG.rutaImagenInmueble,  I.precioInmueble,  I.direccionInmueble, 
I.habitacionesInmueble, I.banosInmueble, I.areaTotalInmueble, I.areaConstruidaInmueble
FROM Inmuebles AS I
INNER JOIN  ImagenesInmuebles AS IG
ON  I.idInmueble = IG.idInmueble
WHERE IG.esImagenPrincipal = 1;
