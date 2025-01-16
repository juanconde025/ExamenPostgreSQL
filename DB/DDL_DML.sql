CREATE TABLE public.vehiculos (
	id int4 NOT NULL,
	marca varchar NULL,
	modelo varchar NULL,
	anio int4 NULL,
	precio int4 NULL,
	estado varchar NULL,
	CONSTRAINT id_vehiculo PRIMARY KEY (id)
);

CREATE TABLE public.clientes (
	id int4 NOT NULL,
	nombre varchar NULL,
	apellido varchar NULL,
	CONSTRAINT id_clientes PRIMARY KEY (id)
);

CREATE TABLE public.ventas (
	id int4 NOT NULL,
	fecha date NULL,
	total int4 NULL,
	ventas_vehiculos int4 NULL,
	ventas_clientes int4 NULL,
	CONSTRAINT id_ventas PRIMARY KEY (id),
	CONSTRAINT ventas_clientes_fk FOREIGN KEY (id) REFERENCES public.clientes(id),
	CONSTRAINT ventas_vehiculos_fk FOREIGN KEY (id) REFERENCES public.vehiculos(id)
);

CREATE TABLE public.proveedores_piezas (
	id int4 NOT NULL,
	nombre varchar NULL,
	pieza varchar NULL,
	precio varchar NULL,
	CONSTRAINT id_proveedores PRIMARY KEY (id)
);

CREATE TABLE public.clientes_potenciales (
	id int4 NOT NULL,
	nombre varchar NULL,
	apellido varchar NULL,
	fecha_interes date NULL,
	id_vehiculo int4 NULL,
	CONSTRAINT id_clientes_potenciales PRIMARY KEY (id),
	CONSTRAINT clientes_potenciales_vehiculos_fk FOREIGN KEY (id) REFERENCES public.vehiculos(id)
);

CREATE TABLE public.empleados (
	id int4 NOT NULL,
	nombre varchar NULL,
	apellido varchar NULL,
	rol varchar NULL,
	fecha_contratacion date NULL,
	CONSTRAINT id_empleados PRIMARY KEY (id)
);

CREATE TABLE public.historial_servicios (
	id int4 NOT NULL,
	servicio varchar NULL,
	descripcion varchar NULL,
	fecha date NULL,
	id_vehiculos int4 NULL,
	id_empleados int4 NULL,
	CONSTRAINT id_historial_servicios PRIMARY KEY (id),
	CONSTRAINT historial_servicios_empleados_fk FOREIGN KEY (id) REFERENCES public.empleados(id),
	CONSTRAINT historial_servicios_vehiculos_fk FOREIGN KEY (id) REFERENCES public.vehiculos(id)
);

CREATE TABLE public.piezas_servicios (
	id int4 NOT NULL,
	id_historial_servicios int4 NULL,
	id_proveedor int NULL,
	CONSTRAINT id_piezas_servicios PRIMARY KEY (id),
	CONSTRAINT piezas_servicios_historial_servicios_fk FOREIGN KEY (id) REFERENCES public.historial_servicios(id),
	CONSTRAINT piezas_servicios_proveedores_piezas_fk FOREIGN KEY (id) REFERENCES public.proveedores_piezas(id)
);

CREATE TABLE public.departamento_ventas (
	id int4 NOT NULL,
	comisiones int4 NULL,
	rendimiento varchar NULL,
	ventas_totales int4 NULL,
	id_empleados int4 NULL,
	id_ventas int4 NULL,
	CONSTRAINT id_departamento_ventas PRIMARY KEY (id),
	CONSTRAINT departamento_ventas_empleados_fk FOREIGN KEY (id) REFERENCES public.empleados(id),
	CONSTRAINT departamento_ventas_ventas_fk FOREIGN KEY (id) REFERENCES public.ventas(id)
);

CREATE TABLE public.horarios (
	id int4 NOT NULL,
	hora_inicio time NULL,
	hora_fin time NULL,
	CONSTRAINT id_horarios PRIMARY KEY (id)
);

CREATE TABLE public.departamento_servicios (
	id int4 NOT NULL,
	servicio varchar NULL,
	id_empleados int4 NULL,
	id_historial_servicios int4 NULL,
	id_horarios int4 NULL,
	CONSTRAINT id_departamento_servicios PRIMARY KEY (id),
	CONSTRAINT departamento_servicios_empleados_fk FOREIGN KEY (id) REFERENCES public.empleados(id),
	CONSTRAINT departamento_servicios_historial_servicios_fk FOREIGN KEY (id) REFERENCES public.historial_servicios(id),
	CONSTRAINT departamento_servicios_horarios_fk FOREIGN KEY (id) REFERENCES public.horarios(id)
);


