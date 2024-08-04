-- Active: 1718486638191@@localhost@5432@postgres
-- CODIGO ESCRITO EN WORKBENCH
-- creacion de la base de datos
CREATE DATABASE hospital;
-- selecciono la base de datos para poder usarla
USE hospital;
-- creacion de las distintas tablas que va a tener mi base de datos
CREATE TABLE doctores (
    id_doctor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL
);

CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    id_doctor INT,
    FOREIGN KEY (id_doctor) REFERENCES doctores(id_doctor)
);
-- asigno datos a las distintas tablas
INSERT INTO doctores (nombre, especialidad) VALUES ('Dr. javier Pérez', 'Cardiología');
INSERT INTO doctores (nombre, especialidad) VALUES ('Dr. pedro gomez', 'psiquiatria');
INSERT INTO doctores (nombre, especialidad) VALUES ('Dra. lorena garcia', 'radiologia');
INSERT INTO doctores (nombre, especialidad) VALUES ('Dra. juana dearco', 'psiquiatria');
INSERT INTO doctores (nombre, especialidad) VALUES ('Dr. kevin zelaya', 'dermatologia');

INSERT INTO pacientes (nombre, fecha_nacimiento, id_doctor) VALUES ('carlos carmuega', '1999-07-10', 1);
INSERT INTO pacientes (nombre, fecha_nacimiento, id_doctor) VALUES ('rodolfo fernandez', '1988-02-25', 2);
INSERT INTO pacientes (nombre, fecha_nacimiento, id_doctor) VALUES ('pablo lezcano', '2004-09-02', 3);
INSERT INTO pacientes (nombre, fecha_nacimiento, id_doctor) VALUES ('matias sanchez', '2000-11-14', 4);
INSERT INTO pacientes (nombre, fecha_nacimiento, id_doctor) VALUES ('pedro arzamendi', '2010-04-08', 5);

-- CODIGO ESCRITO EN POSTGRE SQL
SELECT * FROM doctores;
SELECT * FROM pacientes;

