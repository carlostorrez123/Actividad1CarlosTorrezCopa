
CREATE DATABASE TIENDABD


CREATE TABLE PERSONA (
IDPERSONA INT IDENTITY (1,1) NOT NULL,
NOMBRE NVARCHAR (50) NOT NULL,
APELLIDO NVARCHAR (50) NOT NULL,
TELEFONO NVARCHAR (50) NULL,
CI NVARCHAR (10) NOT NULL,
CORREO NVARCHAR (20) NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDPERSONA),
);

CREATE TABLE ROL (
IDROL INT IDENTITY (1,1) NOT NULL,
NOMBRE NVARCHAR (50) NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDROL),
);

CREATE TABLE TIPOPROD (
IDTIPOPROD INT IDENTITY (1,1) NOT NULL,
NOMBRE NVARCHAR (50) NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDTIPOPROD),
);

CREATE TABLE MARCA (
IDMARCA INT IDENTITY (1,1) NOT NULL,
NOMBRE NVARCHAR (50) NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDMARCA),
);

CREATE TABLE PROVEEDOR (
IDPROVEEDOR INT IDENTITY (1,1) NOT NULL,
NOMBRE NVARCHAR (50) NOT NULL,
TELEFONO NVARCHAR (50) NOT NULL,
DIRECCION NVARCHAR (50) NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDPROVEEDOR),
);

CREATE TABLE USUARIO (
IDUSUARIO INT IDENTITY (1,1) NOT NULL,
IDPERSONA INT NOT NULL,
NOMBREUSER NVARCHAR (50) NOT NULL,
CONTRASEÑA NVARCHAR (50) NOT NULL,
FECHAREG DATETIME NOT NULL,
PRIMARY KEY (IDUSUARIO),
FOREIGN KEY (IDPERSONA) REFERENCES PERSONA (IDPERSONA)
);

CREATE TABLE USUARIOROL (
IDUSUARIOROL INT IDENTITY (1,1) NOT NULL,
IDUSUARIO INT NOT NULL,
IDROL INT NOT NULL,
FECHAASIGNA DATETIME NOT NULL,
ESTADO NVARCHAR(20) NOT NULL,
PRIMARY KEY (IDUSUARIOROL),
FOREIGN KEY (IDUSUARIO) REFERENCES USUARIO (IDUSUARIO),
FOREIGN KEY (IDROL) REFERENCES ROL (IDROL),
);

CREATE TABLE CLIENTE (
IDCLIENTE INT IDENTITY (1,1) NOT NULL,
IDPERSONA INT NOT NULL,
TIPOCLIENTE NVARCHAR (20) NOT NULL,
CODIGOCLIENTE NVARCHAR (20) NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDCLIENTE),
FOREIGN KEY (IDPERSONA) REFERENCES PERSONA (IDPERSONA),
);

CREATE TABLE INGRESO (
IDINGRESO INT IDENTITY (1,1) NOT NULL,
IDPROVEEDOR INT NOT NULL,
FECHAINGRESO DATETIME NOT NULL,
TOTAL MONEY NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDINGRESO),
FOREIGN KEY (IDPROVEEDOR) REFERENCES PROVEEDOR (IDPROVEEDOR),
);

CREATE TABLE VENTA (
IDVENTA INT IDENTITY (1,1) NOT NULL,
IDCLIENTE INT NOT NULL,
IDVENDEDOR INT NULL,
FECHA DATETIME NOT NULL,
TOTAL MONEY NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDVENTA),
FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE (IDCLIENTE),
FOREIGN KEY (IDVENDEDOR) REFERENCES USUARIO (IDUSUARIO),
);

CREATE TABLE PRODUCTO (
IDPRODUCTO INT IDENTITY (1,1) NOT NULL,
IDTIPOPROD INT NOT NULL,
IDMARCA INT NOT NULL,
NOMBRE NVARCHAR (100) NOT NULL,
CODIGOBARRA NVARCHAR (20) NOT NULL,
UNIDAD INT NOT NULL,
DESCRIPCION NVARCHAR (100) NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDPRODUCTO),
FOREIGN KEY (IDTIPOPROD) REFERENCES TIPOPROD (IDTIPOPROD),
FOREIGN KEY (IDMARCA) REFERENCES MARCA (IDMARCA),
);

CREATE TABLE PROVEE (
IDPROVEE INT IDENTITY (1,1) NOT NULL,
IDPRODUCTO INT NOT NULL,
IDPROVEEDOR INT NOT NULL,
FECHA DATETIME NOT NULL,
PRECIO MONEY NOT NULL,
PRIMARY KEY (IDPROVEE),
FOREIGN KEY (IDPRODUCTO) REFERENCES PRODUCTO (IDPRODUCTO),
FOREIGN KEY (IDPROVEEDOR) REFERENCES PROVEEDOR (IDPROVEEDOR),
);

CREATE TABLE DETALLEVENTA (
IDDETALLEVENTA INT IDENTITY (1,1) NOT NULL,
IDVENTA INT NOT NULL,
IDPRODUCTO INT NOT NULL,
CANTIDAD  INT NOT NULL,
PRECIOVENTA MONEY NOT NULL,
SUBTOTAL MONEY NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDDETALLEVENTA),
FOREIGN KEY (IDVENTA) REFERENCES VENTA (IDVENTA),
FOREIGN KEY (IDPRODUCTO) REFERENCES PRODUCTO (IDPRODUCTO),
);

CREATE TABLE DETALLEING (
IDDETALLEING INT IDENTITY (1,1) NOT NULL,
IDINGRESO INT NOT NULL,
IDPRODUCTO INT NOT NULL,
FECHAVENC DATETIME NOT NULL,
CANTIDAD INT NOT NULL,
PRECIOCOSTO MONEY NOT NULL,
PRECIOVENTA MONEY NOT NULL,
SUBTOTAL MONEY NOT NULL,
ESTADO NVARCHAR (20) NOT NULL,
PRIMARY KEY (IDDETALLEING),
FOREIGN KEY (IDINGRESO) REFERENCES INGRESO (IDINGRESO),
FOREIGN KEY (IDPRODUCTO) REFERENCES PRODUCTO (IDPRODUCTO),
);




