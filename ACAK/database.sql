/*==============================================================*/
/* DBMS name:      Sybase SQL Anywhere 12                       */
/* Created on:     29/10/2019 05:08:05                          */
/*==============================================================*/


if exists(select 1 from sys.sysforeignkey where role='FK_TB_DETAI_TERDAPAT_TB_SAMPA') then
    alter table TB_DETAIL_TRANSAISK
       delete foreign key FK_TB_DETAI_TERDAPAT_TB_SAMPA
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TB_DETAI_TERDAPAT2_TB_TRANS') then
    alter table TB_DETAIL_TRANSAISK
       delete foreign key FK_TB_DETAI_TERDAPAT2_TB_TRANS
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TB_LOGIN_MEMILIKI3_TB_NASAB') then
    alter table TB_LOGIN
       delete foreign key FK_TB_LOGIN_MEMILIKI3_TB_NASAB
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TB_NASAB_MEMILIKI4_TB_LOGIN') then
    alter table TB_NASABAH
       delete foreign key FK_TB_NASAB_MEMILIKI4_TB_LOGIN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TB_NASAB_MEMILIKI6_TB_REKEN') then
    alter table TB_NASABAH
       delete foreign key FK_TB_NASAB_MEMILIKI6_TB_REKEN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TB_PETUG_MEMILIKI7_TB_LOGIN') then
    alter table TB_PETUGAS
       delete foreign key FK_TB_PETUG_MEMILIKI7_TB_LOGIN
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TB_REKEN_MEMILIKI5_TB_NASAB') then
    alter table TB_REKENIG
       delete foreign key FK_TB_REKEN_MEMILIKI5_TB_NASAB
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_TB_TRANS_MELAKUKAN_TB_REKEN') then
    alter table TB_TRANSAKSI
       delete foreign key FK_TB_TRANS_MELAKUKAN_TB_REKEN
end if;

drop index if exists TB_DETAIL_TRANSAISK.TERDAPAT2_FK;

drop index if exists TB_DETAIL_TRANSAISK.TERDAPAT_PK;

drop table if exists TB_DETAIL_TRANSAISK;

drop index if exists TB_KATEGORI.TB_KATEGORI_PK;

drop table if exists TB_KATEGORI;

drop index if exists TB_LOGIN.MEMILIKI3_FK;

drop index if exists TB_LOGIN.TB_LOGIN_PK;

drop table if exists TB_LOGIN;

drop index if exists TB_NASABAH.MEMILIKI4_FK;

drop index if exists TB_NASABAH.MEMILIKI2_FK;

drop index if exists TB_NASABAH.TB_NASABAH_PK;

drop table if exists TB_NASABAH;

drop index if exists TB_PETUGAS.MEMILIKI5_FK;

drop index if exists TB_PETUGAS.TB_PETUGAS_PK;

drop table if exists TB_PETUGAS;

drop index if exists TB_REKENIG.MEMILIKI_FK;

drop index if exists TB_REKENIG.TB_REKENIG_PK;

drop table if exists TB_REKENIG;

drop index if exists TB_SAMPAH.TB_SAMPAH_PK;

drop table if exists TB_SAMPAH;

drop index if exists TB_TRANSAKSI.MELAKUKAN_FK;

drop index if exists TB_TRANSAKSI.TB_TRANSAKSI_PK;

drop table if exists TB_TRANSAKSI;

/*==============================================================*/
/* Table: TB_DETAIL_TRANSAISK                                   */
/*==============================================================*/
create table TB_DETAIL_TRANSAISK 
(
   ID_SAMPAH            varchar(10)                    not null,
   ID_TRANSAKSI         varchar(10)                    not null,
   BERAT_SAMPAH         decimal                        null,
   HARGA                float                          null,
   HARGA_TRANSAKSI      float                          null,
   constraint PK_TB_DETAIL_TRANSAISK primary key clustered (ID_SAMPAH, ID_TRANSAKSI)
);

/*==============================================================*/
/* Index: TERDAPAT_PK                                           */
/*==============================================================*/
create unique clustered index TERDAPAT_PK on TB_DETAIL_TRANSAISK (
ID_SAMPAH ASC,
ID_TRANSAKSI ASC
);

