CREATE DATABASE computadora


CREATE TABLE COMPUTADORA (
IDCOMPUTADORA INT IDENTITY (1,1) NOT NULL,
NOMBRE NVARCHAR (50) NOT NULL,
DESCRIPCION NVARCHAR (50) NOT NULL,
PRECIO MONEY NOT NULL,
FECHAFABRIC DATETIME NOT NULL,
PRIMARY KEY (IDCOMPUTADORA),
);