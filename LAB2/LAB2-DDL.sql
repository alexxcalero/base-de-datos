CREATE TABLE HE_COMPLEMENTO_POSTRE (
    ID_COMPLEMENTO_POSTRE NUMBER NOT NULL,
    NOMBRE                VARCHAR2(50 BYTE) NOT NULL,
    DESCRIPCION           VARCHAR2(100 BYTE),
    STOCK                 NUMBER NOT NULL,
    PRECIO                NUMBER(7, 2) NOT NULL
);

COMMENT ON COLUMN HE_COMPLEMENTO_POSTRE.ID_COMPLEMENTO_POSTRE IS
    'IDENTIFICADOR DEL COMPLEMENTO DEL POSTRE.';

COMMENT ON COLUMN HE_COMPLEMENTO_POSTRE.NOMBRE IS
    'NOMBRE DEL COMPLEMENTO.';

COMMENT ON COLUMN HE_COMPLEMENTO_POSTRE.DESCRIPCION IS
    'DESCRIPCIÓN BREVE DEL COMPLEMENTO DE POSTRE.';

COMMENT ON COLUMN HE_COMPLEMENTO_POSTRE.STOCK IS
    'STOCK DLE COMPLEMENTO, EN PAQUETES.';

COMMENT ON COLUMN HE_COMPLEMENTO_POSTRE.PRECIO IS
    'PRECIO DE VENTA BASE.';

ALTER TABLE HE_COMPLEMENTO_POSTRE ADD CONSTRAINT HE_COMPLEMENTO_POSTRE_PK PRIMARY KEY ( ID_COMPLEMENTO_POSTRE );

CREATE TABLE HE_ORDEN_PRODUCCION (
    ID_ORDEN_PRODUCCION    NUMBER NOT NULL,
    ID_SABOR               NUMBER NOT NULL,
    CANTIDAD               NUMBER NOT NULL,
    FECHA_HORA_REGISTRO    DATE NOT NULL,
    FECHA_HORA_TERM_PLANIF DATE NOT NULL,
    FECHA_HORA_TERM_REAL   DATE,
    ESTADO                 CHAR(1 BYTE) NOT NULL
);

COMMENT ON COLUMN HE_ORDEN_PRODUCCION.ID_ORDEN_PRODUCCION IS
    'IDENTIFICADOR DE LA ORDEN.';

COMMENT ON COLUMN HE_ORDEN_PRODUCCION.ID_SABOR IS
    'IDENTIFICADOR DEL SABOR RELACIONADO A LA ORDEN.';

COMMENT ON COLUMN HE_ORDEN_PRODUCCION.CANTIDAD IS
    'CANTIDAD DE LOTES A PRODUCIR DE LA ORDEN.';

COMMENT ON COLUMN HE_ORDEN_PRODUCCION.FECHA_HORA_REGISTRO IS
    'FECHA Y HORA DE REGISTRO DE LA ORDEN.';

COMMENT ON COLUMN HE_ORDEN_PRODUCCION.FECHA_HORA_TERM_PLANIF IS
    'FECHA Y HORA PLANIFICADA DE TÉRMINO DE LA ORDEN.';

COMMENT ON COLUMN HE_ORDEN_PRODUCCION.FECHA_HORA_TERM_REAL IS
    'FECHA Y HORA REAL  DE TÉRMINO DE LA ORDEN.';

COMMENT ON COLUMN HE_ORDEN_PRODUCCION.ESTADO IS
    'ESTADO DE LA ORDEN. S'': SOLICITADA, ''T'': TERMINADA.';

ALTER TABLE HE_ORDEN_PRODUCCION ADD CONSTRAINT HE_ORDER_PRODUCCION_PK PRIMARY KEY ( ID_ORDEN_PRODUCCION );

CREATE TABLE HE_PEDIDO (
    ID_PEDIDO 		NUMBER NOT NULL,
    ID_CLIENTE		NUMBER NOT NULL,
    FECHA_PEDIDO	DATE NOT NULL,
    PRECIO    		NUMBER(7, 2) NOT NULL
);


COMMENT ON COLUMN HE_PEDIDO.ID_PEDIDO IS
    'IDENTIFICADOR DEL PEDIDO.';

