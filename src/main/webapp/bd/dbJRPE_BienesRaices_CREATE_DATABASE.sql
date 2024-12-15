DROP DATABASE IF EXISTS dbBienesRaices;
CREATE DATABASE dbBienesRaices;
USE dbBienesRaices;


SHOW VARIABLES LIKE 'lower_case_table_names';

CREATE TABLE Roles (
    idRol INT AUTO_INCREMENT PRIMARY KEY,
    nombreRol VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Usuarios (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombreUsuario VARCHAR(100) NOT NULL,
    emailUsuario VARCHAR(100) UNIQUE NOT NULL,
    passwordUsuario VARCHAR(255) NOT NULL,
    idRol INT DEFAULT 3 NOT NULL,
    telefonoUsuario VARCHAR(15),
    fechaCreacionUsuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(idRol) REFERENCES Roles(idRol)
);
-- Un usuario puede identificarse como: 'Administrador' || 'Agente' || 'Cliente'

CREATE TABLE Distritos (
    idDistrito INT AUTO_INCREMENT PRIMARY KEY,
    nombreDistrito VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE TiposInmueble (
    idTipoInmueble INT AUTO_INCREMENT PRIMARY KEY,
    nombreTipo VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE EstadosInmueble (
    idEstadoInmueble INT AUTO_INCREMENT PRIMARY KEY,
    nombreEstado VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Inmuebles (
    idInmueble INT AUTO_INCREMENT PRIMARY KEY,
    tituloInmueble VARCHAR(150) NOT NULL,
    descripcionInmueble TEXT NOT NULL,
    precioInmueble DECIMAL(10,2) NOT NULL,
    idTipoInmueble INT DEFAULT 1 NOT NULL,
    direccionInmueble VARCHAR(200) NOT NULL,
    habitacionesInmueble INT NOT NULL,
    banosInmueble INT NOT NULL,
    areaTotalInmueble DECIMAL(10,2) NOT NULL,
    areaConstruidaInmueble DECIMAL(10,2) NOT NULL,
    idAgente INT,
    idDistrito INT NOT NULL,
    idEstadoInmueble INT DEFAULT 1 NOT NULL,
    fechaPublicacionInmueble TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(idTipoInmueble) REFERENCES TiposInmueble(idTipoInmueble),
    FOREIGN KEY(idEstadoInmueble) REFERENCES EstadosInmueble(idEstadoInmueble),
    FOREIGN KEY (idAgente) REFERENCES usuarios(idUsuario),
    FOREIGN KEY (idDistrito) REFERENCES distritos(idDistrito)
);

-- Un usuario puede identificarse como: 'Casa' || 'Departamento'

CREATE TABLE ImagenesInmuebles (
    idImagen INT AUTO_INCREMENT PRIMARY KEY,
    idInmueble INT NOT NULL,
    esImagenPrincipal TINYINT(1) DEFAULT 0,
    rutaImagenInmueble VARCHAR(255) NOT NULL,
    FOREIGN KEY (idInmueble) REFERENCES inmuebles(idInmueble)
);

CREATE TABLE EstadosSolicitud (
    idEstadoSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    nombreEstadoSolicitud VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Solicitudes (
    idSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idInmueble INT NOT NULL,
    mensajeSolicitud TEXT,
    fechaSolicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    idEstadoSolicitud INT DEFAULT 1 NOT NULL,
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

