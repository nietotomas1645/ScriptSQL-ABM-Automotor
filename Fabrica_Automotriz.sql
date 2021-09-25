CREATE DATABASE FABRICA_AUTOMOTRIZ
GO

USE FABRICA_AUTOMOTRIZ
GO

CREATE TABLE AutoPlan (
    id_autoplan  int identity (1,1)  NOT NULL,
    cant_cuotas int  NOT NULL,
    Importe_Cuota money NULL,
    interes decimal (4,3)  NOT NULL,
    fecha datetime  NOT NULL,
    CONSTRAINT AutoPlan_pk PRIMARY KEY  (id_autoplan)
	)

INSERT INTO AutoPlan (cant_cuotas,importe_cuota , interes , fecha)
VALUES (48 , 1500 ,9.8, '12/2/2018')

select*
from AutoPlan

CREATE TABLE Autopartes (
    id_Autoparte  int identity (1,1) NOT NULL,
    nombre varchar (50)  NOT NULL,
    tipoA varchar (80)  NOT NULL,
    precio money  NOT NULL,
    stock_minimo int  NOT NULL,
    stock_actual int  NOT NULL,
    CONSTRAINT Autopartes_pk PRIMARY KEY  (id_Autoparte)
	)
INSERT INTO autopartes(nombre , tipoA ,precio,stock_minimo,stock_actual)
VALUES('capot' ,'oem',2000,200 , 400  )
INSERT INTO autopartes(nombre , tipoA ,precio,stock_minimo,stock_actual)
VALUES('puerta' ,'certificado',3500,250, 450  )

select*
from Autopartes

CREATE TABLE Formas_Pago (
    id_forma_pago int identity (1,1) NOT NULL,
    forma_pago varchar (80) NOT NULL,
    CONSTRAINT Formas_Pago_pk PRIMARY KEY  (id_forma_pago)
	)

INSERT INTO formas_pago(forma_pago)
VALUES('efectivo')
INSERT INTO formas_pago(forma_pago)
VALUES('t_credito')
INSERT INTO formas_pago(forma_pago)
VALUES('cta.cte')
INSERT INTO formas_pago(forma_pago)
VALUES('cheque')

select*
from Formas_Pago



CREATE TABLE Tipos_Clientes(
    id_tipo_cliente int identity (1,1) NOT NULL,
    tipo_cliente varchar (50) NOT NULL,
    CONSTRAINT Tipos_Clientes_pk PRIMARY KEY  (id_tipo_cliente)
)
INSERT INTO Tipos_Clientes(tipo_cliente)
VALUES('autopartista')
INSERT INTO tipos_clientes(tipo_cliente)
VALUES('consu final')
INSERT INTO tipos_clientes(tipo_cliente)
VALUES('empresa')
INSERT INTO tipos_clientes(tipo_cliente)
VALUES('concesionario')

select*
from Tipos_Clientes

CREATE TABLE Provincias (
    Id_provincia int identity (1,1) NOT NULL,
    provincia varchar(80)  NOT NULL,
    CONSTRAINT Provincias_pk PRIMARY KEY  (Id_provincia)
)
INSERT INTO provincias (provincia)
VALUES('cordoba')
INSERT INTO provincias (provincia)
VALUES('santa fe')

select*
from Provincias

CREATE TABLE Vehiculos_Terminados (
    id_vehiculo int identity (1,1) NOT NULL,
    nombre varchar (50) NOT NULL,
    color varchar (50) NOT NULL,
    tipoV varchar (50) NOT NULL,
    precio money  NOT NULL,
    CONSTRAINT Vehiculos_Terminados_pk PRIMARY KEY  (id_vehiculo)
)
INSERT INTO vehiculos_terminados (nombre , color , tipoV , precio)
VALUES('neon' , 'blanco' , 'sedan' , 1000000)
INSERT INTO vehiculos_terminados (nombre , color , tipoV , precio)
VALUES('cubo' , 'rojo','utilitario' , 1500000)
INSERT INTO vehiculos_terminados (nombre , color , tipoV , precio)
VALUES('terra' , 'gris','pick up',2000000)

select*
from Vehiculos_Terminados