/*==============================================================*/
/* Index: TERDAPAT2_FK                                          */
/*==============================================================*/
create index TERDAPAT2_FK on TB_DETAIL_TRANSAISK (
ID_TRANSAKSI ASC
);

/*==============================================================*/
/* Table: TB_KATEGORI                                           */
/*==============================================================*/
create table TB_KATEGORI 
(
   ID_KETGORI           varchar(10)                    not null,
   JENIS_KATEGORI       varchar(50)                    null,
   SATUAN               varchar(50)                    null,
   constraint PK_TB_KATEGORI primary key (ID_KETGORI)
);

/*==============================================================*/
/* Index: TB_KATEGORI_PK                                        */
/*==============================================================*/
create unique index TB_KATEGORI_PK on TB_KATEGORI (
ID_KETGORI ASC
);

/*==============================================================*/
/* Table: TB_LOGIN                                              */
/*==============================================================*/
create table TB_LOGIN 
(
   ID_LOGIN             integer                        not null,
   ID_NASABAH           varchar(10)                    null,
   ID_PETUGAS           varchar(10)                    null,
   USERNAME             varchar(50)                    null,
   PASSWORD             varchar(255)                   null,
   AKSES                varchar(7)                     null,
   constraint PK_TB_LOGIN primary key (ID_LOGIN)
);

/*==============================================================*/
/* Index: TB_LOGIN_PK                                           */
/*==============================================================*/
create unique index TB_LOGIN_PK on TB_LOGIN (
ID_LOGIN ASC
);

/*==============================================================*/
/* Index: MEMILIKI3_FK                                          */
/*==============================================================*/
create index MEMILIKI3_FK on TB_LOGIN (
ID_NASABAH ASC
);

/*==============================================================*/
/* Table: TB_NASABAH                                            */
/*==============================================================*/
create table TB_NASABAH 
(
   ID_NASABAH           varchar(10)                    not null,
   ID_REKENING          varchar(10)                    null,
   ID_LOGIN             integer                        null,
   NAMA_NASABAH         varchar(50)                    null,
   JENIS_KELAMIN_NASABAH varchar(10)                    null,
   HP_NASABAH           varchar(13)                    null,
   ALAMAT_NASABAH       varchar(255)                   null,
   STATUS_NASABAH       varchar(11)                    null,
   TANGGAL_BUAT_NASABAH date                           null,
   constraint PK_TB_NASABAH primary key (ID_NASABAH)
);

/*==============================================================*/
/* Index: TB_NASABAH_PK                                         */
/*==============================================================*/
create unique index TB_NASABAH_PK on TB_NASABAH (
ID_NASABAH ASC
);

/*==============================================================*/
/* Index: MEMILIKI2_FK                                          */
/*==============================================================*/
create index MEMILIKI2_FK on TB_NASABAH (
ID_REKENING ASC
);

/*==============================================================*/
/* Index: MEMILIKI4_FK                                          */
/*==============================================================*/
create index MEMILIKI4_FK on TB_NASABAH (
ID_LOGIN ASC
);

/*==============================================================*/
/* Table: TB_PETUGAS                                            */
/*==============================================================*/
create table TB_PETUGAS 
(
   ID_PETUGAS           varchar(10)                    not null,
   ID_LOGIN             integer                        null,
   NAMA_PETUGAS         varchar(50)                    null,
   JENIS_KELAMIN_PETUGAS varchar(10)                    null,
   HP_PETUGAS           varchar(12)                    null,
   ALAMAT_PETUGAS       varchar(255)                   null,
   STATUS_PETUGAS       varchar(11)                    null,
   TANGGAL_BUAT_PETUGAS date                           null,
   constraint PK_TB_PETUGAS primary key (ID_PETUGAS)
);

/*==============================================================*/
/* Index: TB_PETUGAS_PK                                         */
/*==============================================================*/
create unique index TB_PETUGAS_PK on TB_PETUGAS (
ID_PETUGAS ASC
);

/*==============================================================*/
/* Index: MEMILIKI5_FK                                          */
/*==============================================================*/
create index MEMILIKI5_FK on TB_PETUGAS (
ID_LOGIN ASC
);

/*==============================================================*/
/* Table: TB_REKENIG                                            */
/*==============================================================*/
create table TB_REKENIG 
(
   ID_REKENING          varchar(10)                    not null,
   ID_NASABAH           varchar(10)                    null,
   SALDO_REKENING       integer                        null,
   constraint PK_TB_REKENIG primary key (ID_REKENING)
);

