-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2023-01-20 12:22:46 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE he_complemento_postre (
    id_complemento_pk NUMBER NOT NULL,
    nombre            VARCHAR2(50 BYTE) NOT NULL,
    descripcion       VARCHAR2(255 BYTE) NOT NULL,
    stock             NUMBER NOT NULL,
    precio            NUMBER NOT NULL
);

COMMENT ON COLUMN he_complemento_postre.id_complemento_pk IS
    'Identificador del complemento.';

COMMENT ON COLUMN he_complemento_postre.nombre IS
    'Nombre del complemento añadido al postre.';

COMMENT ON COLUMN he_complemento_postre.descripcion IS
    'Descripción del complemento añadido (este texto será colocado en la heladería)';

COMMENT ON COLUMN he_complemento_postre.stock IS
    'Cantidad del complemento.';

COMMENT ON COLUMN he_complemento_postre.precio IS
    'Precio al que se venderá el complemento.';

ALTER TABLE he_complemento_postre ADD CONSTRAINT he_complemento_postre_pk PRIMARY KEY ( id_complemento_pk );

CREATE TABLE he_orden_produccion (
    id_orden_pk    NUMBER NOT NULL,
    id_sabor_fk    NUMBER NOT NULL,
    cantidad       NUMBER(7, 2) NOT NULL,
    hora_solicitud TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
    termino_plan   TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
    termino_real   TIMESTAMP WITH LOCAL TIME ZONE,
    estado         CHAR(6 BYTE) NOT NULL
);

COMMENT ON COLUMN he_orden_produccion.id_orden_pk IS
    'Identificador de la orden.';

COMMENT ON COLUMN he_orden_produccion.id_sabor_fk IS
    'Nombre del sabor implicada en la orden.';

COMMENT ON COLUMN he_orden_produccion.cantidad IS
    'Cantidad de lotes a producir en la orden.';

COMMENT ON COLUMN he_orden_produccion.hora_solicitud IS
    'Fecha y hora de la solicitud de orden.';

COMMENT ON COLUMN he_orden_produccion.termino_plan IS
    'Fecha y hora del término de producción de orden planificada.';

COMMENT ON COLUMN he_orden_produccion.termino_real IS
    'Fecha y hora del término de producción de orden real (al inicio se deja en nulo).';

COMMENT ON COLUMN he_orden_produccion.estado IS
    'Identificador del estado de la categoría de producto:
''S'': Solicitada.
''T'': Terminada.';

ALTER TABLE he_orden_produccion ADD CONSTRAINT he_orden_produccion_pk PRIMARY KEY ( id_orden_pk );

CREATE TABLE he_pedido (
    id_pedido_pk NUMBER NOT NULL,
    precio       NUMBER NOT NULL
);

COMMENT ON COLUMN he_pedido.id_pedido_pk IS
    'Identificador de la asociación producto-insumo.';

COMMENT ON COLUMN he_pedido.precio IS
    'Precio total del producto.';

ALTER TABLE he_pedido ADD CONSTRAINT he_pedido_pk PRIMARY KEY ( id_pedido_pk );

CREATE TABLE he_pedido_postre (
    id_pedido_postre_pk NUMBER NOT NULL,
    id_pedido_fk        NUMBER NOT NULL,
    id_postre_fk        NUMBER NOT NULL,
    id_complemento_fk   NUMBER
);

COMMENT ON COLUMN he_pedido_postre.id_pedido_postre_pk IS
    'Identificador del pedido junto con los postres q van en él.';

COMMENT ON COLUMN he_pedido_postre.id_pedido_fk IS
    'Identificador del pedido.';

COMMENT ON COLUMN he_pedido_postre.id_postre_fk IS
    'Identificador del postre.';

COMMENT ON COLUMN he_pedido_postre.id_complemento_fk IS
    'Identificador del complemento';

ALTER TABLE he_pedido_postre ADD CONSTRAINT he_pedido_postre_pk PRIMARY KEY ( id_pedido_postre_pk );

CREATE TABLE he_postre (
    id_postre_pk NUMBER NOT NULL,
    nombre       VARCHAR2(50 BYTE) NOT NULL,
    descripcion  VARCHAR2(255 BYTE) NOT NULL,
    numero_bolas NUMBER NOT NULL,
    precio       NUMBER(6, 2) NOT NULL,
    estado       CHAR(1 BYTE) NOT NULL
);