CREATE TABLE Localidades (
    Id_localidad int identity (1,1) NOT NULL,
    localidad varchar(80)  NOT NULL,
    Id_Provincia int  NOT NULL,
    CONSTRAINT Localidades_pk PRIMARY KEY  (Id_localidad),
	CONSTRAINT Localidades_provincias_fk FOREIGN KEY (Id_Provincia) references provincias (id_provincia)
)
INSERT INTO localidades(localidad ,id_provincia)
VALUES('cba capital' , 1)
INSERT INTO localidades(localidad ,id_provincia)
VALUES('la falda' , 1)
INSERT INTO localidades(localidad ,id_provincia)
VALUES('Rosario' , 2)
INSERT INTO localidades(localidad ,id_provincia)
VALUES('Venado tuerto' , 2)

select*
from Localidades

CREATE TABLE Barrios (
    id_barrio int identity (1,1)  NOT NULL,
    nombreBarrio varchar(80)  NOT NULL,
    id_Localidad int  NOT NULL,
    CONSTRAINT Barrios_pk PRIMARY KEY  (id_barrio),
	CONSTRAINT fk_barrios_localidades FOREIGN KEY (id_localidad) references localidades (id_localidad)
)
INSERT INTO barrios (nombreBarrio , id_localidad)
VALUES('Don Bosco' , 1 )
INSERT INTO barrios (nombreBarrio , id_localidad)
VALUES('guiñazu' , 1 )
INSERT INTO barrios (nombreBarrio , id_localidad)
VALUES('antartida' , 2 )
INSERT INTO barrios (nombreBarrio , id_localidad)
VALUES('las lomas' , 3 )
INSERT INTO barrios (nombreBarrio , id_localidad)
VALUES('santa rosa' , 4 )
INSERT INTO barrios (nombreBarrio , id_localidad)
VALUES('Matienzo' , 1 )
INSERT INTO barrios (nombreBarrio , id_localidad)
VALUES('cofico' , 1 )

select*
from Barrios

CREATE TABLE Clientes (
    Id_cliente int identity (1,1) NOT NULL,
    ape_cliente varchar (50) NOT NULL,
    nom_cliente varchar (50) NOT NULL,
    id_Tipo_Cliente int  NOT NULL,
    nro_tel bigint  NOT NULL,
    mail varchar (80)  NULL,
    calle varchar (80) NOT NULL,
    altura int  NOT NULL,
    id_barrio int   NULL,
	fecha_nac datetime NULL,
    CONSTRAINT Clientes_pk PRIMARY KEY  (Id_cliente),
	CONSTRAINT fk_clientes_barrios FOREIGN KEY (id_barrio) references barrios (id_barrio),
	CONSTRAINT fk_clientes_tipo_cliente FOREIGN KEY (id_tipo_cliente) references tipos_clientes (id_tipo_cliente)
)
INSERT INTO clientes (ape_cliente , nom_cliente ,id_tipo_cliente , nro_tel , mail ,calle , altura ,id_barrio)
VALUES('null' ,'Lafalda concesionario SA.',3 ,0543-457812 ,'concesionario@gmail.com' , 'av  38' ,1200,3 )

INSERT INTO clientes (ape_cliente , nom_cliente ,id_tipo_cliente , nro_tel , mail ,calle , altura ,id_barrio)
VALUES('Null' ,'Repuestos cba SA.',1 ,351-4589678 ,'repuestos@hotmail.com' , 'la tablada' ,1500 ,2 )

INSERT INTO clientes (ape_cliente , nom_cliente ,id_tipo_cliente , nro_tel , mail ,calle , altura ,id_barrio)
VALUES('Morales' ,'Hector',2 ,4654085 ,'hectormo@hotmail.com' , 'rosamonte' ,2500 ,1 )

INSERT INTO clientes (ape_cliente , nom_cliente ,id_tipo_cliente , nro_tel , mail ,calle , altura ,id_barrio,fecha_nac)
VALUES('Salas' ,'Maria',2 ,03462-2514879 ,'Maria@hotmail.com' , 'las palmeras' ,700 ,5 ,'18/02/1983' )



select*
from Clientes

CREATE TABLE Vendedores (
    Id_vendedor int identity (1,1) NOT NULL,
    nom_vendedor varchar (80) NOT NULL,
    ape_vendedor varchar (80) NOT NULL,
    calle varchar (80) NOT NULL,
    altura int  NOT NULL,
    id_barrio int  NOT NULL,
    mail varchar (80) NULL,
    nro_tel bigint  NOT NULL,
	fecha_nac datetime NULL,
    CONSTRAINT Vendedores_pk PRIMARY KEY  (Id_vendedor),
	CONSTRAINT fk_vendedores_barrios FOREIGN KEY (id_barrio) references barrios (id_barrio)
)
INSERT INTO vendedores (nom_vendedor,ape_vendedor,calle,altura,id_barrio,mail, nro_tel,fecha_nac)
VALUES('Manuel' ,'Martines','pehuajo' ,2293 , 7 , 'manuel@yahoo.com',4698784,'25/8/1980')
INSERT INTO vendedores (nom_vendedor,ape_vendedor,calle,altura,id_barrio,mail, nro_tel,fecha_nac)
VALUES('soledad','Garcia','larrañaga',325,6, 'soledad@gmail.com',155185599,'15/3/1985')

