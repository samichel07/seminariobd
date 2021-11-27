-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2021 a las 03:17:18
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `teatro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `afinidad`
--

CREATE TABLE `afinidad` (
  `id_afinidad` int(11) NOT NULL,
  `obra` varchar(50) NOT NULL,
  `papel` varchar(50) NOT NULL,
  `artista` varchar(50) NOT NULL,
  `interpretaciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artista`
--

CREATE TABLE `artista` (
  `nombre_artistico` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `cache` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `papel_afin` varchar(50) NOT NULL,
  `cantidad_interpretaciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `nombre_artistico` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `precio_libreto` int(11) NOT NULL,
  `precio_representacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `id_funcion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `teatro` varchar(50) NOT NULL,
  `obra` varchar(50) NOT NULL,
  `id_afinidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra`
--

CREATE TABLE `obra` (
  `titulo_obra` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `anio_publicacion` year(4) NOT NULL,
  `representaciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `papel`
--

CREATE TABLE `papel` (
  `nombre_papel` varchar(50) NOT NULL,
  `obra` varchar(50) NOT NULL,
  `duracion` time NOT NULL,
  `atrezo` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teatro`
--

CREATE TABLE `teatro` (
  `nombre_teatro` varchar(50) NOT NULL,
  `calle_numero` varchar(50) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `aforo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `afinidad`
--
ALTER TABLE `afinidad`
  ADD PRIMARY KEY (`id_afinidad`),
  ADD KEY `obra` (`obra`),
  ADD KEY `papel` (`papel`),
  ADD KEY `artista` (`artista`);

--
-- Indices de la tabla `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`nombre_artistico`);

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`nombre_artistico`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`id_funcion`),
  ADD KEY `teatro` (`teatro`),
  ADD KEY `obra` (`obra`),
  ADD KEY `id_afinidad` (`id_afinidad`);

--
-- Indices de la tabla `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`titulo_obra`),
  ADD KEY `autor` (`autor`);

--
-- Indices de la tabla `papel`
--
ALTER TABLE `papel`
  ADD PRIMARY KEY (`nombre_papel`),
  ADD KEY `obra` (`obra`);

--
-- Indices de la tabla `teatro`
--
ALTER TABLE `teatro`
  ADD PRIMARY KEY (`nombre_teatro`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `afinidad`
--
ALTER TABLE `afinidad`
  ADD CONSTRAINT `afinidad_ibfk_1` FOREIGN KEY (`obra`) REFERENCES `papel` (`obra`),
  ADD CONSTRAINT `afinidad_ibfk_2` FOREIGN KEY (`papel`) REFERENCES `papel` (`nombre_papel`),
  ADD CONSTRAINT `afinidad_ibfk_3` FOREIGN KEY (`artista`) REFERENCES `artista` (`nombre_artistico`);

--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `funcion_ibfk_1` FOREIGN KEY (`teatro`) REFERENCES `teatro` (`nombre_teatro`),
  ADD CONSTRAINT `funcion_ibfk_2` FOREIGN KEY (`obra`) REFERENCES `obra` (`titulo_obra`),
  ADD CONSTRAINT `funcion_ibfk_3` FOREIGN KEY (`id_afinidad`) REFERENCES `afinidad` (`id_afinidad`);

--
-- Filtros para la tabla `obra`
--
ALTER TABLE `obra`
  ADD CONSTRAINT `obra_ibfk_1` FOREIGN KEY (`autor`) REFERENCES `autor` (`nombre_artistico`);

--
-- Filtros para la tabla `papel`
--
ALTER TABLE `papel`
  ADD CONSTRAINT `papel_ibfk_1` FOREIGN KEY (`obra`) REFERENCES `obra` (`titulo_obra`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
