/*1. Se cometió un error en la carga de información de empleados y se desean borrar todos los
empleados que no tienen ningún contrato por favor generar la consulta.
*/
DELETE empleado,contrado FROM empleado
        LEFT JOIN
    contrato ON contato.codEmpleado = empleado.codEmpleado 
WHERE
    contrato.codContrato is null 

/*2. Se desea depurar la base de datos y se desea borrar la información que cumpla lo siguiente:
a. Productos: todos los productos que son del proveedor BAYER
b. Personas: todas las personas cuyo nombre sea JUAN PEREZ que tengan como
pariente a PEDRO PEREZ y que hayan tenido una cita en la fecha 28/03/2028
c. Todos los empleados cuyo salario sea menor a 5000
d. Borrar todos los productos de la tabla CODProducto que no se encuentren en el
almacen = ‘ALMACEN01’*/


delete producto 
from producto 
inner join proveedor prov on prov.codProveedor = pt.codProveedor
where upper(prov.nombre) = 'BAYER' ;
 
delete from paciente where paciente.codPaciente in (select pp.codPaciente from paciente_pariente pp 
inner join pariente par on par.codPariente = pp.codPaciente where par.nombrePaciente = 'PEDRO PERES'
 );
 
 delete from empleado where empleado.codEmpleado in (
 select ct.CodContrato from contrato ct where ct.salario < 5000
 );
 
 delete from producto where producto.codProducto 
 in (
 select pa.codProducto from productoAlmacen pa 
 inner join almacenNivel an on an.codAlmacenNivel pa.codAlmacenNivel 
 where an.nivel = 'ALMACEN01'
 )

    