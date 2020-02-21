/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     20/02/20 17:17:23                            */
/*==============================================================*/
create database programatec;
use programatec;


/*==============================================================*/
/* Table: ACTIVIDADES                                           */
/*==============================================================*/
create table ACTIVIDADES
(
   IDACTIVIDAD          int not null,
   NOMBRE               varchar(80),
   DESCRIPCION          varchar(200),
   primary key (IDACTIVIDAD)
);

/*==============================================================*/
/* Table: ALUMNOS                                               */
/*==============================================================*/
create table ALUMNOS
(
   NOCONTROL            char(8) not null,
   IDUSUARIO            int,
   IDCARRERA            int,
   SEMESTRE             int,
   primary key (NOCONTROL)
);

/*==============================================================*/
/* Table: CARRERAS                                              */
/*==============================================================*/
create table CARRERAS
(
   IDCARRERA            int not null,
   NOMBRE               varchar(100),
   SIGLAS               varchar(10),
   ESTATUS              char(1),
   primary key (IDCARRERA)
);

/*==============================================================*/
/* Table: CATEGORIAS                                            */
/*==============================================================*/
create table CATEGORIAS
(
   IDCATEGORIA          int not null,
   NOMBRE               varchar(50),
   SEMESTRELIMITE       int,
   ESTATUS              char(1),
   primary key (IDCATEGORIA)
);

/*==============================================================*/
/* Table: DOCENTES                                              */
/*==============================================================*/
create table DOCENTES
(
   NODOCENTE            int not null,
   IDUSUARIO            int,
   IDCARRERA            int,
   ESCOLARIDAD          varchar(30),
   ESPECIALIDAD         varchar(80) not null,
   CEDULA               varchar(10),
   primary key (NODOCENTE)
);

/*==============================================================*/
/* Table: EDICIONES                                             */
/*==============================================================*/
create table EDICIONES
(
   IDEDICION            int not null,
   NOMBRE               varchar(100),
   FECHAREGISTRO        date,
   FECHAEVENTO          date,
   HORAINICIO           time,
   HORAFIN              time,
   ESTATUS              char(1),
   primary key (IDEDICION)
);

/*==============================================================*/
/* Table: EQUIPOS                                               */
/*==============================================================*/
create table EQUIPOS
(
   IDEQUIPO             int not null,
   NOMBRE               varchar(100),
   PUNTOSOBTENIDOS      int,
   PROBLEMASRESUELTOS   int,
   IDCATEGORIA          int,
   IDEDICION            int,
   NOCONTROLP1          char(8),
   NOCONTROLP2          char(8),
   NOCONTROLP3          char(8),
   NODOCENTE            int,
   ESTATUS              char(1),
   primary key (IDEQUIPO)
);

/*==============================================================*/
/* Table: PROBLEMAS                                             */
/*==============================================================*/
create table PROBLEMAS
(
   IDPROBLEMA           int not null,
   NOMBRE               varchar(200),
   PUNTOS               int,
   TIEMPOMAX            time,
   DESCRIPCION          varchar(200),
   primary key (IDPROBLEMA)
);

/*==============================================================*/
/* Table: PROBLEMAS_PROPUESTOS                                  */
/*==============================================================*/
create table PROBLEMAS_PROPUESTOS
(
   IDPROBLEMAPROPUESTO  int not null,
   IDCATEGORIA          int,
   IDPROBLEMA           int,
   IDEDICION            int,
   COLOR                varchar(50),
   primary key (IDPROBLEMAPROPUESTO)
);

/*==============================================================*/
/* Table: PROBLEMAS_RESUELTOS                                   */
/*==============================================================*/
create table PROBLEMAS_RESUELTOS
(
   IDEQUIPO             int not null,
   IDPROBLEMAPROPUESTO  int not null,
   PUNTOS               int,
   TIEMPOEJECUCION      time,
   primary key (IDEQUIPO, IDPROBLEMAPROPUESTO)
);