insert into persona values('Pedro' ,'Fernandez','+59172979377','5744158','pedro@gmail.com','Activo');
insert into persona values('Adrián' ,'Pérez' ,'+59161234567' ,'1234567' ,'adrian@gmail.com','Activo');
insert into persona values('Belén','González' ,'+59173456789' ,'87654321' ,'belen@gmail.com','Activo');
insert into persona values('Ana' ,'Rodríguez' ,'+59169876543' ,'2345678' ,'ana@gmail.com','Inactivo');
insert into persona values('Bruno' ,'López' ,'+59176213456' ,'76543210' ,'bruno@gmail.com','Activo');
insert into persona values('Carla' ,'García' ,'+59164738291' ,'3456789' ,'carla@gmail.com','Activo');
insert into persona values('Diego' ,'Sánchez' ,'+59171345678' ,'65432109' ,'diego@gmail.com','Activo');
insert into persona values('Elena' ,'Martínez' ,'+59168912345' ,'4567890' ,'elena@gmail.com','Activo');
insert into persona values('Fabián','Gómez' ,'+59167483921' ,'54321098' ,'fabian@gmail.com','Activo');
insert into persona values('Gloria' ,'Díaz' ,'+59176294837' ,'5678901' ,'gloria@gmail.com','Inactivo');
insert into persona values('Hugo' ,'Ruiz' ,'+59163729184' ,'43210987' ,'hugo@gmail.com','Activo');
insert into persona values('Irene' ,'Torrez' ,'+59172836491' ,'6789012' ,'irene@gmail.com','Inactivo');
insert into persona values('Jorge' ,'Morales' ,'+59169485732' ,'32109876' ,'jorge@gmail.com','Activo');
insert into persona values('Karen' ,'Vargas' ,'+59161293847' ,'7890123' ,'karen@gmail.com','Activo');
insert into persona values('Luis' ,'Castro' ,'+59174321658' ,'21098765' ,'luis@gmail.com','Activo');
insert into persona values('María' ,'Ramírez' ,'+59168749321' ,'8901234' ,'maria@gmail.com','Activo');
insert into persona values('Nicolás' ,'Flores' ,'+59165432198' ,'10987654' ,'nicolas@gmail.com','Activo');
insert into persona values('Olivia' ,'Romero' ,'+59172938475' ,'9012345' ,'olivia@gmail.com','Inactivo');
insert into persona values('Pablo' ,'Ortiz' ,'+59169384752' ,'98765432' ,'pablo@gmail.com','Activo');
insert into persona values('Emma' ,'Álvarez' ,'+59161472583' ,'0123456' ,'emma@gmail.com','Inactivo');
insert into persona values('Raúl' ,'Cruz' ,'+59174839265' ,'87654321' ,'raul@gmail.com','Activo');
insert into persona values('Sonia' ,'Herrera' ,'+59168294731' ,'12345678' ,'sonia@gmail.com','Activo');
insert into persona values('Tomás' ,'Soto' ,'+59165837492' ,'2345678' ,'tomas@gmail.com','Activo');
insert into persona values('Úrsula' ,'Jiménez' ,'+59172648395' ,'76543210' ,'ursula@gmail.com','Activo');
insert into persona values('Víctor' ,'Reyes' ,'+59169123487' ,'6543210' ,'victor@gmail.com','Activo');
insert into persona values('Wendy' ,'Moreno' ,'+59161728394' ,'34567890' ,'wendy@gmail.com','Activo');
insert into persona values('Xavier' ,'Núñez' ,'+59173948572' ,'5432109' ,'xavier@gmail.com','Activo');
insert into persona values('Yolanda' ,'Medina' ,'+59168572934' ,'4567890' ,'yolanda@gmail.com','Inactivo');
insert into persona values('Zacarías' ,'Muñoz' ,'+59165394827' ,'43210987' ,'zacarias@gmail.com','Activo');
insert into persona values('Abel' ,'Ríos' ,'+59172483916' ,'5678901' ,'abel@gmail.com','Activo');
insert into persona values('Bianca' ,'Rojas' ,'+59169217483' ,'32109876' ,'bianca@gmail.com','Activo');
insert into persona values('César' ,'Salazar' ,'+59167123456' ,'6789012' ,'cesar@gmail.com','Inactivo');
insert into persona values('Dalia' ,'Suárez' ,'+59176345678' ,'21098765' ,'dalia@gmail.com','Inactivo');
insert into persona values('Ernesto' ,'Velásquez' ,'+59169786543' ,'7890123' ,'ernesto@gmail.com','Inactivo');
insert into persona values('Flora' ,'Aguilar' ,'+59175213456' ,'10987654' ,'flora@gmail.com','Activo');
insert into persona values('Gastón' ,'Alvarado' ,'+59164837291' ,'8901234' ,'gaston@gmail.com','Activo');
insert into persona values('Helena' ,'Arce' ,'+59171345678' ,'98765432' ,'helena@gmail.com','Activo');
insert into persona values('Iván' ,'Arias' ,'+59168912345' ,'90123456' ,'ivan@gmail.com','Inactivo');
insert into persona values('Julia' ,'Benítez' ,'+59167483921' ,'1834589' ,'julia@gmail.com','Activo');
insert into persona values('Kevin' ,'Cáceres' ,'+59176294837' ,'56327801' ,'kevin@gmail.com','iInactivo');
insert into persona values('Laura' ,'Campos' ,'+59163729184' ,'34005613' ,'laura@gmail.com','Activo');
insert into persona values('Marco' ,'Carvajal' ,'+59172836491' ,'1063459' ,'marco@gmail.com','Activo');
insert into persona values('Nora' ,'Cordero' ,'+59169485732' ,'59056190' ,'nora@gmail.com','Activo');
insert into persona values('Óscar' ,'Delgado' ,'+59161293847' ,'2387012' ,'oscar@gmail.com','Inactivo');
insert into persona values('Patricia' ,'Durán' ,'+59174321658' ,'53426970' ,'patricia@gmail.com','Activo');
insert into persona values('Serguio' ,'Escobar' ,'+59168749321' ,'6923015' ,'serguio@gmail.com','Activo');
insert into persona values('Rosa' ,'Fuentes' ,'+59165432198' ,'44679033' ,'rosa@gmail.com','Activo');
insert into persona values('Teresa' ,'Galindo' ,'+59172938475' ,'4589023' ,'teresa@gmail.com','Inactivo');
insert into persona values('Ulises' ,'Ibáñez' ,'+59169384752' ,'12819234' ,'ulises@gmail.com','Activo');
insert into persona values('Valeria' ,'León' ,'+59161472583' ,'4516780' ,'valeria@gmail.com','Activo');

SELECT * FROM PERSONA

insert into rol values ('Gerente','Activo');
insert into rol values ('Supervisor','Activo');
insert into rol values ('Cajero','Activo');
insert into rol values ('Vendedor','Activo');
insert into rol values ('Guia','Activo');

insert into usuario values (1, 'pedrof', '6841', '2022-02-01 14:00:00');
insert into usuario values (2, 'adrianp', '2847', '2022-02-23 13:50:00');
insert into usuario values (3, 'beleng', '9189', '2022-03-15 09:20:00');
insert into usuario values (4, 'anar', '5539', '2022-05-20 18:25:00');
insert into usuario values (5, 'brunol', '2664', '2022-05-21 15:30:00');
insert into usuario values (6, 'carlag', '7655', '2022-06-06 16:45:00');
insert into usuario values (7, 'diegos', '7655', '2022-06-06 12:32:00');
insert into usuario values (8, 'elenam', '9048', '2022-08-14 12:01:00');
insert into usuario values (9, 'fabiang', '3590', '2022-09-30 11:28:00');
insert into usuario values (10, 'gloriad', '4916', '2022-10-29 14:11:00');
insert into usuario values (11, 'hugor', '9719', '2022-12-27 10:15:00');
insert into usuario values (12, 'irenet', '6789', '2023-01-03 08:23:00');
insert into usuario values (13, 'jorgem', '6487', '2023-02-22 08:41:00');
insert into usuario values (14, 'karenv', '3523', '2023-02-24 11:57:00');
insert into usuario values (15, 'luisc', '7559', '2023-05-24 17:00:00');
insert into usuario values (16, 'mariar', '4221', '2023-05-01 14:30:00');
insert into usuario values (17, 'nicolasf', '1629', '2023-06-10 16:09:00');
insert into usuario values (18, 'oliviar', '8219', '2023-07-12 13:10:00');
insert into usuario values (19, 'pabloo', '1520', '2023-08-12 15:06:00');
insert into usuario values (20, 'emmaa', '7538', '2023-08-20 12:50:00');

select * from USUARIO 

insert into usuariorol values (1, 1, '2022-02-01 14:00:00', 'Activo');
insert into usuariorol values (2, 2, '2022-02-23 13:50:00', 'Activo');
insert into usuariorol values (3, 3, '2022-03-15 09:20:00', 'Activo');
insert into usuariorol values (4, 4, '2022-05-20 18:25:00', 'Activo');
insert into usuariorol values (5, 5, '2022-05-21 15:30:00', 'Activo');
insert into usuariorol values (6, 1, '2022-06-06 16:45:00', 'Activo');
insert into usuariorol values (7, 2, '2022-06-06 12:32:00', 'Activo');
insert into usuariorol values (8, 3, '2022-08-14 12:01:00', 'Activo');
insert into usuariorol values (9, 4, '2022-09-30 11:28:00', 'Activo');
insert into usuariorol values (10, 5, '2022-10-29 14:11:00', 'Activo');
insert into usuariorol values (11, 1, '2022-12-27 10:15:00', 'Activo');
insert into usuariorol values (12, 2, '2023-01-03 08:23:00', 'Activo');
insert into usuariorol values (13, 3, '2023-02-22 08:41:00', 'Activo');
insert into usuariorol values (14, 4, '2023-02-24 11:57:00', 'Activo');
insert into usuariorol values (15, 5, '2023-05-24 17:00:00', 'Activo');
insert into usuariorol values (16, 1, '2023-05-01 14:30:00', 'Activo');
insert into usuariorol values (17, 2, '2023-06-10 16:09:00', 'Activo');
insert into usuariorol values (18, 3, '2023-07-12 13:10:00', 'Activo');
insert into usuariorol values (19, 4, '2023-08-12 15:06:00', 'Activo');
insert into usuariorol values (20, 5, '2023-08-20 12:50:00', 'Activo');


select * from USUARIOROL