select*
from Vendedores

CREATE TABLE Orden_Pedido (
    nro_orden int identity (1,1) NOT NULL,
    fecha_entrega smalldatetime  NOT NULL,
    detalle varchar (80)  NULL,
    cantidad int  NOT NULL,
    id_Autoparte int  NULL,
    id_Vehiculo int   NULL,
    id_cliente int  NOT NULL,
    CONSTRAINT Orden_Pedido_pk PRIMARY KEY  (nro_orden),
	CONSTRAINT fk_oren_pedido_autoparte FOREIGN KEY (id_autoparte) references autopartes (id_autoparte),
	CONSTRAINT fk_oren_pedido_vehiculo FOREIGN KEY (id_vehiculo) references vehiculos_terminados (id_vehiculo),
	CONSTRAINT fk_oren_pedido_cliente FOREIGN KEY (id_cliente) references clientes (id_cliente)	
)
INSERT INTO orden_pedido (fecha_entrega , detalle ,cantidad, id_vehiculo , id_cliente)
VALUES('20/10/2020', 'sedan Neon' , 1 , 1,8)

INSERT INTO orden_pedido (fecha_entrega , detalle ,cantidad, id_autoparte, id_cliente)
VALUES('8/05/2018', 'capot terra oem' , 20 , 1,2)

select*
from Orden_Pedido

CREATE TABLE Facturas (
    nroFac int identity (1,1) NOT NULL,
    fecha smalldatetime  NOT NULL,
    id_forma_pago int  NOT NULL,
    id_cliente int  NOT NULL,
    nro_orden int  NOT NULL,
    Id_vendedor int  NOT NULL,
    CONSTRAINT Facturas_pk PRIMARY KEY  (nroFac),
	CONSTRAINT fk_facturas_clientes FOREIGN KEY (id_cliente) references clientes (id_cliente),
	CONSTRAINT fk_facturas_oden FOREIGN KEY (nro_orden) references orden_pedido (nro_orden),
	CONSTRAINT fk_facturas_vendedores FOREIGN KEY (id_vendedor) references vendedores (id_vendedor),
	CONSTRAINT fk_facturas_forma_pago FOREIGN KEY (id_forma_pago) references formas_pago (id_forma_pago)
)
INSERT INTO facturas (fecha , id_forma_pago ,id_cliente ,nro_orden , id_vendedor)
VALUES('20/10/2020',5,8,1,2)

INSERT INTO facturas (fecha , id_forma_pago ,id_cliente ,nro_orden , id_vendedor)
VALUES('8/05/2018',4,2,2,1)

select*
from Facturas


CREATE TABLE Precios_Historicos (
    Id_Precio_hist int identity (1,1)  NOT NULL,
    id_vehiculo int  NULL,
    id_autoparte int  NULL,
    fecha_precio datetime  NOT NULL,
    precio_hist money  NOT NULL,
    CONSTRAINT Precios_Historicos_pk PRIMARY KEY  (Id_Precio_hist),
	CONSTRAINT fk_precios_hist_vehiculos FOREIGN KEY (id_vehiculo) references vehiculos_terminados (id_vehiculo),
	CONSTRAINT fk_precios_hist_autopartes FOREIGN KEY (id_autoparte) references autopartes (id_autoparte),
)

CREATE TABLE DetalleFactura (
    id_detalle int identity (1,1) NOT NULL,
    nroFac int  NOT NULL,
    id_autoplan int  NULL,
    precio_venta money  NOT NULL,
    cantidad int  NOT NULL,
    descuento int  NULL,
    id_autoparte int NULL,
    CONSTRAINT DetalleFactura_pk PRIMARY KEY  (id_detalle),
	CONSTRAINT fk_detalle_autopartes FOREIGN KEY (id_autoparte) references autopartes (id_autoparte),
	CONSTRAINT fk_detalle_auto_plan FOREIGN KEY (id_autoplan) references autoPlan (id_autoplan),
	CONSTRAINT fk_detalle_facturas FOREIGN KEY (nrofac) references facturas (nrofac)
)
INSERT INTO detallefactura(nroFac ,precio_venta , cantidad , descuento )
VALUES(3,100000,1 , 1.5)

