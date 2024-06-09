-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2023-02-22 03:53:57 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tf_boleta (
    id_doc_venta NUMBER(4) NOT NULL,
    total        NUMBER(4, 2) NOT NULL,
    persona_dni  NUMBER(8) NOT NULL
);

COMMENT ON COLUMN tf_boleta.id_doc_venta IS
    'Código del documento de venta.';

COMMENT ON COLUMN tf_boleta.total IS
    'Total a pagar, sin mostrar el IGV';

COMMENT ON COLUMN tf_boleta.persona_dni IS
    'DNI de la persona que realizó la compra.';

ALTER TABLE tf_boleta ADD CONSTRAINT tf_boleta_pk PRIMARY KEY ( id_doc_venta );

CREATE TABLE tf_categoria (
    id_categoria NUMBER(4) NOT NULL,
    nombre       VARCHAR2(20 BYTE) NOT NULL
);

COMMENT ON COLUMN tf_categoria.id_categoria IS
    'Código de la categoría.';

COMMENT ON COLUMN tf_categoria.nombre IS
    'Nombre de la categoría.';

ALTER TABLE tf_categoria ADD CONSTRAINT tf_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE tf_cliente (
    id_cliente   NUMBER(4) NOT NULL,
    direccion    VARCHAR2(20 BYTE) NOT NULL,
    telefono     VARCHAR2(20 BYTE) NOT NULL,
    correo       VARCHAR2(20 BYTE) NOT NULL,
    tipo_cliente CHAR(1 CHAR) NOT NULL
);

--  ERROR: No Discriminator Column found in Arc FKArc_1 - check constraint cannot be generated 

COMMENT ON COLUMN tf_cliente.id_cliente IS
    'Código del cliente.';

COMMENT ON COLUMN tf_cliente.direccion IS
    'Dirección del cliente.';

COMMENT ON COLUMN tf_cliente.telefono IS
    'Número de teléfono del cliente.';

COMMENT ON COLUMN tf_cliente.correo IS
    'Correo electrónico del cliente.';

COMMENT ON COLUMN tf_cliente.tipo_cliente IS
    'Tipo de cliente. ''P'': Persona o ''E'': Empresa.';

ALTER TABLE tf_cliente ADD CONSTRAINT tf_cliente_pk PRIMARY KEY ( id_cliente );

CREATE TABLE tf_detalle_compra (
    id_compra     NUMBER(4) NOT NULL,
    id_producto   NUMBER(4) NOT NULL,
    cantidad      NUMBER(4) NOT NULL,
    precio_compra NUMBER(4, 2) NOT NULL,
    subtotal      NUMBER(4, 2) NOT NULL,
    id_moneda     CHAR(1 CHAR) NOT NULL
);

COMMENT ON COLUMN tf_detalle_compra.id_compra IS
    'Código de la compra a detallar.';

COMMENT ON COLUMN tf_detalle_compra.id_producto IS
    'Código del producto incluido en el detalle.';

COMMENT ON COLUMN tf_detalle_compra.cantidad IS
    'Cantidad solicitada al proveedor de un producto.';

COMMENT ON COLUMN tf_detalle_compra.precio_compra IS
    'Precio al que vende el producto el proveedor.';

COMMENT ON COLUMN tf_detalle_compra.subtotal IS
    'Precio del producto por la cantidad a comprar.';

COMMENT ON COLUMN tf_detalle_compra.id_moneda IS
    'Código de la moneda en que se va a pagar.';

ALTER TABLE tf_detalle_compra ADD CONSTRAINT tf_detalle_compra_pk PRIMARY KEY ( id_compra,
                                                                                id_producto );

CREATE TABLE tf_detalle_venta (
    id_venta     NUMBER(4) NOT NULL,
    id_producto  NUMBER(4) NOT NULL,
    cantidad     NUMBER(4) NOT NULL,
    precio_venta NUMBER(4, 2) NOT NULL,
    subtotal     NUMBER(4, 2) NOT NULL,
    id_moneda    CHAR(1 CHAR) NOT NULL
);

COMMENT ON COLUMN tf_detalle_venta.id_venta IS
    'Código de la oden de venta a detallar.';

COMMENT ON COLUMN tf_detalle_venta.id_producto IS
    'Código del producto incluido en la orden de venta.';

COMMENT ON COLUMN tf_detalle_venta.cantidad IS
    'Cantidad a vender al cliente.';

