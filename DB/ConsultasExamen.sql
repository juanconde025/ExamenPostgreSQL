-- Consultas

-- 1. Listar Vehículos Disponibles: Obtener una lista de todos los vehículos disponibles 
-- para la venta, incluyendo detalles como marca, modelo, y precio.

select *
from vehiculos v 


-- 2. Clientes con Compras Recientes: Mostrar los clientes que han realizado compras 
-- recientemente, junto con la información de los vehículos adquiridos.

select c.id as id_cliente, c.nombre, c.apellido, v2.marca as vehiculo,  v.total, v.fecha as fecha_compra 
from clientes c 
inner join ventas v 
on v.ventas_clientes = c.id 
inner join vehiculos v2 
on v2.id = v.ventas_vehiculos 
where v.fecha > '2024-01-03';


-- 3. Historial de Servicios por Vehículo: Obtener el historial completo de servicios 
-- realizados para un vehículo específico, incluyendo detalles sobre los empleados involucrados y 
-- las fechas de servicio.

select hs.servicio, hs.descripcion, v.marca as vehiculo, v.estado, e.nombre as nombre_empleado, e.apellido as apellido_empleado, e.rol as rol_empleado, hs.fecha 
from historial_servicios hs 
inner join vehiculos v 
on v.id = id_vehiculos 
inner join empleados e 
on e.id = hs.id_empleados;


-- 4. Proveedores de Piezas Utilizados: Listar los proveedores de piezas que han suministrado 
-- componentes utilizados en los servicios de mantenimiento.

select pp.nombre as proveedor, pp.pieza, hs.servicio, e.nombre as empleado_encargado
from piezas_servicios ps 
inner join proveedores_piezas pp 
on pp.id = ps.id_proveedor 
inner join historial_servicios hs 
on hs.id = ps.id_historial_servicios
inner join empleados e 
on e.id = hs.id_empleados; 


-- 5. Rendimiento del Personal de Ventas: Calcular las comisiones generadas por 
-- cada empleado del departamento de ventas en un período específico.

select sum(dv.comisiones) as comisiones_totales, dv.rendimiento, e.nombre as empleado
from departamento_ventas dv 
inner join empleados e 
on e.id = dv.id_empleados 
group by e.nombre, dv.rendimiento;


-- 6. Servicios Realizados por un Empleado: Identificar todos los servicios de 
-- mantenimiento realizados por un empleado específico, incluyendo detalles sobre los vehículos atendidos.

select hs.servicio, hs.descripcion, e.nombre as empleado, v.marca as vehiculo, v.estado 
from historial_servicios hs 
inner join empleados e 
on e.id = hs.id_empleados 
inner join vehiculos v 
on v.id = hs.id_vehiculos 
group by e.nombre, hs.servicio, hs.descripcion, v.marca, v.estado;


-- 7. Clientes Potenciales y Vehículos de Interés: Mostrar información sobre los clientes potenciales y los vehículos 
-- de su interés, proporcionando pistas valiosas para estrategias de marketing.

select concat(cp.nombre,cp.apellido) as nombre_apellido_cliente_potencial, v.marca as vehiculo_interes, v.anio as anio_vehiculo, cp.fecha_interes as ultima_fecha_interes 
from clientes_potenciales cp 
inner join vehiculos v 
on v.id = cp.id_vehiculo; 


-- 8. Empleados del Departamento de Servicio: Listar todos los empleados 
-- que pertenecen al departamento de servicio, junto con sus horarios de trabajo.

select e.nombre as nombre_empleado, e.apellido as apellido_empleado, h.hora_inicio as hora_inicio_trabajo, h.hora_fin as hora_fin_trabajo 
from departamento_servicios ds 
inner join empleados e 
on e.id = ds.id_empleados 
inner join horarios h 
on h.id = ds.id_horarios; 


-- 9. Vehículos Vendidos en un Rango de Precios: Encontrar los vehículos vendidos en un rango 
-- de precios específico, proporcionando datos útiles para análisis de ventas.

select v2.marca, v2.modelo, v2.anio, v2.estado, v.total as precio_rango
from ventas v 
inner join vehiculos v2 
on v2.id = v.ventas_vehiculos 
where v.total between 20000 and 50000;


-- 10. Clientes con Múltiples Compras: Identificar a aquellos clientes que han 
-- realizado más de una compra en el concesionario, destacando la lealtad del cliente.

select c.nombre as nombre_cliente_leal, c.apellido as apellido_cliente_leal, count(v.ventas_clientes) as numero_compras
from ventas v 
inner join clientes c 
on c.id = v.ventas_clientes 
group by c.nombre, c.apellido 
having count(v.ventas_clientes) > 1; 