INSERT INTO detallefactura(nroFac ,precio_venta , cantidad , descuento,id_autoparte)
VALUES(4,2000,20 , 0,1)


select*
from DetalleFactura

delete DetalleFactura
where id_detalle=2


----------------------------------------------------------------------------------------------------------------------------------

insert into Clientes(ape_cliente, nom_cliente, id_Tipo_Cliente, nro_tel, mail, calle, altura, id_barrio, fecha_nac)
values ('Martinez', 'Juan Cruz', 1, 351767583, 'jcruzmartinez@gmail.com', 'Illia', 201, 1, '12/10/1990')

insert into Clientes(ape_cliente, nom_cliente, id_Tipo_Cliente, nro_tel, mail, calle, altura, id_barrio, fecha_nac)
values ('Lopez', 'Paula', 2, 353456780, 'paulalopez@yahoo.com.ar', 'Brasil', 879, 3, '31/12/1976')

insert into Clientes(ape_cliente, nom_cliente, id_Tipo_Cliente, nro_tel, mail, calle, altura, id_barrio, fecha_nac)
values ('Reyes Magno', 'Reyna', 3, 351723583, 'rrmagno@gmail.com', 'Rafael Nuñez', 1562, 2, '01/06/1987')

insert into Clientes(ape_cliente, nom_cliente, id_Tipo_Cliente, nro_tel, mail, calle, altura, id_barrio, fecha_nac)
values ('Gigli', 'Cristian', 3, 3516756432, '', 'Balcarce', 25, 3, '07/11/1980')

insert into Autopartes (nombre, tipoA, precio, stock_minimo, stock_actual)
values ('Estéreo', 'oem', 1500, 100, 300)

insert into Autopartes (nombre, tipoA, precio, stock_minimo, stock_actual)
values ('Volante', 'Certificado', 1060, 50, 50)

insert into Autopartes (nombre, tipoA, precio, stock_minimo, stock_actual)
values ('Paragolpes Delantero', 'Certificado', 8000, 20, 100)

insert into Autopartes (nombre, tipoA, precio, stock_minimo, stock_actual)
values ('Espejo Lateral', 'Certificado', 2000, 300, 800)

insert into Orden_Pedido ( fecha_entrega, detalle, cantidad, id_Autoparte, id_cliente)
values ('03/04/2020', 'Estéreo Philips oem', 1, 3, 7 )

insert into Orden_Pedido ( fecha_entrega, detalle, cantidad, id_Autoparte, id_cliente)
values ('28/10/2020', 'Volante Volkswagen certificado', 1, 4, 8)

insert into Orden_Pedido ( fecha_entrega, detalle, cantidad, id_Autoparte, id_cliente)
values ('28/10/2019', 'Paragolpes delantero Fiat certificado', 1, 5, 9) 

insert into Orden_Pedido ( fecha_entrega, detalle, cantidad, id_Autoparte, id_cliente)
values ('23/08/2019', 'Espejo Lateral Renault Certificado', 2, 6, 10 )

insert into Facturas(fecha, id_forma_pago, id_cliente, nro_orden, Id_vendedor)
values ('15/02/2020', 1, 4, 2, 1)

insert into Facturas(fecha, id_forma_pago, id_cliente, nro_orden, Id_vendedor)
values ('28/10/2020', 3, 8, 7, 1) 

insert into Facturas(fecha, id_forma_pago, id_cliente, nro_orden, Id_vendedor)
values ('11/04/2019', 1, 9, 8, 1) 

insert into Facturas(fecha, id_forma_pago, id_cliente, nro_orden, Id_vendedor)
values ('21/02/2019', 4, 10, 9, 2) 

insert into DetalleFactura(nroFac, id_autoplan, precio_venta, cantidad, id_autoparte )
values (3,1,1500, 1,3)

insert into DetalleFactura(nroFac, id_autoplan, precio_venta, cantidad, id_autoparte )
values(6, 1, 2000, 3, 4) 

insert into DetalleFactura(nroFac, id_autoplan, precio_venta, cantidad, id_autoparte )
values(7, 1, 8500, 1, 5) 

insert into DetalleFactura(nroFac, id_autoplan, precio_venta, cantidad, id_autoparte )
values(8, 1, 2500, 2, 6) 

