USE SQL_Performance;


-- Por padrão JOIN terá o mesmo resultado que o INNER JOIN


SELECT w.name, o.owner_name FROM (SELECT * FROM owner WHERE type_owner='State') AS o 
JOIN waterfall AS w ON o.id_waterfall = w.id_waterfall;


-- O equivalente a isso seria

SELECT w.name, o.owner_name, o.type_owner, t.tour_type, t.duration_hrs FROM waterfall AS w
JOIN owner AS o ON w.id_waterfall = o.id_waterfall
JOIN tour AS t ON w.id_waterfall = t.id_waterfall
WHERE o.type_owner="State";
