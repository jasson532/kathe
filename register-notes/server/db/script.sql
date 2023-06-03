-- MySQL Script generated by MySQL Workbench
-- Sun May 28 20:06:42 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema registro-notas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema registro-notas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `registro-notas` DEFAULT CHARACTER SET utf8 ;
USE `registro-notas` ;

-- -----------------------------------------------------
-- Table `registro-notas`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro-notas`.`estudiante` (
  `codigo` VARCHAR(10) NOT NULL,
  `identificacion` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `fechanato` DATETIME NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `identificacion_UNIQUE` (`identificacion` ASC) VISIBLE,
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_bin;


-- -----------------------------------------------------
-- Table `registro-notas`.`asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro-notas`.`asignatura` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_bin;


-- -----------------------------------------------------
-- Table `registro-notas`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro-notas`.`notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estudiante` VARCHAR(10) NOT NULL,
  `asignatura` INT NOT NULL,
  `nota` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `estudianteFK_idx` (`estudiante` ASC) VISIBLE,
  INDEX `asignaturaFK_idx` (`asignatura` ASC) VISIBLE,
  CONSTRAINT `estudianteFK`
    FOREIGN KEY (`estudiante`)
    REFERENCES `registro-notas`.`estudiante` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `asignaturaFK`
    FOREIGN KEY (`asignatura`)
    REFERENCES `registro-notas`.`asignatura` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1
COLLATE = latin1_bin;

USE `registro-notas` ;

-- -----------------------------------------------------
-- Placeholder table for view `registro-notas`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registro-notas`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `registro-notas`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registro-notas`.`view1`;
USE `registro-notas`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- INSERT ESTUDIANTES
-- -----------------------------------------------------

INSERT INTO `registro-notas`.`estudiante` (`codigo`, `identificacion`, `nombre`, `apellido`, `fechanato`) VALUES
('001', '1234567890', 'Juan', 'Pérez', '1990-01-01'),
('002', '9876543210', 'María', 'Gómez', '1995-02-15'),
('003', '4567890123', 'Carlos', 'López', '1992-05-10'),
('004', '6543210987', 'Ana', 'Martínez', '1998-08-20'),
('005', '7890123456', 'Pedro', 'Sánchez', '1994-03-05'),
('006', '0123456789', 'Laura', 'García', '1991-11-30'),
('007', '8901234567', 'Diego', 'Rodríguez', '1997-07-12'),
('008', '3210987654', 'Sofía', 'Hernández', '1993-04-25'),
('009', '5678901234', 'Luis', 'Torres', '1996-09-18'),
('010', '2345678901', 'Carmen', 'Ramírez', '1999-12-08');


-- -----------------------------------------------------
-- INSERT ASIGNATURAS
-- -----------------------------------------------------

INSERT INTO `registro-notas`.`asignatura` (`nombre`) VALUES
('Matemáticas'),
('Historia'),
('Biología'),
('Literatura'),
('Física'),
('Química'),
('Geografía'),
('Inglés'),
('Arte'),
('Economía');

-- -----------------------------------------------------
-- INSERT NOTAS
-- -----------------------------------------------------

INSERT INTO `registro-notas`.`notas` (`estudiante`, `asignatura`, `nota`) VALUES
('001', 1, 8.5),
('002', 2, 7.2),
('003', 3, 6.8),
('004', 4, 9.1),
('005', 5, 8.9);