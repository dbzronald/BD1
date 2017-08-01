CREATE TABLE "Fact_Corrida" (
	"Persona_id" numeric(3) NOT NULL,
	"Clima_id" numeric(3) NOT NULL,
	"Fecha_id" numeric(3) NOT NULL,
	"Terreno_id" numeric(3) NOT NULL,
	"Medicion_id" numeric(3) NOT NULL,
	"Carrera_id" numeric(3) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Persona" (
	"ID" serial(3) NOT NULL,
	"Prim_Nombre" varchar(20) NOT NULL,
	"Seg_Nombre" varchar(20) NOT NULL,
	"Seg_Apellido" varchar(20) NOT NULL,
	"Prim_Apellido" varchar(20) NOT NULL,
	"Fecha_Nacimiento" DATE(20) NOT NULL,
	"Sexo" char(5) NOT NULL,
	CONSTRAINT Dim_Persona_pk PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Clima" (
	"ID" serial(3) NOT NULL,
	"Estacion" serial(20) NOT NULL,
	"Temperatura" serial(10) NOT NULL,
	"Precipitacion" serial(10) NOT NULL,
	"Velocidad_viento" serial(15) NOT NULL,
	"Direccion_viento" serial(15) NOT NULL,
	"Porcentaje_humedad" serial(15) NOT NULL,
	"Fecha_clima" serial(15) NOT NULL,
	CONSTRAINT Dim_Clima_pk PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Fecha" (
	"ID" serial(3) NOT NULL,
	"Fecha" serial(15) NOT NULL,
	"Dia" serial(10) NOT NULL,
	"Dia_semana" serial(10) NOT NULL,
	"Mes" serial(10) NOT NULL,
	"Agno" serial(10) NOT NULL,
	"Hora" serial(15) NOT NULL,
	CONSTRAINT Dim_Fecha_pk PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Terreno" (
	"ID" serial NOT NULL,
	"Altitud" serial(20) NOT NULL,
	"Latitud" serial(20) NOT NULL,
	"Lugar" serial(20) NOT NULL,
	"Inclinacion" serial(20) NOT NULL,
	"Material_terreno" serial(20) NOT NULL,
	"Condicion_terreno" serial(20) NOT NULL,
	CONSTRAINT Dim_Terreno_pk PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Medicion" (
	"ID" numeric(3) NOT NULL,
	"Porcentaje_grasa" numeric(15) NOT NULL,
	"Porcentaje_agua" numeric(15) NOT NULL,
	"Masa_muscular" numeric(15) NOT NULL,
	"Edad_corporal" numeric(15) NOT NULL,
	"Grasa_visceral" numeric(15) NOT NULL,
	"Peso" numeric(15) NOT NULL,
	"Altura" numeric(15) NOT NULL,
	"Estado_mental" varchar(20) NOT NULL,
	CONSTRAINT Dim_Medicion_pk PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Carrera" (
	"ID" serial NOT NULL,
	"Numero_vuelta" serial(5) NOT NULL,
	"Tiempo_inicio" serial(10) NOT NULL,
	"Tiempo_fin" serial(10) NOT NULL,
	CONSTRAINT Dim_Carrera_pk PRIMARY KEY ("ID")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk0" FOREIGN KEY ("Persona_id") REFERENCES "Dim_Persona"("ID");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk1" FOREIGN KEY ("Clima_id") REFERENCES "Dim_Clima"("ID");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk2" FOREIGN KEY ("Fecha_id") REFERENCES "Dim_Fecha"("ID");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk3" FOREIGN KEY ("Terreno_id") REFERENCES "Dim_Terreno"("ID");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk4" FOREIGN KEY ("Medicion_id") REFERENCES "Dim_Medicion"("ID");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk5" FOREIGN KEY ("Carrera_id") REFERENCES "Dim_Carrera"("ID");







