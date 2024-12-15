USE dbBienesRaices;

INSERT INTO Roles (nombreRol) 
VALUES 
('Administrador'), ('Agente'), ('Cliente');

INSERT INTO TiposInmueble (nombreTipo) 
VALUES 
('Casa'), ('Departamento');

INSERT INTO EstadosInmueble (nombreEstado) 
VALUES 
('Disponible'), ('Reservada'), ('Vendida');

INSERT INTO EstadosSolicitud (nombreEstadoSolicitud) 
VALUES 
('Pendiente'), ('Aceptada'), ('Rechazada');

INSERT INTO Usuarios (nombreUsuario, emailUsuario, passwordUsuario, idRol, telefonoUsuario)
VALUES 
('Admin', 'admin@gmail.com', 'admin2024', 1, '999888777'),
('Edinson Vitterio', 'edvitterio@gmail.com', 'Sherlock', 2, '987371438'),
('Roxana Curo', 'rocuro@gmail.com', '1234', 2, '984231211'),
('Josehp Garcia', 'jogarcia@gmail.com', '1234', 2, '994124261'),
('Paul Yauli', 'payauli@gmail.com', '1234', 2, '993408891'),
('Cliente Prueba', 'cliente@gmail.com', '12345', 3, '987654321');

INSERT INTO Distritos (nombreDistrito)
VALUES 
('Miraflores'),
('San Isidro'),
('Surco'),
('Barranco'),
('La Molina');

INSERT INTO Inmuebles (tituloInmueble, descripcionInmueble, precioInmueble, idTipoInmueble, direccionInmueble, 
habitacionesInmueble, banosInmueble, areaTotalInmueble, areaConstruidaInmueble, idAgente, idDistrito)
VALUES 

('Casa Moderna', 
'Remodelada hace 12 años',
 120000.00, 1, 
 'Calle Gomez Sanchez 100 Urb. LA Aurora, Miraflores', 
 3, 4, 507.00, 472.00, 
 2, 1), -- ID AGENTE, ID DISTRITO
 
 ('Casa Moderna 2', 
'Remodelada hace 12 años',
70000.00, 1, 
 'Calle Gomez Sanchez 100 Urb. LA Aurora, Miraflores', 
 3, 4, 507.00, 472.00, 
 2, 1),
 
('Casa Familiar', 
'Venta de hermosa casa Triplex en zona exclusiva de San isidro',
 312000.00, 1, 
 'Cuadra de Av. Los Conquistadores y Av. Pardo y Aliaga, San Isidro', 
 4, 3, 280.00, 280.00, 
 2, 2), -- ID AGENTE, ID DISTRITO
 
 ('Departamento', 
'Entrega Inmediata - Mudate a Barranco - Ultimos disponibles',
 199000.00, 2, 
 'Jiron Soldado Cabada N° 1001, Barranco', 
 2, 2, 104.00, 80.00, 
 2, 4), -- ID AGENTE, ID DISTRITO
 
('Departamento San Isidro', 
'Precioso departamento con terraza y bella vista al golf - Ultimos disponibles',
 200000.00, 2, 
 'Camino real, San Isidro, Lima', 
 3, 2, 90.00, 75.00, 
 3, 2), -- ID AGENTE, ID DISTRITO
 
('Departamento Barranco', 
'Alquiler o Venta Hermoso Loft en Barranco - Ultimos disponibles',
 250000.00, 2, 
 'jr tacna , Barranco, Lima', 
 2, 1, 80.00, 100.00, 
 3, 4), -- ID AGENTE, ID DISTRITO
 
('Casa Monterrico', 
'Casa muy bien ubicada cerca a avenidas principales - Ultimos disponibles',
 300000.00, 1, 
 'AV. LA MOLINA 1374, Ampliacion Monterrico Sur, La Molina', 
 7, 5, 1000.00, 346.00, 
 3, 5); -- ID AGENTE, ID DISTRITO

-- TODO: Debes ingresar 3 Inmuebles con tu codigo de agente -->
-- Cantidad Dormitorios: | min = 1 | max = 7 |
-- Rango de Precios: | min= S/60,000 | max= S/500,000 |
-- Areas: | min = 40 m² | max = 600 m² |

