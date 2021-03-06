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
  `descripcion_art` varchar(500) NOT NULL,
  `importe_art` float NOT NULL,
  `fecha_alta_art` datetime NOT NULL,
  `cantidad_max_art` int(11) NOT NULL,
  `imagen_art` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_articulo_vendedor` (`id_vendedor_art`),
  KEY `FK_articulo_subcategoria` (`id_subcategoria_art`),
  KEY `FK_articulo_categoria` (`id_categoria_art`),
  CONSTRAINT `FK_articulo_categoria` FOREIGN KEY (`id_categoria_art`) REFERENCES `categoria` (`id`),
  CONSTRAINT `FK_articulo_subcategoria` FOREIGN KEY (`id_subcategoria_art`) REFERENCES `subcategoria` (`id`),
  CONSTRAINT `FK_articulo_vendedor` FOREIGN KEY (`id_vendedor_art`) REFERENCES `vendedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.articulo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
REPLACE INTO `articulo` (`id`, `id_vendedor_art`, `id_categoria_art`, `id_subcategoria_art`, `nombre_art`, `descripcion_art`, `importe_art`, `fecha_alta_art`, `cantidad_max_art`, `imagen_art`) VALUES
	(1, 3, 1, 1, 'Abeja Reina', 'De color pajizo (casi dorado) y con una retención de espuma extraña en cervezas de su estilo, de trigo bávaras. Aromas cítricos con notas florales y recuerdos a miel y especias. Una receta basada en las cervezas de trigo alemanas tradicionales pero con una carga extra de lúpulos americanos.', 10, '2018-11-27 00:00:00', 3, 'images/products/AbejaReina.jpg'),
	(2, 3, 1, 1, 'Marijuana', 'La única cerveza cerveza artesana que podrás encontrar actualmente con un toque de tequila y cáñamo. Una cerveza "muy canalla" de tipo Pale Ale con tequila y cáñamo. Un sabor sorprendente gracias a la combinación del lúpulo y el cáñamo, ambos de la familia de las Cannabáceas. Suave, fácil de beber, de trago largo y muy refrescante.', 10, '2018-11-23 01:05:48', 2, 'images/products/Marijuana.jpg'),
	(5, 4, 1, 1, 'Bertus White IPA', 'Cerveza de estilo IPA elaborada con trigo, junto a tres tipos de malta y varios lÃºpulos cÃ­tricos americanos. De aspecto amarillo pajizo y con cierta turbidez. Aromas afurtados y sabores cÃ­tricos ligeramente acaramelados.', 2.55, '2018-12-04 00:00:00', 125, 'images/products/BertusWhiteIPA.jpg'),
	(6, 4, 1, 1, 'Matadragons', 'De color cobrizo y con un cuerpo denso y una espuma moderada. De aromas y sabores ahumados con notas dulces. Gracias a su alta graduacion, esta cerveza puede aÃ±ejarse durante aÃ±os.', 3.7, '2018-12-04 00:00:00', 25, '');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cat` varchar(50) NOT NULL,
  `descripcion_cat` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.categoria: ~0 rows (aproximadamente)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.comentario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
REPLACE INTO `comentario` (`id`, `id_articulo_com`, `id_usuario_com`, `descripcion_com`, `valoracion_com`, `fecha_alta_com`) VALUES
	(1, 1, 9, 'holaaaa', 2, '2018-12-04 20:37:06'),
	(2, 1, 10, '\r\nesta bien', 2, '2018-12-04 21:37:15');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.direccion: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
REPLACE INTO `direccion` (`id`, `id_usuario`, `direccion`, `poblacion`, `pais`) VALUES
	(10, 8, 'C/ ejemplo ', 'Albacete', 'EspaÃ±a'),
	(11, 9, 'yo', 'yo', 'yo'),
	(12, 9, 'la mia', 'la mia', 'espaÃ±a'),
	(13, 10, 'C/Filipinas 8 1E', 'Albacete', 'EspaÃ±a');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_ped` int(11) NOT NULL,
  `id_tarjeta` int(11) NOT NULL,
  `id_direccion` int(11) NOT NULL,
  `fecha_ped` datetime NOT NULL,
  `importe_total` float NOT NULL DEFAULT '0',
  `completado` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_pedido_usuario` (`id_usuario_ped`),
  KEY `FK_pedido_direccion` (`id_direccion`),
  KEY `FK_pedido_tarjeta` (`id_tarjeta`),
  CONSTRAINT `FK_pedido_direccion` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id`),
  CONSTRAINT `FK_pedido_tarjeta` FOREIGN KEY (`id_tarjeta`) REFERENCES `tarjeta` (`id`),
  CONSTRAINT `FK_pedido_usuario` FOREIGN KEY (`id_usuario_ped`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.pedido: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
REPLACE INTO `pedido` (`id`, `id_usuario_ped`, `id_tarjeta`, `id_direccion`, `fecha_ped`, `importe_total`, `completado`) VALUES
	(12, 8, 6, 10, '2018-11-28 19:39:30', 50, 0),
	(13, 9, 7, 12, '2018-12-04 20:54:06', 20, 1),
	(14, 10, 8, 13, '2018-12-04 21:38:14', 30, 0);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.pedido_lin
CREATE TABLE IF NOT EXISTS `pedido_lin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_articulo_lin` int(11) NOT NULL,
  `cantidad_lin` int(11) NOT NULL,
  `importe_lin` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_pedido_lin_articulo` (`id_articulo_lin`),
  KEY `FK_pedido_lin_pedido` (`id_pedido`),
  CONSTRAINT `FK_pedido_lin_articulo` FOREIGN KEY (`id_articulo_lin`) REFERENCES `articulo` (`id`),
  CONSTRAINT `FK_pedido_lin_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.pedido_lin: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido_lin` DISABLE KEYS */;
REPLACE INTO `pedido_lin` (`id`, `id_pedido`, `id_articulo_lin`, `cantidad_lin`, `importe_lin`) VALUES
	(17, 12, 2, 5, 50),
	(18, 13, 1, 1, 10),
	(19, 13, 2, 1, 10),
	(20, 14, 1, 2, 20),
	(21, 14, 2, 1, 10);
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

-- Volcando datos para la tabla bd_tienda.subcategoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
REPLACE INTO `subcategoria` (`id`, `id_categoria`, `nombre_subcat`, `descripcion_subcat`) VALUES
	(1, 1, 'Larga', 'Larga Fermentacion');
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.tarjeta
CREATE TABLE IF NOT EXISTS `tarjeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_tarj` int(11) NOT NULL,
  `numero_tarj` varchar(50) NOT NULL,
  `mes_cad_tarj` int(2) NOT NULL,
  `anno_cad_tarj` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tarjeta_usuario` (`id_usuario_tarj`),
  CONSTRAINT `FK_tarjeta_usuario` FOREIGN KEY (`id_usuario_tarj`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.tarjeta: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `tarjeta` DISABLE KEYS */;
REPLACE INTO `tarjeta` (`id`, `id_usuario_tarj`, `numero_tarj`, `mes_cad_tarj`, `anno_cad_tarj`) VALUES
	(5, 8, '4232075279495208', 22, 22),
	(6, 8, '4294785894698565', 2, 18),
	(7, 9, '4232075279495208', 4, 19),
	(8, 10, '4421492549659235', 2, 20);
/*!40000 ALTER TABLE `tarjeta` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif_usr` varchar(9) NOT NULL,
  `pass_usr` varchar(200) NOT NULL,
  `nombre_usr` varchar(50) NOT NULL,
  `apellido_usr` varchar(50) NOT NULL,
  `email_usr` varchar(50) NOT NULL,
  `fecha_alta_usr` date NOT NULL,
  `fecha_nac_usr` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif_usr` (`nif_usr`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.usuario: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` (`id`, `nif_usr`, `pass_usr`, `nombre_usr`, `apellido_usr`, `email_usr`, `fecha_alta_usr`, `fecha_nac_usr`) VALUES
	(8, '47446804n', '123456789', 'Julian', 'Diaz Rodenas', 'cosacosa@cosa.com', '2018-11-26', '2018-11-26'),
	(9, '48259583V', 'p+0giICy5aSPDxwubhiucg==', 'yo', 'yo', 'yo@yo.com', '2018-12-04', '2000-01-01'),
	(10, '73451983B', 'k6vt98nQDyz5bPfPjcXxOQ==', 'Andres', 'Vargas', 'nasd@hotmail.com', '2018-12-04', '1986-06-13');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tienda.vendedor
CREATE TABLE IF NOT EXISTS `vendedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nif_vend` varchar(50) NOT NULL,
  `pass_vend` varchar(50) NOT NULL,
  `nombre_vend` varchar(50) NOT NULL,
  `pais_vend` varchar(50) NOT NULL,
  `poblacion_vend` varchar(50) NOT NULL,
  `direccion_vend` varchar(50) NOT NULL,
  `email_vend` varchar(50) NOT NULL,
  `fecha_alta_vend` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif_vend` (`nif_vend`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tienda.vendedor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
REPLACE INTO `vendedor` (`id`, `nif_vend`, `pass_vend`, `nombre_vend`, `pais_vend`, `poblacion_vend`, `direccion_vend`, `email_vend`, `fecha_alta_vend`) VALUES
	(3, '48259584H', 'PLS1wlU6Ea0zgd0GbRSy1g==', 'yo', 'yo', 'yo', 'yo', 'yo@yo.com', '2018-12-04'),
	(4, '12734568G', 'k6vt98nQDyz5bPfPjcXxOQ==', 'Granujilla de Jerez', 'EspaÃ±a', 'Albacete', 'C/Guay', 'cosacosa@cosa.com', '2018-12-04');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
