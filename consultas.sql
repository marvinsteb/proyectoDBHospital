/*
1. Listado de todos los empleados ordenados descendentemente    
*/ 
select 
 empl.codEmpleado 
,empl.nomEmpleado
,empl.apellEmpleado
,empl.direccion
,empl.fechaNacimiento
,case empl.sexoEmpleado when 'H' then 'hombre'
						  when 'M' then 'mujer'
                          end as sexo
from empleado empl
order by 1 desc;

/*2. Listado de todos los pacientes ascendentemente*/

select
 paci.codPaciente
,paci.nombrePaciente
,paci.apellidoPaciente
from paciente paci
order by 1 desc;

/*
3. Generar un listado de pacientes ingresados. El listado deberá de identificar un rango de
fecha para poder generar un listado por mes y poder indicar cuantos pascientes ingresaron
por sexo. El resultado será de la siguiente forma
Mes Sexo
Cantidad
Enero – Hombres
– 10
Enero – Mujeres
- 15
Febrero – Hombres
– 20
Febrero– Mujeres
- 15
*/
select 
MONTH(ct.fechaHoraCita) as mes  
,case pc.sexoPaci when 'H' then 'Hombres' 
				  when 'M' then 'Mujeres'
                  end as sexo
,count(pc.codPaciente) as cantidad                  
from cita ct 
inner join paciente pc on ct.codPaciente = pc.codPaciente
where ct.fechaHoraCita between '01/01/2019' and '31/12/2019'
group by ct.fechaHoraCita, pc.sexoPaci
/*
4. Listado de todos los proveedores y los medicamentos que han despachado al hospital
verificar la relación que hay con proveedor y producto asociado a pedido)
*/

select 
 prov.idproveedor 
,prov.nombre
,ped.codPedido
,medic.codMedicamento
,medic.dosis
,medic.modoAdministracion
from producto prod
inner join proveedor prov on prod.codProveedor = prod.codProveedor
inner join medicamento medic on medic.codProducto = prod.codProducto
inner join pedido ped on ped.codPedido = prod.codPedido

/*
5. Listado de todas las camas y que paciente las ocupa durante el mes del 2019
*/

select 
 cm.codHabitacion
,hb.codHabitacion
,hb.bloque
,hb.descripcion 
,ct.fechaHoraCita
,pc.nombrePaciente
,pc.apellidoPaciente
,case pc.sexoPaci when 'H' then 'Hombre'
				  when 'M' then 'Mujer'
                  end as sexoPaciente

from cama cm 
inner join habitacion hb on cm.codHabitacion = hb.codDepartamento
inner join cita ct on ct.codHabitacion = hb.codHabitacion
inner join paciente pc on pc.codPaciente = ct.codPaciente
where year(ct.fechaHoraCita) = 2019

/*
6. Listado de todos los empleados y los pedidos realizados durante el año 2017
*/
select 
 pd.codPedido
,pd.cantidad
,pd.fecha
,emp.nomEmpleado
,emp.apellEmpleado
,emp.departamento 
from pedido pd 
inner join empleado emp on pd.codEmpleado = emp.codEmpleado
where year(pedido.fecha) = 2017
/*
7. Listar todos los pacientes que han realizado citas dentro de las habitaciones que se
encuentren dentro del bloque 5 con descripción ”ALA SUR”.*/

select 
pc.nombrePaciente
,pc.apellidoPaciente
,ct.fechaHoraCita
,hb.bloque
,hb.descripcion
from paciente pc
inner join cita ct on ct.codPaciente = pc.codPaciente
inner join habitacion hb on hb.codHabitacion = ct.codHabitacion
where hb.bloque = 5 
and upper(hb.descripcion) like "%ALA SUR%"

/*
8. Se tiene la clasificación de los productos que se encuentran almacenados en el almacén.
Cada nivel almacena un listado de productos. Genere la consulta siguiente:
a. Seleccionar todos los productos “ASPIRINAS” proporcionadas por la farmacéutica
BAYER que se encuentren en el nivel 2 del edificio central. Deberá de tomar en
consideración que se debe de sacar la valoración total del mismo por lo que se
deberá mostrar la cantidad unitaria y el precio (costo unitario)
*/

select
  prov.nombre as nombreProveedor
,pt.nombre as nombreProducto
,pt.descripcion as descripcionProducto
,an.nivel
,pa.cantidad as catidadProducto 
,pa.costoUnitario   
from producto pt
inner join productoAlmacen pa on pa.codProducto = pt.codProducto
inner join almacenNivel an on an.codAlmacenNivel = pa.codAlmacenNivel
inner join proveedor prov on prov.codProveedor = pt.codProveedor
where upper(pt.nombre) = 'ASPIRINAS'
and upper(prov.nombre) = 'BAYER'  
and an.nivel = 2