COMMENT ON COLUMN he_postre.id_postre_pk IS
    'Identificador de la categoría de postre.';

COMMENT ON COLUMN he_postre.nombre IS
    'Nombre del postre.';

COMMENT ON COLUMN he_postre.descripcion IS
    'Descripción del postre (este texto será colocado en el menú de la heladería).';

COMMENT ON COLUMN he_postre.numero_bolas IS
    'Número de bolas de helado que componen al postre.';

COMMENT ON COLUMN he_postre.precio IS
    'Precio de venta base a las empresas asociadas.';

COMMENT ON COLUMN he_postre.estado IS
    'Identificador del estado de la categoría de producto:
''A'': Activo.
''I'': Inactivo.';

ALTER TABLE he_postre ADD CONSTRAINT he_postre_pk PRIMARY KEY ( id_postre_pk );

CREATE TABLE he_postre_sabor (
    id_postre_sabor         NUMBER NOT NULL,
    id_rel_pedido_postre_fk NUMBER NOT NULL,
    id_sabor_fk             NUMBER NOT NULL,
    numero_bolas            NUMBER NOT NULL
);

COMMENT ON COLUMN he_postre_sabor.id_postre_sabor IS
    'Identificador de los sabores que van en el postre.';

COMMENT ON COLUMN he_postre_sabor.id_rel_pedido_postre_fk IS
    'Identificador de la relación entre el pedido y el postre';

COMMENT ON COLUMN he_postre_sabor.id_sabor_fk IS
    'Identificador del sabor.';

COMMENT ON COLUMN he_postre_sabor.numero_bolas IS
    'Número de bolas de cada sabor.';

ALTER TABLE he_postre_sabor ADD CONSTRAINT he_postre_sabor_pk PRIMARY KEY ( id_postre_sabor );

CREATE TABLE he_sabor (
    id_sabor_pk NUMBER NOT NULL,
    nombre      VARCHAR2(50 BYTE) NOT NULL,
    descripcion VARCHAR2(255 BYTE) NOT NULL,
    stock       NUMBER(7, 2) NOT NULL,
    estado      CHAR(6 BYTE) NOT NULL
);

COMMENT ON COLUMN he_sabor.id_sabor_pk IS
    'Identificador del sabor.';

COMMENT ON COLUMN he_sabor.nombre IS
    'Nombre del sabor.';

COMMENT ON COLUMN he_sabor.descripcion IS
    'Descripción breve del sabor.';

COMMENT ON COLUMN he_sabor.stock IS
    'Cantidad de helado contenida en un lote (en galones).';

COMMENT ON COLUMN he_sabor.estado IS
    'Identificador del estado de la categoría de producto:
''A'': Actualmente se usa.
''D'': Fuera de producción.';

ALTER TABLE he_sabor ADD CONSTRAINT he_sabor_pk PRIMARY KEY ( id_sabor_pk );

ALTER TABLE he_pedido_postre
    ADD CONSTRAINT id_complemento_postre_fk FOREIGN KEY ( id_complemento_fk )
        REFERENCES he_complemento_postre ( id_complemento_pk );

ALTER TABLE he_pedido_postre
    ADD CONSTRAINT id_pedido_fk FOREIGN KEY ( id_pedido_fk )
        REFERENCES he_pedido ( id_pedido_pk );

ALTER TABLE he_postre_sabor
    ADD CONSTRAINT id_pedido_postre_fk FOREIGN KEY ( id_rel_pedido_postre_fk )
        REFERENCES he_pedido_postre ( id_pedido_postre_pk );

ALTER TABLE he_pedido_postre
    ADD CONSTRAINT id_postre_fk FOREIGN KEY ( id_postre_fk )
        REFERENCES he_postre ( id_postre_pk );

ALTER TABLE he_orden_produccion
    ADD CONSTRAINT id_sabor_fk FOREIGN KEY ( id_sabor_fk )
        REFERENCES he_sabor ( id_sabor_pk );

ALTER TABLE he_postre_sabor
    ADD CONSTRAINT id_sabor_fkv2 FOREIGN KEY ( id_sabor_fk )
        REFERENCES he_sabor ( id_sabor_pk );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
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
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