COMMENT ON COLUMN tf_detalle_venta.precio_venta IS
    'Precio del producto a vender.';

COMMENT ON COLUMN tf_detalle_venta.subtotal IS
    'Precio del producto por la cantidad solicitada.';

COMMENT ON COLUMN tf_detalle_venta.id_moneda IS
    'Código de la moneda en la que se va a pagar.';

ALTER TABLE tf_detalle_venta ADD CONSTRAINT tf_detalle_venta_pk PRIMARY KEY ( id_producto,
                                                                              id_venta );

CREATE TABLE tf_doc_venta (
    id_doc_venta NUMBER(4) NOT NULL,
    fecha        DATE NOT NULL,
    tipo_doc     CHAR(1 CHAR) NOT NULL,
    id_cliente   NUMBER(4) NOT NULL,
    id_producto  NUMBER(4) NOT NULL,
    id_venta     NUMBER(4) NOT NULL
);

--  ERROR: No Discriminator Column found in Arc FKArc_2 - check constraint cannot be generated 

COMMENT ON COLUMN tf_doc_venta.id_doc_venta IS
    'Código del documento de venta.';

COMMENT ON COLUMN tf_doc_venta.fecha IS
    'Fecha de emisión de la boleta o factura.';

COMMENT ON COLUMN tf_doc_venta.tipo_doc IS
    'Tipo de documento de venta. ''B'': Boleta o ''F'': Factura.';

COMMENT ON COLUMN tf_doc_venta.id_cliente IS
    'Código del cliente para el respectivo documento de venta.';

COMMENT ON COLUMN tf_doc_venta.id_producto IS
    'Código del producto que se ha comprado.';

COMMENT ON COLUMN tf_doc_venta.id_venta IS
    'Código de la orden de venta.';

CREATE UNIQUE INDEX tf_doc_venta__idx ON
    tf_doc_venta (
        id_producto
    ASC,
        id_venta
    ASC );

ALTER TABLE tf_doc_venta ADD CONSTRAINT tf_doc_venta_pk PRIMARY KEY ( id_doc_venta );

CREATE TABLE tf_empresa (
    id_cliente   NUMBER(4) NOT NULL,
    ruc          NUMBER(11) NOT NULL,
    razon_social VARCHAR2(20 BYTE) NOT NULL
);

COMMENT ON COLUMN tf_empresa.id_cliente IS
    'Código del cliente.';

COMMENT ON COLUMN tf_empresa.ruc IS
    'RUC de la empresa.';

COMMENT ON COLUMN tf_empresa.razon_social IS
    'Nombre de la empresa.';

ALTER TABLE tf_empresa ADD CONSTRAINT tf_empresa_pk PRIMARY KEY ( id_cliente );

ALTER TABLE tf_empresa ADD CONSTRAINT tf_empresa_pkv1 UNIQUE ( ruc );

CREATE TABLE tf_factura (
    id_doc_venta NUMBER(4) NOT NULL,
    igv          NUMBER(4, 2) NOT NULL,
    total        NUMBER(4, 2) NOT NULL,
    empresa_ruc  NUMBER(11) NOT NULL
);

COMMENT ON COLUMN tf_factura.id_doc_venta IS
    'Código del documento de venta.';

COMMENT ON COLUMN tf_factura.igv IS
    'IGV del subtotal.';

COMMENT ON COLUMN tf_factura.total IS
    'Total a pagar.';

COMMENT ON COLUMN tf_factura.empresa_ruc IS
    'RUC de la empresa que realizó la compra.';

ALTER TABLE tf_factura ADD CONSTRAINT tf_factura_pk PRIMARY KEY ( id_doc_venta );

CREATE TABLE tf_factura_compra (
    id_factura    NUMBER(4) NOT NULL,
    fecha         DATE NOT NULL,
    igv           NUMBER(4, 2) NOT NULL,
    total         NUMBER(4, 2) NOT NULL,
    id_compra     NUMBER(4) NOT NULL,
    id_producto   NUMBER(4) NOT NULL,
    proveedor_ruc NUMBER(11) NOT NULL
);

COMMENT ON COLUMN tf_factura_compra.id_factura IS
    'Código de la factura que nos entrega el proveedor por la compra realizada.';

COMMENT ON COLUMN tf_factura_compra.fecha IS
    'Fecha de facturación.';

COMMENT ON COLUMN tf_factura_compra.igv IS
    'IGV del subtotal.';