/*
9. Listado de todos los pacientes que tienen relación con un medico externo ordenados
ascendentemente por el apellido
*/

select 
 pc.nombrePaciente
,pc.apellidoPaciente
,me.codMedicoExterno
,me.nombreMedico
,me.apellidoMedico
from paciente pc 
inner join pacienteMedicoExterno pme on pme.codPaciente = pc.codPaciente
inner join medicoExterno me on me.codMedicoExterno = pme.codMedicoExterno
order by 2 asc 

/*
10. Cual es el promedio de pacientes Hombres y Mujeres que hayan sido ingresados en el mes
de diciembre y que se les haya medicado PENICILINA
*/

select
 case pc.sexoPaci when 'H' then 'Hombre'
				  when 'M' then 'Mujer' 
                  end
                  as sexoPaciente
,avg(pc.codPaciente) promedio 
from paciente pc 
inner join cita ct on pc.codPaciente = ct.codPaciente
inner join medicacion mdn on mdn.codPaciente = pc.codPaciente
inner join producto pt on pt.codProducto = mdn.codProducto
where upper(pt.nombre) = 'PENICILINA'
and ct.fechaHoraCita between '01/12/2018' and '31/12/2018'
group by pc.sexoPaci

/*
11. Se requiere realizar una depuración de la información del almacén por lo que se requiere la
siguiente información:
a. Seleccionar el inventario de todos los productos y proveedores que no han tenido
movimiento (ningún pedido) en donde se identifique el lugar donde se encuentra
almacenado el producto para poder generar la devolución de los productos.
*/

select
  prov.nombre as nombreProveedor
,pt.nombre as nombreProducto
,pt.descripcion as descripcionProducto
,an.nivel as nivelAlmacen
,pa.cantidad as catidadProducto 
,pa.costoUnitario   
from producto pt
inner join productoAlmacen pa on pa.codProducto = pt.codProducto
inner join almacenNivel an on an.codAlmacenNivel = pa.codAlmacenNivel
inner join proveedor prov on prov.codProveedor = pt.codProveedor
left join medicamento mdct on pt.codProducto = mdct.codProducto 
where mdct.codProducto is null 


/*
12. Control de empleados
a. Listar los empleados con todos los contratos vigentes que ha tenido indicando la
información general de Escala Salarial y las fechas del mismo. Se deberá de
complementar con información del turno
*/

select 
 empl.nomEmpleado
,empl.apellEmpleado
,ctr.salario
,ctr.fechaIni
,ctr.fechaFinal
,tr.HoraEntrada
,tr.horaSalida
from empleado empl 
inner join contrato ctr on ctr.codEmpleado = empl.codEmpleado
inner join Horario tr on tr.codTurno = empl.codTurno
where ctr.fechaFinal >= curdate();
/*b. Listar los empleados indicando la experiencia que tiene cada uno*/

select 
 empl.nomEmpleado
,empl.apellEmpleado
,exp.posicion
,exp.fechaIni
,exp.fechaFinal
,exp.nombreInst
from empleado empl 
inner join experiencia exp on exp.codExperiencia = empl.codExperiencia

/*
13. Control de citas
a. Listar todas las citas que se tienen programadas para el mes de enero del 2019
indicando el paciente a recibir
*/
select
 paci.codPaciente
,paci.nombrePaciente
,paci.apellidoPaciente
,ct.fechaHoraCita
from cita ct 
inner join paciente pc on ct.codPaciente = pc.codPaciente
where ct.fechaHoraCita between '01/01/2019' and '31/01/2019'
/*
14. Se desea saber la siguiente información:
a. Por paciente generar la siguiente Consulta: Listar todas las citas del señor “CARLOS
PEREZ” y complementar si a el señor se le brindo medicamentos. Para
complementar la información la consulta deberá de indicar en que almacen deberá
de ir a traer el medicamento para el señor PEREZ quien tuvo una CITA 28516*/



select
 pc.nombrePaciente
,pc.apellidoPaciente
,ct.fechaHoraCita
,ct.fechaEspSalida
,pt.nombre
,pt.descripcion
,mdn.unidadesDiarias
,mdn.fechaInicio
,mdn.fechaFinal
,''
from paciente pc 
inner join cita ct on pc.codPaciente = ct.codPaciente
inner join medicacion mdn on mdn.codPaciente = pc.codPaciente
inner join producto pt on pt.codProducto = mdn.codProducto
where pc.nombrePaciente = 'CARLOS PEREZ'
union all 