INSERT INTO ImagenesInmuebles (idInmueble, esImagenPrincipal, rutaImagenInmueble)
VALUES 
(1, 1, 'https://img10.naventcdn.com/avisos/resize/111/01/42/15/51/83/1200x1200/1451289636.jpg'),
(1, 0, 'https://img10.naventcdn.com/avisos/111/01/42/15/51/83/360x266/1451289651.jpg'),
(1, 0, 'https://img10.naventcdn.com/avisos/111/01/42/15/51/83/360x266/1488415862.jpg'),
(1, 0, 'https://img10.naventcdn.com/avisos/111/01/42/15/51/83/360x266/1488415695.jpg'),
(1, 0, 'https://img10.naventcdn.com/avisos/111/01/42/15/51/83/360x266/1451289646.jpg'),

(2, 1, 'https://img10.naventcdn.com/avisos/resize/111/01/44/85/53/35/1200x1200/1492122685.jpg'),
(2, 0, 'https://img10.naventcdn.com/avisos/111/01/44/85/53/35/360x266/1492122627.jpg'),
(2, 0, 'https://img10.naventcdn.com/avisos/111/01/44/85/53/35/360x266/1492122418.jpg'),
(2, 0, 'https://img10.naventcdn.com/avisos/111/01/44/85/53/35/360x266/1492122628.jpg'),
(2, 0, 'https://img10.naventcdn.com/avisos/111/01/44/85/53/35/360x266/1492122472.jpg'),

(3, 1, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1156071491.jpg'),
(3, 0, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1155909167.jpg'),
(3, 0, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1155909156.jpg'),
(3, 0, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1156071497.jpg'),
(3, 0, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1156071500.jpg'),

(4, 1, 'https://img10.naventcdn.com/avisos/resize/111/01/44/82/20/31/1200x1200/1491306902.jpg'),
(4, 0, 'https://img10.naventcdn.com/avisos/111/01/44/82/20/31/360x266/1491306905.jpg'),
(4, 0, 'https://img10.naventcdn.com/avisos/111/01/44/82/20/31/360x266/1491306909.jpg'),
(4, 0, 'https://img10.naventcdn.com/avisos/111/01/44/82/20/31/360x266/1491306903.jpg'),
(4, 0, 'https://img10.naventcdn.com/avisos/111/01/44/82/20/31/360x266/1491306894.jpg'),

(5, 1, 'https://img10.naventcdn.com/avisos/resize/111/01/45/15/92/19/1200x1200/1498039891.jpg'),
(5, 0, 'https://img10.naventcdn.com/avisos/111/01/45/15/92/19/360x266/1498039880.jpg'),
(5, 0, 'https://img10.naventcdn.com/avisos/111/01/45/15/92/19/360x266/1498039881.jpg'),
(5, 0, 'https://img10.naventcdn.com/avisos/111/01/45/15/92/19/360x266/1498039883.jpg'),
(5, 0, 'https://img10.naventcdn.com/avisos/111/01/45/15/92/19/360x266/1498039884.jpg'),

(6, 1, 'https://img10.naventcdn.com/avisos/resize/111/01/43/81/72/66/1200x1200/1468281563.jpg'),
(6, 0, 'https://img10.naventcdn.com/avisos/111/01/43/81/72/66/360x266/1468281560.jpg'),
(6, 0, 'https://img10.naventcdn.com/avisos/111/01/43/81/72/66/360x266/1468281548.jpg'),
(6, 0, 'https://img10.naventcdn.com/avisos/111/01/43/81/72/66/360x266/1470644412.jpg'),
(6, 0, 'https://img10.naventcdn.com/avisos/111/01/43/81/72/66/360x266/1468281561.jpg');

INSERT INTO Solicitudes (idCliente, idInmueble, mensajeSolicitud)
VALUES 
(6, 1, 'Estoy interesado en esta propiedad, por favor contácteme.'),
(6, 3, 'Estoy buscando algo similar, por favor comuníquese conmigo.');

INSERT INTO Ventas (idInmueble, idCliente, idAgente, precioFinalVenta)
VALUES 
(1, 6, 2, 445000.00),
(3, 6, 2, 375000.00);

