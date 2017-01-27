/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     15/01/2017 00:38:47                          */
/*==============================================================*/

drop index RENTINGPERSON_FK cascade;

drop index RENTEDOBJECT_FK cascade;

drop index RENTALPROCESSES_PK cascade;

drop table RENTALPROCESSES cascade;

drop index CUSTOMERS_PK cascade;

drop table CUSTOMERS cascade;

drop index BILLINGINFOOWNER_FK cascade;

drop index BILLINGINFORMATION_PK cascade;

drop table BILLINGINFORMATION cascade;

drop index TYPE_FK cascade;

drop index BOARDGAMECOPIES_PK cascade;

drop table BOARDGAMECOPIES cascade;

drop index BOARDGAMES_PK cascade;

drop table BOARDGAMES cascade;




/*==============================================================*/
/* Table: BILLINGINFORMATION                                    */
/*==============================================================*/
create table BILLINGINFORMATION (
   TYPE                 CHAR(6)              not null
      constraint CKC_TYPE_BILLINGI check (TYPE in ('PAYPAL','IBAN','CCARD')),
   DATA                 CHAR(34)             not null,
   BILLINGINFORMATIONID SERIAL               not null,
   CUSTOMERID           INT4                 not null,
   constraint PK_BILLINGINFORMATION primary key (BILLINGINFORMATIONID)
);

/*==============================================================*/
/* Index: BILLINGINFORMATION_PK                                 */
/*==============================================================*/
create unique index BILLINGINFORMATION_PK on BILLINGINFORMATION (
BILLINGINFORMATIONID
);

/*==============================================================*/
/* Index: BILLINGINFOOWNER_FK                                   */
/*==============================================================*/
create  index BILLINGINFOOWNER_FK on BILLINGINFORMATION (
CUSTOMERID
);

/*==============================================================*/
/* Table: BOARDGAMECOPIES                                       */
/*==============================================================*/
create table BOARDGAMECOPIES (
   BOARDGAMECOPYID      SERIAL               not null,
   BOARDGAMEID          INT4                 not null,
   constraint PK_BOARDGAMECOPIES primary key (BOARDGAMECOPYID)
);

/*==============================================================*/
/* Index: BOARDGAMECOPIES_PK                                    */
/*==============================================================*/
create unique index BOARDGAMECOPIES_PK on BOARDGAMECOPIES (
BOARDGAMECOPYID
);

/*==============================================================*/
/* Index: TYPE_FK                                               */
/*==============================================================*/
create  index TYPE_FK on BOARDGAMECOPIES (
BOARDGAMEID
);

/*==============================================================*/
/* Table: BOARDGAMES                                            */
/*==============================================================*/
create table BOARDGAMES (
   NAME                 CHAR(64)             not null,
   GENRE                CHAR(16)             not null
      constraint CKC_GENRE_BOARDGAM check (GENRE in ('CLASSIC','KIDS','RPG','EUROGAME','PARTYGAME','OTHER')),
   MINAGE               INT2                 null
      constraint CKC_MINAGE_BOARDGAM check (MINAGE is null or (MINAGE between 0 and 99)),
   MAXAGE               INT2                 null
      constraint CKC_MAXAGE_BOARDGAM check (MAXAGE is null or (MAXAGE between 0 and 99)),
   MINPLAYERS           INT2                 null,
   MAXPLAYERS           INT2                 null,
   SHORTDESCRIPTION     CHAR(256)            not null,
   BOARDGAMEID          SERIAL               not null,
   PUBLISHER            CHAR(16)             null,
   RELEASEYEAR          INT2                 null
      constraint CKC_RELEASEYEAR_BOARDGAM check (RELEASEYEAR is null or (RELEASEYEAR >= 1900)),
   constraint PK_BOARDGAMES primary key (BOARDGAMEID),
   check (MAXAGE >= MINAGE),
   check (MAXPLAYERS >= MINPLAYERS)
);

/*==============================================================*/
/* Index: BOARDGAMES_PK                                         */
/*==============================================================*/
create unique index BOARDGAMES_PK on BOARDGAMES (
BOARDGAMEID
);

/*==============================================================*/
/* Table: CUSTOMERS                                             */
/*==============================================================*/
create table CUSTOMERS (
   NAME                 CHAR(64)             not null,
   ADDRESS              CHAR(64)             null,
   CUSTOMERID           SERIAL               not null,
   USERNAME             CHAR(16)             not null unique,
   PASSWORDHASH         CHAR(64)             not null,
   constraint PK_CUSTOMERS primary key (CUSTOMERID)
);

/*==============================================================*/
/* Index: CUSTOMERS_PK                                          */
/*==============================================================*/
create unique index CUSTOMERS_PK on CUSTOMERS (
CUSTOMERID
);

/*==============================================================*/
/* Table: RENTALPROCESSES                                       */
/*==============================================================*/
create table RENTALPROCESSES (
   STARTDATE            DATE                 not null,
   ENDDATE              DATE                 not null,
   RETURNEDDATE         DATE                 null default NULL,
   RENTALPROCESSID      SERIAL               not null,
   BOARDGAMECOPYID      INT4                 not null,
   CUSTOMERID           INT4                 not null,
   MONEYDONATED         MONEY                not null default 0
      constraint CKC_MONEYDONATED_RENTALPR check (MONEYDONATED >= '$0.00'),
   WARNINGSISSUED       INT4                 not null default 0
      constraint CKC_WARNINGSISSUED_RENTALPR check (WARNINGSISSUED >= 0),
   constraint PK_RENTALPROCESSES primary key (RENTALPROCESSID),
   check (ENDDATE > STARTDATE),
   check (RETURNEDDATE is null or (RETURNEDDATE >= STARTDATE))
);

/*==============================================================*/
/* Index: RENTALPROCESSES_PK                                    */
/*==============================================================*/
create unique index RENTALPROCESSES_PK on RENTALPROCESSES (
RENTALPROCESSID
);

/*==============================================================*/
/* Index: RENTEDOBJECT_FK                                       */
/*==============================================================*/
create  index RENTEDOBJECT_FK on RENTALPROCESSES (
BOARDGAMECOPYID
);

/*==============================================================*/
/* Index: RENTINGPERSON_FK                                      */
/*==============================================================*/
create  index RENTINGPERSON_FK on RENTALPROCESSES (
CUSTOMERID
);

alter table BILLINGINFORMATION
   add constraint FK_BILLINGI_BILLINGIN_CUSTOMER foreign key (CUSTOMERID)
      references CUSTOMERS (CUSTOMERID)
      on delete restrict on update restrict;

alter table BOARDGAMECOPIES
   add constraint FK_BOARDGAM_TYPE_BOARDGAM foreign key (BOARDGAMEID)
      references BOARDGAMES (BOARDGAMEID)
      on delete restrict on update restrict;

alter table RENTALPROCESSES
   add constraint FK_RENTALPR_RENTEDOBJ_BOARDGAM foreign key (BOARDGAMECOPYID)
      references BOARDGAMECOPIES (BOARDGAMECOPYID)
      on delete restrict on update restrict;

alter table RENTALPROCESSES
   add constraint FK_RENTALPR_RENTINGPE_CUSTOMER foreign key (CUSTOMERID)
      references CUSTOMERS (CUSTOMERID)
      on delete restrict on update restrict;

