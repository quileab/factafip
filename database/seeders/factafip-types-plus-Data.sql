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
) ENGINE=InnoDB AUTO_INCREMENT=20229713870 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla factafip.customers: ~5 rows (aproximadamente)
DELETE FROM `customers`;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`id`, `customer_id_type_id`, `business_name`, `name`, `address`, `city`, `province_id_type_id`, `phone`, `email`, `CUIT`, `responsibility_type_id`, `created_at`, `updated_at`) VALUES
	(0, 99, 'n/a', 'Consumidor Final', 'N/A', 'N/A', 12, '3482111111', 'x@x.com', '1', 5, '2021-12-22 22:55:18', '2021-12-22 22:55:18'),
	(23526260, 96, 'quileab.com', 'Olivetti, Daniel Alberto', '25 de Mayo 2282', 'Reconquista', 12, '3482518081', 'quileab@gmail.com', '20235262607', 5, '2021-12-20 21:04:27', '2021-12-22 16:29:59'),
	(25834649, 96, 'FAF Inc.', 'Fontana, Fabiana Andrea', '25 de Mayo 2282', 'Reconquista', 12, '3482540792', 'fontanafabianaa@gmail.com', '27258346497', 5, '2021-12-22 09:41:56', '2021-12-22 16:31:37'),
	(20229713869, 80, 'Transporte Cian', 'Cian Ceferino Francisco', 'Sarmiento', 'Malabrigo', 12, '3482533462', 'franciscoccian@gmail.com', '20229713869', 1, '2022-01-31 14:57:13', '2022-01-31 14:57:13'),
	(20374533372, 80, 'Rodar Bike', 'Monzón, Diego Emiliano', 'Olessio 2170', 'Reconquista', 12, '3482307265', 'diego.m94@hotmail.com', '20374533372', 1, '2022-01-06 13:18:32', '2022-01-28 15:57:43');
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

