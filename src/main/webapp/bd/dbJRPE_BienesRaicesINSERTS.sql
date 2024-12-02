USE dbBienesRaices;

INSERT INTO Usuarios (nombreUsuario, emailUsuario, passwordUsuario, rolUsuario, telefonoUsuario)
VALUES 
('Admin', 'admin@gmail.com', 'admin2024', 'Administrador', '999888777'),
('Edinson Vitterio', 'edvitterio@gmail.com', 'Sherlock', 'Agente', '987371438'),
('Roxana Curo', 'rocuro@gmail.com', '1234', 'Agente', '984231211'),
('Josehp Garcia', 'jogarcia@gmail.com', '1234', 'Agente', '994124261'),
('Paul Yauli', 'payauli@gmail.com', '1234', 'Agente', '993408891'),
('Cliente Prueba', 'cliente@gmail.com', '12345', 'Cliente', '987654321');

INSERT INTO Distritos (nombreDistrito)
VALUES 
('Miraflores'),
('San Isidro'),
('Surco'),
('Barranco'),
('La Molina');

INSERT INTO Inmuebles (tituloInmueble, descripcionInmueble, precioInmueble, tipoInmueble, direccionInmueble, habitacionesInmueble, banosInmueble, areaTotalInmueble, areaConstruidaInmueble, idAgente, idDistrito)
VALUES 

('Casa Moderna', 
'Remodelada hace 12 años',
 450000.00, 'Casa', 
 'Calle Gomez Sanchez 100 Urb. LA Aurora, Miraflores', 
 3, 4, 507.00, 472.00, 
 2, 1), -- ID AGENTE, ID DISTRITO
 
('Casa Familiar', 
'Venta de hermosa casa Triplex en zona exclusiva de San isidro',
 312000.00, 'Casa', 
 'Cuadra de Av. Los Conquistadores y Av. Pardo y Aliaga, San Isidro', 
 4, 3, 280.00, 280.00, 
 2, 2), -- ID AGENTE, ID DISTRITO
 
 ('Departamento', 
'Entrega Inmediata - Mudate a Barranco - Ultimos disponibles',
 199000.00, 'Departamento', 
 'Jiron Soldado Cabada N° 1001, Barranco', 
 2, 2, 104.00, 80.00, 
 2, 4); -- ID AGENTE, ID DISTRITO

-- TODO: Debes ingresar 3 Inmuebles con tu codigo de agente -->
-- Cantidad Dormitorios: | min = 1 | max = 7 |
-- Rango de Precios: | min= S/60,000 | max= S/500,000 |
-- Areas: | min = 40 m² | max = 600 m² |

INSERT INTO ImagenesInmuebles (idInmueble, rutaImagenInmueble)
VALUES 
(1, 'https://img10.naventcdn.com/avisos/resize/111/01/42/15/51/83/1200x1200/1451289636.jpg'),
(1, 'https://img10.naventcdn.com/avisos/111/01/42/15/51/83/360x266/1451289651.jpg'),
(1, 'https://img10.naventcdn.com/avisos/111/01/42/15/51/83/360x266/1488415862.jpg'),
(1, 'https://img10.naventcdn.com/avisos/111/01/42/15/51/83/360x266/1488415695.jpg'),
(1, 'https://img10.naventcdn.com/avisos/111/01/42/15/51/83/360x266/1451289646.jpg'),

(2, 'https://img10.naventcdn.com/avisos/resize/111/01/44/85/53/35/1200x1200/1492122685.jpg'),
(2, 'https://img10.naventcdn.com/avisos/111/01/44/85/53/35/360x266/1492122627.jpg'),
(2, 'https://img10.naventcdn.com/avisos/111/01/44/85/53/35/360x266/1492122418.jpg'),
(2, 'https://img10.naventcdn.com/avisos/111/01/44/85/53/35/360x266/1492122628.jpg'),
(2, 'https://img10.naventcdn.com/avisos/111/01/44/85/53/35/360x266/1492122472.jpg'),

(3, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1156071491.jpg'),
(3, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1155909167.jpg'),
(3, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1155909156.jpg'),
(3, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1156071497.jpg'),
(3, 'https://img10.naventcdn.com/avisos/resize/11/01/42/02/65/54/1200x1200/1156071500.jpg');


INSERT INTO Solicitudes (idCliente, idInmueble, mensajeSolicitud)
VALUES 
(6, 1, 'Estoy interesado en esta propiedad, por favor contácteme.'),
(6, 3, 'Estoy buscando algo similar, por favor comuníquese conmigo.');

INSERT INTO Ventas (idInmueble, idCliente, idAgente, precioFinalVenta)
VALUES 
(1, 6, 2, 445000.00),
(3, 6, 2, 375000.00);