INSERT INTO public.vehiculos
(id, marca, modelo, anio, precio, estado)
VALUES(1, 'volvo', 'ultimo', 2024, 30000, 'nuevo');
INSERT INTO public.vehiculos
(id, marca, modelo, anio, precio, estado)
VALUES(2, 'chevrolet', 'ultimo', 2022, 25000, 'nuevo');
INSERT INTO public.vehiculos
(id, marca, modelo, anio, precio, estado)
VALUES(3, 'toyota', 'ultimo', 2020, 27000, 'nuevo');
INSERT INTO public.vehiculos
(id, marca, modelo, anio, precio, estado)
VALUES(4, 'hyundai', 'antiguo', 2012, 17000, 'usado');
INSERT INTO public.vehiculos
(id, marca, modelo, anio, precio, estado)
VALUES(5, 'mazda', 'antiguo', 2004, 7000, 'usado');

INSERT INTO public.clientes
(id, nombre, apellido)
VALUES(1, 'juan', 'jimenez');
INSERT INTO public.clientes
(id, nombre, apellido)
VALUES(2, 'andres', 'gonzales');
INSERT INTO public.clientes
(id, nombre, apellido)
VALUES(3, 'felipe', 'pinzon');
INSERT INTO public.clientes
(id, nombre, apellido)
VALUES(4, 'carlos', 'pinilla');
INSERT INTO public.clientes
(id, nombre, apellido)
VALUES(5, 'pedro', 'rodriguez');

INSERT INTO public.ventas
(id, fecha, total, ventas_vehiculos, ventas_clientes)
VALUES(1, '2024-01-01', 30000, 1, 1);
INSERT INTO public.ventas
(id, fecha, total, ventas_vehiculos, ventas_clientes)
VALUES(2, '2024-01-02', 25000, 2, 2);
INSERT INTO public.ventas
(id, fecha, total, ventas_vehiculos, ventas_clientes)
VALUES(3, '2024-01-03', 27000, 3, 3);
INSERT INTO public.ventas
(id, fecha, total, ventas_vehiculos, ventas_clientes)
VALUES(4, '2024-01-04', 17000, 4, 4);
INSERT INTO public.ventas
(id, fecha, total, ventas_vehiculos, ventas_clientes)
VALUES(5, '2024-01-05', 7000, 5, 5);

INSERT INTO public.clientes_potenciales
(id, nombre, apellido, fecha_interes, id_vehiculo)
VALUES(1, 'pablo', 'cortes', '2023-01-01', 1);
INSERT INTO public.clientes_potenciales
(id, nombre, apellido, fecha_interes, id_vehiculo)
VALUES(2, 'ximena', 'martinez', '2023-01-02', 2);
INSERT INTO public.clientes_potenciales
(id, nombre, apellido, fecha_interes, id_vehiculo)
VALUES(3, 'santiago', 'hernandez', '2023-01-03', 3);
INSERT INTO public.clientes_potenciales
(id, nombre, apellido, fecha_interes, id_vehiculo)
VALUES(4, 'raul', 'soto', '2023-01-04', 4);
INSERT INTO public.clientes_potenciales
(id, nombre, apellido, fecha_interes, id_vehiculo)
VALUES(5, 'valeria', 'villamizar', '2023-01-05', 5);

INSERT INTO public.empleados
(id, nombre, apellido, rol, fecha_contratacion)
VALUES(1, 'pepe', 'perejil', 'cambiador', '2023-01-01');
INSERT INTO public.empleados
(id, nombre, apellido, rol, fecha_contratacion)
VALUES(2, 'jorge', 'ruiz', 'pulidor', '2023-01-01');
INSERT INTO public.empleados
(id, nombre, apellido, rol, fecha_contratacion)
VALUES(3, 'lennyn', 'lopez', 'cepilldor', '2023-01-01');
INSERT INTO public.empleados
(id, nombre, apellido, rol, fecha_contratacion)
VALUES(4, 'kevin', 'ramos', 'reparador', '2023-01-01');
INSERT INTO public.empleados
(id, nombre, apellido, rol, fecha_contratacion)
VALUES(5, 'campos', 'rodriguez', 'limpiador', '2023-01-01');


