USE dbBienesRaices;

INSERT INTO Usuarios (nombreUsuario, emailUsuario, contrasenaUsuario, rolUsuario, telefonoUsuario)
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
('Casa Moderna en Miraflores', 'Casa amplia con jardín y piscina', 450000.00, 'Casa', 'Av. Larco 123', 4, 3, 250.00, 200.00, 2, 1),
('Departamento Lujoso en San Isidro', 'Departamento con vista al parque', 300000.00, 'Departamento', 'Calle Los Laureles 456', 3, 2, 120.00, 100.00, 2, 2),
('Casa Familiar en Surco', 'Casa perfecta para familias grandes', 380000.00, 'Casa', 'Jr. Los Olivos 789', 5, 4, 320.00, 280.00, 5, 3),
('Departamento en Barranco', 'Departamento acogedor cerca al mar', 250000.00, 'Departamento', 'Malecón Souza 321', 2, 1, 80.00, 70.00, 5, 4),
('Casa de Lujo en La Molina', 'Casa espaciosa con acabados premium', 700000.00, 'Casa', 'Av. La Fontana 987', 6, 5, 500.00, 450.00, 2, 5);

