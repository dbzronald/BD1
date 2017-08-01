-- La composicion racial de Nueva York
SELECT 100.0 * Sum(popn_white) / Sum(popn_total) AS porc_blanca, 100.0 * Sum(popn_black) / Sum(popn_total) AS porc_negra, 100.0 * Sum(popn_nativ) / Sum(popn_total) AS porc_nativa, 
100.0 * Sum(popn_asian) / Sum(popn_total) AS porc_asiatica, 100.0 * Sum(popn_other) / Sum(popn_total) AS porc_otra, Sum(popn_total) AS pob_total
FROM nyc_census_blocks;


-- La densidad en personas/km^2 del lado Oeste superior y Este superior.
SELECT n.name,Sum(c.popn_total) / (ST_Area(n.geom) / 1000000.0) AS poblacion_mtC
FROM nyc_census_blocks AS c
JOIN nyc_neighborhoods AS n
ON ST_Intersects(c.geom, n.geom)
WHERE n.name = 'Upper West Side'
OR n.name = 'Upper East Side'
GROUP BY n.name, n.geom;

-- La longuitud de todas las calles de Nueva York.
SELECT Sum(ST_Length(Geography(ST_Transform(geom,4326))))
FROM nyc_streets;

-- Lugar donde se han las personas de raza blanca han cometido mas homicidios con una arma de fuego y por razones de bandas.
SELECT Max(boroname) FROM nyc_homicides
WHERE primary_mo = 'GANG' AND light_dark = 'L' AND weapon = 'gun';

-- Poblacion de Nueva York a 500 metros de una estacion de subway.

SELECT Sum(popn_total)
FROM nyc_census_blocks census
JOIN nyc_subway_stations subway
ON ST_DWithin(census.geom, subway.geom, 500);