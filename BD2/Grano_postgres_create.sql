INSERT INTO dim_model."Dim_Persona" ("ID_persona",
	"Prim_Nombre",
	"Seg_Nombre",
	"Prim_Apellido",
	"Seg_Apellido",
	"Fecha_Nacimiento",
	"Sexo")
    SELECT "id_per",
	"Primer_nombre",
	"Segundo_nombre",
	"Primer_Apellido",
	"Segundo_Apellido",
	"Fecha_Nacimiento",
	"Sexo" FROM public."Persona"
	
	
	
	
	
	----------------------------
	
	
	INSERT INTO dim_model."Dim_Atleta" ("ID_atleta",
	"Porcentaje_grasa" ,
	"Porcentaje_agua" ,
	"Masa_muscular" ,
	"Grasa_visceral" ,
	"Peso" ,
	"Altura" ,
	"Persona_id" ,
	"Entrenador_id"
                                   
    )
    SELECT "id_atleta",
    "Porciento_grasa",
	"Porciento_agua",
	"Masa_Muscular",
	"Grasa_visceral",
	"Peso",
	"Altura",
	"id_persona",
    "Entrenador"
    FROM public."Atleta"
	
	
	
	--------------------------------
	
	INSERT INTO dim_model."Dim_Entrenador" ("id_entrenador" ,
	"Persona_id_entrenad",
	"Fecha_ingreso")
    
    SELECT "id_entrenador" ,
	"id_persona",
	"fecha_ingreso"
    FROM public."Entrenador"
	
	
	-----------------------------------
	
		INSERT INTO dim_model."Dim_Clima" (
    "ID_clima" ,
	"Estacion",
	"Temperatura" ,
	"Precipitacion" ,
	"Velocidad_viento",
	"Porcentaje_humedad",
	"Fecha_clima" ,
	"Direccion_viento"
                                   
    )
    SELECT "id_clima" ,
	"Estacion",
	"Temperatura" ,
	"Precipitacion" ,
	"Velocidad_viento",
    "Porcentaje_humedad",
	"Fecha_clima" ,
    "Direccion_viento"

    FROM public."Clima"
	
	---------------------------------------
	
	
	
		INSERT INTO dim_model."Dim_Estacion" (
   "ID_estacion",
	"Nombre"
                                   
    )
    SELECT "id_estacion" ,
	"Nombre"

    FROM public."Estacion"
	
	------------------------------------
	
		INSERT INTO dim_model."Dim_Dirrecion_Viento" (
   "ID_viento" ,
	"Direccion"
                                   
    )
    SELECT "id_direccion" ,
	"Direccion"

    FROM public."Direccion"
	
	-----------------------------------
	
		INSERT INTO dim_model."Dim_Material" (
  "id_material" ,
	"Tipo" ,
	"Nombre"
                                   
    )
    SELECT  "id_material" ,
	"Tipo" ,
	"Nombre"

    FROM public."Material"
	
	--------------------------------------
	
	
		INSERT INTO dim_model."Dim_Hora" (
 	"ID_hora" ,
	"Hora" ,
	"Minutos" ,
	"Segundos"
                                   
    )
    SELECT
    "id_tiempo" ,
	"Hora" ,
	"Minutos" ,
	"Segundos"

    FROM public."Tiempo"
	
	---------------------------------------
	
		
	INSERT INTO dim_model."Dim_Tramo" ("id_tramo",
                                       "Inclinacion",
                                       "Material")
                                       
    SELECT "id_tramo",
    "Inclinacion",
    "Material"
    
    FROM public."Tramo"
	
	------------------------------------------
	
		
	INSERT INTO dim_model."Dim_Provincia" ("id_provin",
                                    
                                       "Nombre")
                                       
    SELECT "id_provincia",
    
    "Nombre"
    
    FROM public."Provincia"
	
	-------------------------------------------
	
		
	INSERT INTO dim_model."Dim_Provincia" ("id_provin",
                                    
                                       "Nombre")
                                       
    SELECT "id_provincia",
    
    "Nombre"
    
    FROM public."Provincia"
	
	-------------------------------------------
	
	
		
	INSERT INTO dim_model."Dim_Region" ("id_reg",
                                    
                                       "Nombre")
                                       
    SELECT "id_region",
    
    "Nombre"
    
    FROM public."Region"
	
	--------------------------------------------
	
	
		
	INSERT INTO dim_model."Dim_Pais" ("id_pais",
                                       "Nombre",
                                     "Region")
                                       
    SELECT "id_paises", 
    "Nombre",
    "id_regiones"
    
    
    ------------------------------------------------------------------
    
    
    FROM  public."Pais_Region" as PR,public."Pais" as Pa, public."Region" as R
    
    where PR."id_paises"=Pa."id_pais" and PR."id_regiones"=R."id_region"
	
	---------------------------------------------
	
		
	INSERT INTO dim_model."Dim_Sector" ("id_sect",
                                       "Nombre",
                                     "Provincia")
                                       
    SELECT "id_sector", 
    "Nombre",
    "Provincia"
    
    
    
    
    
    FROM  public."Sector" 
    
    
	------------------------------------------
	
		
	INSERT INTO dim_model."Dim_Terreno" ("ID_terreno",
                                       "Altitud",
                                     "Sector_id",
                                        "Inclinacion",
                                        "Material_terreno",
                                        "Condicion_terreno"
                                      )
                                       
    SELECT "id_terreno", 
    "Altitud_sob_mar",
    "Sector",
    "Inclinacion",
    "Material",
    "Condicion"
    
    FROM  public."Terreno" 
    
    
	---------------------------------------------
	
	create view Load_Fact_Table as select(	"Clima_id",
                                       	"Terreno_id",
                                    	 "Atleta_id",
                                       	 "Evento_id",
                                          "Distancias",
                                          "vuelta",
                                          "hora_tramo",
                                          "minuto_tramo",
                                          "segundo_tram",
                                          "milisegundo_tramo",
                                          "Vuelta_Max"
                                      )
   from public."Persona" as PP,public."Terreno" as TE,public."Corrida" as CO,public."Evento" as EV,public."Tramo" as TR,public."Clima" as CL,public."Tramo_Corrida" as TC, public."Atleta" as Atl
   
   where Clima_id=id_clima;
   and Terreno_id=id_terreno;
   and Atleta_id=id_atleta;
   and Evento_id=id_evento;
   and Distancias=Distancia
	
	
	
	
	