/*==============================================================*/
/* Table: STAFF                                                 */
/*==============================================================*/
create table STAFF
(
   NODOCENTE            int not null,
   IDACTIVIDAD          int not null,
   IDEDICION            int not null,
   FECHAINICIO          date,
   FECHAFIN             date,
   primary key (NODOCENTE, IDACTIVIDAD, IDEDICION)
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS
(
   IDUSUARIO            int not null,
   NOMBRECOMPLETO       varchar(50),
   SEXO                 char(1),
   TELEFONO             char(10),
   EMAIL                varchar(100),
   ESTATUS              char(1),
   TIPO                 char(1),
   PASSWORD             varchar(20),
   primary key (IDUSUARIO)
);

alter table ALUMNOS add constraint FK_REFERENCE_15 foreign key (IDCARRERA)
      references CARRERAS (IDCARRERA) on delete restrict on update restrict;

alter table ALUMNOS add constraint FK_REFERENCE_3 foreign key (IDUSUARIO)
      references USUARIOS (IDUSUARIO) on delete restrict on update restrict;

alter table DOCENTES add constraint FK_REFERENCE_1 foreign key (IDUSUARIO)
      references USUARIOS (IDUSUARIO) on delete restrict on update restrict;

alter table DOCENTES add constraint FK_REFERENCE_12 foreign key (IDCARRERA)
      references CARRERAS (IDCARRERA) on delete restrict on update restrict;

alter table EQUIPOS add constraint FK_REFERENCE_10 foreign key (NOCONTROLP1)
      references ALUMNOS (NOCONTROL) on delete restrict on update restrict;

alter table EQUIPOS add constraint FK_REFERENCE_13 foreign key (IDEDICION)
      references EDICIONES (IDEDICION) on delete restrict on update restrict;

alter table EQUIPOS add constraint FK_REFERENCE_16 foreign key (NOCONTROLP2)
      references ALUMNOS (NOCONTROL) on delete restrict on update restrict;

alter table EQUIPOS add constraint FK_REFERENCE_17 foreign key (NOCONTROLP3)
      references ALUMNOS (NOCONTROL) on delete restrict on update restrict;

alter table EQUIPOS add constraint FK_REFERENCE_18 foreign key (NODOCENTE)
      references DOCENTES (NODOCENTE) on delete restrict on update restrict;

alter table EQUIPOS add constraint FK_REFERENCE_9 foreign key (IDCATEGORIA)
      references CATEGORIAS (IDCATEGORIA) on delete restrict on update restrict;

alter table PROBLEMAS_PROPUESTOS add constraint FK_REFERENCE_19 foreign key (IDCATEGORIA)
      references CATEGORIAS (IDCATEGORIA) on delete restrict on update restrict;

alter table PROBLEMAS_PROPUESTOS add constraint FK_REFERENCE_20 foreign key (IDPROBLEMA)
      references PROBLEMAS (IDPROBLEMA) on delete restrict on update restrict;

alter table PROBLEMAS_PROPUESTOS add constraint FK_REFERENCE_21 foreign key (IDEDICION)
      references EDICIONES (IDEDICION) on delete restrict on update restrict;

alter table PROBLEMAS_RESUELTOS add constraint FK_REFERENCE_22 foreign key (IDEQUIPO)
      references EQUIPOS (IDEQUIPO) on delete restrict on update restrict;

alter table PROBLEMAS_RESUELTOS add constraint FK_REFERENCE_23 foreign key (IDPROBLEMAPROPUESTO)
      references PROBLEMAS_PROPUESTOS (IDPROBLEMAPROPUESTO) on delete restrict on update restrict;

alter table STAFF add constraint FK_REFERENCE_24 foreign key (NODOCENTE)
      references DOCENTES (NODOCENTE) on delete restrict on update restrict;

alter table STAFF add constraint FK_REFERENCE_25 foreign key (IDACTIVIDAD)
      references ACTIVIDADES (IDACTIVIDAD) on delete restrict on update restrict;

alter table STAFF add constraint FK_REFERENCE_26 foreign key (IDEDICION)
      references EDICIONES (IDEDICION) on delete restrict on update restrict;

