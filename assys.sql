drop database if exists aaSys;
create database if not exists aaSys;
use aaSys;



-- Tablas padres

-- Tabla de grados
 
create table grad(
aa_idol_grad int not null primary key auto_increment,
aa_nom_grad varchar(30) not null
);

-- Tabla de mes 
create table ms(
aa_idol_ms int not null primary key auto_increment,
aa_nom_ms varchar(20) not null,
aa_tda_ms int not null
);

-- tabla dia
create  table da(
aa_idol_da int not null primary key auto_increment,
aa_nom_da varchar(20) not null
);

-- tabla estado
create table est(
aa_idol_est int not null primary key auto_increment,
aa_nom_est varchar(20) not null
);

-- Tabla de seccion
create table scn(
aa_idol_scn int not null primary key auto_increment,
aa_nom_scn varchar(2) not null
);

-- Tabla tipo educación
create table tpd(
aa_idol_tpd int not null primary key auto_increment,
aa_nom_tpd varchar(20) not null
);

-- Tabala tipo profesor
create table prf(
aa_idol_prf int not null primary key auto_increment,
aa_nom_prf varchar(60) not null,
aa_ape_prf varchar(15) not null,
aa_dir_prf varchar(200) not null,
aa_tlf_prf varchar(15) not null
);

-- Tabla turno
create table trn(
aa_idol_trn int not null primary key auto_increment,
aa_nom_trn varchar(30) not null
);

-- tabla rol
create table rl(
aa_idol_rl int not null primary key auto_increment,
aa_nom_rl varchar(20) not null
);


-- Tablas hijas

-- Tabla horario
create table hro(
aa_idol_hro int not null primary key auto_increment, 
aa_idol_trn int not null,
aa_hi_hro time not null,
aa_hf_hro time not null,
constraint fk_trn_hro foreign key (aa_idol_trn) references trn(aa_idol_trn)
);

-- Tabla alumno 

create table al(
aa_idol_al int not null primary key auto_increment,
aa_cod_al varchar(20) unique not null,
aa_nom_al varchar(70) not null,
aa_ape_al varchar(70) not null,
aa_fnac_al date not null,
aa_idol_grad int not null,
aa_idol_scn int not null,
aa_idol_tpd int not null,
aa_idol_trn int not null,
aa_idol_prf int not null,
aa_dir_al varchar(200) not null,
aa_tlf_al varchar(15) not null,
aa_pr_al varchar(70) not null,
aa_prt_al varchar(30) not null,
aa_ptlf_al varchar(15) not null,
aa_est_al int(2) not null,
constraint fk_grad_al foreign key (aa_idol_grad) references grad(aa_idol_grad),
constraint fk_scn_al foreign key (aa_idol_scn) references scn(aa_idol_scn),
constraint fk_tpd_al foreign key (aa_idol_tpd) references tpd(aa_idol_tpd),
constraint fk_trn_al foreign key (aa_idol_trn) references trn(aa_idol_trn),
constraint fk_prf_al foreign key (aa_idol_prf) references prf(aa_idol_prf)
);

-- Tabla asistencia
create table ast(
aa_idol_ast int not null primary key auto_increment,
aa_idol_est int not null,
aa_idol_al int not null,
aa_idol_da int not null,
aa_idol_ms int not null,
constraint fk_est_ast foreign key (aa_idol_est) references est(aa_idol_est),
constraint fk_al_ast foreign key (aa_idol_al) references al(aa_idol_al),
constraint fk_da_ast foreign key (aa_idol_da) references da(aa_idol_da),
constraint fk_ms_ast foreign key (aa_idol_ms) references ms(aa_idol_ms)
);

-- Tabla asistencia por alumno
create table asta(
aa_idol_asta int not null primary key auto_increment,
aa_idol_al int not null,
aa_por_asta decimal not null,
constraint fk_al_asta foreign key (aa_idol_al) references al(aa_idol_al)
);

