-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2022 a las 03:36:16
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sigces`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendices`
--

CREATE TABLE `aprendices` (
  `ID` int(11) NOT NULL,
  `Tipo_ID` varchar(5) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Genero` varchar(10) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `ID_Regional` int(11) NOT NULL,
  `Centro` int(11) NOT NULL,
  `ID_Programa` int(11) NOT NULL,
  `Ficha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `ID` int(11) NOT NULL,
  `Capitulo` enum('I','II','III','IV','V','VI') NOT NULL,
  `Articulo` int(5) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Numeral` int(5) DEFAULT NULL,
  `Keyword` varchar(50) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capitulos`
--

CREATE TABLE `capitulos` (
  `idCapitulos` int(11) NOT NULL,
  `Numero` varchar(4) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capitulos`
--

INSERT INTO `capitulos` (`idCapitulos`, `Numero`, `Nombre`) VALUES
(1, 'I', 'PRINCIPIOS GENERALES'),
(2, 'II', 'DERECHOS, ESTÍMULOS DEL APRENDIZ SENA'),
(3, 'III', 'DEBERES Y PROHIBICIONES DEL APRENDIZ SENA.'),
(4, 'IV', 'TRÁMITES ACADÉMICOS Y ADMINISTRATIVOS'),
(5, 'V', 'PROCESO DE FORMACIÓN, INCUMPLIMIENTO Y DESERCIÓN'),
(6, 'VI', 'FALTAS ACADÉMICAS Y DISCIPLINARIAS'),
(7, 'VII', 'MEDIDAS FORMATIVAS Y SANCIONES'),
(8, 'VIII', 'EVALUACIÓN'),
(9, 'IX', 'REPRESENTATIVIDAD DE LOS APRENDICES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros`
--

CREATE TABLE `centros` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `ID_Regional` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichas`
--

CREATE TABLE `fichas` (
  `ID` int(10) NOT NULL,
  `ID_Programa` int(11) NOT NULL,
  `Jornada` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionarios`
--

CREATE TABLE `funcionarios` (
  `ID` int(11) NOT NULL,
  `Tipo_ID` varchar(5) NOT NULL,
  `Tipo_Funcionario` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Genero` varchar(10) NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Telefono` varchar(10) NOT NULL,
  `ID_Regional` int(11) NOT NULL,
  `Centro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paragrafo`
--

CREATE TABLE `paragrafo` (
  `idParagrafo` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `Paragrafo` enum('Parágrafo','Parágrafo 1','Parágrafo 2') DEFAULT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `ID` int(11) NOT NULL,
  `ID_Centro` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regionales`
--

CREATE TABLE `regionales` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendices`
--
ALTER TABLE `aprendices`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Aprendices_fk0` (`ID_Regional`),
  ADD KEY `Aprendices_fk1` (`Centro`),
  ADD KEY `Aprendices_fk2` (`ID_Programa`),
  ADD KEY `Aprendices_fk3` (`Ficha`);

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `capitulos`
--
ALTER TABLE `capitulos`
  ADD PRIMARY KEY (`idCapitulos`);

--
-- Indices de la tabla `centros`
--
ALTER TABLE `centros`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Centros_fk0` (`ID_Regional`);

--
-- Indices de la tabla `fichas`
--
ALTER TABLE `fichas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Fichas_fk0` (`ID_Programa`);

--
-- Indices de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Funcionarios_fk0` (`ID_Regional`),
  ADD KEY `Funcionarios_fk1` (`Centro`);

--
-- Indices de la tabla `paragrafo`
--
ALTER TABLE `paragrafo`
  ADD PRIMARY KEY (`idParagrafo`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Programas_fk0` (`ID_Centro`);

--
-- Indices de la tabla `regionales`
--
ALTER TABLE `regionales`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aprendices`
--
ALTER TABLE `aprendices`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `capitulos`
--
ALTER TABLE `capitulos`
  MODIFY `idCapitulos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `centros`
--
ALTER TABLE `centros`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paragrafo`
--
ALTER TABLE `paragrafo`
  MODIFY `idParagrafo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `regionales`
--
ALTER TABLE `regionales`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendices`
--
ALTER TABLE `aprendices`
  ADD CONSTRAINT `Aprendices_fk0` FOREIGN KEY (`ID_Regional`) REFERENCES `regionales` (`ID`),
  ADD CONSTRAINT `Aprendices_fk1` FOREIGN KEY (`Centro`) REFERENCES `centros` (`ID`),
  ADD CONSTRAINT `Aprendices_fk2` FOREIGN KEY (`ID_Programa`) REFERENCES `programas` (`ID`),
  ADD CONSTRAINT `Aprendices_fk3` FOREIGN KEY (`Ficha`) REFERENCES `fichas` (`ID`);

--
-- Filtros para la tabla `centros`
--
ALTER TABLE `centros`
  ADD CONSTRAINT `Centros_fk0` FOREIGN KEY (`ID_Regional`) REFERENCES `regionales` (`ID`);

--
-- Filtros para la tabla `fichas`
--
ALTER TABLE `fichas`
  ADD CONSTRAINT `Fichas_fk0` FOREIGN KEY (`ID_Programa`) REFERENCES `programas` (`ID`);

--
-- Filtros para la tabla `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `Funcionarios_fk0` FOREIGN KEY (`ID_Regional`) REFERENCES `regionales` (`ID`),
  ADD CONSTRAINT `Funcionarios_fk1` FOREIGN KEY (`Centro`) REFERENCES `centros` (`ID`);

--
-- Filtros para la tabla `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `Programas_fk0` FOREIGN KEY (`ID_Centro`) REFERENCES `centros` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;