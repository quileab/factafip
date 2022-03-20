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

-- Volcando estructura para tabla factafip.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.categories: ~5 rows (aproximadamente)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'General', '2021-12-23 08:24:21', '2021-12-23 08:24:22'),
	(3, 'Almacén', '2022-01-04 11:10:31', '2022-01-04 11:10:33'),
	(4, 'Verdulería', '2022-01-04 11:10:49', '2022-01-04 11:10:50'),
	(5, 'Carnicería', '2022-01-04 11:11:10', '2022-01-04 11:11:11'),
	(6, 'Limpieza', '2022-01-04 11:11:32', '2022-01-04 11:11:32'),
	(7, 'Bazar', '2022-01-04 11:11:42', '2022-01-04 11:11:42');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.configs
CREATE TABLE IF NOT EXISTS `configs` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.configs: ~8 rows (aproximadamente)
DELETE FROM `configs`;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` (`id`, `value`, `type`, `description`, `created_at`, `updated_at`) VALUES
	('address', '25 de Mayo 2282, Reconquista (Santa Fe)', 'str', 'Domicilio Comercial', '2022-01-10 11:02:58', '2022-01-10 11:02:58'),
	('business_name', 'Don Titi Distribuciones', 'str', 'Razón Social', '2022-01-10 11:02:00', '2022-01-10 11:02:00'),
	('cuit', '20-23526260-7', 'str', 'CUIT del Sistema', '2022-01-05 11:13:45', '2022-01-05 11:13:46'),
	('default_category', '1', 'int', 'Default category', '2021-12-28 22:15:40', '2021-12-28 22:15:40'),
	('iibb', '20-23526260-7', 'str', 'Ingresos Brutos', '2022-01-10 10:59:48', '2022-01-10 10:59:49'),
	('start_date', '01/01/2022', 'date', 'Fecha de Inicio de Actividades', '2022-01-10 11:00:59', '2022-01-10 11:01:00'),
	('tax_cond', '1', 'int', 'Código Condición Frente al IVA, según tabla AFIP', '2022-01-10 11:03:44', '2022-01-10 11:03:44'),
	('warehouse_id', '1', 'int', 'Default warehouse ID', '2021-12-28 22:15:40', '2021-12-28 22:15:40');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.currency_types
CREATE TABLE IF NOT EXISTS `currency_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_types_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.currency_types: ~62 rows (aproximadamente)
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

-- Volcando estructura para tabla factafip.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id_type_id` bigint(20) unsigned NOT NULL,
  `business_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id_type_id` bigint(20) unsigned NOT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CUIT` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `responsibility_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  KEY `customers_customer_id_type_id_foreign` (`customer_id_type_id`),
  KEY `customers_province_id_type_id_foreign` (`province_id_type_id`),
  KEY `customers_responsibility_type_id_foreign` (`responsibility_type_id`),
  CONSTRAINT `customers_customer_id_type_id_foreign` FOREIGN KEY (`customer_id_type_id`) REFERENCES `customer_id_types` (`id`),
  CONSTRAINT `customers_province_id_type_id_foreign` FOREIGN KEY (`province_id_type_id`) REFERENCES `province_id_types` (`id`),
  CONSTRAINT `customers_responsibility_type_id_foreign` FOREIGN KEY (`responsibility_type_id`) REFERENCES `responsibility_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20374533588 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.customers: ~4 rows (aproximadamente)