insert into marca values ('Pil', 'Activo');
insert into marca values ('Prolac', 'Activo');
insert into marca values ('Coca Cola', 'Activo');
insert into marca values ('Sofia', 'Activo');
insert into marca values ('Kris', 'Activo');
insert into marca values ('MabelS', 'Activo');
insert into marca values ('Colgate', 'Activo');
insert into marca values ('Famosa', 'Activo');
insert into marca values ('Huggies', 'Activo');
insert into marca values ('Delizia', 'Activo');
insert into marca values ('Arcor', 'Activo');
insert into marca values ('Nostras', 'Activo');
insert into marca values ('CBN', 'Activo');
insert into marca values ('Nestle', 'Activo');
insert into marca values ('Windsor', 'Activo');
insert into marca values ('Omo', 'Activo');
insert into marca values ('La Suprema', 'Activo');
insert into marca values ('Ola', 'Activo');
insert into marca values ('Sedal', 'Activo');
insert into marca values ('Nacional', 'Activo');

select * from MARCA

insert into tipoprod values ('Productos Lacteos', 'Activo');
insert into tipoprod values ('Bebidas Gaseosas', 'Activo');
insert into tipoprod values ('Embutidos/Enlatados', 'Activo');
insert into tipoprod values ('Salsas/Levaduras', 'Activo');
insert into tipoprod values ('Galletas', 'Activo');
insert into tipoprod values ('Productos de Uso Personal', 'Activo');
insert into tipoprod values ('Fideos', 'Activo');
insert into tipoprod values ('Pañales', 'Activo');
insert into tipoprod values ('Helados', 'Activo');
insert into tipoprod values ('Bebidas Alcolicas', 'Activo');
insert into tipoprod values ('Te', 'Activo');
insert into tipoprod values ('Productos de Limpieza', 'Activo');

select * from TIPOPROD

insert into cliente values (21, 'Regular', '33-70', 'Activo');
insert into cliente values (22, 'Frecuente', '21-45', 'Activo');
insert into cliente values (23, 'Frecuente', '60-90', 'Activo');
insert into cliente values (24, 'Regular', '12-00', 'Activo');
insert into cliente values (25, 'Regular', '40-30', 'Activo');
insert into cliente values (26, 'Regular', '56-30', 'Activo');
insert into cliente values (27, 'Frecuente', '80-67', 'Activo');
insert into cliente values (28, 'Frecuente', '22-31', 'Activo');
insert into cliente values (29, 'Ocasional', '42-67', 'Activo');
insert into cliente values (30, 'Regular', '9546', 'Activo');
insert into cliente values (31, 'Regular', '20-34', 'Activo');
insert into cliente values (32, 'Regular', '50-45', 'Activo');
insert into cliente values (33, 'Ocasional', '10-04', 'Activo');
insert into cliente values (34, 'Regular', '20-67', 'Activo');
insert into cliente values (35, 'Frecuente', '30-05', 'Activo');
insert into cliente values (36, 'Frecuente', '26-67', 'Activo');
insert into cliente values (37, 'Ocasional', '11-87', 'Activo');
insert into cliente values (38, 'Regular', '20-63', 'Activo');
insert into cliente values (39, 'Regular', '06-41', 'Activo');
insert into cliente values (40, 'Regular', '38-85', 'Activo');
insert into cliente values (41, 'Regular', '49-09', 'Activo');
insert into cliente values (42, 'Ocasional', '16-11', 'Activo');
insert into cliente values (43, 'Frecuente', '12-80', 'Activo');
insert into cliente values (44, 'Regular', '37-48', 'Activo');
insert into cliente values (45, 'Frecuente', '32-23', 'Activo');
insert into cliente values (46, 'Regular', '24-75', 'Activo');
insert into cliente values (47, 'Regular', '50-11', 'Activo');
insert into cliente values (48, 'Frecuente', '00-25', 'Activo');
insert into cliente values (49, 'Ocasional', '01-78', 'Activo');
insert into cliente values (50, 'Ocasional', '97-30', 'Activo');

select * from CLIENTE

insert into proveedor values ('Familia Andina', '+59168294731', 'B. San Mateo', 'Activo');
insert into proveedor values ('Gloria', '+59165837492', 'B. Las Panosas', 'Activo');
insert into proveedor values ('Economico S.A.', '+59172648395', 'B. Trigal', 'Activo');
insert into proveedor values ('La Ideal', '+59169123487', 'B. La Loma', 'Activo');
insert into proveedor values ('Pepsico', '+59161728394', 'B. Senac', 'Activo');
insert into proveedor values ('Femsa', '+59173948572', 'B. Juan XXIII', 'Activo');
insert into proveedor values ('Unilever', '+59168572934', 'B. Avaroa', 'Activo');
insert into proveedor values ('Lavie', '+59165394827', 'B. Los Chapacos', 'Activo');
insert into proveedor values ('ProMarket', '+59172483916', 'B. San Geronimo', 'Activo');
insert into proveedor values ('Johnson & Johnson', '+59169217483', 'B. San Jorge II', 'Activo');

select * from PROVEEDOR

insert into ingreso values (1, '2022-02-01 14:00:00', '100', 'Activo');
insert into ingreso values (2, '2022-02-01 13:50:00', '450', 'Activo');
insert into ingreso values (3, '2022-03-15 09:20:00', '300', 'Activo');
insert into ingreso values (4, '2022-05-20 18:25:00', '678', 'Activo');
insert into ingreso values (5, '2022-05-21 15:30:00', '206', 'Activo');
insert into ingreso values (6, '2022-06-06 16:45:00', '190', 'Activo');
insert into ingreso values (7, '2022-06-06 12:32:00', '480', 'Activo');
insert into ingreso values (8, '2022-08-14 12:01:00', '500', 'Activo');
insert into ingreso values (9, '2022-08-14 12:01:00', '389', 'Activo');
insert into ingreso values (10, '2022-10-29 14:11:00', '600', 'Activo');
insert into ingreso values (1, '2022-12-27 10:15:00', '520', 'Activo');
insert into ingreso values (2, '2023-01-03 08:23:00', '279', 'Activo');
insert into ingreso values (3, '2023-02-22 08:41:00', '340', 'Activo');
insert into ingreso values (4, '2023-02-24 11:57:00', '250', 'Activo');
insert into ingreso values (5, '2023-05-01 17:00:00', '800', 'Activo');
insert into ingreso values (6, '2023-05-01 14:30:00', '320', 'Activo');
insert into ingreso values (7, '2023-06-10 16:09:00', '160', 'Activo');
insert into ingreso values (8, '2023-06-12 13:10:00', '365', 'Activo');
insert into ingreso values (9, '2023-06-12 15:06:00', '485', 'Activo');
insert into ingreso values (10, '2023-07-20 12:50:00', '200', 'Activo');
insert into ingreso values (1, '2023-07-20 12:50:00', '455', 'Activo');
insert into ingreso values (2, '2023-07-23 12:50:00', '630', 'Activo');
insert into ingreso values (3, '2023-08-10 12:50:00', '710', 'Activo');
insert into ingreso values (4, '2023-08-10 12:50:00', '400', 'Activo');
insert into ingreso values (5, '2023-08-15 12:50:00', '200', 'Activo');
insert into ingreso values (6, '2023-08-16 12:50:00', '310', 'Activo');
insert into ingreso values (7, '2023-09-01 12:50:00', '570', 'Activo');
insert into ingreso values (8, '2023-09-01 12:50:00', '300', 'Activo');
insert into ingreso values (9, '2023-09-09 12:50:00', '290', 'Activo');
insert into ingreso values (10, '2023-09-10 12:50:00', '315', 'Activo');


select * from ingreso