COMMENT ON COLUMN tf_factura_compra.total IS
    'Total a pagar.';

COMMENT ON COLUMN tf_factura_compra.id_compra IS
    'Código de la orden de compra que ha sido facturada.';

COMMENT ON COLUMN tf_factura_compra.id_producto IS
    'Código del producto que ha sido facturado.';

COMMENT ON COLUMN tf_factura_compra.proveedor_ruc IS
    'RUC del proveedor al que le hemos comprado los productos.';

CREATE UNIQUE INDEX tf_factura_compra__idx ON
    tf_factura_compra (
        id_compra
    ASC,
        id_producto
    ASC );

ALTER TABLE tf_factura_compra ADD CONSTRAINT tf_factura_compra_pk PRIMARY KEY ( id_factura );

CREATE TABLE tf_marca (
    id_marca NUMBER(4) NOT NULL,
    nombre   VARCHAR2(20 BYTE) NOT NULL
);

COMMENT ON COLUMN tf_marca.id_marca IS
    'Código de la marca.';

COMMENT ON COLUMN tf_marca.nombre IS
    'Nombre de la marca.';

ALTER TABLE tf_marca ADD CONSTRAINT tf_marca_pk PRIMARY KEY ( id_marca );

CREATE TABLE tf_moneda (
    id_moneda CHAR(1 CHAR) NOT NULL,
    nombre    VARCHAR2(20 BYTE) NOT NULL
);

COMMENT ON COLUMN tf_moneda.id_moneda IS
    'Código de la moneda. ''S'': Soles o ''D'': Dólares.';

COMMENT ON COLUMN tf_moneda.nombre IS
    'Nombre de la moneda.';

ALTER TABLE tf_moneda ADD CONSTRAINT tf_moneda_pk PRIMARY KEY ( id_moneda );

CREATE TABLE tf_orden_compra (
    id_compra     NUMBER(4) NOT NULL,
    fecha         DATE NOT NULL,
    estado        CHAR(1 CHAR) NOT NULL,
    proveedor_ruc NUMBER(11) NOT NULL
);

COMMENT ON COLUMN tf_orden_compra.id_compra IS
    'Código de la orden de compra hecha al proveedor.';

COMMENT ON COLUMN tf_orden_compra.fecha IS
    'Fecha en la que se realizó la orden de compra al proveedor.';

COMMENT ON COLUMN tf_orden_compra.estado IS
    'Estado de la orden de compra. ''S'': Solicitado o ''E'': Entregado.';

COMMENT ON COLUMN tf_orden_compra.proveedor_ruc IS
    'RUC del proveedor al que hemos realizado la orden de compra.';

ALTER TABLE tf_orden_compra ADD CONSTRAINT tf_orden_compra_pk PRIMARY KEY ( id_compra );

CREATE TABLE tf_orden_venta (
    id_venta    NUMBER(4) NOT NULL,
    fecha       DATE NOT NULL,
    estado      CHAR(1 CHAR) NOT NULL,
    id_cliente  NUMBER(4) NOT NULL,
    id_vendedor NUMBER(4) NOT NULL
);

COMMENT ON COLUMN tf_orden_venta.id_venta IS
    'Código de la orden de venta.';

COMMENT ON COLUMN tf_orden_venta.fecha IS
    'Fecha en la que se ordenó dicha venta.';

COMMENT ON COLUMN tf_orden_venta.estado IS
    'Estado de la orden de venta. ''P'': Proceso o ''T'': Terminada.';

COMMENT ON COLUMN tf_orden_venta.id_cliente IS
    'Código del cliente que realiza la orden de venta.';

COMMENT ON COLUMN tf_orden_venta.id_vendedor IS
    'Código del vendedor encargado de atender esa orden de venta.';

ALTER TABLE tf_orden_venta ADD CONSTRAINT tf_orden_venta_pk PRIMARY KEY ( id_venta );

CREATE TABLE tf_persona (
    id_cliente NUMBER(4) NOT NULL,
    dni        NUMBER(8) NOT NULL,
    nombres    VARCHAR2(20 BYTE) NOT NULL,
    apellidos  VARCHAR2(20 BYTE) NOT NULL
);

COMMENT ON COLUMN tf_persona.id_cliente IS
    'Código del cliente.';

COMMENT ON COLUMN tf_persona.dni IS
    'DNI de la persona.';

