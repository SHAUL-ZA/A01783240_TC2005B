-- Ejercicio de bases de datos en MySQL / Shaul Zayat Askenazi - A01783240

-- The database can properly handle and store any type of character
SET NAMES utf8mb4; 

-- Temporarily disables the verification of single key restrictions
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;

-- Temporarily disables foreign key constraint checking
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- MySQL will apply stricter validation rules and generate errors for operations that do not comply with these rules
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';



-- - CREATE ALL THE SCHEMA----
DROP SCHEMA IF EXISTS olimpiadas;
CREATE SCHEMA olimpiadas;
USE olimpiadas;

--
-- Table structure for table `medallas`
--
CREATE TABLE medallas (
	nombre_medalla VARCHAR(10) NOT NULL,
    PRIMARY KEY (nombre_medalla)
);


--
-- Table structure for table `paises`
--
CREATE TABLE paises(
	nombre_pais VARCHAR(20) NOT NULL,
	participantes TINYINT UNSIGNED NOT NULL DEFAULT 0, 
    n_de_medallas TINYINT UNSIGNED NOT NULL DEFAULT 0,
    PRIMARY KEY (nombre_pais)
);

--
-- Table structure for table `deportistas`
--
CREATE TABLE deportistas(
	matricula TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    sexo VARCHAR(15) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    PRIMARY KEY (matricula),
    CONSTRAINT fk_paises_deportistas FOREIGN KEY (pais) REFERENCES paises (nombre_pais) ON DELETE RESTRICT ON UPDATE CASCADE
);


--
-- Table structure for table `disciplinas`
--
CREATE TABLE disciplinas(
	id_disciplina TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    disciplina VARCHAR(20),
	PRIMARY KEY (id_disciplina)
);

--
-- Table structure for table `rangos`
--
CREATE TABLE rangos(
	posicion TINYINT UNSIGNED NOT NULL,
	PRIMARY KEY (posicion)
);


--
-- Table structure for table `pruebas`
--
CREATE TABLE pruebas(
	id_prueba TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    disciplina TINYINT UNSIGNED NOT NULL,
    fecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ubicacion VARCHAR(25) NOT NULL,
    deportistas_inscritos TINYINT UNSIGNED NOT NULL DEFAULT 0, 
	tipo_prueba VARCHAR(25),
    puntos TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_prueba),
    CONSTRAINT fk_disciplinas_pruebas FOREIGN KEY (disciplina) REFERENCES disciplinas (id_disciplina) ON DELETE RESTRICT ON UPDATE CASCADE
);

--
-- Table structure for table `clasificacion`
--
CREATE TABLE clasificacion(
	matricula TINYINT UNSIGNED NOT NULL,
    prueba TINYINT UNSIGNED NOT NULL,
    medalla VARCHAR(10) NOT NULL,
    posicion TINYINT UNSIGNED NOT NULL,
    CONSTRAINT fk_deportistas_clasificacion FOREIGN KEY (matricula) REFERENCES deportistas (matricula) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_pruebas_clasificacion FOREIGN KEY (prueba) REFERENCES pruebas (id_prueba) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_medallas_clasificacion FOREIGN KEY (medalla) REFERENCES medallas (nombre_medalla) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_rangos_clasificacion FOREIGN KEY (posicion) REFERENCES rangos (posicion) ON DELETE RESTRICT ON UPDATE CASCADE
);


--
-- Table structure for table `resultados`
--
CREATE TABLE resultados(
	disciplina TINYINT UNSIGNED NOT NULL,
    matricula TINYINT UNSIGNED NOT NULL,
	medalla VARCHAR(10) NOT NULL,
	pais VARCHAR(20) NOT NULL,
	CONSTRAINT fk_disciplinas_resultados FOREIGN KEY (disciplina) REFERENCES disciplinas (id_disciplina) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_deportistas_resultados FOREIGN KEY (matricula) REFERENCES deportistas (matricula) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_medallas_resultados FOREIGN KEY (medalla) REFERENCES medallas (nombre_medalla) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_paises_resultados FOREIGN KEY (pais) REFERENCES paises (nombre_pais) ON DELETE RESTRICT ON UPDATE CASCADE
);

SHOW TABLES;

-- Enable restrictions
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- --- INSERTS -----