insert into producto values (1, 1, 'Leche Pil', '21473658', 10, 'Leche', 'Activo');
insert into producto values (1, 2, 'Karpil', '46929107', 20, 'Karpil', 'Activo');
insert into producto values (1, 1, 'PilFrut', '98166510', 15, 'Jugo', 'Activo');
insert into producto values (1, 2, 'Leche Pasteorizada', '85119692', 10, 'Leche', 'Activo');
insert into producto values (1, 1, 'Pura Vida', '56251184', 30, 'Zumo', 'Activo');
insert into producto values (1, 2, 'Yogurt Boy', '38398949', 20, 'Yogurt', 'Activo');
insert into producto values (2, 3, 'Coca Cola', '48076473', 30, 'Gaseosa', 'Activo');
insert into producto values (2, 3, 'Sprit', '48076473', 30, 'Gaseosa', 'Activo');
insert into producto values (2, 3, 'Fanta', '50932492', 30, 'Gaseosa', 'Activo');
insert into producto values (2, 3, 'Pepsi', '62482802', 30, 'Gaseosa', 'Activo');
insert into producto values (2, 3, 'Cascada', '23895762', 30, 'Gaseosa', 'Activo');
insert into producto values (3, 4, 'Pavo', '47485907', 20, 'Embutido de Pavo', 'Activo');
insert into producto values (3, 4, 'Pollo', '64743925', 40, 'Embutido de Pavo', 'Activo');
insert into producto values (3, 4, 'Cerdo', '58020589', 25, 'Embutido de Pavo', 'Activo');
insert into producto values (3, 4, 'Hamburguesa', '71504436', 30, 'Embutido de Pavo', 'Activo');
insert into producto values (3, 4, 'Fiambres', '23313620', 35, 'Embutido de Pavo', 'Activo');
insert into producto values (3, 4, 'Costilla', '33161495', 45, 'Embutido de Pavo', 'Activo');
insert into producto values (5, 14, 'KitKat', '23878603', 20, 'Galleta', 'Activo');
insert into producto values (3, 14, 'Nan', '37254742', 10, 'Leche en Polvo', 'Activo');
insert into producto values (3, 14, 'Nido', '31858147', 15, 'Leche en Polvo', 'Activo');
insert into producto values (3, 14, 'NesCafe', '36295664', 20, 'Cafe', 'Activo');
insert into producto values (3, 14, 'Nesquik', '56666297', 25, 'Chocolate', 'Activo');
insert into producto values (3, 14, 'Chocapic', '26656517', 30, 'Cereal', 'Activo');
insert into producto values (4, 5, 'Mayonesa', '68533597', 35, 'Salsa', 'Activo');
insert into producto values (4, 5, 'Ketchup', '85044127', 40, 'Salsa', 'Activo');
insert into producto values (4, 5, 'Mostaza', '74802562', 45, 'Salsa', 'Activo');
insert into producto values (4, 5, 'Extracto de Tomate', '70964628', 10, 'Salsa', 'Activo');
insert into producto values (4, 5, 'Churrasco Kriolla', '32791206', 15, 'Salsa', 'Activo');
insert into producto values (4, 5, 'Arroz y Pollo Kriolla', '21631216', 20, 'Salsa', 'Activo');
insert into producto values (5, 6, 'Wafer', '73162535', 25, 'Galleta', 'Activo');
insert into producto values (5, 6, 'Queque', '82141679', 30, 'Queque', 'Activo');
insert into producto values (5, 6, 'Salvado', '82141679', 35, 'Galleta', 'Activo');
insert into producto values (5, 6, 'Crackers', '53711691', 43, 'Galleta', 'Activo');
insert into producto values (5, 6, 'Rosquitas', '58231054', 13, 'Galleta', 'Activo');
insert into producto values (5, 6, 'Cremositas', '20270768', 43, 'Galleta', 'Activo');
insert into producto values (5, 6, 'Moraditas', '84215986', 36, 'Galleta', 'Activo');
insert into producto values (5, 6, 'Maria Maizena', '58331869', 39, 'Galleta', 'Activo');
insert into producto values (5, 6, 'Top', '51892180', 43, 'Galleta', 'Activo');
insert into producto values (6, 7, 'Cepillo de Dientes', '69801362', 25, 'Cepillo', 'Activo');
insert into producto values (6, 7, 'Enjuage Bucal', '10354430', 10, 'Enjuage Bucal', 'Activo');
insert into producto values (6, 7, 'Colgate Total', '14310366', 10, 'Pasta Dental', 'Activo');
insert into producto values (6, 7, 'Colgate Maxima Duracion', '76858991', 20, 'Pasta Dental', 'Activo');
insert into producto values (6, 7, 'Colgate Plax', '65887079', 20, 'Enjuage Bucal', 'Activo');
insert into producto values (6, 12, 'Nostras Invisibles', '27525361', 13, 'Toallas Higienicas', 'Activo');
insert into producto values (6, 12, 'Nostras Invisibles Rapigel', '13231408', 10, 'Toallas Higienicas', 'Activo');
insert into producto values (6, 12, 'Nostras Buenas Noches', '32028827', 32, 'Toallas Higienicas', 'Activo');
insert into producto values (6, 12, 'Nostras Diarios', '15563780', 23, 'Toallas Higienicas', 'Activo');
insert into producto values (6, 12, 'Nostras Extra Proteccion', '16509864', 15, 'Toallas Higienicas', 'Activo');
insert into producto values (6, 12, 'Nostras Desodorante', '91233151', 25, 'Toallas Higienicas', 'Activo');
insert into producto values (6, 12, 'Nosotras Clasica', '47504747', 30, 'Toallas Higienicas', 'Activo');
insert into producto values (6, 12, 'Nostras AplicadorRegular', '22190394', 35, 'Tampones', 'Activo');
insert into producto values (6, 12, 'Nostras Aplicador Super', '55630079', 30, 'Tampones', 'Activo');
insert into producto values (7, 8, 'Cortaditos Liso', '56254192', 23, 'Fideos Cortos', 'Activo');
insert into producto values (7, 8, 'Anillito', '38132703', 13, 'Fideos Cortos', 'Activo');
insert into producto values (7, 8, 'Tirabuzon', '89506397', 33, 'Fideos Cortos', 'Activo');
insert into producto values (7, 8, 'Codo Grande Ragatti', '15215720', 53, 'Fideos Cortos', 'Activo');
insert into producto values (7, 8, 'Corbatitas', '43631588', 43, 'Fideos Cortos', 'Activo');
insert into producto values (7, 8, 'Letras', '86352549', 38, 'Fideos Cortos', 'Activo');
insert into producto values (7, 8, 'Bucatini', '73083413', 56, 'Fideos Largos', 'Activo');
insert into producto values (7, 8, 'Spaghetti', '51625443', 20, 'Fideos Largos', 'Activo');
insert into producto values (7, 17, 'Nidos', '35151408', 10, 'Fideos Cortos', 'Activo');
insert into producto values (7, 17, 'Canuto', '69096543', 13, 'Fideos Cortos', 'Activo');
insert into producto values (7, 17, 'Corbata', '35899598', 23, 'Fideos Cortos', 'Activo');
insert into producto values (7, 17, 'Tornillo', '20809640', 33, 'Fideos Cortos', 'Activo');
insert into producto values (7, 17, 'Codo Mediana', '10927231', 34, 'Fideos Cortos', 'Activo');
insert into producto values (9,10 , 'Brownie', '43770303', 53, 'Helado', 'Activo');
insert into producto values (9,10 , 'Cono', '20704571', 43, 'Helado', 'Activo');
insert into producto values (9,10 , 'Copa Helada', '36821177', 13, 'Helado', 'Activo');
insert into producto values (9,10 , 'Delizaurio', '78959698', 23, 'Helado', 'Activo');
insert into producto values (9,10 , 'Tentacion', '68214073', 33, 'Helado', 'Activo');
insert into producto values (9,10 , 'Ricoco', '40747016', 43, 'Helado', 'Activo');
insert into producto values (9,10 , 'Vaquita', '69773983', 35, 'Helado', 'Activo');
insert into producto values (9,10 , 'Rocky', '38439056', 33, 'Helado', 'Activo');
insert into producto values (9,10 , 'Ricoco En Cono', '38439056', 13, 'Helado', 'Activo');
insert into producto values (8, 9, 'Triple Proteccion', '79105595', 31, 'Pañales', 'Activo');
insert into producto values (8, 9, 'Active Sec', '79105595', 32, 'Pañales', 'Activo');
insert into producto values (8, 9, 'Natural Care', '83899692', 23, 'Pañales', 'Activo');
insert into producto values (8, 9, 'Active Sec Pants', '34538069', 34, 'Pañales', 'Activo');
insert into producto values (10, 13, 'Paceña', '64288017', 10, 'Bebida Alcoholica', 'Activo');
insert into producto values (10, 13, 'Paceña Centenario', '78936717', 10, 'Bebida Alcoholica', 'Activo');
insert into producto values (10, 13, 'Taquiña', '29794635', 10, 'Bebida Alcoholica', 'Activo');
insert into producto values (10, 13, 'Baltica', '49357272', 10, 'Bebida Alcoholica', 'Activo');
insert into producto values (11, 15, 'Mix Mate', '86271608', 30, 'Te', 'Activo');
insert into producto values (11, 15, 'Mix Te', '74513820', 30, 'Te', 'Activo');
insert into producto values (11, 15, 'Trimate', '53957362', 30, 'Te', 'Activo');
insert into producto values (11, 15, 'Te Verde', '26952991', 30, 'Te', 'Activo');
insert into producto values (11, 15, 'Te con Canela', '75672184', 30, 'Te', 'Activo');
insert into producto values (12, 16, 'Omo Matic', '69750850', 20, 'Omo en Polvo', 'Activo');
insert into producto values (12, 16, 'Omo Deteregente', '86898731', 10, 'Deteregente', 'Activo');
insert into producto values (12, 16, 'Omo Matict Doypack', '62450124', 20, 'Omo en Polvo', 'Activo');
insert into producto values (12, 16, 'Omo Aloe Botella', '69147417', 20, 'Deteregente', 'Activo');
insert into producto values (12, 16, 'Omo Aloe Doypack', '62727784', 20, 'Omo en Polvo', 'Activo');
insert into producto values (12, 16, 'Omo Matic Botella', '51771183', 20, 'Deteregente', 'Activo');
insert into producto values (12, 18, 'Ola Lava Vajilla', '24449118', 20, 'Deteregente', 'Activo');
insert into producto values (12, 18, 'Ola Suavecito', '90102614', 20, 'Deteregente', 'Activo');
insert into producto values (12, 18, 'Pastilla de Baño', '21238894', 20, 'Pastillas para Baño', 'Activo');
insert into producto values (12, 18, 'Ola Aromatic', '84346520', 20, 'Deteregente', 'Activo');
insert into producto values (12, 18, 'Ola Limpia Vidrios', '72184756', 20, 'Deteregente', 'Activo');
insert into producto values (12, 18, 'Jabon Liquido', '68472175', 20, 'Jabon Liquido', 'Activo');
insert into producto values (12, 18, 'Ola Clorito', '56187247', 20, 'Cloro', 'Activo');

