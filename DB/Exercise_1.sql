--1
/*La disquera desea realizar un análisis de los artistas que tienen un mayor número de canciones en comparación con el promedio de canciones registradas por cada artista. 
Para poder analizar adecuadamente los datos proporcionados, se le solicita que los entregue en el siguiente formato*/

SELECT 
'***' || P.NOMBRE_PAIS || '***' "PAIS", 
UPPER(A.NOMBRE_ARTISTA) "NOMBRE_ARTISTA", 
COUNT(C.ID_CANCION) "CANT"
FROM ARTISTA A
JOIN PAIS P ON A.ID_PAIS = P.ID_PAIS
JOIN CANCION C ON A.ID_ARTISTA = C.ID_ARTISTA
GROUP BY P.NOMBRE_PAIS, A.NOMBRE_ARTISTA
HAVING COUNT(C.ID_CANCION) > (SELECT AVG(CONTEO_CANCIONES) PROMEDIO_CANCIONES
FROM    (SELECT COUNT(*) CONTEO_CANCIONES
        FROM CANCION
        GROUP BY ID_ARTISTA))
ORDER BY COUNT(C.ID_CANCION);
/*Revise que el orden no fuera por pais, lo recalco porque en el word el formato de salida
pareciera que si esta por pais tambien, pero en la mitad de los paises aparece brasil*/

--2        
--Obtener la información de las canciones cuya duración sea mayor que la duración de la canción con el mayor minutaje entre las originarias de Alemania.         
   
SELECT C.NOMBRE_CANCION, 
SUBSTR(C.DURACION_CANCION, 1, INSTR(C.DURACION_CANCION, ':') - 1) || ':' || LPAD(SUBSTR(C.DURACION_CANCION, INSTR(C.DURACION_CANCION, ':') + 1), 2, '0') "DURACION_CANCION",
GM.NOMBRE_GENERO_MUSICAL "NOMBRE_GENERO_MUSICAL"
FROM SUBGENERO_MUSICAL SM
JOIN CANCION C ON SM.ID_SUBGENERO_MUSICAL = C.ID_SUBGENERO_MUSICAL
JOIN GENERO_MUSICAL GM ON SM.ID_GENERO_MUSICAL = GM.ID_GENERO_MUSICAL
GROUP BY C.NOMBRE_CANCION, C.DURACION_CANCION, GM.NOMBRE_GENERO_MUSICAL
HAVING C.DURACION_CANCION > (SELECT MAX(C.DURACION_CANCION) 
                             FROM CANCION C
                             JOIN ARTISTA A ON C.ID_ARTISTA = A.ID_ARTISTA
                             JOIN PAIS P ON A.ID_PAIS = P.ID_PAIS
                             WHERE NOMBRE_PAIS = 'Alemania');
/*agregue el formato de salida de minutos y segundos, porque en los datos aparecen como 04:40 o 4:40
entonces asi cualquier resultado apareceria con el formaro m:ss*/

--3
--Se requiere un listado de todos los países que no tienen ningún artista asociado

SELECT 
LOWER(LPAD(P.NOMBRE_PAIS,20,'| ')) "NOMBRE_PAISS", 
COUNT(A.ID_ARTISTA) "CANTIDAD"
FROM ARTISTA A
RIGHT JOIN PAIS P ON A.ID_PAIS = P.ID_PAIS
GROUP BY NOMBRE_PAIS
HAVING COUNT(A.ID_ARTISTA) = 0
ORDER BY 1;

--4
/*Un estudiante de análisis musical está explorando una extensa base de datos de canciones con el objetivo de identificar los *géneros musicales* cuya duración promedio supera los 3 minutos y 30 segundos. 
Su propósito es comprender mejor la estructura y características de diferentes géneros en relación con la duración de sus canciones.*/

SELECT 
A.NOMBRE_ARTISTA AS "ARTISTA", 
C.NOMBRE_CANCION "CANCION", 
SM.NOMBRE_SUBGENERO_MUSICAL "SUBGENERO",
LPAD(TRUNC(AVG(SEGUNDOS_TOTALES) / 60), 2, '0') || ':' || LPAD(MOD(AVG(SEGUNDOS_TOTALES), 60), 2, '0') "DURACION"
FROM (  
        SELECT 
        ID_SUBGENERO_MUSICAL,
        ID_ARTISTA,
        NOMBRE_CANCION, 
        TO_NUMBER(SUBSTR(DURACION_CANCION, 1, INSTR(DURACION_CANCION, ':') - 1)) * 60 + TO_NUMBER(SUBSTR(DURACION_CANCION, INSTR(DURACION_CANCION, ':') + 1)) SEGUNDOS_TOTALES
        FROM CANCION 
    ) C 
JOIN SUBGENERO_MUSICAL SM ON C.ID_SUBGENERO_MUSICAL = SM.ID_SUBGENERO_MUSICAL
JOIN ARTISTA A ON C.ID_ARTISTA = A.ID_ARTISTA
GROUP BY A.NOMBRE_ARTISTA, C.NOMBRE_CANCION, SM.NOMBRE_SUBGENERO_MUSICAL
HAVING AVG(SEGUNDOS_TOTALES) > 210
ORDER BY 1;


