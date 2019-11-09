/*
ACTUALIZACIONES:
Se requiere por tema de sacar todos los productos de circulación vencidos del hospital es necesario
darle de baja a todos los productos por lo que se requiere la siguiente consulta:
1. Agregarle a la descripción de los productos “NO DESPACHAR” como media alertiva los que
cumplan la siguiente condición:
a. Todos los productos almacenados que sean del tipo “ASPIRINAS” (utilizar LIKE) que
se encuentren dentro del almacén con codificación = 2501
*/

update producto pt
inner join productoAlmacen pa on pa.codProducto = pt.codProducto
inner join almacenNivel an on an.codAlmacenNivel = pa.codAlmacenNivel
set  
pt.descripcion	= 'NO DESPACHAR'
where an.codAlmacenNivel = 2501
and upper(pt.nombre) like '%ASPIRINAS%'

/*
2. La base de datos de parientes hay que modificar los nombres en el sentido de que cuando
se registró la información se permitió al usuario ingresar Mayúsculas y Minúsculas por lo
que se requiere que realice una consulta de actualización donde se pueda actualizar los
nombres de pacientes y de parientes donde aparezcan minúsculas las convierta en
mayúsculas. Ejemplo:
a. Pedro Lopez  PEDRO LOPEZ

*/
UPDATE paciente SET nombrePaciente=UPPER(nombrePaciente), apellidoPaciente=UPPER(apellidoPaciente)

/*3. Actualización de información:
a. Agregar el ampo ESTADO a la tabla empleado
b. Agregar el campo EDAD a la tabla empleado
Genere la consulta de que a todos los empleados se le ponga estado de BAJA para los que
no tengan contrato vigente a la fecha de finalización del año 2017
Al campo edad actualice en base a la fecha de nacimiento calcule la edad de la persona.*/

ALTER TABLE `dbHospital`.`empleado` 
ADD COLUMN `estado` VARCHAR(5) NOT NULL AFTER `codTelf`;

ALTER TABLE `dbHospital`.`empleado` 
ADD COLUMN `edad` INT NULL AFTER `estado`;

update empleados empl 
inner join contrato ct on ct.codEmpleado = empl.codContrato
set empl.estado = 'baja' 
where year(ct.fechaFinal) = 2017



update empleado set edad = timestampdiff(year,fechaNacimiento,curdate())  