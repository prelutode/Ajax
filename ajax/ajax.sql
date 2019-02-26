-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-02-2019 a las 17:56:54
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ajax`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `department`
--

CREATE TABLE `department` (
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `department`
--

INSERT INTO `department` (`Title`) VALUES
('Administracion'),
('Informatica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job`
--

CREATE TABLE `job` (
  `Title` varchar(255) NOT NULL,
  `Department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `job`
--

INSERT INTO `job` (`Title`, `Department`) VALUES
('Administrativo', 'Administracion'),
('Contable', 'Administracion'),
('Desarrollador', 'Informatica'),
('Ingeniero', 'Informatica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `Fistname` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` int(11) NOT NULL,
  `Job` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`Fistname`, `Email`, `Phone`, `Job`) VALUES
('coco', 'coco@coco.es', 222222222, 'Ingeniero'),
('dede', 'dede@dede.es', 222222222, 'Desarrollador'),
('fefe', 'fefe@fefe.es', 333333333, 'Contable'),
('fofo', 'fofo@fof.es', 111111111, 'Ingeniero'),
('lala', 'lala@lala.es', 111111111, 'Desarrollador'),
('lili', 'lili@lili.es', 333333333, 'Ingeniero'),
('lolo', 'lolo@lolo.es', 555555555, 'Desarrollador'),
('pepe', 'pepe@pepe.es', 999999999, 'Contable'),
('pipi', 'pipi@pipi.es', 888888888, 'Administrativo'),
('popo', 'popo@popo.es', 444444444, 'Administrativo'),
('pupu', 'pupu@pupu.es', 777777777, 'Administrativo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Title`);

--
-- Indices de la tabla `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`Title`),
  ADD KEY `Department` (`Department`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`Fistname`),
  ADD KEY `Job` (`Job`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `job_ibfk_1` FOREIGN KEY (`Department`) REFERENCES `department` (`Title`);

--
-- Filtros para la tabla `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`Job`) REFERENCES `job` (`Title`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