-- Tabla estadisticas
create table stdc(
aa_idol_stdc int not null primary key auto_increment,
aa_idol_ms int not null,
aa_idol_grad int not null,
aa_port_stdc decimal not null,
aa_portno_stdc decimal not null,
aa_portna_stdc decimal not null,
constraint fk_ms_stdc foreign key (aa_idol_ms) references ms(aa_idol_ms),
constraint fk_grad_stdc foreign key (aa_idol_grad) references grad(aa_idol_grad)
);


-- Tabla  usuario 
create table usr(
aa_idol_usr int not null primary key auto_increment,
aa_usr_usr varchar(20) not null,
aa_prw_user varchar(20) not null,
aa_idol_prf int not null,
aa_idol_rl int not null,
constraint fk_prf_user foreign key (aa_idol_prf) references prf(aa_idol_prf),
constraint fk_rl_user foreign key (aa_idol_rl) references rl(aa_idol_rl)
);


-- asistencia anual (para fines de historial)
create table aspa(
aa_idol_aspa int not null primary key auto_increment,
aa_nio_aspa date not null,
aa_pora_aspa decimal not null,
aa_porano_aspa decimal not null,
aa_porana_aspa decimal not null

);


-- Alimentación de las tablas 
insert into ms values(1,'enero',20);
insert into ms values(2,'febrero',20);
insert into ms values(3,'marzo',20);
insert into ms values(4,'abril',20);
insert into ms values(5,'mayo',20);
insert into ms values(6,'junio',20);
insert into ms values(7,'julio',20);
insert into ms values(8,'agosto',20);
insert into ms values(9,'septiembre',20);
insert into ms values(10,'octubre',20);
insert into ms values(11,'noviembre',20);

insert into grad values(1, 'kinder 4');
insert into grad values(2, 'Kinder 5');
insert into grad values(3, 'preparatoria');
insert into grad values(4, 'primer grado');
insert into grad values(5, 'segundo grado');
insert into grad values(6, 'tercer grado');
insert into grad values(7, 'cuarto grado');
insert into grad values(8, 'quinto grado');
insert into grad values(9, 'sexto grado');
insert into grad values(10, 'septimo grado');
insert into grad values(11, 'octavo grado');
insert into grad values(12, 'noveno grado');
insert into grad values(13, 'primero de bachillerato');
insert into grad values(14, 'segundo de bachillerato');
insert into grad values(15, 'tercero de bachillerato');

-- alimentacion tabla dias
insert into da values(1,'lunes');
insert into da values(2,'martes');
insert into da values(3,'miercoles');
insert into da values(4,'jueves');
insert into da values(5,'viernes');

-- alimentacion de la tabla estado
insert into est values(1,'presente');
insert into est values(2,'ausente');
insert into est values(3,'permiso');

-- alimentacion de la tabla seccion
insert into scn values(1, 'A');

-- alimentacion de tabla tipo educacion
insert into tpd values(1,'parvularia');
insert into tpd values(2,'primaria');
insert into tpd values(3,'secundaria');
insert into tpd values(4,'bachillerato');

-- alimentacion tabla profesor
insert into prf values(1,'Alejandra','Alfaro','Colonia Maquilishuat, pasaje T, casa 89','7285-7845');
insert into prf values(2,'Gracia','Flores','Colonia Miravalle, block C #90','7840-6363');
insert into prf values(3,'Tania','Arevalo','Reparto Valle verde, senda Y, #10','6112-8817');
insert into prf values(4,'Lisbeth','Osuna','Reparto Valle verde, senda Z, #50','7512-9668');
insert into prf values(5,'Fernando','Hueso','Colonia Buena Vista, psaje G, casa 23','7145-9966');
insert into prf values(6,'Tomas','Marcano','Residencial Bosques del Matazano, pasaje 3, casa #12','7415-2218');
insert into prf values(7,'Antonio','Rammirez','Colonia Las Flores, pasaje K, casa #87','7020-9684');
insert into prf values(8,'Joaquin','Henriquez','Colonia la seniora del Carmen, poligono H, casa 45','7118-1281');
insert into prf values(9,'Irma','Palacios','Colonia Los Alpes, pasaje B-12, casa #789','7551-7862');
insert into prf values(10,'Karol','Baraona','Colonia Los Amates, senda U, casa #123','7133-3311');
insert into prf values(11,'Marisela','Carranza','Colonia Los Amates, senda R, casa #230','7001-2140');
insert into prf values(12,'Remberto','Barraza','Colonia las Brisas, enda B, casa 78','7699-1412');
insert into prf values(13,'Omar','Castellanos','Residencial Caminos del Cerro, pasaje B19, csa #2','7545-9696');
insert into prf values(14,'Ursula','Castillo','Colonia la Floresta, pasaje G, casa 34','7440-5512');

