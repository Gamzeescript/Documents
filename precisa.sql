create database precisa;
use precisa;


-- Tabblas de entidad fuerte

create table usuario(
id_usuario int not null primary key auto_increment,
usuario varchar(14) not null,
pass varchar(33) not null
);

create table tipo_act(
id_tipo_act int not null primary key auto_increment,
nom_tipo_act varchar(20) not null
);

-- tablas de entidad debil

create table actividad(
id_actividad int not null primary key auto_increment,
id_tipo_act int not null,
nombre_act varchar(20) not null,
descripcion varchar(70) not null,
constraint fk_tipo_act foreign key (id_tipo_act) references tipo_act(id_tipo_act)
);

-- tablas intermedias

create table act_por_us(
id_act_por_us int not null primary key auto_increment,
id_usuario int not null,
id_actividad int not null,
constraint fk_usuario foreign key (id_usuario) references usuario(id_usuario),
constraint fk_actividad foreign key (id_actividad) references actividad(id_actividad)
);

-- alimentacion a tablas
-- usuario 
insert into usuario values(1,'gamzeescript','teamopietro14');
insert into usuario values(2,'pedrux','teamosayuri14');
insert into usuario values(3,'kandrea','cordova123');
insert into usuario values(4,'zenjidpaz','santiago123');
insert into usuario values(5,'amanda','pineda123');
insert into usuario values(6,'isi','pao123');
insert into usuario values(7,'erickgar','miriam123');
insert into usuario values(8,'root','root');

-- tipo_act 
insert into tipo_act values(1,'Para ayer');
insert into tipo_act values(2,'Urge');
insert into tipo_act values(3,'Para mejorar');
insert into tipo_act values(4,'Para considerar');

-- actividad 
insert into actividad values(1,1,'Proyecto Angular','servicio de php/java en angular');
insert into actividad values(2,1,'Proyecto grupal 2','proyecto grupal php/java #3');
insert into actividad values(3,1,'proyecto individual','proyecto individual php/java #3');
insert into actividad values(4,2,'busqueda de bugs','buscar bugs en proyectos ajenos');
insert into actividad values(5,2,'browser sync','si no se instala eso, no hara mayor cosa en su proyecto');
insert into actividad values(6,2,'logique','proyecto para saber usar el ORM de persistencia');
insert into actividad values(7,3,'actualizacion cv','actualizar el cv con los conocimientos actuales');
insert into actividad values(8,3,'investigacion','investigar sobre los frameworks asignados');
insert into actividad values(9,4,'aprendizaje en ajax','resolver ejercicios con ajax');
insert into actividad values(10,4,'servicios con REST','aprender a crear servicios con REST API');

