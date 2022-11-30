USE labor_sql;

SELECT pc.model, pc.speed, pc.ram, pc.hd, pc.cd, product.maker 
FROM pc, product 
WHERE (hd='10' OR hd='20') AND maker='A'
ORDER BY speed;

SELECT *
FROM outcome_o
WHERE outcome_o.date LIKE '%-14%';



SELECT maker FROM pc
INNER JOIN product ON (pc.model=product.model)
WHERE speed >= 600;


SELECT maker
FROM   product
WHERE  model NOT IN (SELECT model FROM pc) AND type = 'PC';

SELECT maker FROM product
WHERE EXISTS
(SELECT model FROM PC);

SELECT  CONCAT('Name: ', name ,  ' Class: ' , class , ' Launch: ' , launched)
FROM Ships;

SELECT maker, COUNT(maker) AS quantity
FROM   product
WHERE  model NOT IN (SELECT model FROM pc) AND type = 'PC'
GROUP BY maker;

SELECT Ships.name, Classes.country, Outcomes.result
FROM Ships, Classes, Outcomes
WHERE Outcomes.result LIKE 'sunk';

SELECT maker,
CASE WHEN
( SELECT COUNT(*) FROM product WHERE type='pc' GROUP BY maker HAVING maker=P.maker )IS NOT NULL THEN 
concat('yes(', (SELECT COUNT(*)
FROM Product WHERE type='pc' GROUP BY maker HAVING maker=P.maker ), ')') 
ELSE 'no'
END AS pc FROM product P GROUP BY maker;

SELECT 'laptop' as type, model, max(price)  FROM laptop
UNION
SELECT 'pc' as type, model, max(price)  FROM pc
UNION
SELECT 'printer' as type,model, max(price)  FROM printer