COMMENT ON COLUMN HE_PEDIDO.PRECIO IS
    'PRECIO TOTAL DEL PEDIDO.';

ALTER TABLE HE_PEDIDO ADD CONSTRAINT HE_PEDIDO_PK PRIMARY KEY ( ID_PEDIDO );

CREATE TABLE HE_PEDIDO_POSTRE (
    ID_PEDIDO_POSTRE      NUMBER NOT NULL,
    ID_PEDIDO             NUMBER NOT NULL,
    ID_POSTRE             NUMBER NOT NULL,
    ID_COMPLEMENTO_POSTRE NUMBER DEFAULT NULL
);

COMMENT ON COLUMN HE_PEDIDO_POSTRE.ID_PEDIDO_POSTRE IS
    'IDENTIFICADOR DEL PEDIDO POR POSTRE.';

COMMENT ON COLUMN HE_PEDIDO_POSTRE.ID_PEDIDO IS
    'IDENTIFICADOR DEL PEDIDO.';

COMMENT ON COLUMN HE_PEDIDO_POSTRE.ID_POSTRE IS
    'IDENTIFICADOR DEL POSTRE.';

COMMENT ON COLUMN HE_PEDIDO_POSTRE.ID_COMPLEMENTO_POSTRE IS
    'IDENTIFICADOR DEL COMPLEMENTO AÑADIDO.';

ALTER TABLE HE_PEDIDO_POSTRE ADD CONSTRAINT HE_PEDIDO_POSTRE_PK PRIMARY KEY ( ID_PEDIDO_POSTRE );

CREATE TABLE HE_PEDIDO_POSTRE_SABOR (
    ID_PEDIDO_POSTRE_SABOR NUMBER NOT NULL,
    ID_PEDIDO_POSTRE       NUMBER NOT NULL,
    ID_SABOR               NUMBER NOT NULL,
    NUMERO_BOLAS           NUMBER NOT NULL
);

COMMENT ON COLUMN HE_PEDIDO_POSTRE_SABOR.ID_PEDIDO_POSTRE_SABOR IS
    'IDENTIFICADOR DEL PEDIDO POR POSTRE POR SABOR.';

COMMENT ON COLUMN HE_PEDIDO_POSTRE_SABOR.ID_PEDIDO_POSTRE IS
    'IDENTIFICADOR DEL PEDIDO POR POSTRE.';

COMMENT ON COLUMN HE_PEDIDO_POSTRE_SABOR.ID_SABOR IS
    'IDENTIFICADOR DEL SABOR.';

COMMENT ON COLUMN HE_PEDIDO_POSTRE_SABOR.NUMERO_BOLAS IS
    'NÚMERO DE BOLAS DEL SABOR ELEGIDO PARA EL POSTRE.';

ALTER TABLE HE_PEDIDO_POSTRE_SABOR ADD CONSTRAINT HE_PEDIDO_POSTRE_SABOR_PK PRIMARY KEY ( ID_PEDIDO_POSTRE_SABOR );

CREATE TABLE HE_POSTRE (
    ID_POSTRE    NUMBER NOT NULL,
    NOMBRE       VARCHAR2(50 BYTE) NOT NULL,
    DESCRIPCION  VARCHAR2(100 BYTE),
    NUMERO_BOLAS NUMBER NOT NULL,
    PRECIO       NUMBER(7, 2) NOT NULL,
    ESTADO       CHAR(1 BYTE) NOT NULL
);

COMMENT ON COLUMN HE_POSTRE.ID_POSTRE IS
    'IDENTIFICADOR DEL POSTRE.';

COMMENT ON COLUMN HE_POSTRE.NOMBRE IS
    'NOMBRE DEL POSTRE.';

COMMENT ON COLUMN HE_POSTRE.DESCRIPCION IS
    'DESCRIPCIÓN DEL POSTRE.';

COMMENT ON COLUMN HE_POSTRE.NUMERO_BOLAS IS
    'NÚMERO DE BOLAS DE HELADO QUE COMFORMAN AL POSTRE.';

COMMENT ON COLUMN HE_POSTRE.PRECIO IS
    'PRECIO DE VENTA BASE.';

COMMENT ON COLUMN HE_POSTRE.ESTADO IS
    'ESTADO DEL PRODUCTO. ''A'': ACTIVO, ''I'': INACTIVO.';

