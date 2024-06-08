Insert into X230_DOCENTE (DOCENTE,NOMBRE) values ('901001  ','JUAN PEREZ');
Insert into X230_DOCENTE (DOCENTE,NOMBRE) values ('901002  ','NANCY CALDERON');
Insert into X230_DOCENTE (DOCENTE,NOMBRE) values ('901003  ','ADRIANA ALVARADO');
Insert into X230_DOCENTE (DOCENTE,NOMBRE) values ('901004  ','WALTER SEGAMA');
Insert into X230_DOCENTE (DOCENTE,NOMBRE) values ('901005  ','LUIS GARCIA');
/
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF246','901001  ','BASE DE DATOS','5');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF248','901002  ','SISTEMAS DE INFORMACION 1','4');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF227','901003  ','DESARROLLO DE PROGRAMAS 2','4');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF263','901004  ','ALGORITMIA','3,75');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF281','901005  ','LENGUAJE DE PROGRAMACION 1','3');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF291','901001  ','METODOS Y PROCEDIMIENTOS','3,5');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF239','901002  ','SISTEMAS OPERATIVOS',null);
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF282','901003  ','LENGUAJE DE PROGRAMACION 2',null);
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF245','901004  ','INGENIERIA DE SOFTWARE',null);
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF250','901005  ','SISTEMAS DE INFORMACION 2','3,5');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF226','901002  ','DESARROLLO DE PROGRAMAS 1','2,75');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF391','901002  ','TESIS 1','3,75');
Insert into X230_CURSO (CURSO,DOCENTE,NOMBRE,ENCPUNTAJE) values ('INF392','901003  ','TESIS 2','3,5');
/
Insert into X230_PREGUNTA (PREGUNTA,DESCRIPCION,PTJEMAXIMO) values ('01','EL PROFESOR ES PUNTUAL','1');
Insert into X230_PREGUNTA (PREGUNTA,DESCRIPCION,PTJEMAXIMO) values ('02','EL PROFESOR CONOCE DEL TEMA','1');
Insert into X230_PREGUNTA (PREGUNTA,DESCRIPCION,PTJEMAXIMO) values ('03','EL PROFESOR ES ORDENADO','1');
Insert into X230_PREGUNTA (PREGUNTA,DESCRIPCION,PTJEMAXIMO) values ('04','EL PROFESOR CORRIGE Y ENTREGA FEEDBACK','1');
Insert into X230_PREGUNTA (PREGUNTA,DESCRIPCION,PTJEMAXIMO) values ('05','EL PROFESOR DEVUELVE A TIEMPO LOS EXAMENES','1');
/
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('1','01','MALO','0');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('2','01','REGULAR','0,25');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('3','01','BUENO','0,75');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('1','02','MALO','0');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('2','02','REGULAR','0,25');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('3','02','BUENO','0,75');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('1','03','MALO','0');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('2','03','REGULAR','0,25');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('3','03','BUENO','0,5');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('1','04','MALO','0');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('2','04','REGULAR','0,25');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('3','04','BUENO','0,75');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('4','04','EXCELENTE','1');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('4','01','EXCELENTE','1');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('4','02','EXCELENTE','1');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('4','03','EXCELENTE','1');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('1','05','MALO','0');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('2','05','REGULAR','0,25');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('3','05','BUENO','0,75');
Insert into X230_OPCXPREG (OPCION,PREGUNTA,DESCRIPCION,PUNTAJE) values ('4','05','EXCELENTE','1');
/
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF246','01','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF248','01','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF246','02','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF246','03','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF248','02','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF248','03','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF227','01','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF227','03','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF263','01','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF263','02','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF263','03','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF263','04','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF291','02','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF291','04','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF239','02','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF239','04','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF282','02','1');
Insert into X230_PUNTAJEXPREGUNTAXCURSO (CURSO,PREGUNTA,PUNTAJE) values ('INF282','03','1');
/
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF246','01','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF246','02','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF246','03','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF248','01','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF248','02','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF248','03','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF263','01','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF263','02','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF282','02','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A00','INF282','03','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A01','INF246','01','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A01','INF246','02','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A02','INF248','01','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A02','INF248','02','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A02','INF248','03','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A03','INF263','01','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A03','INF263','02','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A03','INF282','03','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A03','INF282','02','3');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A04','INF282','03','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A04','INF282','02','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A03','INF246','03','4');
Insert into X230_RESPUESTASXCURSO (FORMULARIO,CURSO,PREGUNTA,OPCION) values ('A03','INF246','02','3');
