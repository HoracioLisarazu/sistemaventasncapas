CREATE DATABASE TiendaN

CREATE TABLE PERSONA (
  idpersona int NOT NULL,
  nombre varchar(128) NOT NULL,
  apellidos varchar(128) NOT NULL,
  telefono varchar(20) NULL,
  ci varchar(11) NULL,
  correo varchar(128) NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idpersona)
);

CREATE TABLE CLIENTE (
  idcliente int NOT NULL,
  idpersona int NOT NULL,
  tipocliente varchar(20) NOT NULL,
  codigoclie varchar(20) NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idcliente),
  FOREIGN KEY (idpersona) REFERENCES PERSONA (idpersona)
);

CREATE TABLE TIPOPROD (
  idtipoprod int NOT NULL,
  nombre varchar(128) NOT NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idtipoprod)
);

CREATE TABLE PRODUCTO (
  idproducto int NOT NULL,
  idtipoproducto int NOT NULL,
  nombre varchar(128) NOT NULL,
  codigobarra varchar(20) NULL,
  precioventa decimal(18,2) NOT NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idproducto),
  FOREIGN KEY (idtipoproducto) REFERENCES TIPOPROD (idtipoprod)
);

CREATE TABLE VENTA (
  idventa int NOT NULL,
  idcliente int NOT NULL,
  idvendedor int NOT NULL,
  fechavenc datetime NOT NULL,
  total decimal(18,2) NOT NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idventa),
  FOREIGN KEY (idcliente) REFERENCES CLIENTE (idcliente),
  FOREIGN KEY (idvendedor) REFERENCES PERSONA (idpersona)
);

CREATE TABLE DETALLEVENT (
  iddetallevent int NOT NULL,
  idventa int NOT NULL,
  idproducto int NOT NULL,
  cantidad int NOT NULL,
  precioventa decimal(18,2) NOT NULL,
  subtotal decimal(18,2) NOT NULL,
  PRIMARY KEY (iddetallevent),
  FOREIGN KEY (idventa) REFERENCES VENTA (idventa),
  FOREIGN KEY (idproducto) REFERENCES PRODUCTO (idproducto)
);

CREATE TABLE USUARIO (
  idusuario int NOT NULL,
  idpersona int NOT NULL,
  nombreuser varchar(128) NOT NULL,
  contraseña varchar(128) NOT NULL,
  fechareg datetime NOT NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idusuario),
  FOREIGN KEY (idpersona) REFERENCES PERSONA (idpersona)
);

CREATE TABLE ROL (
  idrol int NOT NULL,
  nombre varchar(128) NOT NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idrol)
);

CREATE TABLE USUARIOROL (
  idusuariorol int NOT NULL,
  idusuario int NOT NULL,
  idrol int NOT NULL,
  fechaasigna datetime NOT NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idusuariorol),
  FOREIGN KEY (idusuario) REFERENCES USUARIO (idusuario),
  FOREIGN KEY (idrol) REFERENCES ROL (idrol)
);


CREATE TABLE MARCA (
  idmarca int NOT NULL,
  nombre varchar(128) NOT NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idmarca)
);

CREATE TABLE PROVEEDOR (
  idproveedor int NOT NULL,
  nombre varchar(128) NOT NULL,
  telefono varchar(20) NULL,
  direccion varchar(128) NULL,
  estado bit NOT NULL,
  PRIMARY KEY (idproveedor)
);

CREATE TABLE Ingreso (
  idingreso INT NOT NULL,
  idproveedor INT NOT NULL,
  fechaingreso DATE NOT NULL,
  total DECIMAL(18, 2) NOT NULL,
  estado BIT NOT NULL,
  PRIMARY KEY (idingreso)
);


CREATE TABLE Provee (
  idprovee INT NOT NULL,
  idproducto INT NOT NULL,
  idproveedor INT NOT NULL,
  fecha DATE NOT NULL,
  precio DECIMAL(18, 2) NOT NULL,
  PRIMARY KEY (idprovee),
  FOREIGN KEY (idproducto) REFERENCES Producto(idproducto),
  FOREIGN KEY (idproveedor) REFERENCES Proveedor(idproveedor)
);


CREATE TABLE detalle_ingreso (
  iddetalleingreso INT NOT NULL,
  idproducto INT NOT NULL,
  idingreso INT NOT NULL,
  fechavencimiento DATE NOT NULL,
  cantidad INT NOT NULL,
  preciocosto DECIMAL(18, 2) NOT NULL,
  precioventa DECIMAL(18, 2) NOT NULL,
  subtotal DECIMAL(18, 2) NOT NULL,
  estado BIT NOT NULL,
  PRIMARY KEY (iddetalleingreso),
  FOREIGN KEY (idproducto) REFERENCES PRODUCTO (idproducto),
  FOREIGN KEY (idingreso) REFERENCES Ingreso (idingreso)
);

