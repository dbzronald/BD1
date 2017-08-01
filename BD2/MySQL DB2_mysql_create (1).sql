CREATE TABLE `banco` (
	`id_banco` int(11) NOT NULL AUTO_INCREMENT,
	`nombre` varchar(20),
	`telefono` varchar(13),
	`direccion` int(11) NOT NULL,
	PRIMARY KEY (`id_banco`)
);

CREATE TABLE `comprador` (
	`id_comprador` int(11) NOT NULL AUTO_INCREMENT,
	`nombre` TEXT NOT NULL,
	`telefono` TEXT NOT NULL,
	`direccion` int(11) NOT NULL,
	PRIMARY KEY (`id_comprador`)
);

CREATE TABLE `direccion` (
	`id_direccion` int(11) NOT NULL AUTO_INCREMENT,
	`calle` varchar(25) NOT NULL,
	`casa_edificio` varchar(25) NOT NULL,
	`sector` int(11) NOT NULL,
	PRIMARY KEY (`id_direccion`)
);

CREATE TABLE `division` (
	`id_donacion` int(11) NOT NULL AUTO_INCREMENT,
	`id_plaqueta` int(11),
	`id_sangre` int(11),
	PRIMARY KEY (`id_donacion`)
);

CREATE TABLE `donacion` (
	`id_donacion` int(11) NOT NULL AUTO_INCREMENT,
	`fecha_donacion` DATE NOT NULL,
	`id_donador` int(11) NOT NULL,
	`tipo` char(3) NOT NULL,
	PRIMARY KEY (`id_donacion`)
);

CREATE TABLE `donador` (
	`id_donador` int(11) NOT NULL AUTO_INCREMENT,
	`grupo_donar` char(3) NOT NULL,
	`telefono` TEXT NOT NULL,
	`prim_nombre` varchar(20) NOT NULL,
	`segu_nombre` varchar(20),
	`prim_apellido` varchar(20) NOT NULL,
	`segu_apellido` varchar(20),
	`fecha_nacimiento` DATE NOT NULL,
	`sexo` char(1) NOT NULL,
	`direccion` int(11) NOT NULL,
	`id_banco` int(11) NOT NULL,
	`peso` int(15) NOT NULL,
	`rechazado` tinyint(1) DEFAULT '0',
	PRIMARY KEY (`id_donador`)
);

CREATE TABLE `orden` (
	`id_orden` int(11) NOT NULL AUTO_INCREMENT,
	`fecha_orden` DATE NOT NULL,
	`precio` DECIMAL(10.0,0.0) NOT NULL,
	PRIMARY KEY (`id_orden`)
);

CREATE TABLE `orden_comprador` (
	`id_orden` int(11) NOT NULL AUTO_INCREMENT,
	`id_comprador` int(11) NOT NULL,
	PRIMARY KEY (`id_orden`)
);

CREATE TABLE `orden_producto` (
	`id_orden` int(11) NOT NULL AUTO_INCREMENT,
	`id_sc` int(11),
	`id_plaqueta` int(11),
	PRIMARY KEY (`id_orden`)
);

CREATE TABLE `plaquetas` (
	`id_plaqueta` int(11) NOT NULL AUTO_INCREMENT DEFAULT '0',
	`volumen` int(11) NOT NULL,
	`fecha_expiracion` DATE NOT NULL,
	`expirado` tinyint(1) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id_plaqueta`)
);

CREATE TABLE `sangre` (
	`id_sc` int(11) NOT NULL AUTO_INCREMENT DEFAULT '0',
	`volumen_sangre` int(11),
	`grupo_sangre` char(3),
	`fecha_expiracion_s` DATE,
	`expirado_sangre` tinyint(1),
	PRIMARY KEY (`id_sc`)
);

CREATE TABLE `sector` (
	`id_sector` int(11) NOT NULL AUTO_INCREMENT,
	`nombre` varchar(30) NOT NULL,
	PRIMARY KEY (`id_sector`)
);

ALTER TABLE `banco` ADD CONSTRAINT `banco_fk0` FOREIGN KEY (`direccion`) REFERENCES `direccion`(`id_direccion`);

ALTER TABLE `comprador` ADD CONSTRAINT `comprador_fk0` FOREIGN KEY (`direccion`) REFERENCES `direccion`(`id_direccion`);

ALTER TABLE `direccion` ADD CONSTRAINT `direccion_fk0` FOREIGN KEY (`sector`) REFERENCES `sector`(`id_sector`);

ALTER TABLE `division` ADD CONSTRAINT `division_fk0` FOREIGN KEY (`id_donacion`) REFERENCES `donacion`(`id_donacion`);

ALTER TABLE `division` ADD CONSTRAINT `division_fk1` FOREIGN KEY (`id_plaqueta`) REFERENCES `plaquetas`(`id_plaqueta`);

ALTER TABLE `division` ADD CONSTRAINT `division_fk2` FOREIGN KEY (`id_sangre`) REFERENCES `sangre`(`id_sc`);

ALTER TABLE `donacion` ADD CONSTRAINT `donacion_fk0` FOREIGN KEY (`id_donador`) REFERENCES `donador`(`id_donador`);

ALTER TABLE `donador` ADD CONSTRAINT `donador_fk0` FOREIGN KEY (`direccion`) REFERENCES `direccion`(`id_direccion`);

ALTER TABLE `donador` ADD CONSTRAINT `donador_fk1` FOREIGN KEY (`id_banco`) REFERENCES `banco`(`id_banco`);

ALTER TABLE `orden_comprador` ADD CONSTRAINT `orden_comprador_fk0` FOREIGN KEY (`id_orden`) REFERENCES `orden`(`id_orden`);

ALTER TABLE `orden_comprador` ADD CONSTRAINT `orden_comprador_fk1` FOREIGN KEY (`id_comprador`) REFERENCES `comprador`(`id_comprador`);

ALTER TABLE `orden_producto` ADD CONSTRAINT `orden_producto_fk0` FOREIGN KEY (`id_orden`) REFERENCES `orden`(`id_orden`);

ALTER TABLE `orden_producto` ADD CONSTRAINT `orden_producto_fk1` FOREIGN KEY (`id_sc`) REFERENCES `sangre`(`id_sc`);

ALTER TABLE `orden_producto` ADD CONSTRAINT `orden_producto_fk2` FOREIGN KEY (`id_plaqueta`) REFERENCES `plaquetas`(`id_plaqueta`);

