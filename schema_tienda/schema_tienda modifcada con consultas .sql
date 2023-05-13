-- Llista el nom de tots els productes que hi ha en la taula "producto".
select nombre from productos;

-- Llista els noms i els preus de tots els productes de la taula "producto".
select nombre, precio from producto; 

-- Llista totes les columnes de la taula "producto".
Select * from producto; 

-- Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).
Select nombre, precio , precio * 0.91 as usd from producto;

-- Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.
select nombre as producto , precio as Euros , precio * 0.91 as dolares_americanos from producto; 
-- Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.

select upper(nombre),precio from producto;

-- Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.

select lower(nombre),precio from producto;

-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
select nombre, upper (left (nombre,2)) as mayusculas from fabricante ;


-- Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.

select nombre,precio,round(precio,1) from producto;

-- Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.

select nombre,precio,round(precio,0) from producto;

-- Llista el codi dels fabricants que tenen productes en la taula "producto".
select codigo_fabricante from producto right join fabricante on producto.codigo_fabricante= fabricante. codigo;


-- Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.
select distinct codigo_fabricante from producto left join fabricante on  fabricante.codigo = producto.codigo_fabricante ;

-- Llista els noms dels fabricants ordenats de manera ascendent.

select nombre from fabricante order by nombre;

-- Llista els noms dels fabricants ordenats de manera descendent.

select nombre from fabricante order by nombre desc;

-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
select nombre, precio from producto order by nombre asc, precio desc;

-- Retorna una llista amb les 5 primeres files de la taula "fabricante".
select * from fabricante limit 5;

-- Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.
select codigo, nombre from fabricante ;

-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), 
-- necessitaries GROUP BY
select nombre , precio from producto  order by precio  limit 1;
-- Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MAX(preu), necessitaries GROUP BY.
select nombre ,precio from producto order by precio desc limit 1;
-- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
select * from producto where codigo_fabricante= 2;


-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
select producto.nombre, precio,fabricante.nombre from producto  inner join fabricante on producto.codigo_fabricante = fabricante.codigo;

-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
select producto.nombre, precio ,fabricante .nombre  from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre;

-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
select producto.codigo , nombre,fabricante,codigo_fabricante, nombre from producto;
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
select nombre , precio from producto where precio = (select min(precio) from producto);
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
select nombre , precio from producto where precio = (select max(precio ) from producto);

-- Retorna una llista de tots els productes del fabricant Lenovo.
SELECT * FROM producto where fabricante.nombre= 'Lenovo' ;

-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
select * from producto where fabricante.nombre ='Crucial' and precio >200;
-- Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.

-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l'operador IN.
select * from producto where fabricante in( Asus, Hewlett-Packard, Seagate);

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la voca l e.

-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants dels quals contingui el caràcter w en el seu nom.

-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €.
-- Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).

-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.

-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells.
 -- El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.

-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.

-- Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).

-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).

-- Llista el nom del producte més car del fabricant Lenovo.

-- Llista el nom del producte més barat del fabricant Hewlett-Packard.

-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.

-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.


