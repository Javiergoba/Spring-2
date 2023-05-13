-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
select apellido1, apellido2 ,nombre from persona where tipo = ' alumno' order by apellido1,apellido2,nombre;


-- Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
select nombre,apellido1, apellido2 from persona where telefono is null and tipo = 'alumno';



-- Retorna el llistat dels/les alumnes que van néixer en 1999.
select * FROM persona where fecha_nacimiento between '1999-01-01' and '1999-12-31'and tipo = 'alumno';


-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
select * from persona where telefono is null and tipo='profesor' and nif like '%k';

-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
select * from asignatura where cuatrimestre = '1' and (curso = '3' , id_grado = '7');


/*
 Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. 
 El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament.
 El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
 
 select p.apellido1, p.apellido2, p.nombre, d.nombre from persona p , departamento d, profesor pf where p.id =pf.id_profesor and pf.id_departamento = d.id;

-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.

select a.nombre , cur.año_inicio ,cur.año_fin from persona p, alumno_se_matricula_asignatura al, asignatura a , curso_escolar cur 
where p.nif = '26902806m' and p.id = al.id_alumno and al.id_asignatura= cur.id and al.id_curso_escolar = cur.id;

-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).

select distinct d.nombre from departamento d , profesor pf, asignatura a,grado g where d.id= pf.id_departamento and pf.id_profesor = a.id_profesor and g.id = a.id_grado and g.nombre = 'Grado en Ingeniería Informática';

-- Retorna un llistat amb tots els/les alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.

select distinct p.id , p.nif, p.apellido1, p.apellido2 from persona p, alumno_se_matricula_asignatura al ,curso_escolar cur where p.tipo = 'alumno'
 and p.id= al.id_alumno and al.id_curso_escolar = cur.id and cur.id = 5;




-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.



/*Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des.
 El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat.
 El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a.
 El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/
select p.nombre , p.apellido1, p.apellido2 , d.nombre from persona p left join profesor pf on p.id = pf.id_profesor left join departamento d on pf.id_departamento = d.id 
where p.tipo ='profesor' order by d.nombre  ;


-- Retorna un llistat amb els professors/es que no estan associats a un departament.
select p.nombre, p.apellido1, p.apellido2 from persona p left join profesor pf on p.id = pf.id_profesor left join departamento d on pf.id_departamento = d.id 
where p.tipo = 'profesor' and pf.id_departamento = null;


-- Retorna un llistat amb els departaments que no tenen professors/es associats.
select p.nombre, p.apellido1, p.apellido2 from persona p right join profesor pf on p.id = pf.id_profesor right join departamento d on pf.id_departamento = d.id 
where p.tipo = 'profesor' and pf.id_departamento = null;


-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
select a.nombre, a.apellido1, a.apellido2, c.nombre
from persona a
left join profesor b 
on a.id = b.id_profesor
left join asignatura c 
on b.id_profesor = c.id_profesor
where a.tipo = 'profesor' and c.id_profesor = null;

-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
select a.nombre, a.apellido1, a.apellido2, c.nombre
from persona a
left join profesor b 
on a.id = b.id_profesor
right join asignatura c 
on b.id_profesor = c.id_profesor
where a.tipo = 'profesor' and c.id_profesor = null;

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
select c.nombre, a.nombre
from asignatura a
left join profesor b
on a.id_profesor = b.id_profesor
left join departamento c
on b.id_departamento = c.id
where a.curso = null;


-- Consultes resum:



-- Retorna el nombre total d'alumnes que hi ha.
SELECT * from persona where tipo = 'alumno';

-- Calcula quants/es alumnes van néixer en 1999.
select * from persona p  where p.tipo = 'alumno' and p.fecha_nacimiento between 1999-31-12 and 1999-01-01  ;

-- Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.


-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.


-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.


-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.


-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.


-- Retorna un llistat que mostri quants/es alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats/des.


-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.


-- Retorna totes les dades de l'alumne més jove.
SELECT * FROM persona WHERE persona.tipo ='alumno' and fecha_nacimiento = (SELECT MIN(fecha_nacimiento)from persona);

-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.