select * from PRODUCTO

insert into provee values (1, 1, '2022-01-09 12:47:29', 100);
insert into provee values (2, 2, '2022-01-12 11:34:09', 50);
insert into provee values (3, 3, '2022-01-15 09:27:20', 60);
insert into provee values (4, 4, '2022-01-29 08:10:29', 200);
insert into provee values (5, 5, '2022-01-01 12:36:59', 150);
insert into provee values (6, 6, '2022-01-02 04:16:28', 110);
insert into provee values (7, 7, '2022-01-02 08:20:08', 230);
insert into provee values (8, 8, '2022-01-10 16:30:18', 10);
insert into provee values (9, 9, '2022-01-14 03:47:29', 30);
insert into provee values (10, 10, '2022-01-15 17:02:06', 50);
insert into provee values (11, 1, '2022-01-20 15:45:00', 140);
insert into provee values (12, 2, '2022-01-28 05:47:44', 100);
insert into provee values (13, 3, '2022-02-01 18:33:31', 100);
insert into provee values (14, 4, '2022-02-08 10:20:00', 200);
insert into provee values (15, 5, '2022-02-20 12:35:00', 60);
insert into provee values (16, 6, '2022-02-23 07:19:09', 90);
insert into provee values (17, 7, '2022-02-27 15:32:11', 100);
insert into provee values (18, 8, '2022-03-05 22:18:45', 120);
insert into provee values (19, 9, '2022-03-08 20:04:47', 150);
insert into provee values (20, 10, '2022-03-21 08:50:24', 180);
insert into provee values (21, 1, '2022-04-03 21:36:02', 100);
insert into provee values (22, 2, '2022-04-16 10:21:40', 120);
insert into provee values (23, 3, '2022-04-19 09:54:37', 100);
insert into provee values (24, 4, '2022-04-29 23:07:27', 100);
insert into provee values (25, 5, '2022-05-13 11:53:05', 50);
insert into provee values (26, 6, '2022-05-26 00:38:43', 200);
insert into provee values (27, 7, '2022-05-31 18:29:14', 200);
insert into provee values (28, 8, '2022-06-08 13:24:30', 80);
insert into provee values (29, 9, '2022-06-12 07:15:52', 70);
insert into provee values (30, 10, '2022-06-21 02:10:08', 95);
insert into provee values (31, 1, '2022-07-04 14:55:46', 100);
insert into provee values (32, 2, '2022-07-17 03:41:23', 100);
insert into provee values (33, 3, '2022-07-24 16:41:38', 120);
insert into provee values (34, 4, '2022-07-30 16:27:01', 150);
insert into provee values (35, 5, '2022-08-09 05:27:26', 180);
insert into provee values (36, 6, '2022-09-21 14:03:13', 200);
insert into provee values (37, 7, '2022-04-10 02:48:51', 50);
insert into provee values (38, 8, '2022-11-16 11:24:39', 90);
insert into provee values (39, 9, '2022-01-12 00:10:17', 100);
insert into provee values (40, 10, '2023-01-13 08:46:04', 110);
insert into provee values (41, 1, '2023-02-25 17:21:42', 200);
insert into provee values (42, 2, '2023-12-03 06:07:20', 200);
insert into provee values (43, 3, '2023-04-24 14:43:07', 100);
insert into provee values (44, 4, '2023-07-05 03:28:45', 150);
insert into provee values (45, 5, '2023-06-19 12:04:32', 140);
insert into provee values (46, 6, '2023-02-07 00:50:10', 70);
insert into provee values (47, 7, '2023-08-14 09:25:58', 100);
insert into provee values (48, 8, '2023-08-29 22:11:35', 50);
insert into provee values (49, 9, '2023-11-10 06:47:23', 100);
insert into provee values (50, 10, '2023-10-24 19:33:01', 200);

select * from PROVEE