select
 pc.nombrePaciente
,pc.apellidoPaciente
,ct.fechaHoraCita
,ct.fechaEspSalida
,pt.nombre
,pt.descripcion
,mdn.unidadesDiarias
,mdn.fechaInicio
,mdn.fechaFinal
,an.nivel
from paciente pc 
inner join cita ct on pc.codPaciente = ct.codPaciente
inner join medicacion mdn on mdn.codPaciente = pc.codPaciente
inner join producto pt on pt.codProducto = mdn.codProducto
inner join productoAlmacen pa on pt.codProducto = pa.codProducto
inner join almacenNivel an on an.codAlmacenNivel = pa.codAlmacenNivel
where ct.codCita = 28516

/*
15. Genere una consulta con la siguiente información:
a. Seleccione el listado de todos los empleados donde se visualice la información
general y se pueda visualizar el cálculo de los años de la persona.
Código empleado, Nombre Completo, Dirección, Fecha de Cumpleaños y años
cumplidos*/

select
codEmpleado
,concat(nomEmpleado, ' ', apellEmpleado) as nombreCompleto 
,direccion
,fechaNacimiento
,timestampdiff(year,fechaNacimiento,curdate()) as aniosCumplidos 
from empleado

/*
16. PACIENTES:
a. Seleccione un listado de pacientes los cuales han asistido más de 10 citas en el año.
Para esto es importante saber si se le brindo una habitación y medicamento por
cada cita (utilizar sub consultas)
*/
select 
 pc.nombrePaciente
,pc.apellidoPaciente
,count(ct.codCita) as noCitas
from cita ct 
inner join paciente pc on ct.codPaciente = pc.codPaciente
where ct.fechaHoraCita between '01/01/2019' and '31/12/2019'
group by pc.nombrePaciente, pc.apellidoPaciente 
having count(ct.codCita) > 9 
/*
b. Listado de todos los medicamentos entrados al señor JUAN PEREZ en el año 2019
*/
select
 pc.nombrePaciente
,pc.apellidoPaciente
,pt.nombre as nombreMedicamento 
,pt.descripcion as descripcionMedicamento
,mdn.unidadesDiarias
,mdn.fechaInicio
,mdn.fechaFinal
from paciente pc 
inner join cita ct on pc.codPaciente = ct.codPaciente
inner join medicacion mdn on mdn.codPaciente = pc.codPaciente
inner join producto pt on pt.codProducto = mdn.codProducto
where pc.nombrePaciente = 'JUAN PERES'
and year(ct.fechaHoraCita) = 2019

/*c. Listado por paciente y de los parientes que tiene*/

select
 pc.nombrePaciente
,pc.apellidoPaciente
,par.nomPar as nombrePariente
,par.apelPar as apellidoPariente
from paciente pc 
inner join paciente_pariente pp on pp.codPaciente = pc.codPaciente
inner join pariente par on par.codPariente = pp.codPariente

/*
17. Seleccionar los medicamentos que fueron más distribuidos por proveedor. Este listado
deberá de identificar por Tipo de Producto y mostrar la cantidad distribuida en orden de
ascendente (los más distribuidos a los menos)

*/

select 
 prov.idproveedor 
,prov.nombre as nombreProveedor
,prod.nombre as nombreProducto
,sum(ped.cantidad)
from producto prod
inner join proveedor prov on prod.codProveedor = prod.codProveedor
inner join pedido ped on ped.codPedido = prod.codPedido
group by prov.idproveedor ,prov.nombre ,prod.nombre 
order by 4 desc 



/*18. Se requiere saber si el señor JUAN PEREZ ha tenido más de 10 citas en las cuales no se les
haya dado medicamento.*/

select
 pc.nombrePaciente
,pc.apellidoPaciente
,pt.nombre as nombreMedicamento 
,pt.descripcion as descripcionMedicamento
,mdn.unidadesDiarias
,mdn.fechaInicio
,mdn.fechaFinal
from paciente pc 
inner join cita ct on pc.codPaciente = ct.codPaciente
left join medicacion mdn on mdn.codPaciente = pc.codPaciente
inner join producto pt on pt.codProducto = mdn.codProducto
where mdn.codMedicacion is null 
/*

a. Si el señor Gabriel Garcia se encuentra en una CITA dentro del hospital y es
necesario saber en qué habitación se encuentra identificando la cama, así como si
se le ha dado medicamento (identificar qué tipo de medicamento y la cantidad para
poder realizar cálculos de cobro) */


select 
 pc.nombrePaciente