/*==============================================================*/
/* Index: TB_REKENIG_PK                                         */
/*==============================================================*/
create unique index TB_REKENIG_PK on TB_REKENIG (
ID_REKENING ASC
);

/*==============================================================*/
/* Index: MEMILIKI_FK                                           */
/*==============================================================*/
create index MEMILIKI_FK on TB_REKENIG (
ID_NASABAH ASC
);

/*==============================================================*/
/* Table: TB_SAMPAH                                             */
/*==============================================================*/
create table TB_SAMPAH 
(
   ID_SAMPAH            varchar(10)                    not null,
   NAMA_SAMPAH          varchar(50)                    null,
   HARGA_SAMPAH         float                          null,
   KETERANGAN           varchar(255)                   null,
   constraint PK_TB_SAMPAH primary key (ID_SAMPAH)
);

/*==============================================================*/
/* Index: TB_SAMPAH_PK                                          */
/*==============================================================*/
create unique index TB_SAMPAH_PK on TB_SAMPAH (
ID_SAMPAH ASC
);

/*==============================================================*/
/* Table: TB_TRANSAKSI                                          */
/*==============================================================*/
create table TB_TRANSAKSI 
(
   ID_TRANSAKSI         varchar(10)                    not null,
   ID_REKENING          varchar(10)                    not null,
   ID_PETUGAS           varchar(10)                    not null,
   TANGGAL_TRANSAKSI    date                           null,
   TIPE_TRANSAKSI       varchar(10)                    null,
   TOTAL_SETORAN        decimal                        null,
   TOTAL_PERANRIKAN     decimal                        null,
   constraint PK_TB_TRANSAKSI primary key (ID_TRANSAKSI)
);

/*==============================================================*/
/* Index: TB_TRANSAKSI_PK                                       */
/*==============================================================*/
create unique index TB_TRANSAKSI_PK on TB_TRANSAKSI (
ID_TRANSAKSI ASC
);

/*==============================================================*/
/* Index: MELAKUKAN_FK                                          */
/*==============================================================*/
create index MELAKUKAN_FK on TB_TRANSAKSI (
ID_REKENING ASC
);

alter table TB_DETAIL_TRANSAISK
   add constraint FK_TB_DETAI_TERDAPAT_TB_SAMPA foreign key (ID_SAMPAH)
      references TB_SAMPAH (ID_SAMPAH)
      on update restrict
      on delete restrict;

alter table TB_DETAIL_TRANSAISK
   add constraint FK_TB_DETAI_TERDAPAT2_TB_TRANS foreign key (ID_TRANSAKSI)
      references TB_TRANSAKSI (ID_TRANSAKSI)
      on update restrict
      on delete restrict;

alter table TB_LOGIN
   add constraint FK_TB_LOGIN_MEMILIKI3_TB_NASAB foreign key (ID_NASABAH)
      references TB_NASABAH (ID_NASABAH)
      on update restrict
      on delete restrict;

alter table TB_NASABAH
   add constraint FK_TB_NASAB_MEMILIKI4_TB_LOGIN foreign key (ID_LOGIN)
      references TB_LOGIN (ID_LOGIN)
      on update restrict
      on delete restrict;

alter table TB_NASABAH
   add constraint FK_TB_NASAB_MEMILIKI6_TB_REKEN foreign key (ID_REKENING)
      references TB_REKENIG (ID_REKENING)
      on update restrict
      on delete restrict;

alter table TB_PETUGAS
   add constraint FK_TB_PETUG_MEMILIKI7_TB_LOGIN foreign key (ID_LOGIN)
      references TB_LOGIN (ID_LOGIN)
      on update restrict
      on delete restrict;

alter table TB_REKENIG
   add constraint FK_TB_REKEN_MEMILIKI5_TB_NASAB foreign key (ID_NASABAH)
      references TB_NASABAH (ID_NASABAH)
      on update restrict
      on delete restrict;

alter table TB_TRANSAKSI
   add constraint FK_TB_TRANS_MELAKUKAN_TB_REKEN foreign key (ID_REKENING)
      references TB_REKENIG (ID_REKENING)
      on update restrict
      on delete restrict;