ALTER TABLE HE_POSTRE ADD CONSTRAINT HE_POSTRE_PK PRIMARY KEY ( ID_POSTRE );

CREATE TABLE HE_SABOR (
    ID_SABOR    NUMBER NOT NULL,
    NOMBRE      VARCHAR2(50 BYTE) NOT NULL,
    DESCRIPCION VARCHAR2(100 BYTE) NOT NULL,
    STOCK       NUMBER(7, 2) NOT NULL,
    ESTADO      CHAR(1 BYTE) NOT NULL
);

COMMENT ON COLUMN HE_SABOR.ID_SABOR IS
    'IDENTIFICADOR DEL SABOR.';

COMMENT ON COLUMN HE_SABOR.NOMBRE IS
    'NOMBRE DEL SABOR.';

COMMENT ON COLUMN HE_SABOR.DESCRIPCION IS
    'DESCRIPCIÓN BREVE DEL SABOR.';

COMMENT ON COLUMN HE_SABOR.STOCK IS
    'CANTIDAD DE HELADO CONTENIDA EN UN LOTE (EN GALONES).';

COMMENT ON COLUMN HE_SABOR.ESTADO IS
    'ESTADO DEL PRODUCTO. ''A'': ACTUALMENTE SE USA, ''D'': FUERA DE PRODUCCIÓN.
';

ALTER TABLE HE_SABOR ADD CONSTRAINT HE_SABOR_PK PRIMARY KEY ( ID_SABOR );

CREATE TABLE HE_CLIENTE (
	ID_CLIENTE NUMBER NOT NULL,
	NOMBRES VARCHAR2(50 BYTE) NOT NULL,
	APELLIDOS VARCHAR2(50 BYTE) NOT NULL,
	DNI VARCHAR2(8 BYTE) NOT NULL,
	CONSTRAINT CLIENTE_PK PRIMARY KEY (ID_CLIENTE)
);

COMMENT ON COLUMN HE_CLIENTE.ID_CLIENTE IS 
	'Identificador del cliente.';

COMMENT ON COLUMN HE_CLIENTE.NOMBRES IS
	'Nombres del cliente.';

COMMENT ON COLUMN HE_CLIENTE.APELLIDOS IS
	'Apellidos del cliente.';

COMMENT ON COLUMN HE_CLIENTE.DNI IS
	'DNI del cliente.';

ALTER TABLE HE_ORDEN_PRODUCCION
    ADD CONSTRAINT ORD_PRO_SAB_FK FOREIGN KEY ( ID_SABOR )
        REFERENCES HE_SABOR ( ID_SABOR );

ALTER TABLE HE_PEDIDO_POSTRE
    ADD CONSTRAINT PED_POS_COM_POS_FK FOREIGN KEY ( ID_COMPLEMENTO_POSTRE )
        REFERENCES HE_COMPLEMENTO_POSTRE ( ID_COMPLEMENTO_POSTRE );

ALTER TABLE HE_PEDIDO_POSTRE
    ADD CONSTRAINT PED_POS_PED_FK FOREIGN KEY ( ID_PEDIDO )
        REFERENCES HE_PEDIDO ( ID_PEDIDO );

ALTER TABLE HE_PEDIDO_POSTRE
    ADD CONSTRAINT PED_POS_POS_FK FOREIGN KEY ( ID_POSTRE )
        REFERENCES HE_POSTRE ( ID_POSTRE );

ALTER TABLE HE_PEDIDO_POSTRE_SABOR
    ADD CONSTRAINT PPS_PED_POS_FK FOREIGN KEY ( ID_PEDIDO_POSTRE )
        REFERENCES HE_PEDIDO_POSTRE ( ID_PEDIDO_POSTRE );

ALTER TABLE HE_PEDIDO_POSTRE_SABOR
    ADD CONSTRAINT PPS_SAB_FK FOREIGN KEY ( ID_SABOR )
        REFERENCES HE_SABOR ( ID_SABOR );
       
ALTER TABLE HE_PEDIDO 
	ADD CONSTRAINT PED_CLI_FK FOREIGN KEY (ID_CLIENTE)
		REFERENCES HE_CLIENTE (ID_CLIENTE);
