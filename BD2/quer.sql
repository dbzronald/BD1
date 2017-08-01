-- Genero que mas dono.
SELECT count(*) as cantidad, sexo FROM blood_bank.donador
group by sexo;

-- Los 3 tipos de sangre mas donados
SELECT count(*) as cantidad, tipo  FROM blood_bank.donacion
group by tipo
order by count(*) desc LIMIT 3;

-- Tipo de sangre con mas ventas.
SELECT count(*) as cantidad, grupo_sangre  FROM blood_bank.orden_producto a1, blood_bank.sangre s1
where a1.sangrecompleta_id_sc = s1.id_sc AND s1.grupo_sangre is not null
group by s1.grupo_sangre
order by count(*) desc LIMIT 1;

-- Tipo de sangre menos donado
SELECT count(*) as cantidad, tipo  FROM blood_bank.donacion
group by tipo
order by count(*) asc LIMIT 1;

-- Sector que dona mas sangre.

SELECT direccion, max(sector), nombre FROM blood_bank.donador d1 ,blood_bank.direccion d2, blood_bank.sector s1
where d1.direccion = d2.id_direccion and d2.sector = s1.id_sector and rechazado = '0'
;