COMMENT ON COLUMN tf_persona.nombres IS
    'Nombres de la persona';

COMMENT ON COLUMN tf_persona.apellidos IS
    'Apellidos de la persona.';

ALTER TABLE tf_persona ADD CONSTRAINT tf_persona_pk PRIMARY KEY ( id_cliente );

ALTER TABLE tf_persona ADD CONSTRAINT tf_persona_pkv1 UNIQUE ( dni );

CREATE TABLE tf_producto (
    id_producto  NUMBER(4) NOT NULL,
    nombre       VARCHAR2(20 BYTE) NOT NULL,
    precio       NUMBER(4, 2) NOT NULL,
    stock        NUMBER(4) NOT NULL,
    id_marca     NUMBER(4) NOT NULL,
    id_categoria NUMBER(4) NOT NULL
);

COMMENT ON COLUMN tf_producto.id_producto IS
    'Código del producto.';

COMMENT ON COLUMN tf_producto.nombre IS
    'Nombre del producto.';

COMMENT ON COLUMN tf_producto.precio IS
    'Precio al que se vende el producto';

COMMENT ON COLUMN tf_producto.stock IS
    'Cantidad del producto en la tienda';

COMMENT ON COLUMN tf_producto.id_marca IS
    'Código de la marca del producto.';

COMMENT ON COLUMN tf_producto.id_categoria IS
    'Código de la categoría del producto.';

ALTER TABLE tf_producto ADD CONSTRAINT tf_producto_pk PRIMARY KEY ( id_producto );

CREATE TABLE tf_proveedor (
    ruc          NUMBER(11) NOT NULL,
    razon_social VARCHAR2(20 BYTE) NOT NULL,
    direccion    VARCHAR2(20 BYTE) NOT NULL,
    telefono     VARCHAR2(20 BYTE) NOT NULL,
    correo       VARCHAR2(20 BYTE) NOT NULL
);

COMMENT ON COLUMN tf_proveedor.ruc IS
    'RUC del proveedor.';

COMMENT ON COLUMN tf_proveedor.razon_social IS
    'Nombre de la empresa proveedora.';

COMMENT ON COLUMN tf_proveedor.direccion IS
    'Dirección del proveedor.';

COMMENT ON COLUMN tf_proveedor.telefono IS
    'Número de teléfono del proveedor.';

COMMENT ON COLUMN tf_proveedor.correo IS
    'Correo electrónico del proveedor.';

ALTER TABLE tf_proveedor ADD CONSTRAINT tf_proveedor_pk PRIMARY KEY ( ruc );

CREATE TABLE tf_tipo_cambio (
    fecha         DATE NOT NULL,
    precio_compra NUMBER(4, 2) NOT NULL,
    precio_venta  NUMBER(4, 2) NOT NULL
);

COMMENT ON COLUMN tf_tipo_cambio.fecha IS
    'Fecha de registro para cierto tipo de cambio.';

COMMENT ON COLUMN tf_tipo_cambio.precio_compra IS
    'Precio de compra del dólar.';

COMMENT ON COLUMN tf_tipo_cambio.precio_venta IS
    'Precio de venta del dólar.';

ALTER TABLE tf_tipo_cambio ADD CONSTRAINT tf_tipo_cambio_pk PRIMARY KEY ( fecha );

CREATE TABLE tf_vendedor (
    id_vendedor NUMBER(4) NOT NULL,
    nombres     VARCHAR2(20 BYTE) NOT NULL,
    apellidos   VARCHAR2(20 BYTE) NOT NULL,
    dni         NUMBER(8) NOT NULL
);

COMMENT ON COLUMN tf_vendedor.id_vendedor IS
    'Código del vendedor.';

COMMENT ON COLUMN tf_vendedor.nombres IS
    'Nombres del vendedor.';

COMMENT ON COLUMN tf_vendedor.apellidos IS
    'Apellidos del vendedor.';

COMMENT ON COLUMN tf_vendedor.dni IS
    'DNI del vendedor.';

ALTER TABLE tf_vendedor ADD CONSTRAINT tf_vendedor_pk PRIMARY KEY ( id_vendedor );

ALTER TABLE tf_boleta
    ADD CONSTRAINT tf_boleta_doc_venta_fk FOREIGN KEY ( id_doc_venta )
        REFERENCES tf_doc_venta ( id_doc_venta );

ALTER TABLE tf_boleta
    ADD CONSTRAINT tf_boleta_per_fk FOREIGN KEY ( persona_dni )
        REFERENCES tf_persona ( dni );