insert into Vehiculos_Terminados(nombre, color, tipoV, precio)
values ('C-Elisé', 'Azul', 'Deportivo', 3000000)

insert into Vehiculos_Terminados(nombre, color, tipoV, precio)
values ('Argos', 'Blanco', 'Sedan', 2000000)

insert into Facturas(fecha, id_forma_pago, id_cliente,nro_orden, Id_vendedor)
values ('21/02/2017', 2, 2, 9 ,2) 

insert into Orden_Pedido ( fecha_entrega, detalle, cantidad, id_cliente, id_Vehiculo)
values ('23/08/2017', 'Argos Blanco', 1, 2, 5)

insert into Facturas(fecha, id_forma_pago, id_cliente, nro_orden, Id_vendedor)
values ('23/08/2017', 2, 2, 10, 2) 

insert into DetalleFactura(nroFac, id_autoplan, precio_venta, cantidad, id_autoparte )
values (13, 1, 2000000, 1, null)

insert into Orden_Pedido ( fecha_entrega, detalle, cantidad, id_cliente, id_Vehiculo)
values ('02/04/2017', 'Cubo Rojo', 1, 6, 2)

insert into Facturas(fecha, id_forma_pago, id_cliente, nro_orden, Id_vendedor)
values ('09/04/2017', 2, 6, 11, 1)  

insert into DetalleFactura(nroFac, id_autoplan, precio_venta, cantidad, id_autoparte )
values (14, 1, 1500000, 2, null) 

insert into Orden_Pedido ( fecha_entrega, detalle, cantidad, id_cliente, id_Vehiculo)
values ('13/05/2017', 'C-Elisé Azul', 1, 10, 4) 

insert into Facturas(fecha, id_forma_pago, id_cliente, nro_orden, Id_vendedor)
values ('20/05/2017', 3, 10, 12, 1)  

insert into DetalleFactura(nroFac, id_autoplan, precio_venta, cantidad, id_autoparte )
values (15, 1, 3000000, 1, null) 

--1)Cuales son las facturas que vendimos hoy? Listar: formas de pago, id autoplan, precio de venta, id cliente, id vehiculo terminado. Rotule

select df.id_detalle 'Detalle Factura', f.nroFac 'Nro Factura' ,f.id_forma_pago 'Forma Pago', df.id_autoplan 'Auto Plan', df.precio_venta 'Precio Venta', f.id_cliente 'Cliente', f.Id_vendedor 'Vendedor' , f.fecha 'Fecha'
from DetalleFactura df
join AutoPlan ap on df.id_autoplan = ap.id_autoplan
join Facturas f on df.nroFac = f.nroFac

where day(f.fecha) = day (getdate())
order by 2 asc

--2)Cuanto se recaudo el año pasado en total? Rotule

select sum(df.precio_venta) 'Recaudación', year(f.fecha) 'Fecha'
from DetalleFactura df
join Facturas f on df.nroFac = f.nroFac
 
where year(f.fecha) = year(getdate()) -1
group by year(f.fecha)

--3)Muestre el nombre de los vehiculos mayores a $2.000.000 en el año 2017.

select v.nombre 'Vehículo', df.precio_venta 'Precio' ,df.cantidad 'Cantidad', year(f.fecha) 'Año'
from DetalleFactura df

join Facturas f on df.nroFac = f.nroFac
join Orden_Pedido op on f.nro_orden = op.nro_orden
join Vehiculos_Terminados v on op.id_vehiculo = v.id_vehiculo

where year(f.fecha) = 2017
group by v.nombre, df.precio_venta, df.cantidad, f.fecha
having df.precio_venta >= 2000000


--4)Total recaudado en efectivo por los vendedores en lo que va del año

select v.nom_vendedor + space(2) + v.ape_vendedor 'Vendedor', fp.forma_pago 'Forma pago', f.fecha 'Fecha', sum(df.cantidad * df.precio_venta) 'Total'
from vendedores v, facturas f

join Formas_Pago fp on f.id_forma_pago = fp.id_forma_pago
join DetalleFactura df on f.nroFac = df.nroFac

where year(f.fecha)= 2020
and fp.id_forma_pago = 1
group by v.nom_vendedor, v.ape_vendedor, fp.forma_pago, f.fecha



create proc pa_vehiculos 
@precio int 
as 
select v.nombre 'Vehículo', df.precio_venta 'Precio' ,df.cantidad 'Cantidad', year(f.fecha) 'Año'
from DetalleFactura df