-- MEDALLAS --
INSERT INTO olimpiadas.medallas SET nombre_medalla = ('Oro');
INSERT INTO olimpiadas.medallas SET nombre_medalla = ('Plata');
INSERT INTO olimpiadas.medallas SET nombre_medalla = ('Bronce');

-- PAISES ---
INSERT INTO olimpiadas.paises SET nombre_pais = ('Mexico');
INSERT INTO olimpiadas.paises SET nombre_pais = ('USA');
INSERT INTO olimpiadas.paises SET nombre_pais = ('Canada');
INSERT INTO olimpiadas.paises SET nombre_pais = ('Alemania');
INSERT INTO olimpiadas.paises SET nombre_pais = ('UK');


-- DEPORTISTAS ----
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Gustavo', 'Ruiz Hernandez', 'Masculino', 'Mexico');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('David', 'Fernandez Gonzales', 'Masculino', 'Canada');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Christopher', 'Lee Taylor', 'Masculino', 'USA');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Luisa', 'Sanchez Garcia', 'Femenino', 'Canada');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Caroline', 'Clark Parker', 'Femenino', 'USA');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Samuel', 'King Green', 'Masculino', 'UK');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Fernando', 'Garcia Lopez', 'Masculino', 'Mexico');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Tyler', 'Scott Wilson', 'Masculino', 'USA');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Mattew', 'Cooper Nelson', 'Masculino', 'USA');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Lucia', 'Fernandez Perez', 'Femenino', 'Canada');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Ana', 'Gacia Rodriguez', 'Femenino', 'Canada');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Javier','Perez Gonzales', 'Masculino', 'Canada');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Carlos', 'Martinez Torres', 'Masculino', 'Mexico');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Marco', 'Ruiz Cruz', 'Masculino', 'Mexico');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Eleanor', 'Davies Cooper', 'Masculino', 'UK');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('James', 'Smith Jones', 'Masculino', 'UK');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Henry', 'Davies Moore', 'Masculino', 'UK');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Benjamin', 'Taylor Hill', 'Masculino', 'USA');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Lauren', 'Baker Phillips', 'Femenino', 'USA');
INSERT INTO olimpiadas.deportistas (nombre, apellidos, sexo, pais) VALUES ('Daniel', 'Lopez Garcia', 'Masculino', 'Mexico');


-- DISCIPLINAS --
INSERT INTO olimpiadas.disciplinas (nombre, disciplina) VALUES ('Peso muerto', 'Peso');
INSERT INTO olimpiadas.disciplinas (nombre, disciplina) VALUES ('Press Banca', 'Peso');
INSERT INTO olimpiadas.disciplinas (nombre, disciplina) VALUES ('Cuerda', 'Resistencia');
INSERT INTO olimpiadas.disciplinas (nombre, disciplina) VALUES ('Flag', 'Calistenia');
INSERT INTO olimpiadas.disciplinas (nombre, disciplina) VALUES ('Persecucion', 'Agilidad');
INSERT INTO olimpiadas.disciplinas (nombre, disciplina) VALUES ('Parkour', 'Agilidad');

-- RANGOS --
INSERT INTO olimpiadas.rangos VALUES (1);
INSERT INTO olimpiadas.rangos VALUES (2);
INSERT INTO olimpiadas.rangos VALUES (3);
INSERT INTO olimpiadas.rangos VALUES (4);
INSERT INTO olimpiadas.rangos VALUES (5);



-- PRUEBAS --
INSERT INTO olimpiadas.pruebas (disciplina, fecha, ubicacion, deportistas_inscritos, tipo_prueba, puntos) VALUES (1, NOW(), 'Gimnasio', 3, 'Fuerza', 50);
INSERT INTO olimpiadas.pruebas (disciplina, fecha, ubicacion, deportistas_inscritos, tipo_prueba, puntos) VALUES (2, NOW(), 'Gimnasio', 5, 'Fuerza', 50);
INSERT INTO olimpiadas.pruebas (disciplina, fecha, ubicacion, deportistas_inscritos, tipo_prueba, puntos) VALUES (3, NOW(), 'Cancha', 6, 'Resistencia', 30);
INSERT INTO olimpiadas.pruebas (disciplina, fecha, ubicacion, deportistas_inscritos, tipo_prueba, puntos) VALUES (4, NOW(), 'Salon de calistenia', 7, 'Agilidad', 40);
INSERT INTO olimpiadas.pruebas (disciplina, fecha, ubicacion, deportistas_inscritos, tipo_prueba, puntos) VALUES (5, NOW(), 'Salon de parkour', 8, 'Agilidad', 35);
INSERT INTO olimpiadas.pruebas (disciplina, fecha, ubicacion, deportistas_inscritos, tipo_prueba, puntos) VALUES (6, NOW(), 'Cancha', 5, 'Resistencia', 25);

