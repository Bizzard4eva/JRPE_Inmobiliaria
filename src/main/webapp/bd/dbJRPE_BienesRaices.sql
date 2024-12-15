DROP DATABASE IF EXISTS dbBienesRaices;
CREATE DATABASE dbBienesRaices;
USE dbBienesRaices;


SHOW VARIABLES LIKE 'lower_case_table_names';

CREATE TABLE Usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(100) NOT NULL,
    emailUsuario VARCHAR(100) UNIQUE NOT NULL,
    passwordUsuario VARCHAR(255) NOT NULL,
    rolUsuario ENUM('Administrador', 'Agente', 'Cliente') NOT NULL,
    telefonoUsuario VARCHAR(15),
    fechaCreacionUsuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Un usuario puede identificarse como: 'Administrador' || 'Agente' || 'Cliente'

CREATE TABLE Distritos (
    idDistrito INT AUTO_INCREMENT PRIMARY KEY,
    nombreDistrito VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Inmuebles (
    idInmueble INT AUTO_INCREMENT PRIMARY KEY,
    tituloInmueble VARCHAR(150) NOT NULL,
    descripcionInmueble TEXT NOT NULL,
    precioInmueble DECIMAL(10,2) NOT NULL,
    tipoInmueble ENUM('Casa', 'Departamento') DEFAULT 'Casa' NOT NULL,
    direccionInmueble VARCHAR(200) NOT NULL,
    habitacionesInmueble INT NOT NULL,
    banosInmueble INT NOT NULL,
    areaTotalInmueble DECIMAL(10,2) NOT NULL,
    areaConstruidaInmueble DECIMAL(10,2) NOT NULL,
    idAgente INT,
    idDistrito INT NOT NULL,
    estadoInmueble ENUM('Disponible', 'Reservada', 'Vendida') DEFAULT 'Disponible',
    fechaPublicacionInmueble TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idAgente) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idDistrito) REFERENCES distritos(idDistrito)
);

-- Un usuario puede identificarse como: 'Casa' || 'Departamento'

CREATE TABLE ImagenesInmuebles (
    idImagen INT AUTO_INCREMENT PRIMARY KEY,
    idInmueble INT NOT NULL,
    rutaImagenInmueble VARCHAR(255) NOT NULL,
    FOREIGN KEY (idInmueble) REFERENCES inmuebles(idInmueble)
);

CREATE TABLE Solicitudes (
    idSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idInmueble INT NOT NULL,
    mensajeSolicitud TEXT,
    fechaSolicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estadoSolicitud ENUM('Pendiente', 'Aceptada', 'Rechazada') DEFAULT 'Pendiente',
    FOREIGN KEY (idCliente) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idInmueble) REFERENCES inmuebles(idInmueble)
);

CREATE TABLE Ventas (
    idVenta INT AUTO_INCREMENT PRIMARY KEY,
    idInmueble INT NOT NULL,
    idCliente INT NOT NULL,
    idAgente INT NOT NULL,
    precioFinalVenta DECIMAL(10,2) NOT NULL,
    fechaVenta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idInmueble) REFERENCES inmuebles(idInmueble),
    FOREIGN KEY (idCliente) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idAgente) REFERENCES usuarios(idUsuario)
);

-- SP 
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
    GROUP BY 
        I.idInmueble
    HAVING 
        IG.idImagen = MIN(IG.idImagen);
END$$
DELIMITER ;