DELETE FROM `customers`;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `customer_id_type_id`, `business_name`, `name`, `address`, `city`, `province_id_type_id`, `phone`, `email`, `CUIT`, `responsibility_type_id`, `created_at`, `updated_at`) VALUES
	(0, 99, 'n/a', 'Consumidor Final', 'N/A', 'N/A', 12, '3482111111', 'x@x.com', '1', 1, '2021-12-22 22:55:18', '2021-12-22 22:55:18'),
	(1, 96, 'Tomasin Ruben Alcides', 'TOMASiN RUBEN ALCIDES', 'ZONA URBANA ', 'LA SARITA ', 12, '476045-15551261', '1@notiene.com', '20182109062', 6, NULL, NULL),
	(2, 96, 'El Lucerito, Maurenzi Susana Beatriz', 'EL LUCERITO, MAURENZI SUSANA BEATRIZ', 'ZONA URBANA', 'SAN MANUEL', 12, '476033', '2@notiene.com', '27214218343', 6, NULL, NULL),
	(6, 96, 'Gallard Luciano Pedro', 'GALLARD LUCIANO PEDRO', 'ZONA RURAL', 'SAN MANUEL', 12, '499000', '6@notiene.com', '20063306844', 1, NULL, NULL),
	(7, 96, 'Gallard Sisto Pedro', 'GALLARD SISTO PEDRO', 'ZONA URBANA', 'SAN MANUEL', 12, '499017', '7@notiene.com', '20105632240', 6, NULL, NULL),
	(8, 99, 'Escuela Nº 1197', 'ESCUELA Nº 1197', 'ZONA RURAL - LA JOSEFINA', 'TARTAGAL', 12, '15563464', '8@notiene.com', '0', 5, NULL, NULL),
	(12, 96, 'Gonzalez Amelia', 'GONZALEZ AMELIA', 'ZONA URBANA ', 'TARTAGAL ', 12, '15419724', '12@notiene.com', '27108191673', 6, NULL, NULL),
	(13, 96, 'Fain Maria Argentina', 'FAIN MARIA ARGENTINA', 'ZONA URBANA ', 'TARTAGAL', 12, '490543 - 15410743', '13@notiene.com', '27145885693', 6, NULL, NULL),
	(14, 96, 'Zanutin Dario', 'ZANUTIN DARIO', 'ZONA URBANA ', 'TARTAGAL ', 12, '490539 - 15585264', '14@notiene.com', '20135281930', 6, NULL, NULL),
	(16, 96, 'Ayala Elda Ofelia', 'AYALA ELDA OFELIA', 'ZONA URBANA ', 'TARTAGAL ', 12, '15671206 - 15550839', '16@notiene.com', '27140748426', 6, NULL, NULL),
	(22, 96, 'Walter Sandrigo', 'WALTER SANDRIGO', 'ZONA URBANA', 'LANTERI', 12, '0', '22@notiene.com', '20282751136', 6, NULL, NULL),
	(24, 96, 'Super El Diamante (Pirusel Anibal Aldo)', 'SUPER EL DIAMANTE (PIRUSEL ANIBAL ALDO)', 'ZONA URBANA ', 'TARTAGAL ', 12, '490581 - 15526499', '24@notiene.com', '20182109372', 1, NULL, NULL),
	(25, 99, 'Asoc. Cooperadora Escuela Nº 6.072', 'ASOC. COOPERADORA ESCUELA Nº 6.072', 'ZONA URBANA ', 'TARTAGAL ', 12, '490540', '25@notiene.com', '0', 5, NULL, NULL),
	(29, 99, 'Quarin Armando', 'QUARIN ARMANDO', 'ZONA URBANA', 'MOUSSY', 12, '15546200', '29@notiene.com', '0', 5, NULL, NULL),
	(32, 96, 'Comuna De Garabato', 'COMUNA DE GARABATO', 'CALLE SAN MARTIN', 'GARABATO', 12, '', '32@notiene.com', '30674354106', 4, NULL, NULL),
	(36, 96, 'Escuela Nº 6.311- Los Lapachos', 'ESCUELA Nº 6.311- LOS LAPACHOS', 'ZONA URBANA', 'LOS LAPACHOS', 12, '474907', '36@notiene.com', '0', 4, NULL, NULL),
	(38, 96, 'Karle Carlos Ricardo', 'KARLE CARLOS RICARDO', 'Bº BELGRANO', 'TARTAGAL', 12, '15526502', '38@notiene.com', '20271640383', 6, NULL, NULL),
	(41, 96, 'Asoc. Coop. Esc.Nº 447 Maria Elena De San Martin', 'ASOC. COOP. ESC.Nº 447 MARIA ELENA DE SAN MARTIN', 'ZONA URBANA', 'GARABATO', 12, '', '41@notiene.com', '30674363520', 4, NULL, NULL),
	(42, 99, 'Maurenzi Sergio', 'MAURENZI SERGIO', 'ZONA URBANA', 'SAN MANUEL', 12, '', '42@notiene.com', '0', 5, NULL, NULL),
	(43, 96, 'Gregoret Graciela Silvina', 'GREGORET GRACIELA SILVINA', 'ZONA URBANA', 'FLOR DE ORO', 12, '499412', '43@notiene.com', '23214201674', 6, NULL, NULL),
	(44, 96, 'Joffre Dante Fabian', 'JOFFRE DANTE FABIAN', 'CALLE SAN MARTIN', 'LANTERI', 12, '474008', '44@notiene.com', '20166142378', 6, NULL, NULL),
	(45, 96, 'Agretti Hector Manuel', 'AGRETTI HECTOR MANUEL', 'ZONA URBANA', 'FLOR DE ORO', 12, '499420', '45@notiene.com', '20078785455', 6, NULL, NULL),
	(46, 96, 'Moschen Mabel', 'MOSCHEN MABEL', 'CALLE 9 DE JULIO S/N', 'LANTERI', 12, '15618439', '46@notiene.com', '27125009730', 6, NULL, NULL),
	(48, 99, 'Orellano Alejandro', 'ORELLANO ALEJANDRO', 'ZONA URBANA', 'SAN MANUEL', 12, '', '48@notiene.com', '0', 5, NULL, NULL),
	(49, 96, 'Aquino Alfredo', 'AQUINO ALFREDO', 'ZONA URBANA', 'GARABATO', 12, '490207', '49@notiene.com', '23176084189', 6, NULL, NULL),
	(51, 96, 'Latorre Diego Dario Alejandro', 'LATORRE DIEGO DARIO ALEJANDRO', 'ZONA URBANA', 'GARABATO', 12, '15522982', '51@notiene.com', '20341763313', 6, NULL, NULL),
	(59, 96, 'Tortul Samuel', 'TORTUL SAMUEL', 'ZONA URBANA', 'LAS GARZAS', 12, '493045', '59@notiene.com', '30710423934', 1, NULL, NULL),
	(61, 96, 'Sandrigo Aldo Rosendo', 'SANDRIGO ALDO ROSENDO', 'ZONA URBANA', 'GUADALUPE NORTE', 12, '', '61@notiene.com', '20063094693', 1, NULL, NULL),
	(62, 96, 'Colussi Clelia Noemi', 'COLUSSI CLELIA NOEMI', 'CALLE 5 S/NRO.', 'GUADALUPE NORTE', 12, '498201', '62@notiene.com', '27132879538', 6, NULL, NULL),
	(63, 96, 'Sandrigo Rodolfo Orlando', 'SANDRIGO RODOLFO ORLANDO', 'CALLE GOBERNACION DEL CHACO', 'LANTERI', 12, '15586557', '63@notiene.com', '20174256153', 6, NULL, NULL),
	(66, 96, 'Villa Ricardo Carlo', 'VILLA RICARDO CARLO', 'MANZANA Nº 12', 'TARTAGAL', 12, '', '66@notiene.com', '20143084052', 6, NULL, NULL),
	(68, 96, 'Goi Gloria Isabel', 'GOI GLORIA ISABEL', 'CALLE SAN MARTIN', 'LAS GARZAS', 12, '', '68@notiene.com', '27165791814', 6, NULL, NULL),
	(70, 96, 'Casafu Ariel', 'CASAFU ARIEL', 'ZONA URBANA', 'GARABATO', 12, '', '70@notiene.com', '20280253007', 6, NULL, NULL),
	(71, 96, 'Sager Silvana Stela', 'SAGER SILVANA STELA', 'SAN MARTIN, S/NRO.', 'ING. CHANOURDIE', 12, '490915', '71@notiene.com', '27227835813', 6, NULL, NULL),
	(72, 96, 'Asoc. Cooperadora Escuela Nº 9.316', 'ASOC. COOPERADORA ESCUELA Nº 9.316', 'ZONA URBANA', 'TARTAGAL', 12, '', '72@notiene.com', '30999079039', 4, NULL, NULL),
	(74, 96, 'Escuela Nº 6.147', 'ESCUELA Nº 6.147', 'CALLE 8. ESQUINA 25 ', 'GUADALUPE NORTE', 12, '', '74@notiene.com', '0', 4, NULL, NULL),
	(77, 96, 'Samco Hospital Tartagal', 'SAMCO HOSPITAL TARTAGAL', 'ZONA URBANA', 'TARTAGAL', 12, '', '77@notiene.com', '30709150460', 4, NULL, NULL),
	(78, 96, 'Gonzales Mirta Graciela (Minimerc. Keyla)', 'GONZALES MIRTA GRACIELA (MINIMERC. KEYLA)', 'CALLE SAN MARTIN', 'LANTERI', 12, '03482 15585210', '78@notiene.com', '27179302123', 6, NULL, NULL),
	(79, 99, 'Piguin Horacio', 'PIGUIN HORACIO', 'ZONA URBANA', 'MOUSSY', 12, '', '79@notiene.com', '0', 5, NULL, NULL),
	(81, 96, 'Asociacion Cooperadora, Esc. Nº6.147', 'ASOCIACION COOPERADORA, ESC. Nº6.147', 'ZONA URBANA', 'GUADALUPE NORTE', 12, '', '81@notiene.com', '30633613717', 4, NULL, NULL),
	(85, 96, 'Comuna Tartagal', 'COMUNA TARTAGAL', 'ZONA URBANA', 'TARTAGAL', 12, '', '85@notiene.com', '30674364063', 4, NULL, NULL),
	(87, 96, 'Asoc. Coop. Hogar De Ancianos El Tajamar', 'ASOC. COOP. HOGAR DE ANCIANOS EL TAJAMAR', 'ZONA URBANA', 'TARTAGAL', 12, '', '87@notiene.com', '30674373488', 4, NULL, NULL),
	(88, 96, 'Scarpin Elsa Iris', 'SCARPIN ELSA IRIS', 'ZONA URBANA', 'MOUSSY', 12, '490628', '88@notiene.com', '23139775724', 1, NULL, NULL),
	(89, 96, 'Pirusel Anibal Aldo', 'PIRUSEL ANIBAL ALDO', 'ZONA URBANA', 'TARTAGAL', 12, '', '89@notiene.com', '20182109372', 1, NULL, NULL),
	(90, 96, 'Masat Humberto', 'MASAT HUMBERTO', 'CALLE 21-373', 'GUADALUPE NORTE', 12, '3482670845', '90@notiene.com', '20165287666', 6, NULL, NULL),
	(93, 99, 'Escuela Nº 1.031 Coronel Vicente Dupuy', 'ESCUELA Nº 1.031 CORONEL VICENTE DUPUY', 'ZONA RURAL', '[null]', 12, '', '93@notiene.com', '0', 5, NULL, NULL),
	(94, 96, 'Asoc. Coop. Esc. Nº 6.105 Las Garzas', 'ASOC. COOP. ESC. Nº 6.105 LAS GARZAS', 'ZONA URBANA', 'LAS GARZAS', 12, '', '94@notiene.com', '30674357938', 4, NULL, NULL),
	(99, 96, 'Vicentin Roberto Rene', 'VICENTIN ROBERTO RENE', 'ZONA RURAL', 'GARABATO', 12, '', '99@notiene.com', '20179569435', 6, NULL, NULL),
	(100, 96, 'Consumidor Final', 'CONSUMIDOR FINAL', 'ZONA URBANA', 'RECONQUISTA', 12, '', '100@notiene.com', '0', 5, NULL, NULL),
	(102, 96, 'Batistuta Natalia Soledad', 'BATISTUTA NATALIA SOLEDAD', 'ZONA URBANA', 'INGENIERO CHANOURDIE', 12, '', '102@notiene.com', '27314999318', 6, NULL, NULL),
	(105, 99, 'Machuca Rosana (Osuna)', 'MACHUCA ROSANA (OSUNA)', 'CALLE NEWBERY Y 44', 'RECONQUISTA', 12, '', '105@notiene.com', '0', 5, NULL, NULL),
	(106, 96, 'Petean Ariel', 'PETEAN ARIEL', 'ZONA RURAL', 'LA SARITA', 12, '', '106@notiene.com', '20162348990', 6, NULL, NULL),
	(112, 96, 'Diaz Daniel Eduardo', 'DIAZ DANIEL EDUARDO', 'ZONA URBANA', 'LAS GARZAS', 12, '', '112@notiene.com', '20184922720', 6, NULL, NULL),
	(124, 96, 'Centro De Jub. Y Pens. Pozo De Los Indios', 'CENTRO DE JUB. Y PENS. POZO DE LOS INDIOS', 'ZONA RURAL', 'POZO DE LOS INDIOS', 12, '', '124@notiene.com', '30674431941', 4, NULL, NULL),
	(125, 96, 'Escuela Nº 1031 ', 'ESCUELA Nº 1031 ', 'ZONA RURAL', 'KM 320 - GARABATO', 12, '', '125@notiene.com', '30999079039', 4, NULL, NULL),
	(447, 96, 'Escuela Nº447', 'ESCUELA Nº447', 'ZONA RURAL', 'GARABATO', 12, '', '447@notiene.com', '30999079039', 4, NULL, NULL),
	(563, 96, 'Escuela Secundaria Nº 563', 'ESCUELA SECUNDARIA Nº 563', 'ZONA URBANA ', 'GARABATO', 12, '490577', '563@notiene.com', '30999079039', 4, NULL, NULL),
	(584, 96, 'Cooperadora Cer Nº584', 'COOPERADORA CER Nº584', 'ZONA RURAL', 'PARAJE LA BRITANICA', 12, '', '584@notiene.com', '0', 5, NULL, NULL),
	(1000, 96, 'Sandrigo Aldo Rosendo', 'SANDRIGO ALDO ROSENDO', 'ZONA URBANA', 'GUADALUPE NORTE', 12, '498060', '1000@notiene.com', '20063094693', 1, NULL, NULL),
	(6147, 96, 'Escuela Primaria Nº 6.147 (Guadalupe N.)', 'ESCUELA PRIMARIA Nº 6.147 (GUADALUPE N.)', 'ZONA URBANA - GUADALUPE N.', 'GUADALUPE NORTE', 12, '490575', '6147@notiene.com', '30999079039', 4, NULL, NULL),
	(1463863, 96, 'Sandrigo Eldina', 'SANDRIGO ELDINA', 'ZONA URBANA', 'LANTERI', 12, '', '1463863@notiene.com', '0', 5, NULL, NULL),
	(2324169, 96, 'Jara Blanca', 'JARA BLANCA', 'ZONA URBANA ', 'TARTAGAL ', 12, '15670693', '2324169@notiene.com', '0', 5, NULL, NULL),
	(5761451, 89, 'Vallejos Manuel', 'VALLEJOS MANUEL', 'ZONA RURAL', 'EL TIMBO', 12, '', '5761451@notiene.com', '0', 5, NULL, NULL),
	(6337484, 96, 'Oehrli Juan Carlos', 'OEHRLI JUAN CARLOS', 'ZONA URBANA', 'GARABATO', 12, '', '6337484@notiene.com', '0', 5, NULL, NULL),
	(6730337, 96, 'Medina Maria', 'MEDINA MARIA', 'HABEGGER 109', 'RECONQUISTA', 12, '', '6730337@notiene.com', '0', 5, NULL, NULL),
	(7876770, 96, 'Goi Roque Elvio', 'GOI ROQUE ELVIO', 'ZONA RURAL', 'AVELLANEDA OESTE', 12, '487217', '7876770@notiene.com', '0', 5, NULL, NULL),
	(7882448, 96, 'Precidente Alberto', 'PRECIDENTE ALBERTO', 'ZONA URBANA', 'TARTAGAL', 12, '', '7882448@notiene.com', '0', 5, NULL, NULL),
	(10563223, 96, 'Olmos Elida', 'OLMOS ELIDA', 'ZONA URBANA ', 'TARTAGAL ', 12, '15418022', '10563223@notiene.com', '0', 5, NULL, NULL),
	(10867712, 96, 'Campos Victoria', 'CAMPOS VICTORIA', 'ZONA URBANA', 'GARABATO', 12, '490220', '10867712@notiene.com', '0', 5, NULL, NULL),
	(11086454, 96, 'Quarin Mario Nestor', 'QUARIN MARIO NESTOR', 'ZONA URBANA', 'MOUSSY', 12, '490613', '11086454@notiene.com', '20110864540', 6, NULL, NULL),
	(11086456, 96, 'Goi Olga', 'GOi OLGA', 'ZONA RURAL', 'AVELLANEDA OESTE', 12, '15525317', '11086456@notiene.com', '0', 5, NULL, NULL),
	(11088976, 96, 'Sandoval Juanita', 'SANDOVAL JUANITA', 'CALLE SANTA FE', 'LAS GARZAS', 12, '493083', '11088976@notiene.com', '0', 5, NULL, NULL),
	(11458847, 96, 'Suligoy Nancy M. Rosa ', 'SULIGOY NANCY M. ROSA ', 'ZONA URBANA', 'LA VANGUARDIA', 12, '15577505-15668870', '11458847@notiene.com', '0', 5, NULL, NULL),
	(11583449, 96, 'Delgado Zulma', 'DELGADO ZULMA', 'ZONA URBANA', 'EL CARMEN', 12, '3482604271', '11583449@notiene.com', '0', 5, NULL, NULL),
	(11605771, 96, 'Caberlotto Hugo Luis', 'CABERLOTTO HUGO LUIS', 'ZONA URBANA', 'TARTAGAL', 12, '', '11605771@notiene.com', '0', 5, NULL, NULL),
	(11605792, 96, 'Salvioli Carina Mariela', 'SALVIOLI CARINA MARIELA', 'ZONA URBANA', 'GARABATO', 12, '', '11605792@notiene.com', '27222184458', 6, NULL, NULL),
	(11908835, 96, 'Vargas Maria Esther', 'VARGAS MARIA ESTHER', 'ZONA URBANA', 'MOUSSY', 12, '', '11908835@notiene.com', '0', 5, NULL, NULL),
	(11954578, 96, 'Altamirano Susana', 'ALTAMIRANO SUSANA', 'ZONA RURAL (CAMPO GREGORET)', 'TARTAGAL', 12, '', '11954578@notiene.com', '0', 5, NULL, NULL),
	(13510481, 96, 'Alegre Luis', 'ALEGRE LUIS', 'PASAJE SUR 1098 ', 'AVELLANEDA', 12, '', '13510481@notiene.com', '0', 5, NULL, NULL),
	(13715729, 96, 'Berlanda Oscar', 'BERLANDA OSCAR', 'CALLE Nº 424', 'AVELLANEDA', 12, '', '13715729@notiene.com', '0', 5, NULL, NULL),
	(13890191, 96, 'Villasboas Griselda', 'VILLASBOAS GRISELDA', 'IRIONDO Nº17', 'RECONQUISTA', 12, '', '13890191@notiene.com', '0', 5, NULL, NULL),
	(13990014, 96, 'Gonzales Imelda', 'GONZALES IMELDA', 'CALLE 36 Nº805', 'AVELLANEDA', 12, '', '13990014@notiene.com', '0', 5, NULL, NULL),
	(14535659, 96, 'Maurencig Nidia Raquel', 'MAURENCIG NIDIA RAQUEL', 'ZONA URBANA', 'SAN MANUEL', 12, '499002', '14535659@notiene.com', '0', 5, NULL, NULL),
	(14535693, 96, 'Sartor Guillermo', 'SARTOR GUILLERMO', 'ZONA URBANA ', 'MOUSSY', 12, '', '14535693@notiene.com', '0', 5, NULL, NULL),
	(14588552, 96, 'Perez Juan Jose', 'PEREZ JUAN JOSE', 'ZONA URBANA - TARTAGAL', 'TARTAGAL ', 12, '', '14588552@notiene.com', '0', 5, NULL, NULL),
	(14681520, 96, 'Rolon Andres', 'ROLON ANDRES', 'ZONA URBANA', 'TARTAGAL', 12, '15318828', '14681520@notiene.com', '20146815201', 6, NULL, NULL),
	(14738960, 96, 'Cardozo Rosa Vicenta', 'CARDOZO ROSA VICENTA', 'ZONA URBANA', 'GARABATO', 12, '', '14738960@notiene.com', '23147389604', 6, NULL, NULL),
	(14868926, 96, 'Zalazar Ramon', 'ZALAZAR RAMON', 'ZONA RURAL', 'AVELLANEDA OESTE', 12, '', '14868926@notiene.com', '0', 5, NULL, NULL),
	(16280065, 96, 'Lucia Vera', 'LUCIA VERA', 'RUTA 11', 'LAS GARZAS', 12, '15670805', '16280065@notiene.com', '0', 5, NULL, NULL),
	(16608293, 96, 'Faulkner Rafael Alberto', 'FAULKNER RAFAEL ALBERTO', 'ZONA URBANA ', 'TARTAGAL ', 12, '03483-15405038', '16608293@notiene.com', '0', 5, NULL, NULL),
	(16719377, 96, 'Bernardiz Margarita', 'BERNARDIZ MARGARITA', 'CALLE 120- PJE. CENTRO', 'AVELLANEDA', 12, '', '16719377@notiene.com', '27167193779', 1, NULL, NULL),
	(16908958, 96, 'Bolzan Juan Antonio', 'BOLZAN JUAN ANTONIO', 'ZONA URBANA', 'EL TIMBO', 12, '', '16908958@notiene.com', '20169089583', 1, NULL, NULL),
	(16909001, 96, 'Fleitas Raul', 'FLEITAS RAUL', 'ZONA URBANA', 'EL TIMBO', 12, '3482209189', '16909001@notiene.com', '', 5, NULL, NULL),
	(17235638, 96, 'Manchado Ramona', 'MANCHADO RAMONA', 'PASAJE ESTE 823 Bº BELGRANO', 'AVELLANEDA', 12, '', '17235638@notiene.com', '0', 5, NULL, NULL),
	(17328486, 96, 'Vicentin Norma Alicia', 'VICENTIN NORMA ALICIA', 'ZONA URBANA ', 'LA VANGUARDIA', 12, '15500364', '17328486@notiene.com', '0', 5, NULL, NULL),
	(17747687, 96, 'Gonzales Mabel', 'GONZALES MABEL', 'ZONA URBANA', 'EL CARMEN', 12, '3482334779', '17747687@notiene.com', '0', 5, NULL, NULL),
	(17799520, 96, 'Pires Delfor Oscar', 'PIRES DELFOR OSCAR', 'ZONA URBANA S/N', 'RECONQUISTA', 12, '', '17799520@notiene.com', '20177995208', 1, NULL, NULL),
	(18723549, 96, 'Dâ´Onofrio Ester Vicenta ', 'DÂ´ONOFRIO ESTER VICENTA ', 'ZONA URBANA', 'GARABATO', 12, '', '18723549@notiene.com', '0', 5, NULL, NULL),
	(20146528, 96, 'Mehauod David', 'MEHAUOD DAVID', 'ZONA URBANA', 'INTIYACO', 12, '', '20146528@notiene.com', '20201465282', 1, NULL, NULL),
	(20223789, 96, 'Maglione Gabriela', 'MAGLIONE GABRIELA', 'CALLE47 Nº2324', 'RECONQUISTA', 12, '', '20223789@notiene.com', '0', 5, NULL, NULL),
	(20274427, 96, 'Montes Juan Alcides', 'MONTES JUAN ALCIDES', 'ZONA URBANA', 'SANTA ANA', 12, '3482318676', '20274427@notiene.com', '', 5, NULL, NULL),
	(20274437, 96, 'Zamer Mario Dante', 'ZAMER MARIO DANTE', 'ZONA RURAL, AVELLANEDA', 'LA CURVA', 12, '', '20274437@notiene.com', '20202744371', 1, NULL, NULL),
	(20443744, 96, 'Urbani Fabio', 'URBANI FABIO', 'CALLE BOLIVAR 241', 'RECONQUISTA', 12, '', '20443744@notiene.com', '20204437441', 1, NULL, NULL),
	(20713633, 96, 'Fain Gabriel', 'FAIN GABRIEL', 'ZONA URBANA', 'TARTAGAL', 12, '', '20713633@notiene.com', '20207136337', 6, NULL, NULL),
	(20774622, 96, 'Tortul Nestor Adrian', 'TORTUL NESTOR ADRIAN', 'ZONA URBANA', 'LAS GARZAS', 12, '', '20774622@notiene.com', '20207746224', 1, NULL, NULL),
	(20779380, 96, 'Moyano Ignacio Alejandro', 'MOYANO IGNACIO ALEJANDRO', 'ZONA URBANA', 'INTIYACO', 12, '', '20779380@notiene.com', '0', 5, NULL, NULL),
	(21420549, 96, 'Delgado Aldo Ariel', 'DELGADO ALDO ARIEL', 'CALLE 8 Y 10 Nº 106', 'GUADALUPE NORTE', 12, '', '21420549@notiene.com', '20214205492', 6, NULL, NULL),
	(21602922, 96, 'Peralta Juana Beatriz', 'PERALTA JUANA BEATRIZ', 'ZONA URBANA ', 'GARABATO', 12, '', '21602922@notiene.com', '', 5, NULL, NULL),
	(21885003, 96, 'Taponnier Beatriz', 'TAPONNIER BEATRIZ', 'ZONA URBANA', 'GARABATO', 12, '', '21885003@notiene.com', '0', 5, NULL, NULL),
	(22086185, 96, 'Ayala Carla Mariel (Ale-Car)', 'AYALA CARLA MARIEL (ALE-CAR)', 'CALLE 9 DE JULIO', 'INTIYACO', 12, '', '22086185@notiene.com', '27220861851', 6, NULL, NULL),
	(22790256, 96, 'Leiva Tori', 'LEIVA TORI', 'PASAJE 55/57', 'RECONQUISTA', 12, '', '22790256@notiene.com', '0', 5, NULL, NULL),
	(22904143, 96, 'Lopez Francisco', 'LOPEZ FRANCISCO', 'ZONA URBANA', 'ING. CHANOURDIE', 12, '490968', '22904143@notiene.com', '0', 5, NULL, NULL),
	(23040331, 96, 'Mehauod Alcides Ramon', 'MEHAUOD ALCIDES RAMON', 'ZONA URBANA', 'INTIYACO', 12, '', '23040331@notiene.com', '20230403318', 1, NULL, NULL),
	(23142661, 96, 'Cardozo Diego', 'CARDOZO DIEGO', 'FREYRE Y LEDESMA', 'RECONQUISTA', 12, '', '23142661@notiene.com', '0', 5, NULL, NULL),
	(23264167, 96, 'Conti Jesãšs Maria', 'CONTI JESÃšS MARIA', 'CALLE 47 Nº 307', 'RECONQUISTA', 12, '', '23264167@notiene.com', '0', 5, NULL, NULL),
	(23271851, 96, 'Gauna Nestor Ramon', 'GAUNA NESTOR RAMON', 'ZONA URBANA', 'GARABATO', 12, '', '23271851@notiene.com', '0', 5, NULL, NULL),
	(23305352, 96, 'Carrizo Gustavo', 'CARRIZO GUSTAVO', 'CALL 118 258', 'AVELLANEDA', 12, '', '23305352@notiene.com', '', 5, NULL, NULL),
	(23336312, 96, 'Esquivel Estela Marisa', 'ESQUIVEL ESTELA MARISA', 'ZONA URBANA', 'SAN MANUEL', 12, '', '23336312@notiene.com', '0', 5, NULL, NULL),
	(23356864, 96, 'Nalli Marcelo Luis', 'NALLI MARCELO LUIS', 'C. VICENTE CASARES Y S. MARTIN', 'LAS GARZAS', 12, '', '23356864@notiene.com', '0', 5, NULL, NULL),
	(23526260, 96, 'quileab.com', 'Olivetti, Daniel Alberto', '25 de Mayo 2282', 'Reconquista', 12, '3482518081', 'quileab@gmail.com', '20235262607', 5, '2021-12-20 21:04:27', '2021-12-22 16:29:59'),
	(23582635, 96, 'Maidana Sofia', 'MAIDANA SOFIA', 'CALLE 118 Nº851', 'AVELLANEDA', 12, '', '23582635@notiene.com', '0', 5, NULL, NULL),
	(23723631, 96, 'Bordon Ester Liliana', 'BORDON ESTER LILIANA', 'ZONA URBANA', 'TARTAGAL', 12, '', '23723631@notiene.com', '', 5, NULL, NULL),
	(23870005, 96, 'Alvarez Carlos Raul', 'ALVAREZ CARLOS RAUL', 'CALLE SAN MARTIN S/N ', 'LAS GARZAS', 12, '', '23870005@notiene.com', '0', 5, NULL, NULL),
	(24175806, 96, 'Gomez Eduardo Marcelo ', 'GOMEZ EDUARDO MARCELO ', 'ZONA URBANA', 'SAN MANUEL', 12, '', '24175806@notiene.com', '0', 5, NULL, NULL),
	(24175886, 96, 'Daran Olga', 'DARAN OLGA', 'ZONA URBANA ', 'EL CARMEN', 12, '', '24175886@notiene.com', '0', 5, NULL, NULL),
	(24255905, 96, 'Saucedo Estela', 'SAUCEDO ESTELA', 'ZONA URBANA', 'INTIYACO', 12, '', '24255905@notiene.com', '0', 5, NULL, NULL),
	(24416695, 96, 'Sotelo Cristina Noemi ', 'SOTELO CRISTINA NOEMI ', 'ZONA URBANA', 'SANTA ANA', 12, '', '24416695@notiene.com', '0', 5, NULL, NULL),
	(24484180, 96, 'Salinas Gabriel Alcides', 'SALINAS GABRIEL ALCIDES', 'ZONA RURAL', 'EL TIMBO', 12, '', '24484180@notiene.com', '0', 5, NULL, NULL),
	(24607322, 96, 'Lopez Roberto Antonio', 'LOPEZ ROBERTO ANTONIO', 'ZONA URBANA', 'LAS GARZAS', 12, '', '24607322@notiene.com', '0', 5, NULL, NULL),
	(24898089, 96, 'Garcia Silvia', 'GARCIA SILVIA', 'OLESSIO Y MORENO', 'RECONQUISTA', 12, '', '24898089@notiene.com', '0', 5, NULL, NULL),
	(25120382, 96, 'Molina Luis Alberto', 'MOLINA LUIS ALBERTO', 'ZONA URBANA', 'EL CARMEN', 12, '3482270584', '25120382@notiene.com', '', 5, NULL, NULL),
	(25159750, 96, 'Aguilar Roberto', 'AGUILAR ROBERTO', 'CALLE 109 Nº816', 'AVELLANEDA', 12, '', '25159750@notiene.com', '0', 5, NULL, NULL),
	(25217942, 96, 'Orellano Hector Antonio', 'ORELLANO HECTOR ANTONIO', 'ZONA URBANA', 'SAN MANUEL', 12, '', '25217942@notiene.com', '0', 5, NULL, NULL),
	(25341815, 96, 'Obregã“N Miguel', 'OBREGÃ“N MIGUEL', 'ZONA URBANA', 'EL CARMEN', 12, '3482535537', '25341815@notiene.com', '0', 5, NULL, NULL),
	(25380218, 96, 'Bermudez Luis', 'BERMUDEZ LUIS', 'ZONA URBANA', 'MOUSSY', 12, '', '25380218@notiene.com', '0', 5, NULL, NULL),
	(25445594, 96, 'Delgado Ana Maria (Sosa)', 'DELGADO ANA MARIA (SOSA)', 'ZONA URBANA', 'TARTAGAL', 12, '', '25445594@notiene.com', '0', 5, NULL, NULL),
	(25834649, 96, 'FAF Inc.', 'Fontana, Fabiana Andrea', '25 de Mayo 2282', 'Reconquista', 12, '3482540792', 'fontanafabianaa@gmail.com', '27258346497', 5, '2021-12-22 09:41:56', '2021-12-22 16:31:37'),
	(25894131, 96, 'Ciarlo Pedro Alberto', 'CIARLO PEDRO ALBERTO', 'ZONA URBANA', 'SAN MANUEL', 12, '499003', '25894131@notiene.com', '20258941315', 6, NULL, NULL),
	(25894139, 96, 'Villalba Carlos', 'VILLALBA CARLOS', 'ZONA URBANA', 'TARTAGAL', 12, '', '25894139@notiene.com', '0', 5, NULL, NULL),
	(25964842, 96, 'Delgado Herminio ', 'DELGADO HERMINIO ', 'CALLE 1 Y RUTA 11', 'GUADALUPE NORTE', 12, '', '25964842@notiene.com', '', 5, NULL, NULL),
	(26002605, 96, 'Leiva Miguel', 'LEIVA MIGUEL', 'CALLE 25 DE MAYO 2345', 'RECONQUISTA', 12, '', '26002605@notiene.com', '0', 5, NULL, NULL),
	(26244324, 96, 'Espinosa Sonia', 'ESPINOSA SONIA', 'CALLE 25 DE MAYO 2520', 'RECONQUISTA', 12, '', '26244324@notiene.com', '0', 5, NULL, NULL),
	(26636663, 96, 'Maidana Ariel', 'MAIDANA ARIEL', 'ZONA URBANA', 'GARABATO', 12, '', '26636663@notiene.com', '0', 5, NULL, NULL),
	(26694047, 96, 'Bressan Roberto', 'BRESSAN ROBERTO', 'PASAJE 109 Nº744', 'AVELLANEDA', 12, '', '26694047@notiene.com', '0', 5, NULL, NULL),
	(26845929, 96, 'Manchado Mario', 'MANCHADO MARIO', 'CALLE 103 Nº 870', 'AVELLANEDA', 12, '', '26845929@notiene.com', '0', 5, NULL, NULL),
	(26924775, 96, 'Pereira Claudio', 'PEREIRA CLAUDIO', 'CALLE 118 Nº154', 'AVELLANEDA', 12, '', '26924775@notiene.com', '0', 5, NULL, NULL),
	(27129160, 96, 'Gomez Carina', 'GOMEZ CARINA', 'CALLE 59 Nº297', 'RECONQUISTA', 12, '', '27129160@notiene.com', '0', 5, NULL, NULL),
	(27153327, 96, 'Almacen De Kari Y Mati', 'ALMACEN DE KARI Y MATI', 'CALLE 16 Y 63', 'RECONQUISTA', 12, '', '27153327@notiene.com', '0', 5, NULL, NULL),
	(27336307, 96, 'Diaz Natalia', 'DIAZ NATALIA', 'CALLE 116 Nº 472', 'AVELLANEDA', 12, '', '27336307@notiene.com', '0', 5, NULL, NULL),
	(27348523, 96, 'Luque German David', 'LUQUE GERMAN DAVID', 'ZONA URBANA ', 'TARTAGAL ', 12, '490587 - 15533304', '27348523@notiene.com', '0', 5, NULL, NULL),
	(27586165, 96, 'Miã‘O Marisol Lorena', 'MIÃ‘O MARISOL LORENA', 'Bº 18 VIVIENDAS', 'LANTERI', 12, '3482-603717', '27586165@notiene.com', '0', 5, NULL, NULL),
	(27734083, 96, 'Barrios Marcelo', 'BARRIOS MARCELO', 'CALLE SARMIENTO S/NRO.', 'GARABATO', 12, '', '27734083@notiene.com', '20277340837', 6, NULL, NULL),
	(28025282, 96, 'Gimenez Silvina', 'GIMENEZ SILVINA', 'CALLE 9 DE JULIO', 'GARABATO', 12, '', '28025282@notiene.com', '0', 5, NULL, NULL),
	(28228574, 96, 'Gomez Rosana', 'GOMEZ ROSANA', 'ZONA URBANA', 'FLOR DE ORO', 12, '', '28228574@notiene.com', '27282285741', 6, NULL, NULL),
	(28275098, 96, 'Pamela Franco Analia ', 'PAMELA FRANCO ANALIA ', 'ZONA URBANA ', 'TARTAGAL ', 12, '0', '28275098@notiene.com', '0', 5, NULL, NULL),
	(28581209, 96, 'Sosa Nestor Daniel', 'SOSA NESTOR DANIEL', 'ZONA URBANA', 'EL TIMBO', 12, '', '28581209@notiene.com', '0', 5, NULL, NULL),
	(28583197, 96, 'Dâ´Onofrio Sebastian', 'DÂ´ONOFRIO SEBASTIAN', 'CALLE OSCAR CHEMEZ', 'GARABATO', 12, '', '28583197@notiene.com', '0', 5, NULL, NULL),
	(29033907, 96, 'Oliva Valeria Soledad', 'OLIVA VALERIA SOLEDAD', 'ZONA URBANA', 'LAS GARZAS', 12, '', '29033907@notiene.com', '0', 5, NULL, NULL),
	(29470942, 96, 'Franco Fabricio Omar', 'FRANCO FABRICIO OMAR', 'ZONA URBANA', 'TARTAGAL', 12, '', '29470942@notiene.com', '0', 5, NULL, NULL),
	(29529239, 96, 'Maglione Doris', 'MAGLIONE DORIS', 'CALLE 35 Y 85. Bº100 VIVIENDA', 'RECONQUISTA', 12, '', '29529239@notiene.com', '', 5, NULL, NULL),
	(29703027, 96, 'Diaz Miriam', 'DIAZ MIRIAM', 'CALLE 105 Nº205', 'AVELLANEDA', 12, '', '29703027@notiene.com', '0', 5, NULL, NULL),
	(29703033, 96, 'Marega Roxana (Mercado Avenida)', 'MAREGA ROXANA (MERCADO AVENIDA)', 'CALLE 111 Nº602', 'AVELLANEDA', 12, '', '29703033@notiene.com', '0', 5, NULL, NULL),
	(29703045, 96, 'Silva Natalia', 'SILVA NATALIA', 'AVENIDA AUSONIA Nº223', 'AVELLANEDA', 12, '', '29703045@notiene.com', '0', 5, NULL, NULL),
	(29755635, 96, 'Feldmann Mario Alberto', 'FELDMANN MARIO ALBERTO', 'CALLE SAN MARTIN ', 'ING. CHANOURDIE', 12, '', '29755635@notiene.com', '20297556356', 6, NULL, NULL),
	(29797069, 96, 'Acuã‘A Diana', 'ACUÃ‘A DIANA', 'CALLE A. BROWN', 'LAS GARZAS', 12, '', '29797069@notiene.com', '0', 5, NULL, NULL),
	(29808839, 96, 'Godoy Sergio', 'GODOY SERGIO', 'ZONA URBANA', 'TARTAGAL', 12, '', '29808839@notiene.com', '0', 5, NULL, NULL),
	(29808854, 96, 'Gonzalez Mariela Itati', 'GONZALEZ MARIELA ITATI', 'ZONA URBANA - RUTA 31', 'TARTAGAL', 12, '', '29808854@notiene.com', '0', 5, NULL, NULL),
	(29841664, 96, 'Ayala Fernando Andres', 'AYALA FERNANDO ANDRES', 'ZONA URBANA', 'INTIYACO', 12, '', '29841664@notiene.com', '20298416647', 1, NULL, NULL),
	(30052445, 96, 'Gonzales Ramon', 'GONZALES RAMON', 'ZONA URBANA', 'EL CARMEN', 12, '3482706407', '30052445@notiene.com', '', 5, NULL, NULL),
	(30489019, 96, 'Chapero Valeria Itati', 'CHAPERO VALERIA ITATI', 'ZONA URBANA', 'LAS GARZAS', 12, '', '30489019@notiene.com', '27304890199', 6, NULL, NULL),
	(30621105, 96, 'Garcia Nadia', 'GARCIA NADIA', 'ZONA URBANA ', 'EL CARMEN', 12, '', '30621105@notiene.com', '0', 5, NULL, NULL),
	(30663728, 96, 'Sandrigo Gustavo', 'SANDRIGO GUSTAVO', 'ZONA URBANA', 'TARTAGAL', 12, '', '30663728@notiene.com', '0', 5, NULL, NULL),
	(30663792, 96, 'Garcia Susana', 'GARCIA SUSANA', 'ZONA RURAL', 'CAMPO DEAN', 12, '', '30663792@notiene.com', '0', 5, NULL, NULL),
	(30794529, 96, 'Muzzin Veronica (Los Hermanos)', 'MUZZIN VERONICA (LOS HERMANOS)', 'CALLE SAN MARTIN, ESQ. SANTA T', 'ING. CHANOURDIE', 12, '', '30794529@notiene.com', '27307945296', 6, NULL, NULL),
	(31151040, 96, 'Marchetti Hernan', 'MARCHETTI HERNAN', 'CALLE 21 Nº84', 'AVELLANEDA', 12, '', '31151040@notiene.com', '0', 5, NULL, NULL),
	(31253440, 96, 'Melina Bogadin', 'MELINA BOGADIN', 'CALLE 103 Nº 942 Bº COOP.', 'AVELLANEDA', 12, '', '31253440@notiene.com', '0', 5, NULL, NULL),
	(31486916, 96, 'Pereyra Delia', 'PEREYRA DELIA', 'ZONA RURAL', 'AVELLANEDA OESTE', 12, '', '31486916@notiene.com', '0', 5, NULL, NULL),
	(32114217, 96, 'Gutierrez Ariel', 'GUTIERREZ ARIEL', 'PASAJE 124 Nº915', 'RECONQUISTA', 12, '', '32114217@notiene.com', '0', 5, NULL, NULL),
	(32153078, 96, 'Masin Nahuel', 'MASIN NAHUEL', 'ZONA URBANA', 'AVELLANEDA OESTE', 12, '', '32153078@notiene.com', '', 5, NULL, NULL),
	(32153277, 96, 'Spesot Carina', 'SPESOT CARINA', 'CALLE 120 Nº 290', 'AVELLANEDA', 12, '', '32153277@notiene.com', '0', 5, NULL, NULL),
	(32530848, 96, 'Carrizo German', 'CARRIZO GERMAN', 'CALLE 103 Nº 932', 'AVELLANEDA', 12, '', '32530848@notiene.com', '0', 5, NULL, NULL),
	(32723785, 96, 'Martinez Aldo Adrian', 'MARTINEZ ALDO ADRIAN', 'ZONA URBANA', 'SAN MANUEL', 12, '', '32723785@notiene.com', '0', 5, NULL, NULL),
	(32723792, 96, 'Julio Lopez ', 'JULIO LOPEZ ', 'ZONA URBANA', 'TARTAGAL', 12, '', '32723792@notiene.com', '0', 5, NULL, NULL),
	(33157622, 96, 'Medina Paola', 'MEDINA PAOLA', 'CALLE 105 Nº806', 'AVELLANEDA', 12, '', '33157622@notiene.com', '0', 5, NULL, NULL),
	(33324886, 96, 'Tapã“N Erica', 'TAPÃ“N ERICA', 'ZONA URBANA ', 'LAS GARZAS', 12, '', '33324886@notiene.com', '0', 5, NULL, NULL),
	(33354137, 96, 'Perez Vanesa', 'PEREZ VANESA', 'ZONA URBANA', 'TARTAGAL', 12, '', '33354137@notiene.com', '0', 5, NULL, NULL),
	(33680617, 96, 'Ibarra Valeria', 'IBARRA VALERIA', 'CALLE VICENTE CASARES', 'LAS GARZAS', 12, '', '33680617@notiene.com', '0', 5, NULL, NULL),
	(33916070, 96, 'Avila Roberto', 'AVILA ROBERTO', 'CALLE 107 Nº1327', 'AVELLANEDA', 12, '', '33916070@notiene.com', '0', 5, NULL, NULL),
	(34045943, 96, 'Maciel Yanina', 'MACIEL YANINA', 'PASAJE 87-89 Nº 1365', 'AVELLANEDA', 12, '', '34045943@notiene.com', '0', 5, NULL, NULL),
	(34144444, 96, 'Moschen Gabriel', 'MOSCHEN GABRIEL', 'CALLE BART. MITRE Y SANTA FE', 'LANTERI', 12, '', '34144444@notiene.com', '20341444447', 6, NULL, NULL),
	(34176392, 96, 'Moreira Luis Javier', 'MOREIRA LUIS JAVIER', 'CALLE BELGRANO Y HERNAN OHERLI', 'GARABATO, SANTA FE', 12, '', '34176392@notiene.com', '20341763925', 6, NULL, NULL),
	(34177690, 96, 'Velazquez Alejandro', 'VELAZQUEZ ALEJANDRO', 'ZONA URBANA', 'GARABATO', 12, '', '34177690@notiene.com', '0', 5, NULL, NULL),
	(34314903, 96, 'Sotelo Federico', 'SOTELO FEDERICO', 'Bº FRIAR MANZANA "B" CASA', 'RECONQUISTA', 12, '', '34314903@notiene.com', '0', 5, NULL, NULL),
	(34804750, 96, 'Falcon Joaquin', 'FALCON JOAQUIN', 'ZONA URBANA', 'EL CARMEN', 12, '3482208508', '34804750@notiene.com', '0', 5, NULL, NULL),
	(35032880, 96, 'Benina Sebastian', 'BENINA SEBASTIAN', 'CALLE JJ URQUIZA', 'TARTAGAL', 12, '', '35032880@notiene.com', '0', 5, NULL, NULL),
	(35754937, 96, 'Joffre Agustina Nerea', 'JOFFRE AGUSTINA NEREA', 'ZONA URBANA', 'LANTERI', 12, '', '35754937@notiene.com', '27357549375', 6, NULL, NULL),
	(35772023, 96, 'Gallard Silvio', 'GALLARD SILVIO', 'ZONA URBANA', 'TARTAGAL', 12, '', '35772023@notiene.com', '0', 5, NULL, NULL),
	(35772102, 96, 'Perez Emanuel', 'PEREZ EMANUEL', 'ZONA RURAL, LA JOSEFINA', 'TARTAGAL', 12, '', '35772102@notiene.com', '0', 5, NULL, NULL),
	(36013332, 96, 'Daran Mara Lia', 'DARAN MARA LIA', 'ZONA URBANA', 'EL CARMEN', 12, '', '36013332@notiene.com', '0', 5, NULL, NULL),
	(36013423, 96, 'Bustamante Juan Pablo', 'BUSTAMANTE JUAN PABLO', 'CALLE 69 Nº 1611', 'RECONQUISTA', 12, '', '36013423@notiene.com', '0', 5, NULL, NULL),
	(36360975, 96, 'Gomez Daiana', 'GOMEZ DAIANA', 'ZONA URBANA', 'LAS GARZAS', 12, '', '36360975@notiene.com', '0', 5, NULL, NULL),
	(37074295, 96, 'Dimartino Jeremias', 'DIMARTINO JEREMIAS', 'CALLE HABEGGER 97', 'RECONQUISTA', 12, '', '37074295@notiene.com', '0', 5, NULL, NULL),
	(37209967, 96, 'Escalada Gabriela Andrea', 'ESCALADA GABRIELA ANDREA', 'ZONA URBANA', 'GARABATO', 12, '', '37209967@notiene.com', '', 5, NULL, NULL),
	(37211735, 96, 'Fain Emilse', 'FAIN EMILSE', 'ZONA URBANA', 'TARTAGAL', 12, '', '37211735@notiene.com', '0', 5, NULL, NULL),
	(37409310, 96, 'Desp. La Fortaleza (Olga Eichemberger)', 'DESP. LA FORTALEZA (OLGA EICHEMBERGER)', 'BELGRANO 150', 'INTIYACO', 12, '', '37409310@notiene.com', '27374093105', 6, NULL, NULL),
	(37409374, 96, 'Mesa Carla', 'MESA CARLA', 'ZONA URBANA', 'TARTAGAL', 12, '', '37409374@notiene.com', '0', 5, NULL, NULL),
	(37828632, 96, 'Espinosa Jonatan', 'ESPINOSA JONATAN', 'ZONA URBANA', 'TARTAGAL', 12, '', '37828632@notiene.com', '0', 5, NULL, NULL),
	(39245998, 96, 'Solari Blas Andres', 'SOLARI BLAS ANDRES', 'ZONA URBANA', 'MOUSSY', 12, '', '39245998@notiene.com', '', 5, NULL, NULL),
	(39336114, 96, 'Vera Rocio Belen', 'VERA ROCIO BELEN', 'ZONA URBANA', 'FLOR DE ORO', 12, '', '39336114@notiene.com', '0', 5, NULL, NULL),
	(45493589, 96, 'Villalba Owen', 'VILLALBA OWEN', 'ZONA URBANA', 'TARTAGAL', 12, '', '45493589@notiene.com', '0', 5, NULL, NULL),
	(50191240, 96, 'U.A.A Coop Ltda.', 'U.A.A COOP LTDA.', 'CALLE SAN MARTIN 768', 'AVELLANEDA', 12, '', '50191240@notiene.com', '30501912405', 1, NULL, NULL),
	(71067832, 96, 'Asoc. Amigos B.P. Tartagal Mi Pueblo', 'ASOC. AMIGOS B.P. TARTAGAL MI PUEBLO', 'RADIO URBANO', 'TARTAGAL', 12, '', '71067832@notiene.com', '30710678320', 4, NULL, NULL),
	(71494812, 96, 'Stimare S.A', 'STIMARE S.A', 'CALLE 16, Nº 595', 'AVELLANEDA', 12, '', '71494812@notiene.com', '30714948128', 1, NULL, NULL),
	(71516644, 96, 'Sbb S.A', 'SBB S.A', 'PARQUE IND. SIN NUMERO', 'RECONQUISTA', 12, '', '71516644@notiene.com', '30715166441', 1, NULL, NULL),
	(99907903, 96, 'Escuela Nº 62 Sarg. Bautista Cabral', 'ESCUELA Nº 62 SARG. BAUTISTA CABRAL', '4 BOCAS, SAN MANUEL', 'DISTR. LA SARITA', 12, '', '99907903@notiene.com', '30999079039', 4, NULL, NULL),
	(137976639, 96, 'Ortiz Elena Elisabet', 'ORTIZ ELENA ELISABET', 'ZONA URBANA', 'GARABATO', 12, '', '137976639@notiene.com', '27137976639', 1, NULL, NULL),
	(273360199, 96, 'Moschen Ani', 'MOSCHEN ANI', 'CALLE 303 Nº1273', 'AVELLANEDA', 12, '', '273360199@notiene.com', '0', 5, NULL, NULL),
	(20229713869, 80, 'Transporte Cian', 'Cian Ceferino Francisco', 'Sarmiento', 'Malabrigo', 12, '3482533462', 'franciscoccian@gmail.com', '20229713869', 1, '2022-01-31 14:57:13', '2022-01-31 14:57:13'),
	(20374533372, 80, 'Rodar Bike', 'Monzón, Diego Emiliano', 'Olessio 2170', 'Reconquista', 12, '3482307265', 'diego.m94@hotmail.com', '20374533372', 1, '2022-01-06 13:18:32', '2022-01-28 15:57:43'),
	(20374533373, 96, 'Samco Garabato', 'SAMCO GARABATO', 'ZONA URBANA', 'GARABATO', 12, '', '0@notiene.com', '33708322739', 4, NULL, NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

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

-- Volcando estructura para tabla factafip.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

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

-- Volcando estructura para tabla factafip.inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `warehouse_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`,`product_id`),
  KEY `inventories_product_id_foreign` (`product_id`),
  CONSTRAINT `inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `inventories_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.inventories: ~6 rows (aproximadamente)
