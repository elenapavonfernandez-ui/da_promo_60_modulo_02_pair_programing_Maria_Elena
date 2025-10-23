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