insert into venta values (1, 1, '2022-09-01 12:47:29', 10, 'Exitoso');
insert into venta values (2, 2, '2022-09-01 12:50:56', 11, 'Exitoso');
insert into venta values (3, 3, '2022-12-01 11:34:09', 12, 'Exitoso');
insert into venta values (4, 4, '2022-12-01 11:40:10', 13, 'Exitoso');
insert into venta values (5, 5, '2022-01-15 09:27:20', 14, 'Exitoso');
insert into venta values (6, 6, '2022-01-15 09:34:29', 15, 'Exitoso');
insert into venta values (7, 7, '2022-01-29 08:10:29', 16, 'Exitoso');
insert into venta values (8, 8, '2022-01-29 08:15:20', 17, 'Exitoso');
insert into venta values (9, 9, '2022-01-01 12:36:59', 18, 'Exitoso');
insert into venta values (10, 10, '2022-01-01 12:40:45', 19, 'Exitoso');
insert into venta values (11, 11, '2022-02-01 04:16:28', 20, 'Exitoso');
insert into venta values (12, 12, '2022-02-01 04:19:53', 10, 'Exitoso');
insert into venta values (13, 13, '2022-02-01 08:20:08', 30, 'Exitoso');
insert into venta values (14, 14, '2022-02-01 08:44:34', 20, 'Exitoso');
insert into venta values (15, 15, '2022-10-01 16:30:18', 20, 'Exitoso');
insert into venta values (16, 16, '2022-10-01 16:36:21', 10, 'Exitoso');
insert into venta values (17, 17, '2022-01-14 03:47:29', 30, 'Exitoso');
insert into venta values (18, 18, '2022-01-14 03:49:00', 13, 'Exitoso');
insert into venta values (19, 19, '2022-01-15 17:02:06', 25, 'Exitoso');
insert into venta values (20, 20, '2022-01-15 17:10:33', 30, 'Exitoso');
insert into venta values (21, 1, '2022-01-20 15:45:00', 14, 'Exitoso');
insert into venta values (22, 2, '2022-01-20 15:50:10', 24, 'Exitoso');
insert into venta values (23, 3, '2022-01-28 05:47:44', 10, 'Exitoso');
insert into venta values (24, 4, '2022-01-28 05:50:12', 15, 'Exitoso');
insert into venta values (25, 5, '2022-02-01 18:33:31', 18, 'Exitoso');
insert into venta values (26, 6, '2022-02-01 18:38:11', 19, 'Exitoso');
insert into venta values (27, 7, '2022-02-08 10:20:00', 22, 'Exitoso');
insert into venta values (28, 8, '2022-02-08 10:34:23', 25, 'Exitoso');
insert into venta values (29, 9, '2022-02-20 12:35:00', 60, 'Exitoso');
insert into venta values (30, 10, '2022-02-20 12:39:15', 16, 'Exitoso');
insert into venta values (1, 11, '2022-02-23 07:19:09', 90, 'Exitoso');
insert into venta values (2, 12, '2022-02-23 07:22:08', 29, 'Exitoso');
insert into venta values (3, 13, '2022-02-27 15:32:11', 10, 'Exitoso');
insert into venta values (4, 14, '2022-02-27 15:35:16', 11, 'Exitoso');
insert into venta values (5, 15, '2022-03-05 22:18:45', 12, 'Exitoso');
insert into venta values (6, 16, '2022-03-05 22:25:32', 20, 'Exitoso');
insert into venta values (7, 17, '2022-03-08 20:04:47', 15, 'Exitoso');
insert into venta values (8, 18, '2022-03-08 20:10:11', 35, 'Exitoso');
insert into venta values (9, 19, '2022-03-21 08:50:24', 18, 'Exitoso');
insert into venta values (10, 20, '2022-03-21 08:55:23', 38, 'Exitoso');
insert into venta values (11, 1, '2022-04-03 21:36:02', 10, 'Exitoso');
insert into venta values (12, 2, '2022-04-03 21:40:00', 19, 'Exitoso');
insert into venta values (13, 3, '2022-04-16 10:21:40', 12, 'Exitoso');
insert into venta values (14, 4, '2022-04-16 10:26:46', 20, 'Exitoso');
insert into venta values (15, 5, '2022-04-19 09:54:37', 10, 'Exitoso');
insert into venta values (16, 6, '2022-04-19 09:59:00', 30, 'Exitoso');
insert into venta values (17, 7, '2022-04-29 23:07:27', 10, 'Exitoso');
insert into venta values (18, 8, '2022-04-29 23:16:34', 10, 'Exitoso');
insert into venta values (19, 9, '2022-05-13 11:53:05', 5, 'Exitoso');
insert into venta values (20, 10, '2022-05-13 11:59:43', 25, 'Exitoso');
insert into venta values (21, 11, '2022-05-26 00:38:43', 20, 'Exitoso');
insert into venta values (22, 12, '2022-05-26 00:46:23', 12, 'Exitoso');
insert into venta values (23, 13, '2022-05-31 18:29:14', 22, 'Exitoso');
insert into venta values (24, 14, '2022-05-31 18:37:21', 28, 'Exitoso');
insert into venta values (25, 15, '2022-06-08 13:24:30', 23, 'Exitoso');
insert into venta values (26, 16, '2022-06-08 13:30:44', 18, 'Exitoso');
insert into venta values (27, 17, '2022-06-12 07:15:52', 70, 'Exitoso');
insert into venta values (28, 18, '2022-06-12 07:22:45', 17, 'Exitoso');
insert into venta values (29, 19, '2022-06-21 02:10:08', 95, 'Exitoso');
insert into venta values (30, 20, '2022-06-21 02:15:44', 55, 'Exitoso');
insert into venta values (1, 1, '2022-07-04 14:55:46', 10, 'Exitoso');
insert into venta values (2, 2, '2022-07-04 14:59:59', 20, 'Exitoso');
insert into venta values (3, 3, '2022-07-17 03:41:23', 60, 'Exitoso');
insert into venta values (4, 4, '2022-07-17 03:48:12', 10, 'Exitoso');
insert into venta values (5, 5, '2022-07-24 16:41:38', 12, 'Exitoso');
insert into venta values (6, 6, '2022-07-24 16:50:33', 20, 'Exitoso');
insert into venta values (7, 7, '2022-07-30 16:27:01', 15, 'Exitoso');
insert into venta values (8, 8, '2022-07-30 16:30:34', 50, 'Exitoso');
insert into venta values (9, 9, '2022-08-09 05:27:26', 80, 'Exitoso');
insert into venta values (10, 10, '2022-08-09 05:32:33', 80, 'Exitoso');
insert into venta values (11, 11, '2022-09-21 14:03:13', 52, 'Exitoso');
insert into venta values (12, 12, '2022-09-21 14:09:10', 25, 'Exitoso');
insert into venta values (13, 13, '2022-10-04 02:48:51', 50, 'Exitoso');
insert into venta values (14, 14, '2022-10-04 02:50:55', 60, 'Exitoso');
insert into venta values (15, 15, '2022-11-16 11:24:39', 90, 'Exitoso');
insert into venta values (16, 16, '2022-11-16 11:36:55', 70, 'Exitoso');
insert into venta values (17, 17, '2022-12-01 00:10:17', 100, 'Exitoso');
insert into venta values (18, 18, '2022-12-01 00:14:21', 10, 'Exitoso');
insert into venta values (19, 19, '2023-01-13 08:46:04', 11, 'Exitoso');
insert into venta values (20, 20, '2023-01-13 08:51:54', 10, 'Exitoso');
insert into venta values (21, 1, '2023-02-25 17:21:42', 20, 'Exitoso');
insert into venta values (22, 2, '2023-02-25 17:25:32', 29, 'Exitoso');
insert into venta values (23, 3, '2023-03-12 06:07:20', 20, 'Exitoso');
insert into venta values (24, 4, '2023-03-12 06:11:22', 40, 'Exitoso');
insert into venta values (25, 5, '2023-04-24 14:43:07', 40, 'Exitoso');
insert into venta values (26, 6, '2023-04-24 14:49:02', 50, 'Exitoso');
insert into venta values (27, 7, '2023-05-07 03:28:45', 15, 'Exitoso');
insert into venta values (28, 8, '2023-05-07 03:34:23', 50, 'Exitoso');
insert into venta values (29, 9, '2023-06-19 12:04:32', 40, 'Exitoso');
insert into venta values (30, 10, '2023-06-19 12:10:21', 14, 'Exitoso');
insert into venta values (1, 11, '2023-07-02 00:50:10', 70, 'Exitoso');
insert into venta values (2, 12, '2023-07-02 00:55:21', 70, 'Exitoso');
insert into venta values (3, 13, '2023-08-14 09:25:58', 54, 'Exitoso');
insert into venta values (4, 14, '2023-08-14 09:30:22', 100, 'Exitoso');
insert into venta values (5, 15, '2023-08-29 22:11:35', 50, 'Exitoso');
insert into venta values (6, 16, '2023-08-29 22:18:21', 67, 'Exitoso');
insert into venta values (7, 17, '2023-10-11 06:47:23', 10, 'Exitoso');
insert into venta values (8, 18, '2023-10-11 06:57:00', 100, 'Exitoso');
insert into venta values (9, 19, '2023-10-24 19:33:01', 20, 'Exitoso');
insert into venta values (10, 20, '2023-10-24 19:40:01', 80, 'Exitoso');


select * from venta