-- Volcando datos para la tabla factafip.sessions: ~2 rows (aproximadamente)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('PYe6pOrrHsFZsNT4VtFXujRThVAtb7nEe1OVFNnu', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'YToxMTp7czoxMjoid2FyZWhvdXNlX2lkIjtzOjE6IjEiO3M6MTQ6IndhcmVob3VzZV9uYW1lIjtzOjQ6Ik1haW4iO3M6NjoiX3Rva2VuIjtzOjQwOiJNOWF4RWpZT2ZyZTNtR01ybEdBQ003bThUNm1QVE5jcTZQSXFyZVZCIjtzOjM6InVybCI7YTowOnt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wZGYvaW52b2ljZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRZUnBvYjN4ZXhjcWNwc3BYTGJZa1UueVQxVjZCdGpnRnZqcWFsTFlRZnZOcHo5ajFtQW4vYSI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkWVJwb2IzeGV4Y3FjcHNwWExiWWtVLnlUMVY2QnRqZ0Z2anFhbExZUWZ2TnB6OWoxbUFuL2EiO3M6NDoiY2FydCI7YToxOntzOjc6ImRlZmF1bHQiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjI6e3M6MzI6ImVmYjI2ZTJjNmFiNmJkNGQxMzIzMjg4OTIzNTIyZDRlIjtPOjMyOiJHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbSI6MTE6e3M6NToicm93SWQiO3M6MzI6ImVmYjI2ZTJjNmFiNmJkNGQxMzIzMjg4OTIzNTIyZDRlIjtzOjI6ImlkIjtpOjQ7czozOiJxdHkiO2k6MTtzOjQ6Im5hbWUiO3M6Mzk6IkFyY29yOiBDaG9jbG8gZW4gR3Jhbm8gZW5sYXRhZG8geDUwMDogLSI7czo1OiJwcmljZSI7ZDoyODA7czo2OiJ3ZWlnaHQiO2Q6MDtzOjc6Im9wdGlvbnMiO086Mzk6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtT3B0aW9ucyI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO31zOjc6InRheFJhdGUiO2Q6MjE7czo0OToiAEdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtAGFzc29jaWF0ZWRNb2RlbCI7czoxODoiQXBwXE1vZGVsc1xQcm9kdWN0IjtzOjQ2OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AZGlzY291bnRSYXRlIjtkOjM7czo2OiJ0YXhfaWQiO2k6NTt9czozMjoiNDY4Mzk5NTgxMzQyNTA1YzQ3ZjQ2MTViODFiZWRhYTkiO086MzI6Ikdsb3VkZW1hbnNcU2hvcHBpbmdjYXJ0XENhcnRJdGVtIjoxMTp7czo1OiJyb3dJZCI7czozMjoiNDY4Mzk5NTgxMzQyNTA1YzQ3ZjQ2MTViODFiZWRhYTkiO3M6MjoiaWQiO2k6NTtzOjM6InF0eSI7aToxO3M6NDoibmFtZSI7czozMzoiQUxTQU1BUjogQUNFSVRFIEdJUkFTT0wgMTAwMGNjOiAtIjtzOjU6InByaWNlIjtkOjQxOS40NDtzOjY6IndlaWdodCI7ZDowO3M6Nzoib3B0aW9ucyI7TzozOToiR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW1PcHRpb25zIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6NzoidGF4UmF0ZSI7ZDoyMTtzOjQ5OiIAR2xvdWRlbWFuc1xTaG9wcGluZ2NhcnRcQ2FydEl0ZW0AYXNzb2NpYXRlZE1vZGVsIjtzOjE4OiJBcHBcTW9kZWxzXFByb2R1Y3QiO3M6NDY6IgBHbG91ZGVtYW5zXFNob3BwaW5nY2FydFxDYXJ0SXRlbQBkaXNjb3VudFJhdGUiO2Q6NTtzOjY6InRheF9pZCI7aTo1O319czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319czoxMToiaW52b2ljZURhdGEiO2E6MjE6e3M6NzoiQ2FudFJlZyI7aToxO3M6NjoiUHRvVnRhIjtpOjI7czo4OiJDYnRlVGlwbyI7aTo2O3M6ODoiQ29uY2VwdG8iO2k6MTtzOjc6IkRvY1RpcG8iO2k6OTk7czo2OiJEb2NOcm8iO3M6MToiMCI7czo5OiJDYnRlRGVzZGUiO2k6NjtzOjk6IkNidGVIYXN0YSI7aTo2O3M6NzoiQ2J0ZUZjaCI7aToyMDIyMDIwMjtzOjg6IkltcFRvdGFsIjtkOjY3MC4wNztzOjEwOiJJbXBUb3RDb25jIjtpOjA7czo3OiJJbXBOZXRvIjtkOjU1My43NztzOjc6IkltcE9wRXgiO2k6MDtzOjY6IkltcElWQSI7ZDoxMTYuMztzOjc6IkltcFRyaWIiO2k6MDtzOjU6Ik1vbklkIjtzOjM6IlBFUyI7czo4OiJNb25Db3RpeiI7aToxO3M6MzoiSXZhIjthOjE6e2k6MDthOjM6e3M6MjoiSWQiO2k6NTtzOjc6IkJhc2VJbXAiO2Q6NTUzLjc3O3M6NzoiSW1wb3J0ZSI7ZDoxMTYuMzt9fXM6MzoicmVzIjthOjM6e3M6MzoiQ0FFIjtzOjE0OiI3MjA1Nzk4NTgyODQzMSI7czo5OiJDQUVGY2hWdG8iO3M6MTA6IjIwMjItMDItMTIiO3M6NDoiQ1VJVCI7aToyMDIzNTI2MjYwNzt9czo1OiJpdGVtcyI7cjoxNTtzOjEwOiJpdGVtRGV0YWlsIjthOjI6e3M6MzI6ImVmYjI2ZTJjNmFiNmJkNGQxMzIzMjg4OTIzNTIyZDRlIjthOjU6e3M6NjoiUHJlY2lvIjtkOjI4MDtzOjg6IlN1YlRvdGFsIjtkOjI3MS42O3M6OToiRGVzY3VlbnRvIjtkOjguNDtzOjc6IkJhc2VJbXAiO2Q6MjI0LjQ2O3M6MzoiSVZBIjtkOjQ3LjE0O31zOjMyOiI0NjgzOTk1ODEzNDI1MDVjNDdmNDYxNWI4MWJlZGFhOSI7YTo1OntzOjY6IlByZWNpbyI7ZDo0MTkuNDQ7czo4OiJTdWJUb3RhbCI7ZDozOTguNDc7czo5OiJEZXNjdWVudG8iO2Q6MjAuOTc7czo3OiJCYXNlSW1wIjtkOjU1My43NztzOjM6IklWQSI7ZDoxMTYuMzt9fX19', 1643761090),
	('Ui6XZvVSFidGhxdxycUZa4FSeCtAFZ5ex9xqhByW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36', 'YTo2OntzOjEyOiJ3YXJlaG91c2VfaWQiO3M6MToiMSI7czoxNDoid2FyZWhvdXNlX25hbWUiO3M6NDoiTWFpbiI7czo2OiJfdG9rZW4iO3M6NDA6IlVRT3NiZm83R2ZGdVJpVkw0TlNJY1B3ZkxsWmtSNlY3VjJDS0V3ZEciO3M6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbnZvaWNlcy8wLzYvMiI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1643834417);
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