DELETE FROM `inventories`;
/*!40000 ALTER TABLE `inventories` DISABLE KEYS */;
INSERT INTO `inventories` (`warehouse_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
	(1, 1, 5, '2021-12-29 21:49:15', '2022-01-06 13:57:55'),
	(1, 3, 5, '2021-12-29 21:49:22', '2022-01-06 13:57:55'),
	(1, 6, 5, '2022-01-06 13:57:48', '2022-01-06 13:57:55'),
	(2, 1, 5, '2021-12-30 11:09:47', '2022-01-06 13:57:55'),
	(2, 3, 5, '2021-12-30 11:09:55', '2022-01-06 13:57:55'),
	(2, 6, 10, '2022-01-06 13:58:12', '2022-01-06 13:58:12');
/*!40000 ALTER TABLE `inventories` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.migrations: ~21 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2021_11_12_225204_create_sessions_table', 1),
	(7, '2021_12_10_221519_create_voucher_types_table', 1),
	(8, '2021_12_10_221846_create_currency_types_table', 1),
	(9, '2021_12_10_221909_create_unit_types_table', 1),
	(10, '2021_12_10_222017_create_customer_id_types_table', 1),
	(11, '2021_12_10_222307_create_province_id_types_table', 1),
	(12, '2021_12_10_222357_create_responsibility_types_table', 1),
	(13, '2021_12_10_222430_create_tax_condition_types_table', 1),
	(14, '2021_12_10_222514_create_included_concept_types_table', 1),
	(15, '2021_12_10_222554_create_other_tributes_types_table', 1),
	(16, '2021_12_11_150137_create_customers_table', 1),
	(17, '2021_12_11_150329_create_suppliers_table', 1),
	(18, '2021_12_15_135323_create_categories_table', 1),
	(19, '2021_12_15_135439_create_products_table', 1),
	(20, '2021_12_22_122452_create_warehouses_table', 1),
	(21, '2021_12_22_122554_create_inventories_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

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

-- Volcando estructura para tabla factafip.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.password_resets: ~0 rows (aproximadamente)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `brand` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity_min` decimal(12,2) NOT NULL DEFAULT '0.00',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tax_condition_type_id` bigint(20) unsigned NOT NULL,
  `unit_type_id` bigint(20) unsigned NOT NULL,
  `sale_price1` decimal(12,2) NOT NULL DEFAULT '0.00',
  `profit_percentage1` decimal(12,2) NOT NULL DEFAULT '0.00',
  `sale_price2` decimal(12,2) NOT NULL DEFAULT '0.00',
  `profit_percentage2` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount_max` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_barcode_unique` (`barcode`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_tax_condition_type_id_foreign` (`tax_condition_type_id`),
  KEY `products_unit_type_id_foreign` (`unit_type_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `products_tax_condition_type_id_foreign` FOREIGN KEY (`tax_condition_type_id`) REFERENCES `tax_condition_types` (`id`),
  CONSTRAINT `products_unit_type_id_foreign` FOREIGN KEY (`unit_type_id`) REFERENCES `unit_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.products: ~6 rows (aproximadamente)
DELETE FROM `products`;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `barcode`, `origin_code`, `category_id`, `brand`, `model`, `description`, `quantity_min`, `price`, `tax_condition_type_id`, `unit_type_id`, `sale_price1`, `profit_percentage1`, `sale_price2`, `profit_percentage2`, `discount_max`, `created_at`, `updated_at`) VALUES
	(1, NULL, '', 1, 'Philips', 'TV 50"', 'AMOLED ANDROID', 5.00, 60000.00, 5, 7, 84000.00, 40.00, 90000.00, 50.00, 10.00, '2021-12-23 15:19:23', '2022-01-13 14:32:52'),
	(3, NULL, '', 1, 'TCL', 'TV 50"', 'LED ANDROID', 5.00, 40000.00, 4, 7, 52000.00, 30.00, 56000.00, 40.00, 7.00, '2021-12-23 15:42:10', '2022-01-13 14:33:00'),
	(4, NULL, '', 1, 'Arcor', 'Choclo en Grano enlatado x500', '-', 1.00, 200.00, 5, 7, 280.00, 40.00, 320.00, 60.00, 5.00, '2022-01-03 15:47:00', '2022-01-03 15:47:00'),
	(5, '7794870000019', '', 3, 'ALSAMAR', 'ACEITE GIRASOL 1000cc', '-', 1.00, 299.60, 5, 7, 389.48, 30.00, 419.44, 40.00, 5.00, '2022-01-04 14:13:58', '2022-01-07 13:05:27'),
	(6, NULL, '', 1, 'Orbai', 'Camiseta Ciclismo', 'Entallada medio gay', 1.00, 2000.00, 4, 7, 2800.00, 40.00, 3000.00, 50.00, 5.00, '2022-01-06 13:21:11', '2022-01-06 21:11:29'),
	(7, NULL, '', 1, 'Genius', 'Mouse Gamer', 'Top', 1.00, 1200.45, 5, 7, 1560.59, 30.00, 1680.63, 40.00, 0.00, '2022-01-07 12:34:59', '2022-01-07 12:34:59');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

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

-- Volcando estructura para tabla factafip.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.sessions: ~1 rows (aproximadamente)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('TwhYgvt24Or4KI02S1Xz9AwxRuDUcZhdz9kXlFAs', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', 'YTo4OntzOjEyOiJ3YXJlaG91c2VfaWQiO3M6MToiMSI7czoxNDoid2FyZWhvdXNlX25hbWUiO3M6NDoiTWFpbiI7czo2OiJfdG9rZW4iO3M6NDA6IjNHRHpFY1F3NzNQM29sR0pvdmMzVGJOVTB4WEU5WW5lMEZlR1ZPaWQiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMwOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvaW52b2ljZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkWVJwb2IzeGV4Y3FjcHNwWExiWWtVLnlUMVY2QnRqZ0Z2anFhbExZUWZ2TnB6OWoxbUFuL2EiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJFlScG9iM3hleGNxY3BzcFhMYllrVS55VDFWNkJ0amdGdmpxYWxMWVFmdk5wejlqMW1Bbi9hIjt9', 1647705129);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.suppliers
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id_type_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id_type_id` bigint(20) unsigned NOT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CUIT` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_condition_type_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suppliers_email_unique` (`email`),
  KEY `suppliers_customer_id_type_id_foreign` (`customer_id_type_id`),
  KEY `suppliers_province_id_type_id_foreign` (`province_id_type_id`),
  KEY `suppliers_tax_condition_type_id_foreign` (`tax_condition_type_id`),
  CONSTRAINT `suppliers_customer_id_type_id_foreign` FOREIGN KEY (`customer_id_type_id`) REFERENCES `customer_id_types` (`id`),
  CONSTRAINT `suppliers_province_id_type_id_foreign` FOREIGN KEY (`province_id_type_id`) REFERENCES `province_id_types` (`id`),
  CONSTRAINT `suppliers_tax_condition_type_id_foreign` FOREIGN KEY (`tax_condition_type_id`) REFERENCES `tax_condition_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.suppliers: ~0 rows (aproximadamente)
DELETE FROM `suppliers`;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;

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
  `value` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.unit_types: ~54 rows (aproximadamente)
DELETE FROM `unit_types`;
/*!40000 ALTER TABLE `unit_types` DISABLE KEYS */;
INSERT INTO `unit_types` (`id`, `value`, `description`) VALUES
	(1, 'Kg.', 'KILOGRAMO'),
	(2, 'Mt.', 'METROS'),
	(3, 'M2', 'METRO CUADRADO'),
	(4, 'M3', 'METRO CUBICO'),
	(5, 'Lts', 'LITROS'),
	(6, '1000 KILOWATT HORA', '1000 KILOWATT HORA'),
	(7, 'Un.', 'UNIDAD'),
	(8, 'Par', 'PAR'),
	(9, 'Doc.', 'DOCENA'),
	(10, 'QUILATE', 'QUILATE'),
	(11, 'MILLAR', 'MILLAR'),
	(12, 'MG. U. INTER. ACT. ANTIB', 'MEGA U. INTER. ACT. ANTIB'),
	(13, 'UNIDAD INT. ACT. INMUNG', 'UNIDAD INT. ACT. INMUNG'),
	(14, 'GRAMO', 'GRAMO'),
	(15, 'mm.', 'MILIMETRO'),
	(16, 'mm3', 'MILIMETRO CUBICO'),
	(17, 'Km.', 'KILOMETRO'),
	(18, 'Hl.', 'HECTOLITRO'),
	(19, 'MG. UN. INT. ACT. IN', 'MEGA UNIDAD INT. ACT. INMUNG'),
	(20, 'cm.', 'CENTIMETRO'),
	(21, 'Kg. ACTIVO', 'KILOGRAMO ACTIVO'),
	(22, 'gr. ACTIVO', 'GRAMO ACTIVO'),
	(23, 'gr. BASE', 'GRAMO BASE'),
	(24, 'UIACTHOR', 'UIACTHOR'),
	(25, 'JGO.PQT. MAZO NAIPES', 'JGO.PQT. MAZO NAIPES'),
	(26, 'MUIACTHOR', 'MUIACTHOR'),
	(27, 'cm3', 'CENTIMETRO CUBICO'),
	(28, 'UIACTANT', 'UIACTANT'),
	(29, 'T', 'TONELADA'),
	(30, 'dam3', 'DECAMETRO CUBICO'),
	(31, 'Hm3', 'HECTOMETRO CUBICO'),
	(32, 'Km3', 'KILOMETRO CUBICO'),
	(33, 'MICROGRAMO', 'MICROGRAMO'),
	(34, 'NANOGRAMO', 'NANOGRAMO'),
	(35, 'PICOGRAMO', 'PICOGRAMO'),
	(36, 'MUIACTANT', 'MUIACTANT'),
	(37, 'UIACTIG', 'UIACTIG'),
	(41, 'mg.', 'MILIGRAMO'),
	(47, 'MILILITRO', 'MILILITRO'),
	(48, 'CURIE', 'CURIE'),
	(49, 'MILICURIE', 'MILICURIE'),
	(50, 'MICROCURIE', 'MICROCURIE'),
	(51, 'U.INTER. ACT. HORMONAL', 'U.INTER. ACT. HORMONAL'),
	(52, 'MEGA U. INTER. ACT. HOR.', 'MEGA U. INTER. ACT. HOR.'),
	(53, 'KILOGRAMO BASE', 'KILOGRAMO BASE'),
	(54, 'GRUESA', 'GRUESA'),
	(55, 'MUIACTIG', 'MUIACTIG'),
	(56, 'SIN DESCRIPCION', 'SIN DESCRIPCION'),
	(61, 'KILOGRAMO BRUTO', 'KILOGRAMO BRUTO'),
	(62, 'Pack', 'PACK'),
	(63, 'Horma', 'HORMA'),
	(97, 'SEÑAS/ANTICIPOS', 'SEÑAS/ANTICIPOS'),
	(98, 'OTRAS UNIDADES', 'OTRAS UNIDADES'),
	(99, 'BONIFICACION', 'BONIFICACION');
/*!40000 ALTER TABLE `unit_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.users: ~1 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@admin.com', NULL, '$2y$10$YRpob3xexcqcpspXLbYkU.yT1V6BtjgFvjqalLYQfvNpz9j1mAn/a', NULL, NULL, NULL, NULL, NULL, '2021-12-22 12:43:57', '2021-12-22 12:43:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.voucher_types
CREATE TABLE IF NOT EXISTS `voucher_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(82) COLLATE utf8mb4_unicode_ci NOT NULL,
  `letter` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.voucher_types: ~96 rows (aproximadamente)
DELETE FROM `voucher_types`;
/*!40000 ALTER TABLE `voucher_types` DISABLE KEYS */;
INSERT INTO `voucher_types` (`id`, `value`, `letter`, `type`) VALUES
	(1, 'FACTURAS A', 'A', 'FACTURA'),
	(2, 'NOTAS DE DEBITO A', 'A', 'NOTA DE DEBITO'),
	(3, 'NOTAS DE CREDITO A', 'A', 'NOTA DE CREDITO'),
	(4, 'RECIBOS A', 'A', 'RECIBO'),
	(5, 'NOTAS DE VENTA AL CONTADO A', 'A', 'NOTA DE VENTA AL CONTADO'),
	(6, 'FACTURAS B', 'B', 'FACTURA'),
	(7, 'NOTAS DE DEBITO B', 'B', 'NOTA DE DEBITO'),
	(8, 'NOTAS DE CREDITO B', 'B', 'NOTA DE CREDITO'),
	(9, 'RECIBOS B', 'B', 'RECIBO'),
	(10, 'NOTAS DE VENTA AL CONTADO B', 'B', 'NOTA DE VENTA AL CONTADO'),
	(11, 'FACTURAS C', 'C', 'FACTURA'),
	(12, 'NOTAS DE DEBITO C', 'C', 'NOTA DE DEBITO'),
	(13, 'NOTAS DE CREDITO C', 'C', 'NOTA DE CREDITO'),
	(15, 'RECIBOS C', 'C', 'RECIBO'),
	(16, 'NOTAS DE VENTA AL CONTADO C', 'C', 'NOTA DE VENTA AL CONTADO'),
	(17, 'LIQUIDACION DE SERVICIOS PUBLICOS CLASE A', 'A', NULL),
	(18, 'LIQUIDACION DE SERVICIOS PUBLICOS CLASE B', 'B', NULL),
	(19, 'FACTURAS DE EXPORTACION', NULL, NULL),
	(20, 'NOTAS DE DEBITO POR OPERACIONES CON EL EXTERIOR', NULL, NULL),
	(21, 'NOTAS DE CREDITO POR OPERACIONES CON EL EXTERIOR', NULL, NULL),
	(22, 'FACTURAS - PERMISO EXPORTACION SIMPLIFICADO - DTO. 855/97', NULL, NULL),
	(23, 'COMPROBANTES “A” DE COMPRA PRIMARIA PARA EL SECTOR PESQUERO MARITIMO', 'A', NULL),
	(24, 'COMPROBANTES “A” DE CONSIGNACION PRIMARIA PARA EL SECTOR PESQUERO MARITIMO', 'A', NULL),
	(25, 'COMPROBANTES “B” DE COMPRA PRIMARIA PARA EL SECTOR PESQUERO MARITIMO', 'B', NULL),
	(26, 'COMPROBANTES “B” DE CONSIGNACION PRIMARIA PARA EL SECTOR PESQUERO MARITIMO', 'B', NULL),
	(27, 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A', NULL, NULL),
	(28, 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B', NULL, NULL),
	(29, 'LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C', NULL, NULL),
	(30, 'COMPROBANTES DE COMPRA DE BIENES USADOS', NULL, NULL),
	(31, 'MANDATO - CONSIGNACION', NULL, NULL),
	(32, 'COMPROBANTES PARA RECICLAR MATERIALES', NULL, NULL),
	(33, 'LIQUIDACION PRIMARIA DE GRANOS', NULL, NULL),
	(34, 'COMPROBANTES A DEL APARTADO A  INCISO F)  R.G. N°  1415', NULL, NULL),
	(35, 'COMPROBANTES B DEL ANEXO I, APARTADO A, INC. F), R.G. N° 1415', NULL, NULL),
	(36, 'COMPROBANTES C DEL Anexo I, Apartado A, INC.F), R.G. N° 1415', NULL, NULL),
	(37, 'NOTAS DE DEBITO O DOCUMENTO EQUIVALENTE QUE CUMPLAN CON LA R.G. N° 1415', NULL, NULL),
	(38, 'NOTAS DE CREDITO O DOCUMENTO EQUIVALENTE QUE CUMPLAN CON LA R.G. N° 1415', NULL, NULL),
	(39, 'OTROS COMPROBANTES A QUE CUMPLEN CON LA R G  1415', NULL, NULL),
	(40, 'OTROS COMPROBANTES B QUE CUMPLAN CON LA R.G. N° 1415', NULL, NULL),
	(41, 'OTROS COMPROBANTES C QUE CUMPLAN CON LA R.G. N° 1415', NULL, NULL),
	(43, 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B', NULL, NULL),
	(44, 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C', NULL, NULL),
	(45, 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A', NULL, NULL),
	(46, 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE B', NULL, NULL),
	(47, 'NOTA DE DEBITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE C', NULL, NULL),
	(48, 'NOTA DE CREDITO LIQUIDACION UNICA COMERCIAL IMPOSITIVA CLASE A', NULL, NULL),
	(49, 'COMPROBANTES DE COMPRA DE BIENES NO REGISTRABLES A CONSUMIDORES FINALES', NULL, NULL),
	(50, 'RECIBO FACTURA A  REGIMEN DE FACTURA DE CREDITO ', NULL, NULL),
	(51, 'FACTURAS M', 'M', 'FACTURA'),
	(52, 'NOTAS DE DEBITO M', 'M', NULL),
	(53, 'NOTAS DE CREDITO M', 'M', NULL),
	(54, 'RECIBOS M', 'M', NULL),
	(55, 'NOTAS DE VENTA AL CONTADO M', 'M', NULL),
	(56, 'COMPROBANTES M DEL ANEXO I  APARTADO A  INC F) R.G. N° 1415', NULL, NULL),
	(57, 'OTROS COMPROBANTES M QUE CUMPLAN CON LA R.G. N° 1415', NULL, NULL),
	(58, 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO M', NULL, NULL),
	(59, 'LIQUIDACIONES M', 'M', 'LIQUIDACION'),
	(60, 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO A', NULL, NULL),
	(61, 'CUENTAS DE VENTA Y LIQUIDO PRODUCTO B', NULL, NULL),
	(63, 'LIQUIDACIONES A', 'A', 'LIQUIDACION'),
	(64, 'LIQUIDACIONES B', 'B', 'LIQUIDACION'),
	(66, 'DESPACHO DE IMPORTACION', NULL, NULL),
	(68, 'LIQUIDACION C', 'C', 'LIQUIDACION'),
	(70, 'RECIBOS FACTURA DE CREDITO', NULL, NULL),
	(80, 'INFORME DIARIO DE CIERRE (ZETA) - CONTROLADORES FISCALES', NULL, NULL),
	(81, 'TIQUE FACTURA A   ', 'A', 'TIQUE FACTURA'),
	(82, 'TIQUE FACTURA B', 'B', 'TIQUE FACTURA'),
	(83, 'TIQUE', NULL, 'TIQUE'),
	(88, 'REMITO ELECTRONICO', NULL, 'REMITO ELECTRONICO'),
	(89, 'RESUMEN DE DATOS', NULL, 'RESUMEN DE DATOS'),
	(90, 'OTROS COMPROBANTES - DOCUMENTOS EXCEPTUADOS - NOTAS DE CREDITO', NULL, NULL),
	(91, 'REMITOS R', 'R', 'REMITOS'),
	(99, 'OTROS COMPROBANTES QUE NO CUMPLEN O ESTÁN EXCEPTUADOS DE LA R.G. 1415 Y SUS MODIF ', NULL, NULL),
	(110, 'TIQUE NOTA DE CREDITO ', NULL, NULL),
	(111, 'TIQUE FACTURA C', 'C', 'TIQUE FACTURA'),
	(112, 'TIQUE NOTA DE CREDITO A', 'A', NULL),
	(113, 'TIQUE NOTA DE CREDITO B', 'B', NULL),
	(114, 'TIQUE NOTA DE CREDITO C', 'C', NULL),
	(115, 'TIQUE NOTA DE DEBITO A', 'A', NULL),
	(116, 'TIQUE NOTA DE DEBITO B', 'B', NULL),
	(117, 'TIQUE NOTA DE DEBITO C', 'C', NULL),
	(118, 'TIQUE FACTURA M', 'M', NULL),
	(119, 'TIQUE NOTA DE CREDITO M', 'M', NULL),
	(120, 'TIQUE NOTA DE DEBITO M', 'M', NULL),
	(201, 'FACTURA DE CRÉDITO ELECTRÓNICA MiPyMEs (FCE) A', 'A', NULL),
	(202, 'NOTA DE DEBITO ELECTRÓNICA MiPyMEs (FCE) A', 'A', NULL),
	(203, 'NOTA DE CREDITO ELECTRÓNICA MiPyMEs (FCE) A', 'A', NULL),
	(206, 'FACTURA DE CRÉDITO ELECTRÓNICA MiPyMEs (FCE) B', 'B', NULL),
	(207, 'NOTA DE DEBITO ELECTRÓNICA MiPyMEs (FCE) B', 'B', NULL),
	(208, 'NOTA DE CREDITO ELECTRÓNICA MiPyMEs (FCE) B', 'B', NULL),
	(211, 'FACTURA DE CRÉDITO ELECTRÓNICA MiPyMEs (FCE) C', 'C', NULL),
	(212, 'NOTA DE DEBITO ELECTRÓNICA MiPyMEs (FCE) C', 'C', NULL),
	(213, 'NOTA DE CREDITO ELECTRÓNICA MiPyMEs (FCE) C', 'C', NULL),
	(331, 'LIQUIDACION SECUNDARIA DE GRANOS', NULL, NULL),
	(332, 'CERTIFICACION ELECTRONICA (GRANOS)', NULL, NULL),
	(995, 'REMITO ELECTRÓNICO CÁRNICO ', NULL, NULL);
/*!40000 ALTER TABLE `voucher_types` ENABLE KEYS */;

-- Volcando estructura para tabla factafip.warehouses
CREATE TABLE IF NOT EXISTS `warehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.warehouses: ~4 rows (aproximadamente)
DELETE FROM `warehouses`;
/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` (`id`, `name`, `location`, `phone`, `email`, `contact_person`, `created_at`, `updated_at`) VALUES
	(1, 'Main', 'First Street', '34825111111', 'main@warehouse.com', 'Doe, John', '2021-12-22 09:53:07', '2021-12-22 09:53:07'),
	(2, 'Segundo', 'Avellaneda', '3482 222222', 'alguien@mas.com', 'Alguien Mas', '2021-12-23 00:16:37', '2021-12-27 15:54:21'),
	(3, 'Tercero', 'Reconquista', '3482 333333', 'perez@gmail.com', 'Pérez, Juan', '2021-12-23 00:22:36', '2021-12-27 15:54:07'),
	(4, 'Hell\'s Kitchen', 'Hell`s Kitchen', '3482666666', 'hell@666.com', 'DareDevil', '2021-12-27 15:12:33', '2021-12-28 14:06:00');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