SELECT * FROM olimpiadas.pruebas;
-- CLASIFICACION --
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (1, 1, 'Oro', 1);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (1, 3, 'Plata', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (2, 4, 'Oro', 3);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (2, 5, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (3, 6, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (4, 1, 'Bronce', 3);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (4, 5, 'Bronce', 3);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (5, 6, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (6, 4, 'Bronce', 4);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (6, 1, 'Oro', 1);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (7, 3, 'Bronce', 3);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (7, 5, 'Bronce', 4);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (8, 1, 'Oro', 1);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (8, 3, 'Bronce', 3);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (9, 4, 'Plata', 2);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (9, 5, 'Oro', 1);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (9, 6, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (10, 1, 'Bronce', 4);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (10, 2, 'Bronce', 4);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (11, 3, 'Plata', 2);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (11, 4, 'Plata', 2);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (12, 5, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (13, 1, 'Plata', 2);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (14, 1, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (14, 3, 'Plata', 2);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (15, 4, 'Bronce', 4);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (15, 5, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (16, 5, 'Bronce', 4);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (16, 3, 'Bronce', 3);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (17, 2, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (17, 1, 'Bronce', 4);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (18, 3, 'Bronce', 5);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (18, 5, 'Plata', 2);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (19, 5, 'Plata', 2);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (20, 6, 'Oro', 1);
INSERT INTO olimpiadas.clasificacion (matricula, prueba, medalla, posicion) VALUES (20, 1, 'Bronce', 5);

-- RESULTADOS --
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (1, 1, 'Oro', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (5, 1, 'Bronce', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (2, 2, 'Bronce', 'Mexico');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 2, 'Bronce', 'Mexico');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 3, 'Bronce', 'Canada');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (3, 4, 'Bronce', 'Canada');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (5, 4, 'Bronce', 'Canada');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 5, 'Bronce', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (1, 6, 'Bronce', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (3, 6, 'Oro', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 7, 'Bronce', 'Mexico');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (6, 7, 'Bronce', 'Mexico');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (1, 8, 'Oro', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (1, 8, 'Bronce', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (5, 9, 'Plata', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (6, 9, 'Oro', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (5, 9, 'Bronce', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (6, 10, 'Bronce', 'Canada');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (3, 10, 'Bronce', 'Canada');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 11, 'Plata', 'Canada');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (3, 11, 'Plata', 'Canada');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (2, 12, 'Bronce', 'Canada');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (1, 13, 'Plata', 'Mexico');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (2, 14, 'Bronce', 'Mexico');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (2, 14, 'Plata', 'Mexico');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 15, 'Bronce', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 15, 'Bronce', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (5, 16, 'Bronce', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 16, 'Bronce', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (5, 17, 'Bronce', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (6, 17, 'Bronce', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (4, 17, 'Bronce', 'UK');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (6, 18, 'Plata', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (3, 18, 'Plata', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (2, 19, 'Oro', 'USA');
INSERT INTO olimpiadas.resultados (disciplina, matricula, medalla, pais) VALUES (3, 20, 'Oro', 'Mexico');




-- ---CONSULTAS-----
-- Apellidos y nombre de los participantes de nacionalidad mexicana.
SELECT olimpiadas.deportistas.apellidos, olimpiadas.deportistas.nombre 
	FROM olimpiadas.deportistas WHERE pais= 'Mexico';

-- Apellidos, nombre y puntos acumulados de los participantes de USA
-- 	La consulta no es posible dado el diseño del esquema
 
-- Apellidos y nombre de los participantes que se clasificaron en primer lugar en al menos una competencia.
SELECT DISTINCT olimpiadas.deportistas.apellidos, olimpiadas.deportistas.nombre FROM olimpiadas.deportistas
INNER JOIN olimpiadas.clasificacion ON olimpiadas.clasificacion.matricula = olimpiadas.deportistas.matricula  WHERE pais = 'USA';