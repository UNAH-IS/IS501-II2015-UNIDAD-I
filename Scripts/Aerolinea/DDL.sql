-- Generated by Oracle SQL Developer Data Modeler 4.1.0.866
--   at:        2015-08-04 14:49:18 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE AEROLINEA.TBL_ASIENTOS
  (
    CODIGO_ASIENTO      INTEGER NOT NULL ,
    ALIAS_ASIENTO       VARCHAR2 (10) NOT NULL ,
    CODIGO_AVION        INTEGER NOT NULL ,
    CODIGO_TIPO_ASIENTO INTEGER NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_ASIENTOS ADD CONSTRAINT TBL_ASIENTOS_PK PRIMARY KEY ( CODIGO_ASIENTO ) ;

CREATE TABLE AEROLINEA.TBL_AVIONES
  (
    CODIGO_AVION      INTEGER NOT NULL ,
    REGISTRO          VARCHAR2 (150) NOT NULL ,
    CANTIDAD_ASIENTOS INTEGER ,
    CODIGO_MARCA      INTEGER NOT NULL ,
    CODIGO_MODELO     INTEGER NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_AVIONES ADD CONSTRAINT TBL_AVIONES_PK PRIMARY KEY ( CODIGO_AVION ) ;

CREATE TABLE AEROLINEA.TBL_CARGOS_TRIPULANTES
  (
    CODIGO_CARGO INTEGER NOT NULL ,
    NOMBRE_CARGO VARCHAR2 (150)
  ) ;
ALTER TABLE AEROLINEA.TBL_CARGOS_TRIPULANTES ADD CONSTRAINT TBL_CARGOS_TRIP_PK PRIMARY KEY ( CODIGO_CARGO ) ;

CREATE TABLE AEROLINEA.TBL_CLASES_SOCIALES
  (
    CODIGO_CLASE INTEGER NOT NULL ,
    NOMBRE_CLASE VARCHAR2 (200)
  ) ;
ALTER TABLE AEROLINEA.TBL_CLASES_SOCIALES ADD CONSTRAINT TBL_CLASES_SOCIALES_PK PRIMARY KEY ( CODIGO_CLASE ) ;

CREATE TABLE AEROLINEA.TBL_FACTURAS
  (
    CODIGO_FACTURA  INTEGER NOT NULL ,
    COSTO_TOTAL     NUMBER NOT NULL ,
    TOTAL_IMPUESTOS NUMBER NOT NULL ,
    FECHA           DATE NOT NULL ,
    FACTURADO       CHAR (1) NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_FACTURAS ADD CONSTRAINT TBL_FACTURAS_TICKETS_PK PRIMARY KEY ( CODIGO_FACTURA ) ;

CREATE TABLE AEROLINEA.TBL_FACTURA_DETALLE
  (
    CODIGO_FACTURA  INTEGER NOT NULL ,
    CODIGO_VUELO    INTEGER NOT NULL ,
    CODIGO_CLASE    INTEGER NOT NULL ,
    CODIGO_PASAJERO INTEGER NOT NULL ,
    CODIGO_ASIENTO  INTEGER NOT NULL ,
    TICKET          VARCHAR2 (100) NOT NULL ,
    COSTO_TICKET    NUMBER NOT NULL ,
    DESCUENTO       NUMBER
  ) ;
ALTER TABLE AEROLINEA.TBL_FACTURA_DETALLE ADD CONSTRAINT TBL_FACTURA_DETALLE_PK PRIMARY KEY ( CODIGO_FACTURA, CODIGO_VUELO, CODIGO_CLASE, CODIGO_PASAJERO, CODIGO_ASIENTO ) ;

CREATE TABLE AEROLINEA.TBL_MARCAS
  (
    CODIGO_MARCA INTEGER NOT NULL ,
    NOMBRE_MARCA VARCHAR2 (150) NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_MARCAS ADD CONSTRAINT TBL_MARCAS_PK PRIMARY KEY ( CODIGO_MARCA ) ;

CREATE TABLE AEROLINEA.TBL_MODELOS
  (
    CODIGO_MODELO INTEGER NOT NULL ,
    NOMBRE_MODELO VARCHAR2 (150) NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_MODELOS ADD CONSTRAINT TBL_MODELOS_PK PRIMARY KEY ( CODIGO_MODELO ) ;

CREATE TABLE AEROLINEA.TBL_PASAJEROS
  (
    CODIGO_PASAJERO INTEGER NOT NULL ,
    NOMBRE          VARCHAR2 (150) NOT NULL ,
    APELLIDO        VARCHAR2 (150) ,
    EDAD            INTEGER ,
    GENERO          VARCHAR2 (2)
  ) ;
ALTER TABLE AEROLINEA.TBL_PASAJEROS ADD CONSTRAINT TBL_PASAJEROS_PK PRIMARY KEY ( CODIGO_PASAJERO ) ;

CREATE TABLE AEROLINEA.TBL_PUNTOS_X_RUTAS
  (
    CODIGO_RUTA  INTEGER NOT NULL ,
    CODIGO_PUNTO INTEGER NOT NULL ,
    ORDEN_RUTA   INTEGER NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_PUNTOS_X_RUTAS ADD CONSTRAINT TBL_PUNTOS_X_RUTAS_PK PRIMARY KEY ( CODIGO_RUTA, CODIGO_PUNTO, ORDEN_RUTA ) ;

CREATE TABLE AEROLINEA.TBL_PUNTO_ESCALA
  (
    CODIGO_PUNTO INTEGER NOT NULL ,
    NOMBRE_PUNTO VARCHAR2 (250) NOT NULL ,
    LONGITUD     NUMBER NOT NULL ,
    LATITUD FLOAT NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_PUNTO_ESCALA ADD CONSTRAINT TBL_PUNTO_ESCALA_PK PRIMARY KEY ( CODIGO_PUNTO ) ;

CREATE TABLE AEROLINEA.TBL_RUTAS
  (
    CODIGO_RUTA             INTEGER NOT NULL ,
    ALIAS_RUTA              VARCHAR2 (4000) NOT NULL ,
    TIEMPO_PROMEDIO_MINUTOS NUMBER NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_RUTAS ADD CONSTRAINT TBL_RUTAS_PK PRIMARY KEY ( CODIGO_RUTA ) ;

CREATE TABLE AEROLINEA.TBL_TIPOS_ASIENTOS
  (
    CODIGO_TIPO_ASIENTO INTEGER NOT NULL ,
    TIPO_ASIENTO        VARCHAR2 (100)
  ) ;
ALTER TABLE AEROLINEA.TBL_TIPOS_ASIENTOS ADD CONSTRAINT TBL_TIPOS_ASIENTOS_PK PRIMARY KEY ( CODIGO_TIPO_ASIENTO ) ;

CREATE TABLE AEROLINEA.TBL_TRIPULACION
  (
    CODIGO_TRIPULANTE          INTEGER NOT NULL ,
    NOMBRE                     VARCHAR2 (150) NOT NULL ,
    CODIGO_TRIPULANTE_SUPERIOR INTEGER ,
    CODIGO_CARGO               INTEGER NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_TRIPULACION ADD CONSTRAINT TBL_TRIPULACION_PK PRIMARY KEY ( CODIGO_TRIPULANTE ) ;

CREATE TABLE AEROLINEA.TBL_TRIPULACION_X_VUELOS
  (
    CODIGO_VUELO      INTEGER NOT NULL ,
    CODIGO_TRIPULANTE INTEGER NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_TRIPULACION_X_VUELOS ADD CONSTRAINT TBL_TRIPULACION_X_VUELOS_PK PRIMARY KEY ( CODIGO_VUELO, CODIGO_TRIPULANTE ) ;

CREATE TABLE AEROLINEA.TBL_VUELOS
  (
    CODIGO_VUELO       INTEGER NOT NULL ,
    FECHA_HORA_PARTIDA DATE NOT NULL ,
    FECHA_HORA_LLEGADA DATE ,
    CODIGO_AVION       INTEGER NOT NULL ,
    CODIGO_RUTA        INTEGER NOT NULL
  ) ;
ALTER TABLE AEROLINEA.TBL_VUELOS ADD CONSTRAINT TBL_VUELOS_PK PRIMARY KEY ( CODIGO_VUELO ) ;

ALTER TABLE AEROLINEA.TBL_ASIENTOS ADD CONSTRAINT TBL_ASIE_TBL_AVIONES_FK FOREIGN KEY ( CODIGO_AVION ) REFERENCES AEROLINEA.TBL_AVIONES ( CODIGO_AVION ) ;

ALTER TABLE AEROLINEA.TBL_ASIENTOS ADD CONSTRAINT TBL_ASIE_TBL_TP_ASI_FK FOREIGN KEY ( CODIGO_TIPO_ASIENTO ) REFERENCES AEROLINEA.TBL_TIPOS_ASIENTOS ( CODIGO_TIPO_ASIENTO ) ;

ALTER TABLE AEROLINEA.TBL_AVIONES ADD CONSTRAINT TBL_AVIONES_TBL_MAR_FK FOREIGN KEY ( CODIGO_MARCA ) REFERENCES AEROLINEA.TBL_MARCAS ( CODIGO_MARCA ) ;

ALTER TABLE AEROLINEA.TBL_AVIONES ADD CONSTRAINT TBL_AVIONES_TBL_MOD_FK FOREIGN KEY ( CODIGO_MODELO ) REFERENCES AEROLINEA.TBL_MODELOS ( CODIGO_MODELO ) ;

ALTER TABLE AEROLINEA.TBL_FACTURA_DETALLE ADD CONSTRAINT TBL_FD_TBL_CS_FK FOREIGN KEY ( CODIGO_CLASE ) REFERENCES AEROLINEA.TBL_CLASES_SOCIALES ( CODIGO_CLASE ) ;

ALTER TABLE AEROLINEA.TBL_FACTURA_DETALLE ADD CONSTRAINT TBL_FD_TBL_F_FK FOREIGN KEY ( CODIGO_FACTURA ) REFERENCES AEROLINEA.TBL_FACTURAS ( CODIGO_FACTURA ) ;

ALTER TABLE AEROLINEA.TBL_FACTURA_DETALLE ADD CONSTRAINT TBL_FD_TBL_P_FK FOREIGN KEY ( CODIGO_PASAJERO ) REFERENCES AEROLINEA.TBL_PASAJEROS ( CODIGO_PASAJERO ) ;

ALTER TABLE AEROLINEA.TBL_FACTURA_DETALLE ADD CONSTRAINT TBL_FD_TBL_V_FK FOREIGN KEY ( CODIGO_VUELO ) REFERENCES AEROLINEA.TBL_VUELOS ( CODIGO_VUELO ) ;

ALTER TABLE AEROLINEA.TBL_FACTURA_DETALLE ADD CONSTRAINT TBL_F_DETALLE_TBL_ASIE_FK FOREIGN KEY ( CODIGO_ASIENTO ) REFERENCES AEROLINEA.TBL_ASIENTOS ( CODIGO_ASIENTO ) ;

ALTER TABLE AEROLINEA.TBL_PUNTOS_X_RUTAS ADD CONSTRAINT TBL_P_X_R_TBL_P_E_FK FOREIGN KEY ( CODIGO_PUNTO ) REFERENCES AEROLINEA.TBL_PUNTO_ESCALA ( CODIGO_PUNTO ) ;

ALTER TABLE AEROLINEA.TBL_PUNTOS_X_RUTAS ADD CONSTRAINT TBL_P_X_R_TBL_R_FK FOREIGN KEY ( CODIGO_RUTA ) REFERENCES AEROLINEA.TBL_RUTAS ( CODIGO_RUTA ) ;

ALTER TABLE AEROLINEA.TBL_TRIPULACION ADD CONSTRAINT TBL_TRIP_TBL_CARG_FK FOREIGN KEY ( CODIGO_CARGO ) REFERENCES AEROLINEA.TBL_CARGOS_TRIPULANTES ( CODIGO_CARGO ) ;

ALTER TABLE AEROLINEA.TBL_TRIPULACION ADD CONSTRAINT TBL_TRIP_TBL_TRIP_FK FOREIGN KEY ( CODIGO_TRIPULANTE_SUPERIOR ) REFERENCES AEROLINEA.TBL_TRIPULACION ( CODIGO_TRIPULANTE ) ;

ALTER TABLE AEROLINEA.TBL_TRIPULACION_X_VUELOS ADD CONSTRAINT TBL_TRIP_X_V_TBL_TRIP_FK FOREIGN KEY ( CODIGO_TRIPULANTE ) REFERENCES AEROLINEA.TBL_TRIPULACION ( CODIGO_TRIPULANTE ) ;

ALTER TABLE AEROLINEA.TBL_TRIPULACION_X_VUELOS ADD CONSTRAINT TBL_TRIP_X_V_TBL_V_FK FOREIGN KEY ( CODIGO_VUELO ) REFERENCES AEROLINEA.TBL_VUELOS ( CODIGO_VUELO ) ;

ALTER TABLE AEROLINEA.TBL_VUELOS ADD CONSTRAINT TBL_V_TBL_AVIONES_FK FOREIGN KEY ( CODIGO_AVION ) REFERENCES AEROLINEA.TBL_AVIONES ( CODIGO_AVION ) ;

ALTER TABLE AEROLINEA.TBL_VUELOS ADD CONSTRAINT TBL_V_TBL_RUTAS_FK FOREIGN KEY ( CODIGO_RUTA ) REFERENCES AEROLINEA.TBL_RUTAS ( CODIGO_RUTA ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            16
-- CREATE INDEX                             0
-- ALTER TABLE                             33
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
