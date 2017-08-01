-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-04-24 02:21:31.853

-- tables
-- Table: banco
CREATE TABLE banco (
    id_banco int NOT NULL,
    nombre varchar(20) NULL,
    telefono int NULL,
    direccion int NOT NULL,
    CONSTRAINT Banco_pk PRIMARY KEY (id_banco)
) COMMENT 'Tabla que contiene la informacion de Banco';

-- Table: comprador
CREATE TABLE comprador (
    id_comprador int NOT NULL,
    nombre int NOT NULL,
    telefono int NOT NULL,
    direccion int NOT NULL,
    CONSTRAINT comprador_pk PRIMARY KEY (id_comprador)
) COMMENT 'Tabla que contiene los datos del comprador de sangre/plaqueta';

-- Table: direccion
CREATE TABLE direccion (
    id_direccion int NOT NULL,
    calle varchar(25) NOT NULL,
    casa_edificio int NOT NULL,
    sector int NOT NULL,
    CONSTRAINT direccion_pk PRIMARY KEY (id_direccion)
) COMMENT 'Tabla que contiene informacion de la direccion ';

-- Table: division
CREATE TABLE division (
    id_donacion int NOT NULL,
    id_plaqueta int NOT NULL,
    id_sangre int NOT NULL,
    CONSTRAINT division_pk PRIMARY KEY (id_donacion)
) COMMENT 'Tabla que contiene la informacion del proceso de division de las plaquetas ';

-- Table: donacion
CREATE TABLE donacion (
    id_donacion int NOT NULL,
    tipo char(3) NOT NULL,
    fecha_donacion int NOT NULL,
    id_donador int NOT NULL,
    CONSTRAINT id_donacion PRIMARY KEY (id_donacion)
) COMMENT 'Tabla que contiene la informacion de donacion';

-- Table: donador
CREATE TABLE donador (
    id_donador int NOT NULL,
    grupo_donar char(3) NOT NULL,
    informe_medico int NOT NULL,
    telefono int NOT NULL,
    prim_nombre varchar(20) NOT NULL,
    segu_nombre varchar(20) NULL,
    prim_apellido varchar(20) NOT NULL,
    segu_apellido varchar(20) NULL,
    fecha_nacimiento date NOT NULL,
    sexo char(1) NOT NULL,
    direccion int NOT NULL,
    id_banco int NOT NULL,
    CHECK (( edad ( ( ( sysdate - fecha_nacimiento ) / 365 ) < 17 ) )),
    CONSTRAINT Donador_pk PRIMARY KEY (id_donador)
) COMMENT 'Tabla que contiene la informacion del donador';

-- Table: orden
CREATE TABLE orden (
    id_orden int NOT NULL,
    fecha_orden date NOT NULL,
    precio decimal(4,2) NOT NULL,
    impuesto decimal(3,2) NOT NULL,
    CONSTRAINT id_orden PRIMARY KEY (id_orden)
) COMMENT 'Tabla que contiene la informacion de orden';

-- Table: orden_comprador
CREATE TABLE orden_comprador (
    d_orden int NOT NULL,
    id_comprador int NOT NULL,
    CONSTRAINT orden_comprador_pk PRIMARY KEY (d_orden,id_comprador)
);

-- Table: orden_producto
CREATE TABLE orden_producto (
    orden_id_orden int NOT NULL,
    sangrecompleta_id_sc int NOT NULL,
    id_plaqueta int NOT NULL,
    CONSTRAINT orden_producto_pk PRIMARY KEY (orden_id_orden)
) COMMENT 'Tabla mucho a mucho de producto y order';

-- Table: plaquetas
CREATE TABLE plaquetas (
    id_plaqueta int NOT NULL,
    volumen int NOT NULL,
    fecha_expiracion date NOT NULL,
    fecha_donacion date NOT NULL,
    expirado bool NOT NULL,
    CONSTRAINT Plaquetas_pk PRIMARY KEY (id_plaqueta)
) COMMENT 'Tabla que contiene la informacion de plaquetas';

-- Table: sangre
CREATE TABLE sangre (
    id_sc int NOT NULL,
    volumen_sangre int NULL,
    tipo char(3) NULL,
    fecha_expiracion date NULL,
    fecha_donacion int NOT NULL,
    expirado_sangre bool NOT NULL,
    CONSTRAINT SangreCompleta_pk PRIMARY KEY (id_sc)
) COMMENT 'Tabla que contiene la informacion de la sangre ';

