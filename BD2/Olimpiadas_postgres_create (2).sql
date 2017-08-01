



SET search_path TO "dim_model", information_schema;



CREATE TABLE "Dim_Persona" (
	"ID_persona" numeric(3) NOT NULL,
	"Prim_Nombre" varchar(20) NOT NULL,
	"Seg_Nombre" varchar(20),
	"Prim_Apellido" varchar(20) NOT NULL,
	"Seg_Apellido" varchar(20) NOT NULL,
	"Fecha_Nacimiento" date NOT NULL,
	"Sexo" char(2) NOT NULL,
	CONSTRAINT Dim_Persona_pk PRIMARY KEY ("ID_persona")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Terreno" (
	"ID_terreno" numeric(3) NOT NULL,
	"Altitud" numeric(20) NOT NULL,
	"Sector_id" numeric(3) NOT NULL,
	"Inclinacion" numeric(3) NOT NULL,
	"Material_terreno" varchar(20) NOT NULL,
	"Condicion_terreno" varchar(20) NOT NULL,
	"Tramos" varchar(20) NOT NULL,
	CONSTRAINT Dim_Terreno_pk PRIMARY KEY ("ID_terreno")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Atleta" (
	"ID_atleta" numeric(3) NOT NULL,
	"Porcentaje_grasa" numeric(15) NOT NULL,
	"Porcentaje_agua" numeric(15) NOT NULL,
	"Masa_muscular" numeric(15) NOT NULL,
	"Edad_corporal" numeric(15) NOT NULL,
	"Grasa_visceral" numeric(15) NOT NULL,
	"Peso" numeric(15) NOT NULL,
	"Altura" numeric(15) NOT NULL,
	"Estado_mental" varchar(20) NOT NULL,
	"Persona_id" numeric(3) NOT NULL,
	"Entrenador_id" numeric(3) NOT NULL,
	CONSTRAINT Dim_Atleta_pk PRIMARY KEY ("ID_atleta")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Clima" (
	"ID_clima" numeric(3) NOT NULL,
	"Estacion" numeric(3) NOT NULL,
	"Temperatura" numeric(15) NOT NULL,
	"Precipitacion" numeric(15) NOT NULL,
	"Velocidad_viento" numeric(15) NOT NULL,
	"Porcentaje_humedad" numeric(15) NOT NULL,
	"Fecha_clima" DATE NOT NULL,
	"Direccion_viento" numeric(3) NOT NULL,
	CONSTRAINT Dim_Clima_pk PRIMARY KEY ("ID_clima")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Dirrecion_Viento" (
	"ID_viento" numeric(3) NOT NULL,
	"Direccion" varchar(20) NOT NULL,
	CONSTRAINT Dim_Dirrecion_Viento_pk PRIMARY KEY ("ID_viento")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Fecha" (
	"ID_fecha" numeric(3) NOT NULL,
	"Fecha" date NOT NULL,
	"Dia" numeric(10) NOT NULL,
	"Dia_semana" varchar(15) NOT NULL,
	"Mes" numeric(10) NOT NULL,
	"Agno" numeric(10) NOT NULL,
	CONSTRAINT Dim_Fecha_pk PRIMARY KEY ("ID_fecha")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Hora" (
	"ID_hora" numeric(3) NOT NULL,
	"Hora" numeric(15) NOT NULL,
	"Minutos" numeric(15) NOT NULL,
	"Segundos" numeric(15) NOT NULL,
	CONSTRAINT Dim_Hora_pk PRIMARY KEY ("ID_hora")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Fact_Corrida" (
	"Persona_id" numeric(3) NOT NULL,
	"Clima_id" numeric(3) NOT NULL,
	"Fecha_id" numeric(3) NOT NULL,
	"Tiempo_id" numeric(3) NOT NULL,
	"Terreno_id" numeric(3) NOT NULL,
	"Atleta_id" numeric(3) NOT NULL,
	"Pais_id" numeric(3) NOT NULL,
	"Evento_id" numeric(3) NOT NULL,
	"Distancia" numeric(10) NOT NULL,
	"Tiempo_Tramo" varchar(100) NOT NULL,
	"Numero_vueltas" numeric(5) NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Sector" (
	"id_sect" numeric(3) NOT NULL,
	"Nombre" varchar(20) NOT NULL,
	"Provincia" numeric(3) NOT NULL,
	CONSTRAINT Dim_Sector_pk PRIMARY KEY ("id_sect")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Provincia" (
	"id_provin" numeric(3) NOT NULL,
	"Nombre" varchar(20) NOT NULL,
	CONSTRAINT Dim_Provincia_pk PRIMARY KEY ("id_provin")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Pais" (
	"id_pais" numeric(3) NOT NULL,
	"Nombre" varchar(20) NOT NULL,
	"Region" numeric(3) NOT NULL,
	CONSTRAINT Dim_Pais_pk PRIMARY KEY ("id_pais")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Region" (
	"id_reg" numeric(3) NOT NULL,
	"Nombre" varchar(20) NOT NULL,
	CONSTRAINT Dim_Region_pk PRIMARY KEY ("id_reg")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Entrenador" (
	"id_entrenador" numeric(3) NOT NULL,
	"Persona_id_entrenad" numeric(3) NOT NULL,
	"Fecha_ingreso" DATE NOT NULL,
	CONSTRAINT Dim_Entrenador_pk PRIMARY KEY ("id_entrenador")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Estacion" (
	"ID_estacion" numeric(3) NOT NULL,
	"Nombre" varchar(20) NOT NULL,
	CONSTRAINT Dim_Estacion_pk PRIMARY KEY ("ID_estacion")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Tramo" (
	"id_tramo" numeric(3) NOT NULL,
	"Inclinacion" numeric(20) NOT NULL,
	"Material" numeric(3) NOT NULL,
	CONSTRAINT Dim_Tramo_pk PRIMARY KEY ("id_tramo")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Material" (
	"id_material" numeric(3) NOT NULL,
	"Tipo" varchar(20) NOT NULL,
	"Nombre" varchar(20) NOT NULL,
	CONSTRAINT Dim_Material_pk PRIMARY KEY ("id_material")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Dim_Evento" (
	"id_evento" numeric(3) NOT NULL,
	"Nombre" varchar(20) NOT NULL,
	"Fecha_inicio" numeric(3) NOT NULL,
	"Fecha_fin" numeric(3) NOT NULL,
	CONSTRAINT Dim_Evento_pk PRIMARY KEY ("id_evento")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Dim_Terreno" ADD CONSTRAINT "Dim_Terreno_fk0" FOREIGN KEY ("Sector_id") REFERENCES "Dim_Sector"("id_sect");
ALTER TABLE "Dim_Terreno" ADD CONSTRAINT "Dim_Terreno_fk1" FOREIGN KEY ("Inclinacion") REFERENCES "Dim_Tramo"("id_tramo");

ALTER TABLE "Dim_Atleta" ADD CONSTRAINT "Dim_Atleta_fk0" FOREIGN KEY ("Persona_id") REFERENCES "Dim_Persona"("ID_persona");
ALTER TABLE "Dim_Atleta" ADD CONSTRAINT "Dim_Atleta_fk1" FOREIGN KEY ("Entrenador_id") REFERENCES "Dim_Entrenador"("id_entrenador");

ALTER TABLE "Dim_Clima" ADD CONSTRAINT "Dim_Clima_fk0" FOREIGN KEY ("Estacion") REFERENCES "Dim_Estacion"("ID_estacion");
ALTER TABLE "Dim_Clima" ADD CONSTRAINT "Dim_Clima_fk1" FOREIGN KEY ("Direccion_viento") REFERENCES "Dim_Dirrecion_Viento"("ID_viento");




ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk0" FOREIGN KEY ("Persona_id") REFERENCES "Dim_Persona"("ID_persona");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk1" FOREIGN KEY ("Clima_id") REFERENCES "Dim_Clima"("ID_clima");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk2" FOREIGN KEY ("Fecha_id") REFERENCES "Dim_Fecha"("ID_fecha");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk3" FOREIGN KEY ("Tiempo_id") REFERENCES "Dim_Hora"("ID_hora");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk4" FOREIGN KEY ("Terreno_id") REFERENCES "Dim_Terreno"("ID_terreno");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk5" FOREIGN KEY ("Atleta_id") REFERENCES "Dim_Atleta"("ID_atleta");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk6" FOREIGN KEY ("Pais_id") REFERENCES "Dim_Pais"("id_pais");
ALTER TABLE "Fact_Corrida" ADD CONSTRAINT "Fact_Corrida_fk7" FOREIGN KEY ("Evento_id") REFERENCES "Dim_Evento"("id_evento");

ALTER TABLE "Dim_Sector" ADD CONSTRAINT "Dim_Sector_fk0" FOREIGN KEY ("Provincia") REFERENCES "Dim_Provincia"("id_provin");


ALTER TABLE "Dim_Pais" ADD CONSTRAINT "Dim_Pais_fk0" FOREIGN KEY ("Region") REFERENCES "Dim_Region"("id_reg");


ALTER TABLE "Dim_Entrenador" ADD CONSTRAINT "Dim_Entrenador_fk0" FOREIGN KEY ("Persona_id_entrenad") REFERENCES "Dim_Persona"("ID_persona");


ALTER TABLE "Dim_Tramo" ADD CONSTRAINT "Dim_Tramo_fk0" FOREIGN KEY ("Material") REFERENCES "Dim_Material"("id_material");


ALTER TABLE "Dim_Evento" ADD CONSTRAINT "Dim_Evento_fk0" FOREIGN KEY ("Fecha_inicio") REFERENCES "Dim_Fecha"("ID_fecha");
ALTER TABLE "Dim_Evento" ADD CONSTRAINT "Dim_Evento_fk1" FOREIGN KEY ("Fecha_fin") REFERENCES "Dim_Fecha"("ID_fecha");

