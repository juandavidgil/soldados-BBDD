-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-08-2024 a las 04:11:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `midaswallet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias`
--

CREATE TABLE `compañias` (
  `Id_CP` int(5) NOT NULL,
  `Numero_Compañia` int(5) DEFAULT NULL,
  `Actividad_Principal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `Id_CT` int(5) NOT NULL,
  `Codigo_Cuartel` int(5) DEFAULT NULL,
  `Primer_nombre_cuartel` varchar(10) DEFAULT NULL,
  `Segundo_nombre_cuartel` varchar(10) DEFAULT NULL,
  `Ubicacion_pais` varchar(10) DEFAULT NULL,
  `Ubicacion_departamento` varchar(10) DEFAULT NULL,
  `Ubicacion_ciudad` varchar(10) DEFAULT NULL,
  `Ubicacion_barrio` varchar(10) DEFAULT NULL,
  `Ubicacion_Calle_carrera_Dg` varchar(10) DEFAULT NULL,
  `Ubicacion_Numero` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles_compañia`
--

CREATE TABLE `cuarteles_compañia` (
  `Id_CT1` int(10) DEFAULT NULL,
  `Id_CP1` int(10) DEFAULT NULL,
  `id_CT3` int(10) DEFAULT NULL,
  `id_CP2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpos_ejercito`
--

CREATE TABLE `cuerpos_ejercito` (
  `Id_CE` int(5) NOT NULL,
  `Infanteria` varchar(10) DEFAULT NULL,
  `Artilleria` varchar(10) DEFAULT NULL,
  `Armada` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `Id_SR` int(5) NOT NULL,
  `Cuartelero` varchar(10) DEFAULT NULL,
  `Guardia` varchar(10) DEFAULT NULL,
  `Actividad_Principal` varchar(10) DEFAULT NULL,
  `Condigo_Actividad` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_soldado`
--

CREATE TABLE `servicio_soldado` (
  `Id_SR1` int(10) DEFAULT NULL,
  `Id_SD1` int(10) DEFAULT NULL,
  `id_SD2` int(10) DEFAULT NULL,
  `id_SR2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `Id_SD` int(5) NOT NULL,
  `Primer_Nombre` varchar(10) DEFAULT NULL,
  `Segundo_Nombre` varchar(10) DEFAULT NULL,
  `Primer_Apellido` varchar(10) DEFAULT NULL,
  `Segundo_Apellido` varchar(10) DEFAULT NULL,
  `Codigo_Soldado` int(5) DEFAULT NULL,
  `Codigo_Cuartel` int(5) DEFAULT NULL,
  `Grado` varchar(10) DEFAULT NULL,
  `id_CT2` int(10) DEFAULT NULL,
  `id_CE2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañias`
--
ALTER TABLE `compañias`
  ADD PRIMARY KEY (`Id_CP`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`Id_CT`);

--
-- Indices de la tabla `cuarteles_compañia`
--
ALTER TABLE `cuarteles_compañia`
  ADD KEY `fk_id5` (`id_CT3`),
  ADD KEY `fk_id6` (`id_CP2`);

--
-- Indices de la tabla `cuerpos_ejercito`
--
ALTER TABLE `cuerpos_ejercito`
  ADD PRIMARY KEY (`Id_CE`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`Id_SR`);

--
-- Indices de la tabla `servicio_soldado`
--
ALTER TABLE `servicio_soldado`
  ADD KEY `fk_id3` (`id_SD2`),
  ADD KEY `fk_id4` (`id_SR2`);

--
-- Indices de la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD PRIMARY KEY (`Id_SD`),
  ADD KEY `fk_id1` (`id_CT2`),
  ADD KEY `fk_id2` (`id_CE2`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañias`
--
ALTER TABLE `compañias`
  MODIFY `Id_CP` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  MODIFY `Id_CT` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpos_ejercito`
--
ALTER TABLE `cuerpos_ejercito`
  MODIFY `Id_CE` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `Id_SR` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldado`
--
ALTER TABLE `soldado`
  MODIFY `Id_SD` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuarteles_compañia`
--
ALTER TABLE `cuarteles_compañia`
  ADD CONSTRAINT `fk_id5` FOREIGN KEY (`id_CT3`) REFERENCES `cuarteles` (`Id_CT`),
  ADD CONSTRAINT `fk_id6` FOREIGN KEY (`id_CP2`) REFERENCES `compañias` (`Id_CP`);

--
-- Filtros para la tabla `servicio_soldado`
--
ALTER TABLE `servicio_soldado`
  ADD CONSTRAINT `fk_id3` FOREIGN KEY (`id_SD2`) REFERENCES `soldado` (`Id_SD`),
  ADD CONSTRAINT `fk_id4` FOREIGN KEY (`id_SR2`) REFERENCES `servicios` (`Id_SR`);

--
-- Filtros para la tabla `soldado`
--
ALTER TABLE `soldado`
  ADD CONSTRAINT `fk_id1` FOREIGN KEY (`id_CT2`) REFERENCES `cuarteles` (`Id_CT`),
  ADD CONSTRAINT `fk_id2` FOREIGN KEY (`id_CE2`) REFERENCES `cuerpos_ejercito` (`Id_CE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
