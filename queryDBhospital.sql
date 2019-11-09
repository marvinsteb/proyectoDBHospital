-- MySQL Script generated by MySQL Workbench
-- vie 08 nov 2019 19:37:11 CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dbHospital
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dbHospital` ;

-- -----------------------------------------------------
-- Schema dbHospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbHospital` ;
USE `dbHospital` ;

-- -----------------------------------------------------
-- Table `dbHospital`.`paciente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`paciente` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`paciente` (
  `codPaciente` INT NOT NULL AUTO_INCREMENT,
  `nombrePaciente` VARCHAR(50) NOT NULL,
  `apellidoPaciente` VARCHAR(50) NOT NULL,
  `direcpaci` VARCHAR(75) NOT NULL,
  `fechaNaci` DATE NOT NULL,
  `sexoPaci` VARCHAR(1) NOT NULL,
  `codEmpleado` INT NOT NULL,
  `fechaReg` DATE NOT NULL,
  `estadoCivil` VARCHAR(1) NULL,
  `codtelf` INT NULL,
  PRIMARY KEY (`codPaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`pariente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`pariente` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`pariente` (
  `codPariente` INT NOT NULL AUTO_INCREMENT,
  `nomPar` VARCHAR(50) NULL,
  `apelPar` VARCHAR(50) NULL,
  `direcPar` VARCHAR(75) NULL,
  PRIMARY KEY (`codPariente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`paciente_pariente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`paciente_pariente` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`paciente_pariente` (
  `idpaciente_pariente` INT NOT NULL AUTO_INCREMENT,
  `codPaciente` INT NOT NULL,
  `codPariente` INT NOT NULL,
  `relacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idpaciente_pariente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`Horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`Horario` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`Horario` (
  `codTurno` INT NOT NULL AUTO_INCREMENT,
  `HoraEntrada` VARCHAR(10) NULL,
  `horaSalida` VARCHAR(45) NULL,
  PRIMARY KEY (`codTurno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`categoria` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`categoria` (
  `codCategoria` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(15) NULL,
  PRIMARY KEY (`codCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`departamento` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`departamento` (
  `codDepartamento` INT NOT NULL AUTO_INCREMENT,
  `nombreDepartamento` VARCHAR(25) NULL,
  `ubicacion` VARCHAR(15) NULL,
  `codTelf` VARCHAR(45) NULL,
  PRIMARY KEY (`codDepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`empleado` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`empleado` (
  `codEmpleado` INT NOT NULL AUTO_INCREMENT,
  `codDepartamento` INT NOT NULL,
  `nomEmpleado` VARCHAR(50) NOT NULL,
  `apellEmpleado` VARCHAR(50) NOT NULL,
  `direccion` VARCHAR(75) NOT NULL,
  `fechaNacimiento` DATE NULL,
  `sexoEmpleado` VARCHAR(1) NULL,
  `dniEmpleado` VARCHAR(30) NULL,
  `codCategoria` INT NOT NULL,
  `codTurno` INT NOT NULL,
  `codTelf` VARCHAR(45) NULL,
  PRIMARY KEY (`codEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`experiencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`experiencia` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`experiencia` (
  `codExperiencia` INT NOT NULL AUTO_INCREMENT,
  `posicion` VARCHAR(30) NOT NULL,
  `fechaIni` DATE NOT NULL,
  `fechaFinal` DATE NOT NULL,
  `nombreInst` VARCHAR(35) NULL,
  `codEmpleado` INT NOT NULL,
  PRIMARY KEY (`codExperiencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`contrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`contrato` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`contrato` (
  `codContrato` INT NOT NULL AUTO_INCREMENT,
  `codEmpleado` INT NOT NULL,
  `tipoContrato` VARCHAR(1) NULL,
  `horasContrato` VARCHAR(10) NULL,
  `salario` DOUBLE NULL,
  `escalaSalarial` VARCHAR(5) NULL,
  `fechaIni` DATE NULL,
  `fechaFinal` DATE NULL,
  PRIMARY KEY (`codContrato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`cualificacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`cualificacion` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`cualificacion` (
  `codCualificaciones` INT NOT NULL AUTO_INCREMENT,
  `codEmpleado` INT NOT NULL,
  `fechaCual` DATE NULL,
  `cualObt` VARCHAR(15) NULL,
  `tipoInst` VARCHAR(1) NULL,
  `nomInst` VARCHAR(45) NULL,
  PRIMARY KEY (`codCualificaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`medicoExterno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`medicoExterno` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`medicoExterno` (
  `codMedicoExterno` INT NOT NULL AUTO_INCREMENT,
  `codDepartamento` INT NOT NULL,
  `nombreMedico` VARCHAR(50) NOT NULL,
  `apellidoMedico` VARCHAR(50) NOT NULL,
  `codTelf` VARCHAR(45) NULL,
  PRIMARY KEY (`codMedicoExterno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`pacienteMedicoExterno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`pacienteMedicoExterno` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`pacienteMedicoExterno` (
  `idpacienteMedicoExterno` INT NOT NULL AUTO_INCREMENT,
  `codPaciente` INT NOT NULL,
  `codMedicoExterno` INT NOT NULL,
  PRIMARY KEY (`idpacienteMedicoExterno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`habitacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`habitacion` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`habitacion` (
  `codHabitacion` INT NOT NULL AUTO_INCREMENT,
  `codDepartamento` INT NOT NULL,
  `bloque` INT NOT NULL,
  `descripcion` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`codHabitacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`cita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`cita` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`cita` (
  `codCita` INT NOT NULL AUTO_INCREMENT,
  `codPaciente` INT NOT NULL,
  `codHabitacion` INT NOT NULL,
  `codEmpleado` INT NOT NULL,
  `fechaHoraCita` DATETIME NOT NULL,
  `fechaEspSalida` DATE NOT NULL,
  `fechaSalida` DATE NULL,
  PRIMARY KEY (`codCita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`cama`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`cama` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`cama` (
  `codcama` INT NOT NULL AUTO_INCREMENT,
  `codHabitacion` INT NOT NULL,
  PRIMARY KEY (`codcama`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`tipoProducto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`tipoProducto` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`tipoProducto` (
  `codTipoProducto` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codTipoProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`proveedor` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`proveedor` (
  `codProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL,
  `descripcion` VARCHAR(25) NULL,
  `codTelf` VARCHAR(10) NULL,
  PRIMARY KEY (`codProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`producto` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`producto` (
  `codProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NOT NULL,
  `descripcion` VARCHAR(60) CHARACTER SET 'armscii8' NOT NULL,
  `codTipoProducto` INT NOT NULL,
  `codProveedor` INT NOT NULL,
  PRIMARY KEY (`codProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`medicacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`medicacion` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`medicacion` (
  `codMedicacion` INT NOT NULL AUTO_INCREMENT,
  `codPaciente` INT NOT NULL,
  `codcama` INT NOT NULL,
  `codProducto` INT NOT NULL,
  `unidadesDiarias` INT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFinal` DATE NOT NULL,
  PRIMARY KEY (`codMedicacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`pedido` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`pedido` (
  `codPedido` INT NOT NULL AUTO_INCREMENT,
  `codEmpleado` INT NOT NULL,
  `codDepartamento` INT NOT NULL,
  `codProducto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`codPedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`productoDepartamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`productoDepartamento` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`productoDepartamento` (
  `codProductoDepartamento` INT NOT NULL AUTO_INCREMENT,
  `codDepartamento` INT NOT NULL,
  `codProducto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`codProductoDepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`medicamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`medicamento` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`medicamento` (
  `codMedicamento` INT NOT NULL AUTO_INCREMENT,
  `codProducto` INT NOT NULL,
  `especialidad` VARCHAR(15) NULL,
  `dosis` VARCHAR(20) NULL,
  `modoAdministracion` VARCHAR(45) NULL,
  PRIMARY KEY (`codMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`almacenNivel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`almacenNivel` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`almacenNivel` (
  `codAlmacenNivel` INT NOT NULL AUTO_INCREMENT,
  `nivel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codAlmacenNivel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`productoAlmacen`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`productoAlmacen` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`productoAlmacen` (
  `codProductoAlmacen` INT NOT NULL AUTO_INCREMENT,
  `codProducto` INT NOT NULL,
  `codAlmacenNivel` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `costoUnitario` DOUBLE NOT NULL,
  PRIMARY KEY (`codProductoAlmacen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbHospital`.`table1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbHospital`.`table1` ;

CREATE TABLE IF NOT EXISTS `dbHospital`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `dbHospital`.`paciente`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`paciente` (`codPaciente`, `nombrePaciente`, `apellidoPaciente`, `direcpaci`, `fechaNaci`, `sexoPaci`, `codEmpleado`, `fechaReg`, `estadoCivil`, `codtelf`) VALUES (1, 'nombre1 ', 'apellido1 ', 'direccion1', '01012019', 'H', 1, '01012019', 'soltero', 123456680);
INSERT INTO `dbHospital`.`paciente` (`codPaciente`, `nombrePaciente`, `apellidoPaciente`, `direcpaci`, `fechaNaci`, `sexoPaci`, `codEmpleado`, `fechaReg`, `estadoCivil`, `codtelf`) VALUES (2, 'nombre2 ', 'apellido2 ', 'direccion2', '01012019', 'M', 2, '01012019', 'solera', 12378);
INSERT INTO `dbHospital`.`paciente` (`codPaciente`, `nombrePaciente`, `apellidoPaciente`, `direcpaci`, `fechaNaci`, `sexoPaci`, `codEmpleado`, `fechaReg`, `estadoCivil`, `codtelf`) VALUES (3, 'nombre3', 'apellido3', 'direccion3', '0102019', 'M', 1, '010102019', 'casada', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`pariente`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`pariente` (`codPariente`, `nomPar`, `apelPar`, `direcPar`) VALUES (1, 'pariente1', 'apellido1 ', 'direccion1');
INSERT INTO `dbHospital`.`pariente` (`codPariente`, `nomPar`, `apelPar`, `direcPar`) VALUES (2, 'nombre2', 'apellido2', 'direccion2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`Horario`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`Horario` (`codTurno`, `HoraEntrada`, `horaSalida`) VALUES (1, '8', '12');
INSERT INTO `dbHospital`.`Horario` (`codTurno`, `HoraEntrada`, `horaSalida`) VALUES (2, '1', '5');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`categoria` (`codCategoria`, `categoria`) VALUES (1, 'categoria1');
INSERT INTO `dbHospital`.`categoria` (`codCategoria`, `categoria`) VALUES (2, 'categoria2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`departamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`departamento` (`codDepartamento`, `nombreDepartamento`, `ubicacion`, `codTelf`) VALUES (1, '1', 'ubicacion1', '1341324');
INSERT INTO `dbHospital`.`departamento` (`codDepartamento`, `nombreDepartamento`, `ubicacion`, `codTelf`) VALUES (2, '2', 'ubicacion2', '12389080');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`empleado`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`empleado` (`codEmpleado`, `codDepartamento`, `nomEmpleado`, `apellEmpleado`, `direccion`, `fechaNacimiento`, `sexoEmpleado`, `dniEmpleado`, `codCategoria`, `codTurno`, `codTelf`) VALUES (1, 1, 'empleado1', 'apellido1', 'direccion1', '01012019', 'H', '1235`', 1, 1, '1');
INSERT INTO `dbHospital`.`empleado` (`codEmpleado`, `codDepartamento`, `nomEmpleado`, `apellEmpleado`, `direccion`, `fechaNacimiento`, `sexoEmpleado`, `dniEmpleado`, `codCategoria`, `codTurno`, `codTelf`) VALUES (2, 2, 'empleado2', 'apellido2', 'direccion2', '01012019', 'M', '01012019', 2, 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`experiencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`experiencia` (`codExperiencia`, `posicion`, `fechaIni`, `fechaFinal`, `nombreInst`, `codEmpleado`) VALUES (1, 'posisicon1', '01012019', '01012019', 'institucion1', 1);
INSERT INTO `dbHospital`.`experiencia` (`codExperiencia`, `posicion`, `fechaIni`, `fechaFinal`, `nombreInst`, `codEmpleado`) VALUES (2, 'posision2', '01012019', '01012019', 'institucion2', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`contrato`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`contrato` (`codContrato`, `codEmpleado`, `tipoContrato`, `horasContrato`, `salario`, `escalaSalarial`, `fechaIni`, `fechaFinal`) VALUES (1, 1, '1', '8', 5000, '4', '01012019', '01012019');
INSERT INTO `dbHospital`.`contrato` (`codContrato`, `codEmpleado`, `tipoContrato`, `horasContrato`, `salario`, `escalaSalarial`, `fechaIni`, `fechaFinal`) VALUES (2, 2, '2', '9', 4000, '7', '01012019', '01012019');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`cualificacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`cualificacion` (`codCualificaciones`, `codEmpleado`, `fechaCual`, `cualObt`, `tipoInst`, `nomInst`) VALUES (1, 1, '01012019', 'cualobt1', 'inst1', 'nominst1');
INSERT INTO `dbHospital`.`cualificacion` (`codCualificaciones`, `codEmpleado`, `fechaCual`, `cualObt`, `tipoInst`, `nomInst`) VALUES (2, 2, '01012019', 'cualobt2', 'tipoinst2', 'nominst2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`medicoExterno`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`medicoExterno` (`codMedicoExterno`, `codDepartamento`, `nombreMedico`, `apellidoMedico`, `codTelf`) VALUES (1, 1, 'medicoexterno1', 'apellidoexterno1', '12345');
INSERT INTO `dbHospital`.`medicoExterno` (`codMedicoExterno`, `codDepartamento`, `nombreMedico`, `apellidoMedico`, `codTelf`) VALUES (2, 2, 'medicoexterno2', 'apeellidoexterno2', '123446567');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`pacienteMedicoExterno`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`pacienteMedicoExterno` (`idpacienteMedicoExterno`, `codPaciente`, `codMedicoExterno`) VALUES (1, 1, 1);
INSERT INTO `dbHospital`.`pacienteMedicoExterno` (`idpacienteMedicoExterno`, `codPaciente`, `codMedicoExterno`) VALUES (2, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`habitacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`habitacion` (`codHabitacion`, `codDepartamento`, `bloque`, `descripcion`) VALUES (1, 1, 1, 'descripcion1');
INSERT INTO `dbHospital`.`habitacion` (`codHabitacion`, `codDepartamento`, `bloque`, `descripcion`) VALUES (2, 2, 2, 'descripcioin2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`cita`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`cita` (`codCita`, `codPaciente`, `codHabitacion`, `codEmpleado`, `fechaHoraCita`, `fechaEspSalida`, `fechaSalida`) VALUES (1, 1, 1, 1, '01012019', '30012019', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`cama`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`cama` (`codcama`, `codHabitacion`) VALUES (1, 1);
INSERT INTO `dbHospital`.`cama` (`codcama`, `codHabitacion`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`tipoProducto`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`tipoProducto` (`codTipoProducto`, `tipo`) VALUES (1, 'tipo1');
INSERT INTO `dbHospital`.`tipoProducto` (`codTipoProducto`, `tipo`) VALUES (2, 'tipo2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`proveedor` (`codProveedor`, `nombre`, `descripcion`, `codTelf`) VALUES (1, 'proveedor1', 'descripcion1', '1234');
INSERT INTO `dbHospital`.`proveedor` (`codProveedor`, `nombre`, `descripcion`, `codTelf`) VALUES (2, 'proveedor2', 'descripcion2', '1234');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`producto` (`codProducto`, `nombre`, `descripcion`, `codTipoProducto`, `codProveedor`) VALUES (1, 'aspirina ', 'aspirina', 1, 1);
INSERT INTO `dbHospital`.`producto` (`codProducto`, `nombre`, `descripcion`, `codTipoProducto`, `codProveedor`) VALUES (2, 'penicilina', 'penicilina', 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`medicacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`medicacion` (`codMedicacion`, `codPaciente`, `codcama`, `codProducto`, `unidadesDiarias`, `fechaInicio`, `fechaFinal`) VALUES (1, 1, 1, 1, 7, '01012019', '01012019');
INSERT INTO `dbHospital`.`medicacion` (`codMedicacion`, `codPaciente`, `codcama`, `codProducto`, `unidadesDiarias`, `fechaInicio`, `fechaFinal`) VALUES (2, 2, 2, 2, 8, '01012019', '01012019');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`pedido`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`pedido` (`codPedido`, `codEmpleado`, `codDepartamento`, `codProducto`, `cantidad`, `fecha`) VALUES (1, 1, 1, 1, 10, '01012019');
INSERT INTO `dbHospital`.`pedido` (`codPedido`, `codEmpleado`, `codDepartamento`, `codProducto`, `cantidad`, `fecha`) VALUES (2, 2, 2, 2, 50, '01012019');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`productoDepartamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`productoDepartamento` (`codProductoDepartamento`, `codDepartamento`, `codProducto`, `cantidad`) VALUES (1, 1, 1, 8);
INSERT INTO `dbHospital`.`productoDepartamento` (`codProductoDepartamento`, `codDepartamento`, `codProducto`, `cantidad`) VALUES (2, 2, 2, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`medicamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`medicamento` (`codMedicamento`, `codProducto`, `especialidad`, `dosis`, `modoAdministracion`) VALUES (1, 1, 'especialidad1', 'dosis1', 'administracion1');
INSERT INTO `dbHospital`.`medicamento` (`codMedicamento`, `codProducto`, `especialidad`, `dosis`, `modoAdministracion`) VALUES (2, 2, 'especialidad2', 'disis2', 'administracion2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`almacenNivel`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`almacenNivel` (`codAlmacenNivel`, `nivel`) VALUES (1, 'nivel1');
INSERT INTO `dbHospital`.`almacenNivel` (`codAlmacenNivel`, `nivel`) VALUES (2, 'nivel2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `dbHospital`.`productoAlmacen`
-- -----------------------------------------------------
START TRANSACTION;
USE `dbHospital`;
INSERT INTO `dbHospital`.`productoAlmacen` (`codProductoAlmacen`, `codProducto`, `codAlmacenNivel`, `cantidad`, `costoUnitario`) VALUES (1, 1, 1, 56, 80);
INSERT INTO `dbHospital`.`productoAlmacen` (`codProductoAlmacen`, `codProducto`, `codAlmacenNivel`, `cantidad`, `costoUnitario`) VALUES (2, 2, 2, 78, 90);

COMMIT;