join Facturas f on df.nroFac = f.nroFac
join Orden_Pedido op on f.nro_orden = op.nro_orden
join Vehiculos_Terminados v on op.id_vehiculo = v.id_vehiculo

where year(f.fecha) = 2017
group by v.nombre, df.precio_venta, df.cantidad, f.fecha
having df.precio_venta >= @precio

exec pa_vehiculos @precio = 2000000

create proc pa_autopartes
@cantidad as int=0
as
select f.id_cliente , c.nom_cliente , f.nroFac , f.fecha , df.id_autoparte, a.nombre , df.cantidad , df.precio_venta
from DetalleFactura df
join Facturas f on df.nroFac = f.nroFac
join Clientes c on f.Id_cliente = c.id_cliente
join Autopartes a on a.id_Autoparte=df.id_autoparte
where  df.nroFac in (select nroFac
                  from DetalleFactura
				  where cantidad < @cantidad)
 execute pa_autopartes
@cantidad= 15

select df.id_detalle 'Id',f.nroFac 'Nro Fac', a.nombre ' Autoparte', a.precio 'Precio Costo', df.cantidad 'Cantidad', df.precio_venta 'Precio Venta', f.fecha 'Fecha'
from DetalleFactura df
join Autopartes a on df.id_autoparte = a.id_Autoparte
join Facturas f on df.nroFac = f.nroFac
where f.nroFac in (select nroFac from DetalleFactura where cantidad > 15)

create proc pa_año
@año int 
as
select v.nom_vendedor + space(2) + v.ape_vendedor 'Vendedor', fp.forma_pago 'Forma pago', f.fecha 'Fecha', sum(df.cantidad * df.precio_venta) 'Total'
from vendedores v, facturas f

join Formas_Pago fp on f.id_forma_pago = fp.id_forma_pago
join DetalleFactura df on f.nroFac = df.nroFac

where year(f.fecha)= @año
and fp.id_forma_pago = 1
group by v.nom_vendedor, v.ape_vendedor, fp.forma_pago, f.fecha

exec pa_año @año = 2020


create proc pa_nroFac
@precio int
as
select f.nroFac 'Nro Factura' ,f.id_forma_pago 'Forma Pago', c.ape_cliente  + space(2) + c.nom_cliente 'Cliente', f.fecha 'Fecha'
from facturas f
join Clientes c on f.id_cliente = c.Id_cliente

group by f.nroFac, f.id_forma_pago, c.ape_cliente  + space(2) + c.nom_cliente, f.fecha
having f.nroFac > (select nroFac from DetalleFactura  where precio_venta = @precio)
order by 3 asc

exec pa_nroFac @precio = 1500000


create proc pa_max_min 
@num int
as
SELECT  v.id_vendedor'codigo segun tipo' , v.nom_vendedor+' '+v.ape_vendedor
        'nombre' ,sum(d.cantidad*d.precio_venta)'importe total segun tipo' , 'vendedor' tipo
FROM Vendedores v join Facturas f on f.Id_vendedor=v.Id_vendedor
     join DetalleFactura d on d.nroFac=f.nroFac
WHERE  year(f.fecha)= @num
GROUP BY  v.id_vendedor , v.nom_vendedor+' '+v.ape_vendedor
UNION
SELECT  c.Id_cliente , c.nom_cliente+' '+c.ape_cliente ,sum
(d.precio_venta*d.cantidad), 'cliente'
FROM Facturas f join Clientes c on f.id_cliente=c.Id_cliente
     join DetalleFactura d on d.nroFac = f.nroFac
WHERE year(f.fecha)= @num
GROUP BY c.Id_cliente , c.nom_cliente+' '+c.ape_cliente
ORDER BY 1 , 3


create proc pa_mayor_30
@num int
as

select  c.nom_cliente + SPACE(2) + c.ape_cliente 'Nombre Cliente', c.fecha_nac 'Fecha Nac', b.nombreBarrio 'Barrio', c.calle 'Residencia' , c.nro_tel 'Telefono'
from clientes c
join Barrios b on c.id_barrio = b.id_barrio
where c.fecha_nac < '1990' and b.id_barrio < @num
union
select v.nom_vendedor + SPACE(2) + v.ape_vendedor 'Nombre Vendedor', v.fecha_nac 'Fecha Nac', l.localidad 'Localidad', v.calle 'Residencia', v.nro_tel 'Telefono'
from Vendedores v
join Barrios b on v.id_barrio = b.id_barrio
join Localidades l on b.id_Localidad = l.Id_localidad
where v.fecha_nac < '1990' and b.id_barrio < @num