ALTER TABLE tf_detalle_compra
    ADD CONSTRAINT tf_det_com_ord_fk FOREIGN KEY ( id_compra )
        REFERENCES tf_orden_compra ( id_compra );

ALTER TABLE tf_detalle_compra
    ADD CONSTRAINT tf_det_comp_mon_fk FOREIGN KEY ( id_moneda )
        REFERENCES tf_moneda ( id_moneda );

ALTER TABLE tf_detalle_compra
    ADD CONSTRAINT tf_det_comp_prod_fk FOREIGN KEY ( id_producto )
        REFERENCES tf_producto ( id_producto );

ALTER TABLE tf_detalle_venta
    ADD CONSTRAINT tf_det_vent_mon_fk FOREIGN KEY ( id_moneda )
        REFERENCES tf_moneda ( id_moneda );

ALTER TABLE tf_detalle_venta
    ADD CONSTRAINT tf_det_vent_orden_fk FOREIGN KEY ( id_venta )
        REFERENCES tf_orden_venta ( id_venta );

ALTER TABLE tf_detalle_venta
    ADD CONSTRAINT tf_det_vent_prod_fk FOREIGN KEY ( id_producto )
        REFERENCES tf_producto ( id_producto );

ALTER TABLE tf_doc_venta
    ADD CONSTRAINT tf_doc_venta_cli_fk FOREIGN KEY ( id_cliente )
        REFERENCES tf_cliente ( id_cliente );

ALTER TABLE tf_doc_venta
    ADD CONSTRAINT tf_doc_venta_detalle_fk FOREIGN KEY ( id_producto,
                                                         id_venta )
        REFERENCES tf_detalle_venta ( id_producto,
                                      id_venta );

ALTER TABLE tf_empresa
    ADD CONSTRAINT tf_empresa_fk FOREIGN KEY ( id_cliente )
        REFERENCES tf_cliente ( id_cliente );

ALTER TABLE tf_factura
    ADD CONSTRAINT tf_fac_emp_fk FOREIGN KEY ( empresa_ruc )
        REFERENCES tf_empresa ( ruc );

ALTER TABLE tf_factura_compra
    ADD CONSTRAINT tf_fact_comp_det_fk FOREIGN KEY ( id_compra,
                                                     id_producto )
        REFERENCES tf_detalle_compra ( id_compra,
                                       id_producto );

ALTER TABLE tf_factura_compra
    ADD CONSTRAINT tf_fact_comp_prov_fk FOREIGN KEY ( proveedor_ruc )
        REFERENCES tf_proveedor ( ruc );

ALTER TABLE tf_factura
    ADD CONSTRAINT tf_fact_doc_venta_fk FOREIGN KEY ( id_doc_venta )
        REFERENCES tf_doc_venta ( id_doc_venta );

ALTER TABLE tf_orden_compra
    ADD CONSTRAINT tf_ord_comp_fk FOREIGN KEY ( proveedor_ruc )
        REFERENCES tf_proveedor ( ruc );

ALTER TABLE tf_orden_venta
    ADD CONSTRAINT tf_ord_vent_cli_fk FOREIGN KEY ( id_cliente )
        REFERENCES tf_cliente ( id_cliente );

ALTER TABLE tf_orden_venta
    ADD CONSTRAINT tf_ord_vent_vend_fk FOREIGN KEY ( id_vendedor )
        REFERENCES tf_vendedor ( id_vendedor );

ALTER TABLE tf_persona
    ADD CONSTRAINT tf_persona_fk FOREIGN KEY ( id_cliente )
        REFERENCES tf_cliente ( id_cliente );

ALTER TABLE tf_producto
    ADD CONSTRAINT tf_prod_categ_fk FOREIGN KEY ( id_categoria )
        REFERENCES tf_categoria ( id_categoria );

ALTER TABLE tf_producto
    ADD CONSTRAINT tf_prod_marca_fk FOREIGN KEY ( id_marca )
        REFERENCES tf_marca ( id_marca );

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_1 - constraint trigger for Arc cannot be generated

--  ERROR: No Discriminator Column found in Arc FKArc_2 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc FKArc_2 - constraint trigger for Arc cannot be generated



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            18
-- CREATE INDEX                             2
-- ALTER TABLE                             41
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
-- ERRORS                                   6
-- WARNINGS                                 0