-- alimentacion tabla rol
insert into rl values(1,'director');
insert into rl values(2,'profesor');


-- alimentación tabla usuario
insert into usr values(1,'PFR001','pass001',1,2);
insert into usr values(2,'PFR002','pass002',2,2);
insert into usr values(3,'PFR003','pass003',3,2);
insert into usr values(4,'PFR004','pass004',4,2);
insert into usr values(5,'PFR005','pass005',5,2);
insert into usr values(6,'PFR006','pass006',6,2);
insert into usr values(7,'PFR007','pass007',7,2);
insert into usr values(8,'PFR008','pass008',8,2);
insert into usr values(9,'PFR009','pass009',9,2);
insert into usr values(10,'PFR010','pass010',10,2);
insert into usr values(11,'PFR011','pass011',11,2);
insert into usr values(12,'PFR012','pass012',12,1);
insert into usr values(13,'PFR013','pass013',13,1);
insert into usr values(14,'PFR014','pass014',14,1);



-- alimentacion de la tabla turno
insert into trn values(1,'matutino');
insert into trn values(2,'vespertino');

-- alimentacion de la tabla horario
insert into hro values(1,1,'07:00:00','12:00:00');
insert into hro values(2,2,'13:00:00','17:30:00');

-- alimentacion alumno

