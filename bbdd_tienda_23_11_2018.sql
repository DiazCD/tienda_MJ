-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.21-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5339
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_tienda
CREATE DATABASE IF NOT EXISTS `bd_tienda` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_tienda`;

-- Volcando estructura para tabla bd_tienda.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif_admin` varchar(9) NOT NULL,
  `pass_admin` varchar(50) NOT NULL,
  `nombre_admin` varchar(50) NOT NULL,
  `apellidos_admin` varchar(50) NOT NULL,
  `email_admin` varchar(50) NOT NULL,
  `fecha_alta_admin` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif_admin` (`nif_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd_tienda.administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.articulo
CREATE TABLE IF NOT EXISTS `articulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendedor_art` int(11) NOT NULL,
  `id_categoria_art` int(11) NOT NULL,
  `id_subcategoria_art` int(11) NOT NULL,
  `nombre_art` varchar(50) NOT NULL,
  `descripcion_art` varchar(50) NOT NULL,
  `importe_art` float NOT NULL,
  `fecha_alta_art` datetime NOT NULL,
  `cantidad_max_art` int(11) NOT NULL,
  `imagen_art` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_articulo_vendedor` (`id_vendedor_art`),
  KEY `FK_articulo_categoria` (`id_categoria_art`),
  KEY `FK_articulo_subcategoria` (`id_subcategoria_art`),
  CONSTRAINT `FK_articulo_categoria` FOREIGN KEY (`id_categoria_art`) REFERENCES `categoria` (`id`),
  CONSTRAINT `FK_articulo_subcategoria` FOREIGN KEY (`id_subcategoria_art`) REFERENCES `subcategoria` (`id`),
  CONSTRAINT `FK_articulo_vendedor` FOREIGN KEY (`id_vendedor_art`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.articulo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
REPLACE INTO `articulo` (`id`, `id_vendedor_art`, `id_categoria_art`, `id_subcategoria_art`, `nombre_art`, `descripcion_art`, `importe_art`, `fecha_alta_art`, `cantidad_max_art`, `imagen_art`) VALUES
	(1, 1, 1, 1, 'Abeja Reina', 'Mu güena', 10, '2018-11-23 01:05:24', 10, 'images/products/AbejaReina.jpg'),
	(2, 1, 1, 1, 'Marijuana', 'Mu güena tambien', 10, '2018-11-23 01:05:48', 10, 'images/products/Marijuana.jpg');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cat` varchar(50) NOT NULL,
  `descripcion_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.categoria: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
REPLACE INTO `categoria` (`id`, `nombre_cat`, `descripcion_cat`) VALUES
	(1, 'Rubia', 'Cerveza Rubita');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_articulo_com` int(11) NOT NULL,
  `id_usuario_com` int(11) NOT NULL,
  `descripcion_com` varchar(50) NOT NULL,
  `valoracion_com` int(11) NOT NULL,
  `fecha_alta_com` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comentario_articulo` (`id_articulo_com`),
  KEY `FK_comentario_usuario` (`id_usuario_com`),
  CONSTRAINT `FK_comentario_articulo` FOREIGN KEY (`id_articulo_com`) REFERENCES `articulo` (`id`),
  CONSTRAINT `FK_comentario_usuario` FOREIGN KEY (`id_usuario_com`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.comentario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.configuracion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.direccion
CREATE TABLE IF NOT EXISTS `direccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `poblacion` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_direccion_usuario` (`id_usuario`),
  CONSTRAINT `FK_direccion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.direccion: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
REPLACE INTO `direccion` (`id`, `id_usuario`, `direccion`, `poblacion`, `pais`) VALUES
	(1, 1, 'C/Filipinas 8 1E', 'Albacete', 'EspaÃ±a'),
	(2, 2, 'C/Filipinas 8 1E', 'Albacete', 'EspaÃ±a');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion_ped` varchar(50) NOT NULL,
  `id_usuario_ped` int(11) NOT NULL,
  `importe_ped` float NOT NULL,
  `importe_total` float NOT NULL,
  `fecha_ped` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pedido_usuario` (`id_usuario_ped`),
  CONSTRAINT `FK_pedido_usuario` FOREIGN KEY (`id_usuario_ped`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.pedido: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.pedido_lin
CREATE TABLE IF NOT EXISTS `pedido_lin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_articulo_lin` int(11) NOT NULL,
  `cantidad_lin` int(11) NOT NULL,
  `importe_lin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pedido_lin_articulo` (`id_articulo_lin`),
  KEY `FK_pedido_lin_pedido` (`id_pedido`),
  CONSTRAINT `FK_pedido_lin_articulo` FOREIGN KEY (`id_articulo_lin`) REFERENCES `articulo` (`id`),
  CONSTRAINT `FK_pedido_lin_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.pedido_lin: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_lin` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_lin` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.subcategoria
CREATE TABLE IF NOT EXISTS `subcategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre_subcat` varchar(50) NOT NULL,
  `descripcion_subcat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_subcategoria_categoria` (`id_categoria`),
  CONSTRAINT `FK_subcategoria_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla bd_tienda.subcategoria: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
REPLACE INTO `subcategoria` (`id`, `id_categoria`, `nombre_subcat`, `descripcion_subcat`) VALUES
	(1, 1, 'Ale', 'Larga Fermentación');
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_tarj` int(11) NOT NULL DEFAULT '0',
  `numero_tarj` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tarjeta_usuario` (`id_usuario_tarj`),
  CONSTRAINT `FK_tarjeta_usuario` FOREIGN KEY (`id_usuario_tarj`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.tarjeta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif_usr` varchar(9) NOT NULL,
  `pass_usr` varchar(9) NOT NULL,
  `nombre_usr` varchar(50) NOT NULL,
  `apellido_usr` varchar(50) NOT NULL,
  `email_usr` varchar(50) NOT NULL,
  `fecha_alta_usr` date NOT NULL,
  `fecha_nac_usr` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif_usr` (`nif_usr`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.usuario: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` (`id`, `nif_usr`, `pass_usr`, `nombre_usr`, `apellido_usr`, `email_usr`, `fecha_alta_usr`, `fecha_nac_usr`) VALUES
	(1, '47446804n', '123456789', 'Julian', 'Rodenas', 'asd@as.c', '2018-11-23', '2018-11-23'),
	(2, '12345678s', '123456789', 'Miguel Angel', 'c', 'asdas@gmail.es', '2018-11-23', '2018-11-23');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.vendedor
CREATE TABLE IF NOT EXISTS `vendedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif_vend` varchar(50) NOT NULL,
  `pass_vend` varchar(50) NOT NULL,
  `nombre_vend` varchar(50) NOT NULL,
  `apellidos_vend` varchar(50) NOT NULL,
  `email_vend` varchar(50) NOT NULL,
  `fecha_alta_vend` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif_vend` (`nif_vend`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.vendedor: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
REPLACE INTO `vendedor` (`id`, `nif_vend`, `pass_vend`, `nombre_vend`, `apellidos_vend`, `email_vend`, `fecha_alta_vend`) VALUES
	(1, '123456789', '123456789', 'Cerveceria1', 'Cerv', 'asd@asd.es', '2018-11-23');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
