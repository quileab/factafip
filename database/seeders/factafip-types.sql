-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para factafip
CREATE DATABASE IF NOT EXISTS `factafip` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `factafip`;

-- Volcando estructura para tabla factafip.currency_types
CREATE TABLE IF NOT EXISTS `currency_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_types_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.currency_types: ~0 rows (aproximadamente)
DELETE FROM `currency_types`;
/*!40000 ALTER TABLE `currency_types` DISABLE KEYS */;
INSERT INTO `currency_types` (`id`, `key`, `value`) VALUES
	(1, '000', 'OTRAS MONEDAS'),
	(2, 'PES', 'PESOS'),
	(3, 'DOL', 'Dólar ESTADOUNIDENSE'),
	(4, '002', 'Dólar EEUU LIBRE'),
	(5, '003', 'FRANCOS FRANCESES'),
	(6, '004', 'LIRAS ITALIANAS'),
	(7, '005', 'PESETAS'),
	(8, '006', 'MARCOS ALEMANES'),
	(9, '007', 'FLORINES HOLANDESES'),
	(10, '008', 'FRANCOS BELGAS'),
	(11, '009', 'FRANCOS SUIZOS'),
	(12, '010', 'PESOS MEJICANOS'),
	(13, '011', 'PESOS URUGUAYOS'),
	(14, '012', 'REAL'),
	(15, '013', 'ESCUDOS PORTUGUESES'),
	(16, '014', 'CORONAS DANESAS'),
	(17, '015', 'CORONAS NORUEGAS'),
	(18, '016', 'CORONAS SUECAS'),
	(19, '017', 'CHELINES AUTRIACOS'),
	(20, '018', 'Dólar CANADIENSE'),
	(21, '019', 'YENS'),
	(22, '021', 'LIBRA ESTERLINA'),
	(23, '022', 'MARCOS FINLANDESES'),
	(24, '023', 'BOLIVAR (VENEZOLANO)'),
	(25, '024', 'CORONA CHECA'),
	(26, '025', 'DINAR (YUGOSLAVO)'),
	(27, '026', 'Dólar AUSTRALIANO'),
	(28, '027', 'DRACMA (GRIEGO)'),
	(29, '028', 'FLORIN (ANTILLAS HOLA'),
	(30, '029', 'GUARANI'),
	(31, '030', 'SHEKEL (ISRAEL)'),
	(32, '031', 'PESO BOLIVIANO'),
	(33, '032', 'PESO COLOMBIANO'),
	(34, '033', 'PESO CHILENO'),
	(35, '034', 'RAND (SUDAFRICANO)'),
	(36, '035', 'NUEVO SOL PERUANO'),
	(37, '036', 'SUCRE (ECUATORIANO)'),
	(38, '040', 'LEI RUMANOS'),
	(39, '041', 'DERECHOS ESPECIALES DE GIRO'),
	(40, '042', 'PESOS DOMINICANOS'),
	(41, '043', 'BALBOAS PANAMEÑAS'),
	(42, '044', 'CORDOBAS NICARAGÛENSES'),
	(43, '045', 'DIRHAM MARROQUÍES'),
	(44, '046', 'LIBRAS EGIPCIAS'),
	(45, '047', 'RIYALS SAUDITAS'),
	(46, '048', 'BRANCOS BELGAS FINANCIERAS'),
	(47, '049', 'GRAMOS DE ORO FINO'),
	(48, '050', 'LIBRAS IRLANDESAS'),
	(49, '051', 'Dólar DE HONG KONG'),
	(50, '052', 'Dólar DE SINGAPUR'),
	(51, '053', 'Dólar DE JAMAICA'),
	(52, '054', 'Dólar DE TAIWAN'),
	(53, '055', 'QUETZAL (GUATEMALTECOS)'),
	(54, '056', 'FORINT (HUNGRIA)'),
	(55, '057', 'BAHT (TAILANDIA)'),
	(56, '058', 'ECU'),
	(57, '059', 'DINAR KUWAITI'),
	(58, '060', 'EURO'),
	(59, '061', 'ZLTYS POLACOS'),
	(60, '062', 'RUPIAS HINDÚES'),
	(61, '063', 'LEMPIRAS HONDUREÑAS'),
	(62, '064', 'YUAN (Rep. Pop. China)');
/*!40000 ALTER TABLE `currency_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.customer_id_types
CREATE TABLE IF NOT EXISTS `customer_id_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.customer_id_types: ~38 rows (aproximadamente)
DELETE FROM `customer_id_types`;
/*!40000 ALTER TABLE `customer_id_types` DISABLE KEYS */;
INSERT INTO `customer_id_types` (`id`, `value`) VALUES
	(1, 'CI Buenos Aires'),
	(2, 'CI Catamarca'),
	(3, 'CI Córdoba'),
	(4, 'CI Corrientes'),
	(5, 'CI Entre Ríos'),
	(6, 'CI Jujuy'),
	(7, 'CI Mendoza'),
	(8, 'CI La Rioja'),
	(9, 'CI Salta'),
	(10, 'CI San Juan'),
	(11, 'CI San Luis'),
	(12, 'CI Santa Fe'),
	(13, 'CI Santiago del Estero'),
	(14, 'CI Tucumán'),
	(16, 'CI Chaco'),
	(17, 'CI Chubut'),
	(18, 'CI Formosa'),
	(19, 'CI Misiones'),
	(20, 'CI Neuquén'),
	(21, 'CI La Pampa'),
	(22, 'CI Río Negro'),
	(23, 'CI Santa Cruz'),
	(24, 'CI Tierra del Fuego'),
	(30, 'Certificado de Migración'),
	(39, 'CI Policía Federal'),
	(80, 'CUIT'),
	(86, 'CUIL'),
	(87, 'CDI'),
	(88, 'Usado por Anses para Padrón'),
	(89, 'LE'),
	(90, 'LC'),
	(91, 'CI extranjera'),
	(92, 'en trámite'),
	(93, 'Acta nacimiento'),
	(94, 'Pasaporte'),
	(95, 'CI Bs. As. RNP'),
	(96, 'DNI'),
	(99, 'Sin identificar/venta global diaria');
/*!40000 ALTER TABLE `customer_id_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.included_concept_types
CREATE TABLE IF NOT EXISTS `included_concept_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.included_concept_types: ~4 rows (aproximadamente)
DELETE FROM `included_concept_types`;
/*!40000 ALTER TABLE `included_concept_types` DISABLE KEYS */;
INSERT INTO `included_concept_types` (`id`, `value`) VALUES
	(1, 'Producto / Exportación definitiva de bienes'),
	(2, 'Servicios'),
	(3, 'Productos y Servicios'),
	(4, 'Otro');
/*!40000 ALTER TABLE `included_concept_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.other_tributes_types
CREATE TABLE IF NOT EXISTS `other_tributes_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.other_tributes_types: ~18 rows (aproximadamente)
DELETE FROM `other_tributes_types`;
/*!40000 ALTER TABLE `other_tributes_types` DISABLE KEYS */;
INSERT INTO `other_tributes_types` (`id`, `value`, `description`) VALUES
	(1, 'Impuestos nacionales', ''),
	(2, 'Impuestos provinciales', ''),
	(3, 'Impuestos municipales', ''),
	(4, 'Impuestos internos', ''),
	(5, 'IIBB', ''),
	(6, 'Percepción de IVA', ''),
	(7, 'Percepción de IIBB', ''),
	(8, 'Percepciones por Impuestos Municipales', ''),
	(9, 'Otras Percepciones', ''),
	(10, 'Impuesto interno a nivel item', 'Sólo Controladores Fiscales'),
	(13, 'Percepción de IVA a no Categorizado ', 'Solo FE'),
	(14, 'Retención IIGG - RG 830', 'Liquidaciones Pecuarias'),
	(15, 'Retención IVA - RG 3873', 'Liquidaciones Pecuarias'),
	(16, 'Pago a cuenta IVA - RG 3873', 'Liquidaciones Pecuarias'),
	(17, 'Percepción IVA  RG 3873', 'Liquidaciones Pecuarias'),
	(18, 'Retención IVA – RG 2616/2009', 'Liquidaciones Pecuarias'),
	(19, 'Retención Ganancias – RG 2616/2009', 'Liquidaciones Pecuarias'),
	(99, 'Otros', '');
/*!40000 ALTER TABLE `other_tributes_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.province_id_types
CREATE TABLE IF NOT EXISTS `province_id_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.province_id_types: ~24 rows (aproximadamente)
DELETE FROM `province_id_types`;
/*!40000 ALTER TABLE `province_id_types` DISABLE KEYS */;
INSERT INTO `province_id_types` (`id`, `value`) VALUES
	(1, 'Buenos Aires'),
	(2, 'Catamara'),
	(3, 'Córdoba'),
	(4, 'Corrientes'),
	(5, 'Entre Ríos'),
	(6, 'Jujuy'),
	(7, 'Mendoza'),
	(8, 'La Rioja'),
	(9, 'Salta'),
	(10, 'San Juan'),
	(11, 'San Luis'),
	(12, 'Santa Fe'),
	(13, 'Santiago del Estero'),
	(14, 'Tucumán'),
	(16, 'Chaco'),
	(17, 'Chubut'),
	(18, 'Formosa'),
	(19, 'Misiones'),
	(20, 'Neuquén'),
	(21, 'La Pampa'),
	(22, 'Río Negro'),
	(23, 'Santa Cruz'),
	(24, 'Tierra del Fuego'),
	(25, 'Ciudad Autónoma de Buenos Aires');
/*!40000 ALTER TABLE `province_id_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.responsibility_types
CREATE TABLE IF NOT EXISTS `responsibility_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.responsibility_types: ~14 rows (aproximadamente)
DELETE FROM `responsibility_types`;
/*!40000 ALTER TABLE `responsibility_types` DISABLE KEYS */;
INSERT INTO `responsibility_types` (`id`, `value`) VALUES
	(1, 'IVA Responsable Inscripto'),
	(2, 'IVA Responsable no Inscripto'),
	(3, 'IVA no Responsable'),
	(4, 'IVA Sujeto Exento'),
	(5, 'Consumidor Final'),
	(6, 'Responsable Monotributo'),
	(7, 'Sujeto no Categorizado'),
	(8, 'Proveedor del Exterior'),
	(9, 'Cliente del Exterior'),
	(10, 'IVA Liberado – Ley Nº 19.640'),
	(11, 'IVA Responsable Inscripto – Agente de Percepción'),
	(12, 'Pequeño Contribuyente Eventual'),
	(13, 'Monotributista Social'),
	(14, 'Pequeño Contribuyente Eventual Social');
/*!40000 ALTER TABLE `responsibility_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.tax_condition_types
CREATE TABLE IF NOT EXISTS `tax_condition_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` decimal(5,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.tax_condition_types: ~10 rows (aproximadamente)
DELETE FROM `tax_condition_types`;
/*!40000 ALTER TABLE `tax_condition_types` DISABLE KEYS */;
INSERT INTO `tax_condition_types` (`id`, `value`, `description`, `note`) VALUES
	(1, 0.00, 'No Gravado', ''),
	(2, 0.00, 'Exento', ''),
	(3, 0.00, '0%', ''),
	(4, 10.50, '10,50%', ''),
	(5, 21.00, '21%', ''),
	(6, 27.00, '27%', ''),
	(7, 0.00, 'Gravado', 'SOLO PARA CONTROLADORES FISCALES'),
	(8, 5.00, '5%', ''),
	(9, 2.50, '2,50%', ''),
	(11, 0.00, 'No Corresponde', 'NO APLICA PARA FACTURA ELECTRÓNICA');
/*!40000 ALTER TABLE `tax_condition_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.unit_types
CREATE TABLE IF NOT EXISTS `unit_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.unit_types: ~54 rows (aproximadamente)
DELETE FROM `unit_types`;
/*!40000 ALTER TABLE `unit_types` DISABLE KEYS */;
INSERT INTO `unit_types` (`id`, `value`) VALUES
	(1, 'KILOGRAMO'),
	(2, 'METROS'),
	(3, 'METRO CUADRADO'),
	(4, 'METRO CUBICO'),
	(5, 'LITROS'),
	(6, '1000 KILOWATT HORA'),
	(7, 'UNIDAD'),
	(8, 'PAR'),
	(9, 'DOCENA'),
	(10, 'QUILATE'),
	(11, 'MILLAR'),
	(12, 'MEGA U. INTER. ACT. ANTIB'),
	(13, 'UNIDAD INT. ACT. INMUNG'),
	(14, 'GRAMO'),
	(15, 'MILIMETRO'),
	(16, 'MILIMETRO CUBICO'),
	(17, 'KILOMETRO'),
	(18, 'HECTOLITRO'),
	(19, 'MEGA UNIDAD INT. ACT. INMUNG'),
	(20, 'CENTIMETRO'),
	(21, 'KILOGRAMO ACTIVO'),
	(22, 'GRAMO ACTIVO'),
	(23, 'GRAMO BASE'),
	(24, 'UIACTHOR'),
	(25, 'JGO.PQT. MAZO NAIPES'),
	(26, 'MUIACTHOR'),
	(27, 'CENTIMETRO CUBICO'),
	(28, 'UIACTANT'),
	(29, 'TONELADA'),
	(30, 'DECAMETRO CUBICO'),
	(31, 'HECTOMETRO CUBICO'),
	(32, 'KILOMETRO CUBICO'),
	(33, 'MICROGRAMO'),
	(34, 'NANOGRAMO'),
	(35, 'PICOGRAMO'),
	(36, 'MUIACTANT'),
	(37, 'UIACTIG'),
	(41, 'MILIGRAMO'),
	(47, 'MILILITRO'),
	(48, 'CURIE'),
	(49, 'MILICURIE'),
	(50, 'MICROCURIE'),
	(51, 'U.INTER. ACT. HORMONAL'),
	(52, 'MEGA U. INTER. ACT. HOR.'),
	(53, 'KILOGRAMO BASE'),
	(54, 'GRUESA'),
	(55, 'MUIACTIG'),
	(56, 'SIN DESCRIPCION'),
	(61, 'KILOGRAMO BRUTO'),
	(62, 'PACK'),
	(63, 'HORMA'),
	(97, 'SEÑAS/ANTICIPOS'),
	(98, 'OTRAS UNIDADES'),
	(99, 'BONIFICACION');
/*!40000 ALTER TABLE `unit_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.voucher_types
CREATE TABLE IF NOT EXISTS `voucher_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.voucher_types: ~96 rows (aproximadamente)
DELETE FROM `voucher_types`;
/*!40000 ALTER TABLE `voucher_types` DISABLE KEYS */;
INSERT INTO `voucher_types` (`id`, `value`) VALUES
	(1, 'FACTURAS A'),
	(2, 'NOTAS DE DEBITO A'),
	(3, 'NOTAS DE CREDITO A'),
	(4, 'RECIBOS A'),
	(5, 'NOTAS DE VENTA AL CONTADO A'),
	(6, 'FACTURAS B'),
	(7, 'NOTAS DE DEBITO B'),
	(8, 'NOTAS DE CREDITO B'),
	(9, 'RECIBOS B'),
	(10, 'NOTAS DE VENTA AL CONTADO B'),
	(11, 'FACTURAS C'),
	(12, 'NOTAS DE DEBITO C'),
	(13, 'NOTAS DE CREDITO C'),
	(15, 'RECIBOS C'),
	(16, 'NOTAS DE VENTA AL CONTADO C'),
	(17, 'LIQUIDACION DE SERVICIOS PUBLICOS CLASE A'),
	(18, 'LIQUIDACION DE SERVICIOS PUBLICOS CLASE B'),
	(19, 'FACTURAS DE EXPORTACION'),
	(20, 'NOTAS DE DEBITO POR OPERACIONES CON EL EXTERIOR'),
	(21, 'NOTAS DE CREDITO POR OPERACIONES CON EL EXTERIOR'),
	(22, 'FACTURAS - PERMISO EXPORTACION SIMPLIFICADO - DTO. 855/97'),
	(23, 'COMPROBANTES “A” DE COMPRA PRIMARIA PARA EL SECTOR PESQUERO MARITIMO'),
	(24, 'COMPROBANTES “A” DE CONSIGNACION PRIMARIA PARA EL SECTOR PESQUERO MARITIMO'),
	(25, 'COMPROBANTES “B” DE COMPRA PRIMARIA PARA EL SECTOR PESQUERO MARITIMO'),
	(26, 'COMPROBANTES “B” DE CONSIGNACION PRIMARIA PARA EL SECTOR PESQUERO MARITIMO'),
	(27, 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A'),
	(28, 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B'),
	(29, 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C'),
	(30, 'COMPROBANTES DE COMPRA DE BIENES USADOS'),
	(31, 'MANDATO - CONSIGNACION'),
	(32, 'COMPROBANTES PARA RECICLAR MATERIALES'),
	(33, 'LIQUIDACION PRIMARIA DE GRANOS'),
	(34, 'COMPROBANTES A DEL APARTADO A  INCISO F)  R.G. N°  1415'),
	(35, 'COMPROBANTES B DEL ANEXO I, APARTADO A, INC. F), R.G. N° 1415'),
	(36, 'COMPROBANTES C DEL Anexo I, Apartado A, INC.F), R.G. N° 1415'),
	(37, 'NOTAS DE DEBITO O DOCUMENTO EQUIVALENTE QUE CUMPLAN CON LA R.G. N° 1415'),
	(38, 'NOTAS DE CREDITO O DOCUMENTO EQUIVALENTE QUE CUMPLAN CON LA R.G. N° 1415'),
	(39, 'OTROS COMPROBANTES A QUE CUMPLEN CON LA R G  1415'),
	(40, 'OTROS COMPROBANTES B QUE CUMPLAN CON LA R.G. N° 1415'),
	(41, 'OTROS COMPROBANTES C QUE CUMPLAN CON LA R.G. N° 1415'),
	(43, 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B'),
	(44, 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C'),
	(45, 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A'),
	(46, 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B'),
	(47, 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C'),
	(48, 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A'),
	(49, 'COMPROBANTES DE COMPRA DE BIENES NO REGISTRABLES A CONSUMIDORES FINALES'),
	(50, 'RECIBO FACTURA A  REGIMEN DE FACTURA DE CREDITO '),
	(51, 'FACTURAS M'),
	(52, 'NOTAS DE DEBITO M'),
	(53, 'NOTAS DE CREDITO M'),
	(54, 'RECIBOS M'),
	(55, 'NOTAS DE VENTA AL CONTADO M'),
	(56, 'COMPROBANTES M DEL ANEXO I  APARTADO A  INC F) R.G. N° 1415'),
	(57, 'OTROS COMPROBANTES M QUE CUMPLAN CON LA R.G. N° 1415'),
	(58, 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO M'),
	(59, 'LIQUIDACIONES M'),
	(60, 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO A'),
	(61, 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO B'),
	(63, 'LIQUIDACIONES A'),
	(64, 'LIQUIDACIONES B'),
	(66, 'DESPACHO DE IMPORTACION'),
	(68, 'LIQUIDACION C'),
	(70, 'RECIBOS FACTURA DE CREDITO'),
	(80, 'INFORME DIARIO DE CIERRE (ZETA) - CONTROLADORES FISCALES'),
	(81, 'TIQUE FACTURA A   '),
	(82, 'TIQUE FACTURA B'),
	(83, 'TIQUE'),
	(88, 'REMITO ELECTRONICO'),
	(89, 'RESUMEN DE DATOS'),
	(90, 'OTROS COMPROBANTES - DOCUMENTOS EXCEPTUADOS - NOTAS DE CREDITO'),
	(91, 'REMITOS R'),
	(99, 'OTROS COMPROBANTES QUE NO CUMPLEN O ESTÁN EXCEPTUADOS DE LA R.G. 1415 Y SUS MODIF '),
	(110, 'TIQUE NOTA DE CREDITO '),
	(111, 'TIQUE FACTURA C'),
	(112, 'TIQUE NOTA DE CREDITO A'),
	(113, 'TIQUE NOTA DE CREDITO B'),
	(114, 'TIQUE NOTA DE CREDITO C'),
	(115, 'TIQUE NOTA DE DEBITO A'),
	(116, 'TIQUE NOTA DE DEBITO B'),
	(117, 'TIQUE NOTA DE DEBITO C'),
	(118, 'TIQUE FACTURA M'),
	(119, 'TIQUE NOTA DE CREDITO M'),
	(120, 'TIQUE NOTA DE DEBITO M'),
	(201, 'FACTURA DE CRÉDITO ELECTRÓNICA MiPyMEs (FCE) A'),
	(202, 'NOTA DE DEBITO ELECTRÓNICA MiPyMEs (FCE) A'),
	(203, 'NOTA DE CREDITO ELECTRÓNICA MiPyMEs (FCE) A'),
	(206, 'FACTURA DE CRÉDITO ELECTRÓNICA MiPyMEs (FCE) B'),
	(207, 'NOTA DE DEBITO ELECTRÓNICA MiPyMEs (FCE) B'),
	(208, 'NOTA DE CREDITO ELECTRÓNICA MiPyMEs (FCE) B'),
	(211, 'FACTURA DE CRÉDITO ELECTRÓNICA MiPyMEs (FCE) C'),
	(212, 'NOTA DE DEBITO ELECTRÓNICA MiPyMEs (FCE) C'),
	(213, 'NOTA DE CREDITO ELECTRÓNICA MiPyMEs (FCE) C'),
	(331, 'LIQUIDACION SECUNDARIA DE GRANOS'),
	(332, 'CERTIFICACION ELECTRONICA (GRANOS)'),
	(995, 'REMITO ELECTRÓNICO CÁRNICO ');
/*!40000 ALTER TABLE `voucher_types` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
