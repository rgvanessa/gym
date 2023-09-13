#creamos base de datos
create database db_GYM;
#usamos base de datos
use db_GYM;
#creamos tabla miembros
create table miembros(
id_miembros int primary key not null AUTO_INCREMENT,
nombre varchar(50) not null,
apellido varchar(50) not null,
fecha_nacimiento date,
genero varchar(10) not null,
telefono int not null,
correo varchar(50),
fecha_inscripcion date not null 
);
## no es necesario poner el id osea el campo id_mienbro en la sentencia insert por que el id auto incrementable 
insert into miembros (nombre, apellido, fecha_nacimiento,genero,telefono,correo,fecha_inscripcion )
values ("juan", "perez", STR_TO_DATE('11-12-2023','%d-%m-%Y'), "M", 999999, "asdf@gmail.com", STR_TO_DATE('07-12-2023','%d-%m-%Y'));

#creamos tabla pagos
create table pagos(
id_pagos int primary key not null AUTO_INCREMENT,
monto int not null,
metodo_pago varchar(50) not null,
id_miembro int not null,
foreign key pagos(id_miembro) references miembros(id_miembros) 
);

insert into pagos (monto, metodo_pago, id_miembro )
values (1000, "Nequi", 2);

#creamos la tabla entranadores
create table entrenador(
id_entrenador int primary key not null AUTO_INCREMENT,
nombre varchar(50) not null,
apellido varchar(50) not null,
especialidad varchar(100) not null,
telefono int not null,
correo varchar(50)
);
insert into entrenador (nombre, apellido, especialidad, telefono, correo)
values ("jouseph","orozco","entrenador",362873,"aghge@gmail.com");

#creamos la tabla planes
create table planes(
id_plan int primary key not null AUTO_INCREMENT,
nom_plan varchar(50) not null,
descripcion varchar(100) not null,
precio_mensual int not null,
id_miembros int not null,
id_entrenador int not null,
foreign key (id_miembros) references miembros(id_miembros),
foreign key (id_entrenador) references entrenador(id_entrenador) 
);

insert into planes(nom_plan,descripcion,precio_mensual,id_miembros,id_entrenador)
values ("salud","mejorar_rutina_y_alimentacion",1,2,55775);

#creamos tabla asistencia
create table asistencia(
id_asistencia int primary key not null AUTO_INCREMENT,
fecha_asistencia date not null,
hora_ingreso datetime not null,
hora_salida datetime not null,
id_miembros int not null,
foreign key asistencia(id_miembros) references miembros(id_miembros)
);

insert into asistencia (fecha_asistencia, hora_ingreso, hora_salida, id_miembros) 
values (STR_TO_DATE('11-12-2023','%d-%m-%Y'), STR_TO_DATE("2017,8,14 10,40,10", "%Y,%m,%d %h,%i,%s"), 
STR_TO_DATE("2017,8,14 10,40,10", "%Y,%m,%d %h,%i,%s"), 1);