insert into al values(1,'AM1-9','Armando Heriberto','Iraheta Alegria','2009-02-12',12,1,3,1,12,'Colonia los Alpes, casa #12','7412-7771','Maritza de Alegria','madre','7111-5244',1);
insert into al values(2,'AM2-9','Beatriz Maria','Melara Alfaro','2009-02-12',12,1,3,1,12,'Colonia Sevilla, pasaje U #12','7455-1244','Ernestina Medina','abuela','7214-8855',1);
insert into al values(3,'AM3-9','Carlos Alfredo','Meza Regalado','2009-02-12',12,1,3,1,12,'Colonia Los Amaneceres 4','7845-0000','Gonzalo Meza','padre','7411-5588',1);
insert into al values(4,'AM4-9','Daniela Abigail','Zetino Melendez','2009-02-12',12,1,3,1,12,'','7411-5544','Alfredo Meza','padre','7232-4412',1);
insert into al values(5,'AM5-9','Esmeralda Jeannette','Landaverde Verapaz','2009-02-12',12,1,3,1,12,'7422-4499','Aurelio Gomez','padre','7318-2121','',1);
insert into al values(6,'AM6-9','Fernanda Manuela','Urrutia Enamorado','2009-02-12',12,1,3,1,12,'','7414-9912','Pablo Urrutia','padre','7712-1221',1);
insert into al values(7,'AM7-9','Gema Sujey','Vadillo Vadillo','2009-02-12',12,1,3,1,12,'','6150-0550','Luis Vadillo','padre','6144-5121',1);
insert into al values(8,'AM8-9','Humberto Rafael','Marroquin Granados','2009-02-12',12,1,3,1,12,'Colonia los cabos ojos , pasaje 5 #23','7828-5214','Gilberto Marroquin','padre','7921-4466',1);
insert into al values(9,'AM9-9','Imelda Alendrina','Palomo Padilla','2009-02-12',12,1,3,1,12,'Colonia Santa Lucias, pje R, casa #156','7766-2211','Imelda de Padilla','madre','7314-5521',1);
insert into al values(10,'AM10-9','Johanna Clariza','Schmidth Cota','2009-02-12',12,1,3,1,12,'Residencial urbanizacion Santa Lucia, poligono R #99','7755-1245','Ana Cota','madre','7544-9661',1);
insert into al values(11,'AM11-9','Karen Cecilia','Cota Valencia','2009-02-12',12,1,3,1,12,'Residencial Venecia, pasaje U-12 #89','7845-9966','Arely Valencia','madre','6124-7899',1);
insert into al values(12,'AM12-9','Leucel Andrea','Vega Garcia','2009-02-12',12,1,3,1,12,'Colonia los Alpes, casa #67','7890-2154','Yanira Medrano','madre','7515-1514',1);
insert into al values(13,'AM13-9','Manuela Dolores','Almilcar Serrano','2009-02-12',12,1,3,1,12,'Colonia los Alpes, casa #300','7700-6600','Laura Henriquez','madre','7215-7215',1);
insert into al values(14,'AM14-9','Nadia Eloisa','Gutierrez Rosales','2009-02-12',12,1,3,1,12,'Colonia los Alpes, casa #4','7300-8911','Elsa de Rosales','madre','7451-8877',1);
insert into al values(15,'AM15-9','Ophelia Beatriz','Hernandez Alvarez','2009-02-12',12,1,3,1,12,'Colonia los Alpes, casa #56','7840-2121','Miriam Guevara','tia','7510-5564',1);
insert into al values(16,'AM16-9','Peter Anthon','Ramirez Mendoza','2009-02-12',12,1,3,1,12,'Colonia los Alpes, casa #88','7030-4020','Avelina Rmirez','abuela','7777-0200',1);
insert into al values(17,'AM17-9','Renato José','Garcia Jimenez','2009-02-12',12,1,3,1,12,'Residencial Bosques del Matazano, pasaje 10, casa #44','7477-4512','Monica Jimenez','madre','7465-8871',1);
insert into al values(18,'AM18-9','Silvia Andrea','Stupinian Ungo','2009-02-12',12,1,3,1,12,'Residencial Las Carmelitas, pasaje 3, casa #12','7966-2212','Silvia Ungo','madre','7155-9910',1);
insert into al values(19,'AM19-9','Tom Maximiliano','Cepeda Espino','2009-02-12',12,1,3,1,12,'Residencial Agua en mis ojos, pasaje 3, casa #12','6144-9645','Tomasa de Espino','madre','7855-1002',1);
insert into al values(20,'AM20-9','Ursula Eloisse','Gamboa Icaza','2009-02-12',12,1,3,1,12,'Residencial Faro de luz, pasaje Abelita, casa #12','7696-6631','Vicenta Gamboa','madre','7445-6666',1);
insert into al values(21,'AM21-9','Viviene Stephania','Medrano Navarro','2009-02-12',12,1,3,1,12,'Colonia Matazano 2, pasaje 3, casa #12','7912-2177','Ada Medrano','madre','7028-6666',1);
insert into al values(22,'AM22-9','William Fernandio','Fuentes Pantoja','2009-02-12',12,1,3,1,12,'Residencial los pinos, pasaje 3, casa #12','7212-7844','Amanda Pantoja','madre','7777-4455',1);
insert into al values(23,'AM23-9','Xotchitl Colette','Paniagua Gonzales','2009-02-12',12,1,3,1,12,'Plan del pino, ciudadela don bosco, pasaje Ramos, casa #565','7450-9678','Carolina Gonzales','madre','7745-8888',1);
insert into al values(24,'AM24-9','Yancy Andrea','Valdiva Zuniga','2009-02-12',12,1,3,1,12,'Residencial Bosques del Matazano, pasaje 3, casa #9','7710-1010','Catalina Zuniga','madre','7114-2255',1);