-- Table: sector
CREATE TABLE sector (
    id_sector int NOT NULL,
    nombre varchar(30) NOT NULL,
    CONSTRAINT sector_pk PRIMARY KEY (id_sector)
) COMMENT 'Tabla que contiene la informacion de sector';

-- views
-- View: plaquetas_totales
CREATE VIEW plaquetas_totales AS
select count(volumen), expirado as total_plaquetas from plaquetas where expirado = 'false';

-- View: sangre_total
CREATE VIEW sangre_total AS
select count(volumen_sangre), expirado_sangre as total_sangre from sangre where expirado_sangre = 'false';

-- foreign keys
-- Reference: Banco_direccion (table: banco)
ALTER TABLE banco ADD CONSTRAINT Banco_direccion FOREIGN KEY Banco_direccion (direccion)
    REFERENCES direccion (id_direccion);

-- Reference: Donador_Banco (table: donador)
ALTER TABLE donador ADD CONSTRAINT Donador_Banco FOREIGN KEY Donador_Banco (id_banco)
    REFERENCES banco (id_banco);

-- Reference: Donador_direccion (table: donador)
ALTER TABLE donador ADD CONSTRAINT Donador_direccion FOREIGN KEY Donador_direccion (direccion)
    REFERENCES direccion (id_direccion);

-- Reference: comprador_direccion (table: comprador)
ALTER TABLE comprador ADD CONSTRAINT comprador_direccion FOREIGN KEY comprador_direccion (direccion)
    REFERENCES direccion (id_direccion);

-- Reference: direccion_sector (table: direccion)
ALTER TABLE direccion ADD CONSTRAINT direccion_sector FOREIGN KEY direccion_sector (sector)
    REFERENCES sector (id_sector);

-- Reference: division_Donacion (table: division)
ALTER TABLE division ADD CONSTRAINT division_Donacion FOREIGN KEY division_Donacion (id_donacion)
    REFERENCES donacion (id_donacion);

-- Reference: division_Plaquetas (table: division)
ALTER TABLE division ADD CONSTRAINT division_Plaquetas FOREIGN KEY division_Plaquetas (id_plaqueta)
    REFERENCES plaquetas (id_plaqueta);

-- Reference: division_SangreCompleta (table: division)
ALTER TABLE division ADD CONSTRAINT division_SangreCompleta FOREIGN KEY division_SangreCompleta (id_sangre)
    REFERENCES sangre (id_sc);

-- Reference: donacion_Donador (table: donacion)
ALTER TABLE donacion ADD CONSTRAINT donacion_Donador FOREIGN KEY donacion_Donador (id_donador)
    REFERENCES donador (id_donador);

-- Reference: id_orden (table: orden_producto)
ALTER TABLE orden_producto ADD CONSTRAINT id_orden FOREIGN KEY id_orden (orden_id_orden)
    REFERENCES orden (id_orden);

-- Reference: orden_comprador_Orden (table: orden_comprador)
ALTER TABLE orden_comprador ADD CONSTRAINT orden_comprador_Orden FOREIGN KEY orden_comprador_Orden (d_orden)
    REFERENCES orden (id_orden);

-- Reference: orden_comprador_comprador (table: orden_comprador)
ALTER TABLE orden_comprador ADD CONSTRAINT orden_comprador_comprador FOREIGN KEY orden_comprador_comprador (id_comprador)
    REFERENCES comprador (id_comprador);

-- Reference: orden_producto_Plaquetas (table: orden_producto)
ALTER TABLE orden_producto ADD CONSTRAINT orden_producto_Plaquetas FOREIGN KEY orden_producto_Plaquetas (id_plaqueta)
    REFERENCES plaquetas (id_plaqueta);

-- Reference: orden_producto_SangreCompleta (table: orden_producto)
ALTER TABLE orden_producto ADD CONSTRAINT orden_producto_SangreCompleta FOREIGN KEY orden_producto_SangreCompleta (sangrecompleta_id_sc)
    REFERENCES sangre (id_sc);

-- End of file.