insert into DETALLEVENTA values (1, 1, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (2, 18, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (3, 4, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (4, 3, 1, 2, 2, 'Exitoso');
insert into DETALLEVENTA values (5,10, 1, 10, 10, 'Exitoso')
insert into DETALLEVENTA values (6, 6, 3, 3, 3, 'Exitoso');
insert into DETALLEVENTA values (7, 19, 1, 45, 45, 'Exitoso');
insert into DETALLEVENTA values (8, 15, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (9, 9, 1, 12, 12, 'Exitoso');
;insert into DETALLEVENTA values (10, 5, 1, 12, 12, 'Exitoso');
insert into DETALLEVENTA values (11, 11, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (12, 12, 1, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (13, 26, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (14, 14, 1, 45, 45, 'Exitoso');
insert into DETALLEVENTA values (15, 7, 1, 13, 13, 'Exitoso');
insert into DETALLEVENTA values (16, 8, 1, 12, 12, 'Exitoso');
insert into DETALLEVENTA values (17, 16, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (18, 17, 2, 80, 80, 'Exitoso');
insert into DETALLEVENTA values (19, 2, 3, 3, 3, 'Exitoso');
insert into DETALLEVENTA values (20, 13, 1, 30, 30, 'Exitoso');
insert into DETALLEVENTA values (21, 20, 1, 38, 38, 'Exitoso');
insert into DETALLEVENTA values (22, 23, 1, 35, 35, 'Exitoso');
insert into DETALLEVENTA values (23, 22, 1, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (24, 40, 1, 35, 35, 'Exitoso');
insert into DETALLEVENTA values (25, 24, 2, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (26, 25, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (27, 21, 2, 30, 30, 'Exitoso');
insert into DETALLEVENTA values (28, 27, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (29, 36, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (30, 29, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (31, 30, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (32, 31, 1, 3, 3, 'Exitoso');
insert into DETALLEVENTA values (33, 32, 2, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (34, 41, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (35, 34, 1, 18, 18, 'Exitoso');
insert into DETALLEVENTA values (36, 35, 2, 2, 2, 'Exitoso');
insert into DETALLEVENTA values (37, 28, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (38, 37, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (39, 48, 1, 12, 12, 'Exitoso');
insert into DETALLEVENTA values (40, 39, 2, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (41, 44, 1, 9, 9, 'Exitoso');
insert into DETALLEVENTA values (42, 38, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (43, 42, 1, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (44, 43, 1, 22, 22, 'Exitoso');
insert into DETALLEVENTA values (45, 33, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (46, 61, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (47, 46, 1, 13, 13, 'Exitoso');
insert into DETALLEVENTA values (48, 47, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (49, 52, 1, 30, 30, 'Exitoso');
insert into DETALLEVENTA values (50, 49, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (51, 51, 1, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (52, 45, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (53, 55, 3, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (54, 53, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (55, 59, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (56, 67, 2, 14, 14, 'Exitoso');
insert into DETALLEVENTA values (57, 65, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (58, 57, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (59, 58, 3, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (60, 50, 1, 8, 8, 'Exitoso');
insert into DETALLEVENTA values (61, 60, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (62, 56, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (63, 72, 1, 2, 2, 'Exitoso');
insert into DETALLEVENTA values (64, 63, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (65, 64, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (66, 66, 3, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (67, 62, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (68, 69, 2, 4, 4, 'Exitoso');
insert into DETALLEVENTA values (69, 70, 2, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (70, 71, 1, 3, 3, 'Exitoso');
insert into DETALLEVENTA values (71, 79, 1, 80, 80, 'Exitoso');
insert into DETALLEVENTA values (72, 73, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (73, 74, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (74, 89, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (75, 98, 1, 55, 55, 'Exitoso');
insert into DETALLEVENTA values (76, 82, 1, 8, 8, 'Exitoso');
insert into DETALLEVENTA values (77, 76, 1, 55, 55, 'Exitoso');
insert into DETALLEVENTA values (78, 78, 1, 75, 75, 'Exitoso');
insert into DETALLEVENTA values (79, 68, 1, 9, 9, 'Exitoso');
insert into DETALLEVENTA values (80, 84, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (81, 80, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (82, 81, 1, 12, 12, 'Exitoso');
insert into DETALLEVENTA values (83, 77, 1, 68, 68, 'Exitoso');
insert into DETALLEVENTA values (84, 90, 1, 25, 25, 'Exitoso');
insert into DETALLEVENTA values (85, 95, 1, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (86, 75, 2, 8, 8, 'Exitoso');
insert into DETALLEVENTA values (87, 85, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (88, 87, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (89, 91, 1, 35, 35, 'Exitoso');
insert into DETALLEVENTA values (90, 96, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (91, 97, 1, 25, 25, 'Exitoso');
;insert into DETALLEVENTA values (92, 93, 1, 23, 23, 'Exitoso');
insert into DETALLEVENTA values (93, 92, 1, 40, 40, 'Exitoso')
insert into DETALLEVENTA values (94, 94, 1, 30, 30, 'Exitoso');
insert into DETALLEVENTA values (95, 88, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (96, 86, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (97, 99, 1, 35, 35, 'Exitoso');
insert into DETALLEVENTA values (98, 100, 1, 45, 45, 'Exitoso');
insert into DETALLEVENTA values (99, 83, 1, 7, 7, 'Exitoso');
insert into DETALLEVENTA values (100, 54, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (1, 2, 3, 3, 3, 'Exitoso');
insert into DETALLEVENTA values (2, 4, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (3, 13, 1, 30, 30, 'Exitoso');
insert into DETALLEVENTA values (4, 5, 1, 12, 12, 'Exitoso');
insert into DETALLEVENTA values (5, 7, 1, 13, 13, 'Exitoso');
insert into DETALLEVENTA values (6, 11, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (7, 6, 3, 3, 3, 'Exitoso');
insert into DETALLEVENTA values (8, 21, 2, 30, 30, 'Exitoso');
insert into DETALLEVENTA values (9, 9, 1, 12, 12, 'Exitoso');
insert into DETALLEVENTA values (10,10, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (11, 23, 1, 35, 35, 'Exitoso');
insert into DETALLEVENTA values (12, 14, 1, 45, 45, 'Exitoso');
insert into DETALLEVENTA values (13, 25, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (14, 34, 1, 18, 18, 'Exitoso');
insert into DETALLEVENTA values (15, 30, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (16, 42, 1, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (17, 33, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (18, 37, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (19, 35, 2, 2, 2, 'Exitoso');
insert into DETALLEVENTA values (20, 43, 1, 22, 22, 'Exitoso');
insert into DETALLEVENTA values (21, 27, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (22, 44, 1, 9, 9, 'Exitoso');
insert into DETALLEVENTA values (23, 36, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (24, 24, 2, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (25, 12, 1, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (26, 1, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (27, 15, 2, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (28, 16, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (29, 8, 1, 12, 12, 'Exitoso');
insert into DETALLEVENTA values (30, 18, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (31, 20, 1, 38, 38, 'Exitoso');
insert into DETALLEVENTA values (32, 32, 2, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (33, 40, 1, 35, 35, 'Exitoso');
insert into DETALLEVENTA values (34, 47, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (35, 49, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (36, 19, 1, 45, 45, 'Exitoso');
insert into DETALLEVENTA values (37, 45, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (38, 22, 1, 20, 20, 'Exitoso');
insert into DETALLEVENTA values (39, 48, 1, 12, 12, 'Exitoso');
insert into DETALLEVENTA values (40, 28, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (41, 38, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (42, 50, 1, 8, 8, 'Exitoso');
insert into DETALLEVENTA values (43, 3, 1, 2, 2, 'Exitoso');
insert into DETALLEVENTA values (44, 17, 2, 80, 80, 'Exitoso');
insert into DETALLEVENTA values (45, 26, 1, 5, 5, 'Exitoso');
insert into DETALLEVENTA values (46, 29, 1, 10, 10, 'Exitoso');
insert into DETALLEVENTA values (47, 31, 1, 3, 3, 'Exitoso');
insert into DETALLEVENTA values (48, 39, 2, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (49, 41, 1, 15, 15, 'Exitoso');
insert into DETALLEVENTA values (50, 46, 1, 13, 13, 'Exitoso');

select * from detalleventa

insert into detalleing values (1, 1, '2023-06-11 10:18:40', 1, 100, 150, 100, 'Exitoso');
insert into detalleing values (2, 2, '2023-11-19 23:04:18', 14, 150, 170, 150, 'Exitoso');
insert into detalleing values (3, 3, '2023-12-02 11:49:55', 16, 200, 240, 200, 'Exitoso');
insert into detalleing values (4, 4, '2023-12-15 00:35:33', 21, 140, 180, 140, 'Exitoso');
insert into detalleing values (5, 5, '2023-12-28 13:21:21', 41, 300, 350, 300, 'Exitoso');
insert into detalleing values (6, 6, '2024-01-10 02:07:08', 15, 350, 400, 350, 'Exitoso');
insert into detalleing values (7, 7, '2024-01-23 14:52:46', 31, 250, 300, 250, 'Exitoso');
insert into detalleing values (8, 8, '2024-02-05 03:38:24', 14, 400, 450, 400, 'Exitoso');
insert into detalleing values (9, 9, '2024-02-18 16:24:11', 15, 90, 130, 90, 'Exitoso');
insert into detalleing values (10, 10, '2024-03-03 05:09:49', 17, 80, 150, 80, 'Exitoso');
insert into detalleing values (11, 11, '2024-03-16 17:55:37', 18, 220, 250, 220, 'Exitoso');
insert into detalleing values (12, 12, '2024-03-29 06:41:14', 21, 250, 300, 250, 'Exitoso');
insert into detalleing values (13, 13, '2024-04-11 19:26:52', 51, 340, 380, 340, 'Exitoso');
insert into detalleing values (14, 14, '2024-04-25 08:12:30', 61, 560, 600, 560, 'Exitoso');
insert into detalleing values (15, 15, '2024-05-08 20:58:17', 71, 100, 150, 100, 'Exitoso');
insert into detalleing values (16, 16, '2024-05-22 09:43:55', 81, 210, 250, 210, 'Exitoso');
insert into detalleing values (17, 17, '2024-06-04 22:29:43', 11, 250, 300, 250, 'Exitoso');
insert into detalleing values (18, 18, '2024-06-18 11:15:20', 12, 270, 300, 270, 'Exitoso');
insert into detalleing values (19, 19, '2024-07-01 23:51:08', 21, 100, 150, 100, 'Exitoso');
insert into detalleing values (20, 20, '2024-07-15 12:36:46', 21, 200, 250, 200, 'Exitoso');
insert into detalleing values (21, 21, '2024-07-28 01:22:23', 51, 300, 350, 300, 'Exitoso');
insert into detalleing values (22, 22, '2024-08-10 14:08:01', 71, 350, 450, 350, 'Exitoso');
insert into detalleing values (23, 23, '2024-08-23 02:53:39', 81, 300, 350, 300, 'Exitoso');
insert into detalleing values (24, 24, '2025-10-11 06:47:23', 41, 120, 250, 120, 'Exitoso');
insert into detalleing values (25, 25, '2025-10-24 19:33:01', 51, 130, 250, 130, 'Exitoso');
insert into detalleing values (26, 26, '2025-01-14 12:45:38', 51, 150, 190, 150, 'Exitoso');
insert into detalleing values (27, 27, '2025-01-27 01:31:16', 61, 170, 200, 170, 'Exitoso');
insert into detalleing values (28, 28, '2025-02-09 14:16:54', 19, 190, 250, 190, 'Exitoso');
insert into detalleing values (29, 29, '2025-02-22 03:02:31', 21, 100, 150, 100, 'Exitoso');
insert into detalleing values (30, 30, '2025-03-07 15:48:09', 70, 200, 250, 200, 'Exitoso');
insert into detalleing values (1, 31, '2025-03-20 04:33:47', 60, 220, 350, 220, 'Exitoso');
insert into detalleing values (2, 32, '2025-04-02 17:19:24', 50, 230, 350, 230, 'Exitoso');
insert into detalleing values (3, 33, '2025-04-15 06:05:02', 34, 250, 350, 250, 'Exitoso');
insert into detalleing values (4, 34, '2025-04-28 18:50:40', 45, 280, 300, 280, 'Exitoso');
insert into detalleing values (5, 35, '2025-05-11 07:36:17', 67, 290, 320, 290, 'Exitoso');
insert into detalleing values (6, 36, '2025-05-24 20:21:55', 14, 160, 250, 160, 'Exitoso');
insert into detalleing values (7, 37, '2025-06-06 09:07:33', 27, 190, 200, 190, 'Exitoso');
insert into detalleing values (8, 38, '2025-06-19 21:53:10', 50, 100, 150, 100, 'Exitoso');
insert into detalleing values (9, 39, '2025-07-03 10:38:48', 50, 200, 250, 200, 'Exitoso');
insert into detalleing values (10, 40, '2025-07-16 23:24:26', 60, 140, 160, 140, 'Exitoso');
insert into detalleing values (11, 41, '2025-07-29 12:10:03', 90, 150, 190, 150, 'Exitoso');
insert into detalleing values (12, 42, '2025-01-15 17:02:06', 80, 200, 250, 200, 'Exitoso');
insert into detalleing values (13, 43, '2025-01-28 05:47:44', 46, 300, 350, 300, 'Exitoso');
insert into detalleing values (14, 44, '2025-02-10 18:33:31', 75, 400, 450, 400, 'Exitoso');
insert into detalleing values (15, 45, '2025-02-23 07:19:09', 78, 450, 550, 450, 'Exitoso');
insert into detalleing values (16, 46, '2025-03-08 20:04:47', 65, 350, 400, 350, 'Exitoso');
insert into detalleing values (17, 47, '2025-03-21 08:50:24', 60, 210, 250, 210, 'Exitoso');
insert into detalleing values (18, 48, '2024-03-04 21:36:02', 32, 170, 200, 170, 'Exitoso');
insert into detalleing values (19, 49, '2024-04-16 10:21:40', 34, 190, 250, 190, 'Exitoso');
insert into detalleing values (20, 50, '2024-04-29 23:07:27', 47, 150, 200, 150, 'Exitoso');
insert into detalleing values (21, 51, '2024-05-13 11:53:05', 60, 160, 210, 160, 'Exitoso');
insert into detalleing values (22, 52, '2024-05-26 00:38:43', 74, 130, 230, 130, 'Exitoso');
insert into detalleing values (23, 53, '2024-06-08 13:24:30', 78, 140, 250, 140, 'Exitoso');
insert into detalleing values (24, 54, '2024-06-21 02:10:08', 89, 200, 150, 200, 'Exitoso');
insert into detalleing values (25, 55, '2024-07-04 14:55:46', 90, 230, 250, 230, 'Exitoso');
insert into detalleing values (26, 56, '2024-07-17 03:41:23', 34, 240, 280, 240, 'Exitoso');
insert into detalleing values (27, 57, '2024-07-30 16:27:01', 56, 250, 300, 250, 'Exitoso');
insert into detalleing values (28, 58, '2024-10-24 19:33:01', 66, 260, 350, 260, 'Exitoso');
insert into detalleing values (29, 59, '2024-10-11 06:47:23', 77, 270, 340, 270, 'Exitoso');
insert into detalleing values (30, 60, '2024-08-29 22:11:35', 80, 100, 150, 100, 'Exitoso');
insert into detalleing values (1, 61, '2024-08-14 09:25:58', 90, 100, 150, 100, 'Exitoso');
insert into detalleing values (2, 62, '2024-07-02 00:50:10', 10, 50, 100, 50, 'Exitoso');
insert into detalleing values (3, 63, '2024-06-19 12:04:32', 20, 90, 150, 90, 'Exitoso');
insert into detalleing values (4, 64, '2024-05-07 03:28:45', 30, 80, 120, 80, 'Exitoso');
insert into detalleing values (5, 65, '2024-04-24 14:43:07', 40, 100, 150, 100, 'Exitoso');
insert into detalleing values (6, 66, '2024-03-12 06:07:20', 50, 120, 160, 120, 'Exitoso');
insert into detalleing values (7, 67, '2024-02-25 17:21:42', 60, 100, 150, 100, 'Exitoso');
insert into detalleing values (8, 68, '2024-01-13 08:46:04', 70, 130, 180, 130, 'Exitoso');
insert into detalleing values (9, 69, '2023-12-01 00:10:17', 80, 100, 180, 100, 'Exitoso');
insert into detalleing values (10, 70, '2023-11-16 11:24:39', 90, 140, 200, 140, 'Exitoso');
insert into detalleing values (11, 71, '2023-10-04 02:48:51', 100, 100, 150, 100, 'Exitoso');
insert into detalleing values (12, 72, '2023-09-21 14:03:13', 17, 200, 250, 200, 'Exitoso');
insert into detalleing values (13, 73, '2023-08-09 05:27:26', 14, 300, 350, 300, 'Exitoso');
insert into detalleing values (14, 74, '2023-07-24 16:41:38', 41, 400, 450, 400, 'Exitoso');
insert into detalleing values (15, 75, '2023-06-12 07:15:52', 51, 450, 500, 450, 'Exitoso');
insert into detalleing values (16, 76, '2023-05-31 18:29:14', 61, 230, 270, 230, 'Exitoso');
insert into detalleing values (17, 77, '2023-04-19 09:54:37', 71, 20, 50, 20, 'Exitoso');
insert into detalleing values (18, 78, '2023-03-05 22:18:45', 21, 100, 150, 100, 'Exitoso');
insert into detalleing values (19, 79, '2023-02-27 15:32:11', 71, 150, 250, 150, 'Exitoso');
insert into detalleing values (20, 80, '2023-01-14 03:47:29', 91, 180, 200, 180, 'Exitoso');


select * from DETALLEING