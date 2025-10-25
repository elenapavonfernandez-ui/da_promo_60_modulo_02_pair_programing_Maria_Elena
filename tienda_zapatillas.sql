CREATE SCHEMA tienda_zapatillas;

USE tienda_zapatillas;

CREATE TABLE zapatillas(
id_zapatillas INT NOT NULL AUTO_INCREMENT,
modelo VARCHAR(45) NOT NULL,
color VARCHAR(45) NOT NULL,
PRIMARY KEY(id_zapatillas)
);


CREATE TABLE empleados(
id_empleado INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
tienda VARCHAR(45) NOT NULL,
salario INT,
fecha_incorporacion DATE NOT NULL,
PRIMARY KEY(id_empleado)
);

CREATE TABLE clientes (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) NOT NULL,
  numero_telefono INT NOT NULL,
  email VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  ciudad VARCHAR(45) NOT NULL,
  provincia VARCHAR(45) NOT NULL,
  pais VARCHAR(45) NOT NULL,
  codigo_postal VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_cliente)
  );
  
CREATE TABLE facturas(
id_factura INT NOT NULL AUTO_INCREMENT,
numero_factura VARCHAR(45) NOT NULL,
fecha DATE NOT NULL,
zapatilla INT NOT NULL,
empleado INT NOT NULL,
cliente INT NOT NULL,
CONSTRAINT fk_zapatilla 
   FOREIGN KEY (zapatilla)
   REFERENCES zapatillas(id_zapatillas),
CONSTRAINT fk_empleado
   FOREIGN KEY (empleado)
   REFERENCES empleados(id_empleado),
CONSTRAINT fk_cliente
   FOREIGN KEY (cliente)
   REFERENCES clientes(id_cliente),
PRIMARY KEY (id_factura)
);

USE tienda_zapatillas;
ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL,
ADD COLUMN talla INT NOT NULL;

ALTER TABLE empleados
MODIFY COLUMN salario FLOAT;

ALTER TABLE clientes 
DROP COLUMN pais;
 
ALTER TABLE facturas 
ADD COLUMN total FLOAT;

INSERT INTO zapatillas (id_zapatillas, modelo, color, marca, talla)
VALUES (1, "xqyun", "negro", "nike", 42), (2, "uopmn", "rosa", "nike", 39), (3, "opnyt", "verde", "adidas", 35);

SELECT * 
  FROM zapatillas;
 
 INSERT INTO empleados (id_empleado, nombre, tienda, salario, fecha_incorporacion)
 VALUES (2, "Maria", "Sevilla", null, "2001-04-11"), (3, "Esther", "Oviedo", 30165.98, "2000-11-29");
 
 SELECT * 
  FROM empleados;
  
INSERT INTO clientes (id_cliente, nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES (1, "Monica", 473953, "monica@gmail.com", "calle felicidad", "Mostoles", "Madrid", 28176), (2, "Lorena", 275293, "lorena@email.com", "calle alegria", "Barcelona", "Barcelona", 12345), (3, "Carmen", 274502, "carmen@email.com", "Calle del color", "Vigo", "Pontevedra", 23456);

SELECT * 
  FROM clientes;
  
INSERT INTO facturas (id_factura, numero_factura, fecha, zapatilla, empleado, cliente, total)
VALUES (1, 123, "2001-12-11", 1, 2, 1, 54.98), (2, 1234, "2005-05-23", 1, 1, 3, 89.91), (3, 12345, "2015-09-18", 2, 3, 3, 76.23);  

SELECT * 
  FROM facturas; 