INSERT INTO public.historial_servicios
(id, servicio, descripcion, fecha, id_vehiculos, id_empleados)
VALUES(1, 'limpieza', 'se hace limpieaz', '2024-01-01', 1, 1);
INSERT INTO public.historial_servicios
(id, servicio, descripcion, fecha, id_vehiculos, id_empleados)
VALUES(2, 'reparacion', 'se hace reparacion', '2024-01-02', 2, 2);
INSERT INTO public.historial_servicios
(id, servicio, descripcion, fecha, id_vehiculos, id_empleados)
VALUES(3, 'cambio', 'se hace un cambio', '2024-01-03', 3, 3);
INSERT INTO public.historial_servicios
(id, servicio, descripcion, fecha, id_vehiculos, id_empleados)
VALUES(4, 'pulir', 'se pule ', '2024-01-04', 4, 4);
INSERT INTO public.historial_servicios
(id, servicio, descripcion, fecha, id_vehiculos, id_empleados)
VALUES(5, 'cepillar', 'se cepilla', '2024-01-05', 5, 5);

INSERT INTO public.proveedores_piezas
(id, nombre, pieza, precio)
VALUES(1, 'pabolo', 'ventana', '1000');
INSERT INTO public.proveedores_piezas
(id, nombre, pieza, precio)
VALUES(2, 'pedro', 'defensa', '2000');
INSERT INTO public.proveedores_piezas
(id, nombre, pieza, precio)
VALUES(3, 'remon', 'parabrisa', '1000');
INSERT INTO public.proveedores_piezas
(id, nombre, pieza, precio)
VALUES(4, 'sergio', 'espejo', '500');
INSERT INTO public.proveedores_piezas
(id, nombre, pieza, precio)
VALUES(5, 'gabriel', 'asiento', '2000');

INSERT INTO public.piezas_servicios
(id, id_historial_servicios, id_proveedor)
VALUES(1, 1, '1');
INSERT INTO public.piezas_servicios
(id, id_historial_servicios, id_proveedor)
VALUES(2, 2, '2');
INSERT INTO public.piezas_servicios
(id, id_historial_servicios, id_proveedor)
VALUES(3, 3, '3');
INSERT INTO public.piezas_servicios
(id, id_historial_servicios, id_proveedor)
VALUES(4, 4, '4');
INSERT INTO public.piezas_servicios
(id, id_historial_servicios, id_proveedor)
VALUES(5, 5, '5');

INSERT INTO public.departamento_ventas
(id, comisiones, rendimiento, ventas_totales, id_empleados, id_ventas)
VALUES(1, 200, 'bueno', 1, 5, 5);
INSERT INTO public.departamento_ventas
(id, comisiones, rendimiento, ventas_totales, id_empleados, id_ventas)
VALUES(2, 300, 'bueno', 1, 4, 4);
INSERT INTO public.departamento_ventas
(id, comisiones, rendimiento, ventas_totales, id_empleados, id_ventas)
VALUES(3, 400, 'bueno', 1, 3, 3);
INSERT INTO public.departamento_ventas
(id, comisiones, rendimiento, ventas_totales, id_empleados, id_ventas)
VALUES(4, 500, 'bueno', 1, 2, 2);
INSERT INTO public.departamento_ventas
(id, comisiones, rendimiento, ventas_totales, id_empleados, id_ventas)
VALUES(5, 600, 'bueno', 1, 1, 1);

INSERT INTO public.horarios
(id, hora_inicio, hora_fin)
VALUES(1, '00:00:00', '01:00:00');
INSERT INTO public.horarios
(id, hora_inicio, hora_fin)
VALUES(2, '01:00:00', '02:00:00');
INSERT INTO public.horarios
(id, hora_inicio, hora_fin)
VALUES(3, '02:00:00', '03:00:00');
INSERT INTO public.horarios
(id, hora_inicio, hora_fin)
VALUES(4, '03:00:00', '04:00:00');
INSERT INTO public.horarios
(id, hora_inicio, hora_fin)
VALUES(5, '04:00:00', '05:00:00');

INSERT INTO public.departamento_servicios
(id, servicio, id_empleados, id_historial_servicios, id_horarios)
VALUES(1, 'limpieza', 5, 5, 1);
INSERT INTO public.departamento_servicios
(id, servicio, id_empleados, id_historial_servicios, id_horarios)
VALUES(2, 'reparacion', 4, 4, 2);
INSERT INTO public.departamento_servicios
(id, servicio, id_empleados, id_historial_servicios, id_horarios)
VALUES(3, 'cambio', 3, 3, 3);
INSERT INTO public.departamento_servicios
(id, servicio, id_empleados, id_historial_servicios, id_horarios)
VALUES(4, 'pulir', 2, 2, 4);
INSERT INTO public.departamento_servicios
(id, servicio, id_empleados, id_historial_servicios, id_horarios)
VALUES(5, 'cepillar', 1, 1, 5);