,pc.apellidoPaciente
,ct.fechaHoraCita
,hb.codHabitacion
,hb.descripcion 
,hb.bloque
,cm.codcama
,tp.tipo
,mdn.unidadesDiarias
,pa.costoUnitario
from cama cm 
inner join habitacion hb on cm.codHabitacion = hb.codDepartamento
inner join cita ct on ct.codHabitacion = hb.codHabitacion
inner join paciente pc on pc.codPaciente = ct.codPaciente
inner join medicacion mdn on mdn.codPaciente = pc.codPaciente
inner join producto pt on pt.codProducto = mdn.codProducto
inner join tipoProducto tp on tp.codTipoProducto = pt.codTipoProducto
inner join productoAlmacen pa on pa.codProducto = pt.codProveedor
where pc.nombrePaciente = 'GABRIEL GARCIA'


/*
Se desea saber cuáles son las camas que se requieren cambiar por lo que se requiere un
listado por habitación que cumpla lo siguiente:
a. Cuáles son las habitaciones y camas que han recibido más de 2000 citas en un año.
*/

select 
  hb.codHabitacion
 ,hb.bloque
 ,hb.descripcion
 ,cm.codcama
 ,count(cm.codcama)
from cama cm 
inner join habitacion hb on cm.codHabitacion = hb.codDepartamento
inner join cita ct on ct.codHabitacion = hb.codHabitacion
inner join paciente pc on pc.codPaciente = ct.codPaciente
where year(ct.fechaHoraCita) = 2019
group by hb.codHabitacion ,hb.bloque  ,hb.descripcion ,cm.codcama
having count(cm.codcama) > 2000 
/*
b. Listado de las habitaciones y camas que han recibido mas de 2000 citas en el año y
que no tienen paciente asignado para el 23 de septiembre del 2019
*/
select 
  hb.codHabitacion
 ,hb.bloque
 ,hb.descripcion
 ,cm.codcama
 ,count(cm.codcama)
from cama cm 
inner join habitacion hb on cm.codHabitacion = hb.codDepartamento
inner join cita ct on ct.codHabitacion = hb.codHabitacion
inner join paciente pc on pc.codPaciente = ct.codPaciente
where year(ct.fechaHoraCita) = 2019
and ct.fechaHoraCita <> '23/09/2019'
group by hb.codHabitacion ,hb.bloque  ,hb.descripcion ,cm.codcama
having count(cm.codcama) > 2000 

/*
21. El PADRE: JESUS ALEJANDRO LOPEZ VILLATORO quien tiene a su hijo ALEJANDRO LOPEZ
GARCIA internado en el hospital desea saber si le medicaron una dosis de PENICILINA a su
hijo. Realice la consulta para verificar dicha información*/


select
 pc.nombrePaciente
,pc.apellidoPaciente
,par.nomPar as nombrePariente
,par.apelPar as apellidoPariente
,pt.nombre
,mdn.unidadesDiarias
from paciente pc 
inner join paciente_pariente pp on pp.codPaciente = pc.codPaciente
inner join pariente par on par.codPariente = pp.codPariente
inner join medicacion mdn on mdn.codPaciente = pc.codPaciente
inner join producto pt on pt.codProducto = mdn.codProducto
where par.nomPar = 'JESUS ALEJANDRO'
and par.apelPar = 'LOPEZ VILLATORO'
and pt.nombre = 'PENICILINA'

/*22. Necesito el listado de todos los proveedores y el tipo de medicina que despachan
*/
select
  prov.nombre as nombreProveedor
,pt.nombre as nombreProducto
,pt.descripcion as descripcionProducto
from producto pt
inner join proveedor prov on prov.codProveedor = pt.codProveedor

/*
23. Genere una consulta de la tabla de empleados que indique la fecha de nacimiento con el
mes en letras.
Ejemplo:
COD NOMBRE DIA MES AÑO EDAD
2501 JUAN PEREZ 25 Enero 2017 35 años
*/

select
codEmpleado
,concat(nomEmpleado, ' ', apellEmpleado) as nombre
,day(fechaNacimiento) dia 
,case month(fechaNacimiento) when 1 then 'enero'
							 when 2 then 'febrero'
                             when 3 then 'marzo'
                             when 4 then 'abril'
                             when 5 then 'mayo'
                             when 6 then 'junio'
                             when 7 then 'julio'
                             when 8 then 'agosto'
                             when 9 then 'septiembre'
                             when 10 then 'octubre'
                             when 12 then 'noviembre'
                             when 12 then 'diciembre'
                             end as mes
,year(fechaNacimiento) as anio
,timestampdiff(year,fechaNacimiento,curdate()) as edad 
from empleado