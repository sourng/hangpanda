-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 02, 2020 at 10:24 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sourng_erp_v34`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `business_id`, `name`, `account_number`, `account_type_id`, `note`, `created_by`, `is_closed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'ចំណាយ', '10001', 0, NULL, 1, 0, NULL, '2020-08-03 16:36:19', '2020-08-03 16:36:19'),
(2, 1, 'ចំណូល', '20001', 0, NULL, 1, 0, NULL, '2020-08-03 16:45:23', '2020-08-03 16:45:23');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
CREATE TABLE IF NOT EXISTS `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_account_id_index` (`account_id`),
  KEY `account_transactions_transaction_id_index` (`transaction_id`),
  KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  KEY `account_transactions_created_by_index` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `type`, `sub_type`, `amount`, `reff_no`, `operation_date`, `created_by`, `transaction_id`, `transaction_payment_id`, `transfer_transaction_id`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'debit', NULL, '5.0000', NULL, '2020-08-03 23:34:00', 1, 1, 1, NULL, NULL, NULL, '2020-08-03 16:41:27', '2020-08-03 16:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
CREATE TABLE IF NOT EXISTS `account_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 1, 'App\\DocumentAndNote', 1, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":4,\"notable_type\":\"App\\\\Contact\",\"heading\":\"\\u1796\\u17b7\\u1793\\u17b7\\u178f\\u17d2\\u1799\\u1797\\u17d2\\u1793\\u17c2\\u1780\",\"description\":\"<p>\\u1781\\u17b6\\u1784\\u1792\\u17d2\\u179c\\u17c1\\u1784 59<\\/p>\\r\\n<p>\\u1781\\u17b6\\u1784\\u179f\\u17d2\\u178f\\u17b6\\u17c6 90<\\/p>\",\"is_private\":0,\"created_by\":1,\"created_at\":\"2020-08-03 22:44:46\",\"updated_at\":\"2020-08-03 22:44:46\"}}', '2020-08-03 15:44:46', '2020-08-03 15:44:46'),
(2, 'default', 'created', 2, 'App\\DocumentAndNote', 1, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":4,\"notable_type\":\"App\\\\Contact\",\"heading\":\"\\u1780\\u17b6\\u178f\\u17cb\\u179c\\u17c2\\u1793\\u178f\\u17b6 R90-L89\",\"description\":\"<p>\\u179f\\u17d2\\u178f\\u17b6\\u17c6 90<\\/p>\\r\\n<p>\\u1792\\u17d2\\u179c\\u17c1\\u1784 89<\\/p>\",\"is_private\":0,\"created_by\":1,\"created_at\":\"2020-08-03 22:45:59\",\"updated_at\":\"2020-08-03 22:45:59\"}}', '2020-08-03 15:45:59', '2020-08-03 15:45:59'),
(3, 'default', 'created', 3, 'App\\DocumentAndNote', 1, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":4,\"notable_type\":\"App\\\\Contact\",\"heading\":\"\\u1796\\u17b7\\u1793\\u17b7\\u178f\\u17d2\\u1799\\u1780\\u17b6\\u178f\\u17cb\\u179c\\u17c2\\u1793\\u178f\\u17b6 2020-08-25\",\"description\":\"<p>\\u1797\\u17d2\\u1793\\u17c2\\u1780\\u1792\\u17d2\\u179c\\u17c1\\u1784 85<\\/p>\\r\\n<p>\\u179f\\u17d2\\u178f\\u17b6\\u17c6 90<\\/p>\",\"is_private\":0,\"created_by\":1,\"created_at\":\"2020-08-25 14:02:42\",\"updated_at\":\"2020-08-25 14:02:42\"}}', '2020-08-25 07:02:43', '2020-08-25 07:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

DROP TABLE IF EXISTS `barcodes`;
CREATE TABLE IF NOT EXISTS `barcodes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barcodes_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20', 3.7500, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.1562, 2, 0, 0, 20, NULL, '2017-12-17 23:13:44', '2017-12-17 23:13:44'),
(2, '30 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.2198, 0.0000, 0.1400, 3, 0, 0, 30, NULL, '2017-12-17 23:04:39', '2017-12-17 23:10:40'),
(3, '32 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-17 22:55:40', '2017-12-17 22:55:40'),
(4, '40 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-17 22:58:40', '2017-12-17 22:58:40'),
(5, '50 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-17 22:51:10', '2017-12-17 22:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-17 22:51:10', '2017-12-17 22:51:10'),
(7, 'Barcode001', NULL, 1.1800, 0.7800, 1.1800, 0.0000, 0.1000, 0.0000, 0.0200, 0.0200, 1, 0, 1, 28, 1, '2020-08-24 02:19:42', '2020-08-25 14:49:58'),
(8, 'Print Label', NULL, 0.7800, 1.1800, 0.7800, 2.0000, 0.0000, 0.0000, 0.0200, 0.0200, 1, 1, 0, 1, 1, '2020-08-25 14:49:58', '2020-08-25 15:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_contact_id_foreign` (`contact_id`),
  KEY `bookings_business_id_foreign` (`business_id`),
  KEY `bookings_created_by_foreign` (`created_by`),
  KEY `bookings_table_id_index` (`table_id`),
  KEY `bookings_waiter_id_index` (`waiter_id`),
  KEY `bookings_location_id_index` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `contact_id`, `waiter_id`, `table_id`, `correspondent_id`, `business_id`, `location_id`, `booking_start`, `booking_end`, `created_by`, `booking_status`, `booking_note`, `created_at`, `updated_at`) VALUES
(3, 4, NULL, NULL, 1, 1, 1, '2020-08-14 07:30:00', '2020-08-14 07:30:00', 1, 'booked', NULL, '2020-08-14 12:10:50', '2020-08-14 12:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_business_id_foreign` (`business_id`),
  KEY `brands_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Hauwei', NULL, 1, NULL, '2020-08-24 01:14:51', '2020-08-24 01:14:51'),
(2, 1, 'OPPO', NULL, 1, NULL, '2020-08-24 02:36:34', '2020-08-24 02:36:34'),
(3, 1, 'Samsung', NULL, 1, NULL, '2020-08-24 04:45:44', '2020-08-24 04:45:44'),
(4, 1, 'ViVo', NULL, 1, NULL, '2020-08-24 05:00:49', '2020-08-24 05:00:49'),
(5, 1, 'Realme', NULL, 1, NULL, '2020-08-24 05:15:30', '2020-08-24 05:15:30'),
(6, 1, 'Nava', NULL, 1, NULL, '2020-08-24 05:34:15', '2020-08-24 05:34:15'),
(7, 1, 'Nokia', NULL, 1, NULL, '2020-08-24 05:37:55', '2020-08-24 05:37:55'),
(8, 1, 'Naviforce', NULL, 1, NULL, '2020-08-24 06:28:15', '2020-08-24 06:28:15'),
(9, 1, 'MK Mike', NULL, 1, NULL, '2020-08-24 08:01:11', '2020-08-24 08:01:11'),
(10, 1, 'SKMEI', NULL, 1, NULL, '2020-08-25 03:20:07', '2020-08-25 03:20:07'),
(11, 1, 'HUBLOT', NULL, 1, NULL, '2020-08-25 03:22:41', '2020-08-25 03:22:41'),
(12, 1, 'EURA', NULL, 1, NULL, '2020-08-25 03:24:34', '2020-08-25 03:24:34'),
(13, 1, 'OVERFLY', NULL, 1, NULL, '2020-08-25 03:27:15', '2020-08-25 03:27:15'),
(14, 1, 'Casio', NULL, 1, NULL, '2020-08-25 05:03:35', '2020-08-25 05:03:35'),
(15, 1, 'TRULY', NULL, 1, NULL, '2020-08-25 05:23:38', '2020-08-25 05:23:38'),
(16, 1, 'cellcard', NULL, 1, NULL, '2020-08-25 13:15:13', '2020-08-25 13:15:13');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_owner_id_foreign` (`owner_id`),
  KEY `business_currency_id_foreign` (`currency_id`),
  KEY `business_default_sales_tax_foreign` (`default_sales_tax`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Hang Tek Optic Shop', 2, '2020-08-03', NULL, NULL, NULL, NULL, NULL, 25.00, 1, 'Asia/Phnom_Penh', 1, 'fifo', '0.00', 'includes', '1596475128_logo.png', NULL, 0, 'add_expiry', 'stop_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"allow_overselling\":\"1\",\"enable_transaction_date\":\"1\",\"show_invoice_scheme\":\"1\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, NULL, 1, 0, 'before', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\",\"booking\"]', 'd/m/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":\"PR\",\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null}', 'purple', NULL, 1, NULL, '1.0000', '1.0000', 0, '1.0000', '1.0000', NULL, 1, 1, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"enable_product_warranty\":\"1\",\"default_datatable_page_entries\":\"25\"}', 1, '2020-08-03 07:57:20', '2020-08-25 08:38:18');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

DROP TABLE IF EXISTS `business_locations`;
CREATE TABLE IF NOT EXISTS `business_locations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_locations_business_id_index` (`business_id`),
  KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'Hang Tek Optic Shop', 'Sreysor', 'CAMBODIA', 'Kompongcham', 'Kompongcham', '17253', 2, 2, NULL, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":\"2\"},\"card\":{\"is_enabled\":\"1\",\"account\":\"2\"},\"cheque\":{\"is_enabled\":\"1\",\"account\":\"2\"},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":\"2\"},\"other\":{\"is_enabled\":\"1\",\"account\":\"2\"},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2020-08-03 07:57:20', '2020-08-25 10:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

DROP TABLE IF EXISTS `cash_registers`;
CREATE TABLE IF NOT EXISTS `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int(11) NOT NULL DEFAULT '0',
  `total_cheques` int(11) NOT NULL DEFAULT '0',
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_registers_business_id_foreign` (`business_id`),
  KEY `cash_registers_user_id_foreign` (`user_id`),
  KEY `cash_registers_location_id_index` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'open', NULL, '0.0000', 0, 0, NULL, '2020-08-03 09:29:00', '2020-08-03 09:29:17'),
(2, 1, 1, 2, 'open', NULL, '0.0000', 0, 0, NULL, '2020-08-25 13:07:00', '2020-08-25 13:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

DROP TABLE IF EXISTS `cash_register_transactions`;
CREATE TABLE IF NOT EXISTS `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  KEY `cash_register_transactions_transaction_id_index` (`transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, '0.0000', 'cash', 'credit', 'initial', NULL, '2020-08-03 09:29:17', '2020-08-03 09:29:17'),
(14, 2, '0.0000', 'cash', 'credit', 'initial', NULL, '2020-08-25 13:07:53', '2020-08-25 13:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_business_id_foreign` (`business_id`),
  KEY `categories_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ទូរស័ព្ទ', 1, 'Phone', 0, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:15:39', '2020-08-24 01:15:39'),
(2, 'Hauwei', 1, 'Hauwei', 1, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:16:09', '2020-08-24 01:16:09'),
(3, 'OPPO', 1, 'OPPO', 1, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:19:04', '2020-08-24 01:19:04'),
(4, 'ViVo', 1, 'ViVo', 1, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:19:34', '2020-08-24 01:19:34'),
(5, 'Nokia', 1, 'Nokia', 1, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:19:54', '2020-08-24 01:19:54'),
(6, 'Samsung', 1, 'Samsung', 1, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:21:16', '2020-08-24 01:21:16'),
(7, 'Camfone', 1, 'Camfone', 1, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:21:31', '2020-08-24 01:21:31'),
(8, 'Nava', 1, 'Nava', 1, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:22:11', '2020-08-24 01:22:11'),
(9, 'នាឡិកា', 1, 'watch', 0, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:23:09', '2020-08-24 01:23:09'),
(10, 'ស្វីស', 1, 'Swiss', 9, 1, 'product', NULL, NULL, NULL, '2020-08-24 01:24:07', '2020-08-24 01:24:07'),
(11, 'Realme', 1, 'Realme', 1, 1, 'product', NULL, NULL, NULL, '2020-08-24 05:16:54', '2020-08-24 05:17:21'),
(12, 'Naviforce', 1, 'Naviforce', 9, 1, 'product', NULL, NULL, '2020-08-24 06:26:27', '2020-08-24 06:25:37', '2020-08-24 06:26:27'),
(13, 'Naviforce', 1, 'Naviforce', 9, 1, 'product', NULL, NULL, NULL, '2020-08-24 06:27:01', '2020-08-24 06:27:01'),
(14, 'MK Mike', 1, 'MK Mike', 9, 1, 'product', NULL, NULL, NULL, '2020-08-24 07:57:02', '2020-08-24 07:57:02'),
(15, 'Realme', 1, 'Realme', 9, 1, 'product', NULL, NULL, NULL, '2020-08-24 07:57:32', '2020-08-24 07:57:32'),
(16, 'SKMEI', 1, 'SKMEI', 9, 1, 'product', NULL, NULL, NULL, '2020-08-24 07:58:02', '2020-08-24 07:58:02'),
(17, 'HUBLOT', 1, 'HUBLOT', 9, 1, 'product', NULL, NULL, NULL, '2020-08-24 07:58:26', '2020-08-24 07:58:26'),
(18, 'EURA', 1, 'EURA', 9, 1, 'product', NULL, NULL, NULL, '2020-08-24 07:58:44', '2020-08-24 07:58:44'),
(19, 'OVERFLY', 1, 'OVERFLY', 9, 1, 'product', NULL, NULL, NULL, '2020-08-24 07:59:22', '2020-08-24 07:59:22'),
(20, 'កាស្យូ', 1, 'Casio', 0, 1, 'product', NULL, NULL, NULL, '2020-08-25 05:01:21', '2020-08-25 05:02:11');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

DROP TABLE IF EXISTS `categorizables`;
CREATE TABLE IF NOT EXISTS `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL,
  KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `total_rp` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_business_id_foreign` (`business_id`),
  KEY `contacts_created_by_foreign` (`created_by`),
  KEY `contacts_type_index` (`type`),
  KEY `contacts_contact_status_index` (`contact_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(2, 1, 'customer', 'Seng Sourng', 'Mr SENG  SOURNG', 'Mr', 'SENG', NULL, 'SOURNG', 'sengsourng@gmail.com', 'CO0002', 'active', NULL, 'Krong Siemreap', 'Siemreap', 'CAMBODIA', 'R06', NULL, '17251', '1983-05-12', '092771244', NULL, NULL, NULL, NULL, '0.0000', 1, 0, 0, 0, 0, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, '2020-08-03 14:05:34', '2020-08-03 15:43:18'),
(3, 1, 'customer', NULL, 'លោក ឡុង  ដារា', 'លោក', 'ឡុង', NULL, 'ដារា', NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '099887766', NULL, NULL, NULL, NULL, '0.0000', 1, 0, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '2020-08-03 15:39:09', '2020-08-03 15:43:08'),
(4, 1, 'customer', NULL, 'លោក ឆៃ  យ៉ារឹទ្ធ', 'លោក', 'ឆៃ', NULL, 'យ៉ារឹទ្ធ', NULL, 'CO0004', 'active', NULL, 'ភ្នំពេញ', 'ភ្នំពេញ', NULL, NULL, NULL, NULL, NULL, '010887766', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-03 15:41:19', '2020-08-03 15:41:19');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_groups_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'អតិថិជនធម្មតា 0%', 0.00, 1, '2020-08-03 15:35:52', '2020-08-03 15:35:52'),
(2, 1, 'អតិថិជន VIP 20%', 20.00, 1, '2020-08-03 15:36:23', '2020-08-03 15:36:23'),
(3, 1, 'អតិថិជន 10%', 10.00, 1, '2020-08-03 15:36:45', '2020-08-03 15:36:45'),
(4, 1, 'អតិថិជន 5%', 5.00, 1, '2020-08-03 15:37:01', '2020-08-03 15:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

DROP TABLE IF EXISTS `dashboard_configurations`;
CREATE TABLE IF NOT EXISTS `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_configurations_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_business_id_index` (`business_id`),
  KEY `discounts_brand_id_index` (`brand_id`),
  KEY `discounts_category_id_index` (`category_id`),
  KEY `discounts_location_id_index` (`location_id`),
  KEY `discounts_priority_index` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

DROP TABLE IF EXISTS `document_and_notes`;
CREATE TABLE IF NOT EXISTS `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_and_notes_business_id_index` (`business_id`),
  KEY `document_and_notes_notable_id_index` (`notable_id`),
  KEY `document_and_notes_created_by_index` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_and_notes`
--

INSERT INTO `document_and_notes` (`id`, `business_id`, `notable_id`, `notable_type`, `heading`, `description`, `is_private`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'App\\Contact', 'ពិនិត្យភ្នែក', '<p>ខាងធ្វេង 59</p>\r\n<p>ខាងស្តាំ 90</p>', 0, 1, '2020-08-03 15:44:46', '2020-08-03 15:44:46'),
(2, 1, 4, 'App\\Contact', 'កាត់វែនតា R90-L89', '<p>ស្តាំ 90</p>\r\n<p>ធ្វេង 89</p>', 0, 1, '2020-08-03 15:45:59', '2020-08-03 15:45:59'),
(3, 1, 4, 'App\\Contact', 'ពិនិត្យកាត់វែនតា 2020-08-25', '<p>ភ្នែកធ្វេង 85</p>\r\n<p>ស្តាំ 90</p>', 0, 1, '2020-08-25 07:02:42', '2020-08-25 07:02:42');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE IF NOT EXISTS `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ចាក់សាំង', 1, NULL, NULL, '2020-08-03 16:31:34', '2020-08-03 16:31:34'),
(2, 'ម្ហូបអាហារ', 1, NULL, NULL, '2020-08-03 16:31:45', '2020-08-03 16:31:45'),
(3, 'ប្រាក់បៀវត្ស', 1, NULL, NULL, '2020-08-03 16:31:59', '2020-08-03 16:31:59'),
(4, 'បង់ភ្លើង', 1, NULL, NULL, '2020-08-03 16:32:16', '2020-08-03 16:32:16'),
(5, 'ទឹកសុទ្ធ', 1, NULL, NULL, '2020-08-03 16:32:28', '2020-08-03 16:32:28'),
(6, 'ផ្សេងៗ', 1, NULL, NULL, '2020-08-03 16:32:35', '2020-08-03 16:32:35');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

DROP TABLE IF EXISTS `group_sub_taxes`;
CREATE TABLE IF NOT EXISTS `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL,
  KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  KEY `group_sub_taxes_tax_id_foreign` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

DROP TABLE IF EXISTS `invoice_layouts`;
CREATE TABLE IF NOT EXISTS `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_layouts_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 'Customer', 0, '#000000', NULL, NULL, '{\"due_date_label\":null,\"total_quantity_label\":null}', 1, 1, 'slim', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2020-08-03 07:57:20', '2020-08-25 08:39:42'),
(2, 'A5 Invice', NULL, 'Invoice No.', 'Quotation No.', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round off', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', NULL, NULL, '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 1, 'classic', 'Credit Note', 'Ref. No.', 'Credit Amount', NULL, 0, 'All Balance Due', 'Change Return', NULL, NULL, NULL, '2020-08-25 10:45:48', '2020-08-25 10:51:51'),
(3, 'POS Printer', NULL, 'Invoice No.', 'Quotation No.', 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Quotation', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round off', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 0, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', NULL, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', NULL, NULL, '{\"due_date_label\":\"Due Date\",\"total_quantity_label\":\"Total Quantity\"}', 0, 1, 'slim', 'Credit Note', 'Ref. No.', 'Credit Amount', NULL, 0, 'All Balance Due', 'Change Return', NULL, NULL, NULL, '2020-08-25 10:53:19', '2020-08-25 10:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

DROP TABLE IF EXISTS `invoice_schemes`;
CREATE TABLE IF NOT EXISTS `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT '0',
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_schemes_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'year', '', 1, 5, 4, 0, '2020-08-03 07:57:20', '2020-08-25 10:46:29'),
(2, 1, 'A5 Paper', 'year', NULL, 0, 1, 4, 0, '2020-08-25 10:46:20', '2020-08-25 10:53:44'),
(3, 1, 'POS Printer', 'year', NULL, 0, 0, 4, 1, '2020-08-25 10:53:44', '2020-08-25 10:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1598237385_2072296967_OPPO-A31-3.jpg', NULL, 1, 'App\\Variation', 1, '2020-08-24 02:49:45', '2020-08-24 02:49:45'),
(2, 1, '1598338960_187086425_download (2).jfif', NULL, 1, 'App\\DocumentAndNote', 3, '2020-08-25 07:02:43', '2020-08-25 07:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(110, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(111, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(112, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(113, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(114, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(115, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(116, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(117, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(118, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(119, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(120, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(121, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(122, '2018_09_04_155900_create_accounts_table', 1),
(123, '2018_09_06_114438_create_selling_price_groups_table', 1),
(124, '2018_09_06_154057_create_variation_group_prices_table', 1),
(125, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(126, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(127, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(128, '2018_09_10_152703_create_account_transactions_table', 1),
(129, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(130, '2018_09_19_123914_create_notification_templates_table', 1),
(131, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(132, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(133, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(134, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(135, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(136, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(137, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(138, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(139, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(140, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(141, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(142, '2018_10_22_134428_modify_variable_product_data', 1),
(143, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(144, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(145, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(146, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(147, '2018_10_31_175627_add_user_contact_access', 1),
(148, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(149, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(150, '2018_11_08_105621_add_role_permissions', 1),
(151, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(152, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(153, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(154, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(155, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(156, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(157, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(158, '2018_12_14_103307_modify_system_table', 1),
(159, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(160, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(161, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(162, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(163, '2018_12_24_154933_create_notifications_table', 1),
(164, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(165, '2019_01_10_124645_add_account_permission', 1),
(166, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(167, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(168, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(169, '2019_02_19_103118_create_discounts_table', 1),
(170, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(171, '2019_02_21_134324_add_permission_for_discount', 1),
(172, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(173, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(174, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(175, '2019_03_12_120336_create_activity_log_table', 1),
(176, '2019_03_15_132925_create_media_table', 1),
(177, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(178, '2019_05_10_132311_add_missing_column_indexing', 1),
(179, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(180, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(181, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(182, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(183, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(184, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(185, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(186, '2019_07_15_165136_add_fields_for_combo_product', 1),
(187, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(188, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(189, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(190, '2019_08_08_162302_add_sub_units_related_fields', 1),
(191, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(192, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(193, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(194, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(195, '2019_09_04_184008_create_types_of_services_table', 1),
(196, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(197, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(198, '2019_09_12_105616_create_product_locations_table', 1),
(199, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(200, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(201, '2019_09_19_170927_close_all_active_registers', 1),
(202, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(203, '2019_10_18_155633_create_account_types_table', 1),
(204, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(205, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(206, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(207, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(208, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(209, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(210, '2019_12_02_105025_create_warranties_table', 1),
(211, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(212, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(213, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(214, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(215, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(216, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(217, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(218, '2020_01_08_133506_create_document_and_notes_table', 1),
(219, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(220, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(221, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(222, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(223, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(224, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(225, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(226, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(227, '2020_04_15_151802_add_user_type_to_users_table', 1),
(228, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(229, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(230, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(231, '2020_06_12_162245_modify_contacts_table', 1),
(232, '2020_06_22_103104_change_recur_interval_default_to_one', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(79, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
CREATE TABLE IF NOT EXISTS `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', NULL, NULL, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', 'Payment Received, from {business_name}', NULL, NULL, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', NULL, NULL, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', NULL, NULL, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', NULL, NULL, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2020-08-03 07:38:42', NULL),
(2, 'direct_sell.access', 'web', '2020-08-03 07:38:42', NULL),
(3, 'product.opening_stock', 'web', '2020-08-03 07:38:45', '2020-08-03 07:38:45'),
(4, 'crud_all_bookings', 'web', '2020-08-03 07:38:46', '2020-08-03 07:38:46'),
(5, 'crud_own_bookings', 'web', '2020-08-03 07:38:46', '2020-08-03 07:38:46'),
(6, 'access_default_selling_price', 'web', '2020-08-03 07:38:47', '2020-08-03 07:38:47'),
(7, 'purchase.payments', 'web', '2020-08-03 07:38:48', '2020-08-03 07:38:48'),
(8, 'sell.payments', 'web', '2020-08-03 07:38:48', '2020-08-03 07:38:48'),
(9, 'edit_product_price_from_sale_screen', 'web', '2020-08-03 07:38:48', '2020-08-03 07:38:48'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2020-08-03 07:38:48', '2020-08-03 07:38:48'),
(11, 'roles.view', 'web', '2020-08-03 07:38:49', '2020-08-03 07:38:49'),
(12, 'roles.create', 'web', '2020-08-03 07:38:49', '2020-08-03 07:38:49'),
(13, 'roles.update', 'web', '2020-08-03 07:38:49', '2020-08-03 07:38:49'),
(14, 'roles.delete', 'web', '2020-08-03 07:38:49', '2020-08-03 07:38:49'),
(15, 'account.access', 'web', '2020-08-03 07:38:50', '2020-08-03 07:38:50'),
(16, 'discount.access', 'web', '2020-08-03 07:38:50', '2020-08-03 07:38:50'),
(17, 'view_purchase_price', 'web', '2020-08-03 07:38:51', '2020-08-03 07:38:51'),
(18, 'view_own_sell_only', 'web', '2020-08-03 07:38:51', '2020-08-03 07:38:51'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2020-08-03 07:38:52', '2020-08-03 07:38:52'),
(20, 'edit_product_price_from_pos_screen', 'web', '2020-08-03 07:38:52', '2020-08-03 07:38:52'),
(21, 'access_shipping', 'web', '2020-08-03 07:38:52', '2020-08-03 07:38:52'),
(22, 'purchase.update_status', 'web', '2020-08-03 07:38:52', '2020-08-03 07:38:52'),
(23, 'list_drafts', 'web', '2020-08-03 07:38:53', '2020-08-03 07:38:53'),
(24, 'list_quotations', 'web', '2020-08-03 07:38:53', '2020-08-03 07:38:53'),
(25, 'user.view', 'web', '2020-08-03 07:38:54', NULL),
(26, 'user.create', 'web', '2020-08-03 07:38:54', NULL),
(27, 'user.update', 'web', '2020-08-03 07:38:54', NULL),
(28, 'user.delete', 'web', '2020-08-03 07:38:54', NULL),
(29, 'supplier.view', 'web', '2020-08-03 07:38:54', NULL),
(30, 'supplier.create', 'web', '2020-08-03 07:38:54', NULL),
(31, 'supplier.update', 'web', '2020-08-03 07:38:54', NULL),
(32, 'supplier.delete', 'web', '2020-08-03 07:38:54', NULL),
(33, 'customer.view', 'web', '2020-08-03 07:38:54', NULL),
(34, 'customer.create', 'web', '2020-08-03 07:38:54', NULL),
(35, 'customer.update', 'web', '2020-08-03 07:38:54', NULL),
(36, 'customer.delete', 'web', '2020-08-03 07:38:54', NULL),
(37, 'product.view', 'web', '2020-08-03 07:38:54', NULL),
(38, 'product.create', 'web', '2020-08-03 07:38:54', NULL),
(39, 'product.update', 'web', '2020-08-03 07:38:54', NULL),
(40, 'product.delete', 'web', '2020-08-03 07:38:54', NULL),
(41, 'purchase.view', 'web', '2020-08-03 07:38:54', NULL),
(42, 'purchase.create', 'web', '2020-08-03 07:38:54', NULL),
(43, 'purchase.update', 'web', '2020-08-03 07:38:54', NULL),
(44, 'purchase.delete', 'web', '2020-08-03 07:38:54', NULL),
(45, 'sell.view', 'web', '2020-08-03 07:38:54', NULL),
(46, 'sell.create', 'web', '2020-08-03 07:38:54', NULL),
(47, 'sell.update', 'web', '2020-08-03 07:38:54', NULL),
(48, 'sell.delete', 'web', '2020-08-03 07:38:54', NULL),
(49, 'purchase_n_sell_report.view', 'web', '2020-08-03 07:38:54', NULL),
(50, 'contacts_report.view', 'web', '2020-08-03 07:38:54', NULL),
(51, 'stock_report.view', 'web', '2020-08-03 07:38:54', NULL),
(52, 'tax_report.view', 'web', '2020-08-03 07:38:54', NULL),
(53, 'trending_product_report.view', 'web', '2020-08-03 07:38:54', NULL),
(54, 'register_report.view', 'web', '2020-08-03 07:38:54', NULL),
(55, 'sales_representative.view', 'web', '2020-08-03 07:38:54', NULL),
(56, 'expense_report.view', 'web', '2020-08-03 07:38:54', NULL),
(57, 'business_settings.access', 'web', '2020-08-03 07:38:54', NULL),
(58, 'barcode_settings.access', 'web', '2020-08-03 07:38:54', NULL),
(59, 'invoice_settings.access', 'web', '2020-08-03 07:38:54', NULL),
(60, 'brand.view', 'web', '2020-08-03 07:38:54', NULL),
(61, 'brand.create', 'web', '2020-08-03 07:38:54', NULL),
(62, 'brand.update', 'web', '2020-08-03 07:38:54', NULL),
(63, 'brand.delete', 'web', '2020-08-03 07:38:54', NULL),
(64, 'tax_rate.view', 'web', '2020-08-03 07:38:54', NULL),
(65, 'tax_rate.create', 'web', '2020-08-03 07:38:54', NULL),
(66, 'tax_rate.update', 'web', '2020-08-03 07:38:54', NULL),
(67, 'tax_rate.delete', 'web', '2020-08-03 07:38:54', NULL),
(68, 'unit.view', 'web', '2020-08-03 07:38:54', NULL),
(69, 'unit.create', 'web', '2020-08-03 07:38:54', NULL),
(70, 'unit.update', 'web', '2020-08-03 07:38:54', NULL),
(71, 'unit.delete', 'web', '2020-08-03 07:38:54', NULL),
(72, 'category.view', 'web', '2020-08-03 07:38:54', NULL),
(73, 'category.create', 'web', '2020-08-03 07:38:54', NULL),
(74, 'category.update', 'web', '2020-08-03 07:38:54', NULL),
(75, 'category.delete', 'web', '2020-08-03 07:38:54', NULL),
(76, 'expense.access', 'web', '2020-08-03 07:38:54', NULL),
(77, 'access_all_locations', 'web', '2020-08-03 07:38:54', NULL),
(78, 'dashboard.data', 'web', '2020-08-03 07:38:54', NULL),
(79, 'location.1', 'web', '2020-08-03 07:57:20', '2020-08-03 07:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
CREATE TABLE IF NOT EXISTS `printers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `printers_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_sub_category_id_foreign` (`sub_category_id`),
  KEY `products_tax_foreign` (`tax`),
  KEY `products_name_index` (`name`),
  KEY `products_business_id_index` (`business_id`),
  KEY `products_unit_id_index` (`unit_id`),
  KEY `products_created_by_index` (`created_by`),
  KEY `products_warranty_id_index` (`warranty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(2, 'OPPO A31', 1, 'variable', 1, NULL, 2, 1, 3, NULL, 'exclusive', 1, '2.0000', '6944284655782', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598237992_OPPO-A31-3.jpg', '<p>OPPO A31</p>', 1, NULL, 0, 0, '2020-08-24 02:59:52', '2020-08-24 03:54:47'),
(3, 'OPPO Reno4', 1, 'variable', 1, NULL, 2, 1, 3, NULL, 'exclusive', 1, '2.0000', 'CPH2113', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598239153_oppo reno4.jpg', '<p>OPPO Reno4</p>', 1, NULL, 0, 0, '2020-08-24 03:15:17', '2020-08-24 03:55:23'),
(4, 'OPPO A12', 1, 'variable', 1, NULL, 2, 1, 3, NULL, 'exclusive', 1, '2.0000', 'CPH2083', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598240058_oppo A12.jpeg', '<p>OPPO A12</p>', 1, NULL, 0, 0, '2020-08-24 03:31:43', '2020-08-24 03:54:05'),
(5, 'OPPO A12s', 1, 'variable', 1, NULL, 2, 1, 3, NULL, 'exclusive', 1, '2.0000', 'CPH2083s', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598240237_oppo a12s.jpg', '<p>OPPO A12s</p>', 1, NULL, 0, 0, '2020-08-24 03:37:17', '2020-08-24 03:54:15'),
(6, 'OPPO Reno2', 1, 'variable', 1, NULL, 2, 1, 3, NULL, 'exclusive', 1, '2.0000', 'CPH1989', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598240810_oppo reno 2.jpg', '<p>OPPO Reno2</p>', 1, NULL, 0, 0, '2020-08-24 03:46:50', '2020-08-24 03:55:14'),
(7, 'OPPO A92', 1, 'variable', 1, NULL, 2, 1, 3, NULL, 'exclusive', 1, '2.0000', 'CPH1937', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598241173_OPPO A92.png', '<p>OPPO A92</p>', 1, NULL, 0, 0, '2020-08-24 03:50:51', '2020-08-24 03:54:59'),
(8, 'OPPO A9', 1, 'variable', 1, NULL, 2, 1, 3, NULL, 'exclusive', 1, '2.0000', 'CPH2059', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598241481_OPPO A9.jfif', '<p>OPPO A9</p>', 1, NULL, 0, 0, '2020-08-24 03:58:01', '2020-08-24 03:58:01'),
(9, 'Galaxy A31', 1, 'variable', 1, NULL, 3, 1, 6, NULL, 'exclusive', 1, '1.0000', 'SM-315G', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598244605_Galaxy A31.jpg', '<p>Galaxy A31</p>', 1, NULL, 0, 0, '2020-08-24 04:47:57', '2020-08-24 04:57:13'),
(10, 'Galaxy A21s', 1, 'variable', 1, NULL, 3, 1, 6, NULL, 'exclusive', 1, '1.0000', 'SM-A217F', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598245005_galaxy A21s.jpg', '<p>Galaxy A21s</p>', 1, NULL, 0, 0, '2020-08-24 04:55:29', '2020-08-24 04:56:45'),
(11, 'Galaxy A51', 1, 'variable', 1, NULL, 3, 1, 6, NULL, 'exclusive', 1, '1.0000', 'SM-A515F', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598245208_Galaxy A51.jpg', '<p>Galaxy A51</p>', 1, NULL, 0, 0, '2020-08-24 05:00:08', '2020-08-24 05:00:08'),
(12, 'Hauwei Y5p', 1, 'variable', 1, NULL, 1, 1, 2, NULL, 'exclusive', 1, '1.0000', 'DRA-Lx9', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598246066_huawei-y5p-kv-v2.jpg', '<p>Hauwei Y5p</p>', 1, NULL, 0, 0, '2020-08-24 05:13:25', '2020-08-24 05:14:26'),
(13, 'Realme C11', 1, 'variable', 1, NULL, 5, 1, 11, NULL, 'exclusive', 1, '1.0000', 'RMX2185', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598246943_realme_c11_lazada_small_1593160697085.webp', '<p>Realme C11</p>', 1, NULL, 0, 0, '2020-08-24 05:29:03', '2020-08-24 05:29:03'),
(14, 'Nava F21', 1, 'variable', 1, NULL, 6, 1, 8, NULL, 'exclusive', 1, '2.0000', 'F21', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598247379_images.jfif', '<p>Nava F21</p>', 1, NULL, 0, 0, '2020-08-24 05:36:19', '2020-08-24 05:37:12'),
(15, 'Nokia105', 1, 'variable', 1, NULL, 7, 1, 5, NULL, 'exclusive', 1, '0.0000', 'TA-1174', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598247608_Nokia-105-2019.webp', '<p>Nokia105</p>', 1, NULL, 0, 0, '2020-08-24 05:40:08', '2020-08-24 05:40:08'),
(16, 'Nokia220', 1, 'variable', 1, NULL, 7, 1, 5, NULL, 'exclusive', 1, '4.0000', 'TA-1155', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598247796_images (1).jfif', '<p>Nokia220</p>', 1, NULL, 0, 0, '2020-08-24 05:43:16', '2020-08-24 05:43:16'),
(17, 'Nokia110', 1, 'variable', 1, NULL, 7, 1, 5, NULL, 'exclusive', 1, '2.0000', 'TA-1192', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598248062_nokia-110-2019-699x800-1567695009.webp', '<p>Nokia110</p>', 1, NULL, 0, 0, '2020-08-24 05:47:42', '2020-08-24 05:47:42'),
(18, 'Nokia106', 1, 'variable', 1, NULL, 7, 1, 5, NULL, 'exclusive', 1, '0.0000', 'TA-1114', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598248222_download.jfif', '<p>Nokia106</p>', 1, NULL, 0, 0, '2020-08-24 05:50:22', '2020-08-24 05:50:22'),
(19, 'Nokia210', 1, 'variable', 1, NULL, 7, 1, 5, NULL, 'exclusive', 1, '2.0000', 'TA-1139', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598248385_download (1).jfif', '<p>Nokia210</p>', 1, NULL, 0, 0, '2020-08-24 05:53:05', '2020-08-24 05:53:38'),
(20, 'Vivo Y30', 1, 'variable', 1, NULL, 4, 1, 4, NULL, 'exclusive', 1, '2.0000', 'VV1938', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598248653_vivo Y30.jpg', '<p>Vivo Y30</p>', 1, NULL, 0, 0, '2020-08-24 05:57:33', '2020-08-24 05:57:33'),
(21, 'Vivo Y1s', 1, 'variable', 1, NULL, 4, 1, 4, NULL, 'exclusive', 1, '2.0000', 'VV2015', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598248796_download (3).jfif', '<p>Vivo Y1s</p>', 1, NULL, 0, 0, '2020-08-24 05:59:56', '2020-08-24 05:59:56'),
(22, 'Vivo V11', 1, 'variable', 1, NULL, 4, 1, 4, NULL, 'exclusive', 1, '2.0000', 'VV1906', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598249040_download (4).jfif', '<p>Vivo V11</p>', 1, NULL, 0, 0, '2020-08-24 06:04:00', '2020-08-24 06:04:00'),
(24, 'Naviforce', 1, 'variable', 1, NULL, 8, 9, 13, NULL, 'exclusive', 1, '1.0000', '9181', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598251844_images (3).jfif', '<p>Naviforce</p>', 1, NULL, 0, 0, '2020-08-24 06:50:44', '2020-08-24 07:31:52'),
(25, 'Naviforce', 1, 'variable', 1, NULL, 8, 9, 13, NULL, 'exclusive', 1, '1.0000', '9175', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598253499_images (2).jfif', '<p>Naviforce</p>', 1, NULL, 0, 0, '2020-08-24 07:18:19', '2020-08-24 07:32:09'),
(26, 'Naviforce', 1, 'variable', 1, NULL, 8, 9, 13, NULL, 'exclusive', 1, '1.0000', '9117', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598255453_download (7).jfif', '<p>Naviforce</p>', 1, NULL, 0, 0, '2020-08-24 07:31:04', '2020-08-24 07:50:53'),
(27, 'Naviforce', 1, 'variable', 1, NULL, 8, 9, 13, NULL, 'exclusive', 1, '1.0000', '9170', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598255514_images (5).jfif', '<p>Naviforce</p>', 1, NULL, 0, 0, '2020-08-24 07:33:32', '2020-08-24 07:51:54'),
(28, 'Naviforce', 1, 'variable', 1, NULL, 8, 9, 13, NULL, 'exclusive', 1, '1.0000', '9161', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598255324_download (5).jfif', '<p>Naviforce</p>', 1, NULL, 0, 0, '2020-08-24 07:34:59', '2020-08-24 07:48:44'),
(29, 'Naviforce', 1, 'variable', 1, NULL, 8, 9, 13, NULL, 'exclusive', 1, '1.0000', '9171', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598255368_images (4).jfif', '<p>Naviforce</p>', 1, NULL, 0, 0, '2020-08-24 07:36:54', '2020-08-24 07:49:28'),
(30, 'Naviforce', 1, 'variable', 1, NULL, 8, 9, 13, NULL, 'exclusive', 1, '1.0000', '9182', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598255413_download (6).jfif', '<p>Naviforce</p>', 1, NULL, 0, 0, '2020-08-24 07:39:26', '2020-08-24 07:50:13'),
(31, 'Naviforce', 1, 'variable', 1, NULL, 8, 9, 13, NULL, 'exclusive', 1, '1.0000', '9172', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598255599_download (8).jfif', '<p>Naviforce</p>', 1, NULL, 0, 0, '2020-08-24 07:53:19', '2020-08-24 07:53:19'),
(32, 'MK Mike', 1, 'variable', 1, NULL, 9, 9, 14, NULL, 'exclusive', 1, '1.0000', '8887M', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598324740_images (1).jfif', '<p>MK Mike</p>', 1, NULL, 0, 0, '2020-08-25 03:05:40', '2020-08-25 03:14:10'),
(33, 'MK Mike', 1, 'variable', 1, NULL, 9, 9, 14, NULL, 'exclusive', 1, '1.0000', '8871m', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598325005_download.jfif', '<p>MK Mike</p>', 1, NULL, 0, 0, '2020-08-25 03:10:05', '2020-08-25 03:13:45'),
(34, 'MK Mike', 1, 'variable', 1, NULL, 9, 9, 14, NULL, 'exclusive', 1, '1.0000', '8837M', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598325136_download (9).jfif', '<p>MK Mike</p>', 1, NULL, 0, 0, '2020-08-25 03:12:16', '2020-08-25 03:12:16'),
(35, 'MK Mike', 1, 'variable', 1, NULL, 9, 9, 14, NULL, 'exclusive', 1, '1.0000', '8877M', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598325360_download (10).jfif', '<p>MK Mike</p>', 1, NULL, 0, 0, '2020-08-25 03:16:00', '2020-08-25 03:16:00'),
(36, 'Realme', 1, 'variable', 1, NULL, 5, 9, 15, NULL, 'exclusive', 1, '1.0000', 'RMA161', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598325536_download (11).jfif', '<p>Realme</p>', 1, NULL, 0, 0, '2020-08-25 03:18:56', '2020-08-25 03:44:15'),
(37, 'SKMEI', 1, 'variable', 1, NULL, 10, 9, 16, NULL, 'exclusive', 1, '1.0000', '2430', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598325708_download (12).jfif', '<p>SKMEI</p>', 1, NULL, 0, 0, '2020-08-25 03:21:48', '2020-08-25 03:21:48'),
(38, 'HUBLOT', 1, 'variable', 1, NULL, 11, 9, 17, NULL, 'exclusive', 1, '1.0000', '1793', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598325835_download (13).jfif', '<p>HUBLOT</p>', 1, NULL, 0, 0, '2020-08-25 03:23:55', '2020-08-25 03:23:55'),
(39, 'EURA', 1, 'variable', 1, NULL, 12, 9, 18, NULL, 'exclusive', 1, '1.0000', '2166', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598325985_download (14).jfif', '<p>EURA</p>', 1, NULL, 0, 0, '2020-08-25 03:26:25', '2020-08-25 03:26:25'),
(40, 'OVERFLY', 1, 'variable', 1, NULL, 13, 9, 19, NULL, 'exclusive', 1, '1.0000', '3139', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598326188_images (6).jfif', '<p>OVERFLY</p>', 1, NULL, 0, 0, '2020-08-25 03:29:48', '2020-08-25 03:33:17'),
(41, 'OVERFLY', 1, 'variable', 1, NULL, 13, 9, 19, NULL, 'exclusive', 1, '1.0000', '3159', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598326375_download (15).jfif', '<p>OVERFLY</p>', 1, NULL, 0, 0, '2020-08-25 03:32:55', '2020-08-25 03:32:55'),
(42, 'OVERFLY', 1, 'variable', 1, NULL, 13, 9, 19, NULL, 'exclusive', 1, '0.0000', '3101', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598326531_images (7).jfif', '<p>OVERFLY</p>', 1, NULL, 0, 0, '2020-08-25 03:35:31', '2020-08-25 03:35:31'),
(43, 'WM-220MS-BU', 1, 'single', 1, NULL, 14, 20, NULL, NULL, 'exclusive', 1, '2.0000', 'WMBIG', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598332261_images (8).jfif', '<p>WM-220MS-BU</p>', 1, NULL, 0, 0, '2020-08-25 05:11:01', '2020-08-25 05:13:23'),
(44, 'WM-220MS-BU', 1, 'single', 1, NULL, 14, 20, NULL, NULL, 'exclusive', 1, '2.0000', 'WMSMALL', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598332370_download (16).jfif', '<p>WM-220MS-BU</p>', 1, NULL, 0, 0, '2020-08-25 05:12:50', '2020-08-25 05:12:50'),
(45, 'LC-403TV', 1, 'single', 1, NULL, 14, 20, NULL, NULL, 'exclusive', 1, '2.0000', 'LC403', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598332521_download (17).jfif', '<p>LC-403TV</p>', 1, NULL, 0, 0, '2020-08-25 05:15:21', '2020-08-25 05:15:21'),
(46, 'MJ-12VCB', 1, 'variable', 1, NULL, 14, 20, NULL, NULL, 'exclusive', 1, '2.0000', 'MJ-12VCB', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598332801_download (18).jfif', '<p>MJ-12VCB</p>', 1, NULL, 0, 0, '2020-08-25 05:20:01', '2020-08-25 05:20:01'),
(47, 'TRULY', 1, 'single', 1, NULL, 15, 20, NULL, NULL, 'exclusive', 1, '2.0000', '837-12', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598333101_images (9).jfif', '<p>TRULY&nbsp;</p>', 1, NULL, 0, 0, '2020-08-25 05:25:01', '2020-08-25 05:25:01'),
(48, 'DJ-220 PLUS', 1, 'single', 1, NULL, 14, 20, NULL, NULL, 'exclusive', 1, '2.0000', 'DJ220', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598333218_download (19).jfif', '<p>DJ-220 PLUS</p>', 1, NULL, 0, 0, '2020-08-25 05:26:58', '2020-08-25 05:26:58'),
(49, 'DJ-120DPLUS', 1, 'single', 1, NULL, 14, 20, NULL, NULL, 'exclusive', 1, '2.0000', 'DJ120', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598333361_download (20).jfif', '<p>DJ-120DPLUS</p>', 1, NULL, 0, 0, '2020-08-25 05:29:21', '2020-08-25 05:29:21'),
(50, 'CX-77BN', 1, 'single', 1, NULL, 14, 20, NULL, NULL, 'exclusive', 1, '2.0000', 'CXCASIO', 'C39', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, '1598333463_images (10).jfif', '<p>CX-77BN</p>', 1, NULL, 0, 0, '2020-08-25 05:31:03', '2020-08-25 13:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

DROP TABLE IF EXISTS `product_locations`;
CREATE TABLE IF NOT EXISTS `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  KEY `product_locations_product_id_index` (`product_id`),
  KEY `product_locations_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

DROP TABLE IF EXISTS `product_racks`;
CREATE TABLE IF NOT EXISTS `product_racks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_racks`
--

INSERT INTO `product_racks` (`id`, `business_id`, `location_id`, `product_id`, `rack`, `row`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, NULL, NULL, '2020-08-24 02:49:45', '2020-08-24 02:49:45'),
(2, 1, 1, 2, NULL, NULL, NULL, '2020-08-24 02:59:52', '2020-08-24 03:54:47'),
(3, 1, 1, 3, NULL, NULL, NULL, '2020-08-24 03:15:17', '2020-08-24 03:55:23'),
(4, 1, 1, 4, NULL, NULL, NULL, '2020-08-24 03:31:43', '2020-08-24 03:54:05'),
(5, 1, 1, 5, NULL, NULL, NULL, '2020-08-24 03:37:17', '2020-08-24 03:54:15'),
(6, 1, 1, 6, NULL, NULL, NULL, '2020-08-24 03:46:50', '2020-08-24 03:55:14'),
(7, 1, 1, 7, NULL, NULL, NULL, '2020-08-24 03:50:51', '2020-08-24 03:54:59'),
(8, 1, 1, 8, NULL, NULL, NULL, '2020-08-24 03:58:01', '2020-08-24 03:58:01'),
(9, 1, 1, 9, NULL, NULL, NULL, '2020-08-24 04:47:57', '2020-08-24 04:57:13'),
(10, 1, 1, 10, NULL, NULL, NULL, '2020-08-24 04:55:29', '2020-08-24 04:56:45'),
(11, 1, 1, 11, NULL, NULL, NULL, '2020-08-24 05:00:08', '2020-08-24 05:00:08'),
(12, 1, 1, 12, NULL, NULL, NULL, '2020-08-24 05:13:25', '2020-08-24 05:14:26'),
(13, 1, 1, 13, NULL, NULL, NULL, '2020-08-24 05:29:03', '2020-08-24 05:29:03'),
(14, 1, 1, 14, NULL, NULL, NULL, '2020-08-24 05:36:19', '2020-08-24 05:37:12'),
(15, 1, 1, 15, NULL, NULL, NULL, '2020-08-24 05:40:08', '2020-08-24 05:40:08'),
(16, 1, 1, 16, NULL, NULL, NULL, '2020-08-24 05:43:16', '2020-08-24 05:43:16'),
(17, 1, 1, 17, NULL, NULL, NULL, '2020-08-24 05:47:42', '2020-08-24 05:47:42'),
(18, 1, 1, 18, NULL, NULL, NULL, '2020-08-24 05:50:22', '2020-08-24 05:50:22'),
(19, 1, 1, 19, NULL, NULL, NULL, '2020-08-24 05:53:06', '2020-08-24 05:53:38'),
(20, 1, 1, 20, NULL, NULL, NULL, '2020-08-24 05:57:33', '2020-08-24 05:57:33'),
(21, 1, 1, 21, NULL, NULL, NULL, '2020-08-24 05:59:56', '2020-08-24 05:59:56'),
(22, 1, 1, 22, NULL, NULL, NULL, '2020-08-24 06:04:00', '2020-08-24 06:04:00'),
(23, 1, 1, 23, NULL, NULL, NULL, '2020-08-24 06:40:32', '2020-08-24 06:40:32'),
(24, 1, 1, 24, NULL, NULL, NULL, '2020-08-24 06:50:44', '2020-08-24 07:31:52'),
(25, 1, 1, 25, NULL, NULL, NULL, '2020-08-24 07:18:19', '2020-08-24 07:32:09'),
(26, 1, 1, 26, NULL, NULL, NULL, '2020-08-24 07:31:04', '2020-08-24 07:50:53'),
(27, 1, 1, 27, NULL, NULL, NULL, '2020-08-24 07:33:32', '2020-08-24 07:51:54'),
(28, 1, 1, 28, NULL, NULL, NULL, '2020-08-24 07:34:59', '2020-08-24 07:48:44'),
(29, 1, 1, 29, NULL, NULL, NULL, '2020-08-24 07:36:54', '2020-08-24 07:49:28'),
(30, 1, 1, 30, NULL, NULL, NULL, '2020-08-24 07:39:26', '2020-08-24 07:50:13'),
(31, 1, 1, 31, NULL, NULL, NULL, '2020-08-24 07:53:19', '2020-08-24 07:53:19'),
(32, 1, 1, 32, NULL, NULL, NULL, '2020-08-25 03:05:40', '2020-08-25 03:14:11'),
(33, 1, 1, 33, NULL, NULL, NULL, '2020-08-25 03:10:05', '2020-08-25 03:13:45'),
(34, 1, 1, 34, NULL, NULL, NULL, '2020-08-25 03:12:16', '2020-08-25 03:12:16'),
(35, 1, 1, 35, NULL, NULL, NULL, '2020-08-25 03:16:00', '2020-08-25 03:16:00'),
(36, 1, 1, 36, NULL, NULL, NULL, '2020-08-25 03:18:56', '2020-08-25 03:44:15'),
(37, 1, 1, 37, NULL, NULL, NULL, '2020-08-25 03:21:48', '2020-08-25 03:21:48'),
(38, 1, 1, 38, NULL, NULL, NULL, '2020-08-25 03:23:55', '2020-08-25 03:23:55'),
(39, 1, 1, 39, NULL, NULL, NULL, '2020-08-25 03:26:25', '2020-08-25 03:26:25'),
(40, 1, 1, 40, NULL, NULL, NULL, '2020-08-25 03:29:48', '2020-08-25 03:33:17'),
(41, 1, 1, 41, NULL, NULL, NULL, '2020-08-25 03:32:55', '2020-08-25 03:32:55'),
(42, 1, 1, 42, NULL, NULL, NULL, '2020-08-25 03:35:31', '2020-08-25 03:35:31'),
(43, 1, 1, 43, NULL, NULL, NULL, '2020-08-25 05:11:01', '2020-08-25 05:13:23'),
(44, 1, 1, 44, NULL, NULL, NULL, '2020-08-25 05:12:50', '2020-08-25 05:12:50'),
(45, 1, 1, 45, NULL, NULL, NULL, '2020-08-25 05:15:21', '2020-08-25 05:15:21'),
(46, 1, 1, 46, NULL, NULL, NULL, '2020-08-25 05:20:01', '2020-08-25 05:20:01'),
(47, 1, 1, 47, NULL, NULL, NULL, '2020-08-25 05:25:01', '2020-08-25 05:25:01'),
(48, 1, 1, 48, NULL, NULL, NULL, '2020-08-25 05:26:58', '2020-08-25 05:26:58'),
(49, 1, 1, 49, NULL, NULL, NULL, '2020-08-25 05:29:21', '2020-08-25 05:29:21'),
(50, 1, 1, 50, NULL, NULL, NULL, '2020-08-25 05:31:03', '2020-08-25 13:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
CREATE TABLE IF NOT EXISTS `product_variations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variations_name_index` (`name`),
  KEY `product_variations_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(2, 1, 'Black', 2, 0, '2020-08-24 02:59:52', '2020-08-24 02:59:52'),
(3, 2, 'Green', 2, 0, '2020-08-24 02:59:52', '2020-08-24 02:59:52'),
(4, 3, 'White', 2, 0, '2020-08-24 02:59:52', '2020-08-24 02:59:52'),
(5, 1, 'Black', 3, 0, '2020-08-24 03:15:17', '2020-08-24 03:15:17'),
(6, 7, 'Blue', 3, 0, '2020-08-24 03:15:17', '2020-08-24 03:15:17'),
(7, 7, 'Blue', 4, 0, '2020-08-24 03:31:43', '2020-08-24 03:31:43'),
(8, 1, 'Black', 4, 0, '2020-08-24 03:31:43', '2020-08-24 03:31:43'),
(9, 7, 'Blue', 5, 0, '2020-08-24 03:37:17', '2020-08-24 03:37:17'),
(10, 8, 'Sliver', 5, 0, '2020-08-24 03:37:17', '2020-08-24 03:37:17'),
(11, 2, 'Green', 6, 0, '2020-08-24 03:46:50', '2020-08-24 03:46:50'),
(12, 3, 'White', 6, 0, '2020-08-24 03:46:50', '2020-08-24 03:46:50'),
(13, 3, 'White', 7, 0, '2020-08-24 03:50:51', '2020-08-24 03:50:51'),
(14, 2, 'Green', 8, 0, '2020-08-24 03:58:01', '2020-08-24 03:58:01'),
(15, 3, 'White', 9, 0, '2020-08-24 04:47:57', '2020-08-24 04:47:57'),
(16, 1, 'Black', 10, 0, '2020-08-24 04:55:29', '2020-08-24 04:55:29'),
(17, 3, 'White', 11, 0, '2020-08-24 05:00:08', '2020-08-24 05:00:08'),
(18, 1, 'Black', 12, 0, '2020-08-24 05:13:25', '2020-08-24 05:13:25'),
(19, 12, 'Gray', 13, 0, '2020-08-24 05:29:03', '2020-08-24 05:29:03'),
(20, 2, 'Green', 13, 0, '2020-08-24 05:29:03', '2020-08-24 05:29:03'),
(21, 1, 'Black', 14, 0, '2020-08-24 05:36:19', '2020-08-24 05:36:19'),
(22, 1, 'Black', 15, 0, '2020-08-24 05:40:08', '2020-08-24 05:40:08'),
(23, 7, 'Blue', 15, 0, '2020-08-24 05:40:08', '2020-08-24 05:40:08'),
(24, 9, 'Pink', 15, 0, '2020-08-24 05:40:08', '2020-08-24 05:40:08'),
(25, 1, 'Black', 16, 0, '2020-08-24 05:43:16', '2020-08-24 05:43:16'),
(26, 7, 'Blue', 16, 0, '2020-08-24 05:43:16', '2020-08-24 05:43:16'),
(27, 1, 'Black', 17, 0, '2020-08-24 05:47:42', '2020-08-24 05:47:42'),
(28, 9, 'Pink', 17, 0, '2020-08-24 05:47:42', '2020-08-24 05:47:42'),
(29, 12, 'Gray', 18, 0, '2020-08-24 05:50:22', '2020-08-24 05:50:22'),
(30, 1, 'Black', 19, 0, '2020-08-24 05:53:06', '2020-08-24 05:53:06'),
(31, 3, 'White', 20, 0, '2020-08-24 05:57:33', '2020-08-24 05:57:33'),
(32, 1, 'Black', 21, 0, '2020-08-24 05:59:56', '2020-08-24 05:59:56'),
(33, 7, 'Blue', 21, 0, '2020-08-24 05:59:56', '2020-08-24 05:59:56'),
(34, 7, 'Blue', 22, 0, '2020-08-24 06:04:00', '2020-08-24 06:04:00'),
(35, 13, 'Red', 22, 0, '2020-08-24 06:04:00', '2020-08-24 06:04:00'),
(39, 14, 'ពណ៌មាស', 24, 0, '2020-08-24 06:50:44', '2020-08-24 06:50:44'),
(40, 17, 'ពណ៌ស', 24, 0, '2020-08-24 06:50:44', '2020-08-24 06:50:44'),
(41, 19, 'ពណ៌មាសលាយទឹកប៊ិច', 24, 0, '2020-08-24 06:50:44', '2020-08-24 06:50:44'),
(42, 14, 'ពណ៌មាស', 25, 0, '2020-08-24 07:18:19', '2020-08-24 07:18:19'),
(43, 16, 'ពណ៌ខ្មៅខ្សែស្បែក', 25, 0, '2020-08-24 07:18:19', '2020-08-24 07:18:19'),
(44, 15, 'ពណ៌កាហ្វេ', 25, 0, '2020-08-24 07:18:19', '2020-08-24 07:18:19'),
(45, 14, 'ពណ៌មាស', 26, 0, '2020-08-24 07:31:04', '2020-08-24 07:31:04'),
(46, 18, 'ពណ៌ខ្មៅ', 26, 0, '2020-08-24 07:31:04', '2020-08-24 07:31:04'),
(47, 14, 'ពណ៌មាស', 27, 0, '2020-08-24 07:33:32', '2020-08-24 07:33:32'),
(48, 18, 'ពណ៌ខ្មៅ', 27, 0, '2020-08-24 07:33:32', '2020-08-24 07:33:32'),
(49, 14, 'ពណ៌មាស', 28, 0, '2020-08-24 07:34:59', '2020-08-24 07:34:59'),
(50, 17, 'ពណ៌ស', 28, 0, '2020-08-24 07:34:59', '2020-08-24 07:34:59'),
(51, 17, 'ពណ៌ស', 29, 0, '2020-08-24 07:36:54', '2020-08-24 07:36:54'),
(52, 21, 'ពណ៌សលាយទឹកប៊ិច', 29, 0, '2020-08-24 07:36:54', '2020-08-24 07:36:54'),
(53, 20, 'ពណ៌មាសលាយខ្មៅ', 30, 0, '2020-08-24 07:39:26', '2020-08-24 07:39:26'),
(54, 17, 'ពណ៌ស', 30, 0, '2020-08-24 07:39:26', '2020-08-24 07:39:26'),
(55, 23, 'ពណ៌ខ្មៅលាយកាហ្វេ', 31, 0, '2020-08-24 07:53:19', '2020-08-24 07:53:19'),
(56, 27, 'ពណ៌ទឹកប៊ិច', 31, 0, '2020-08-24 07:53:19', '2020-08-24 07:53:19'),
(57, 25, 'ពណ៌ទឹកប្រាក់', 32, 0, '2020-08-25 03:05:40', '2020-08-25 03:05:40'),
(58, 26, 'ពណ៌ទឹកប្រាក់លាយមាស', 32, 0, '2020-08-25 03:05:40', '2020-08-25 03:05:40'),
(59, 14, 'ពណ៌មាស', 33, 0, '2020-08-25 03:10:05', '2020-08-25 03:10:05'),
(60, 25, 'ពណ៌ទឹកប្រាក់', 33, 0, '2020-08-25 03:10:05', '2020-08-25 03:10:05'),
(61, 18, 'ពណ៌ខ្មៅ', 34, 0, '2020-08-25 03:12:16', '2020-08-25 03:12:16'),
(63, 18, 'ពណ៌ខ្មៅ', 33, 0, '2020-08-25 03:13:45', '2020-08-25 03:13:45'),
(64, 18, 'ពណ៌ខ្មៅ', 35, 0, '2020-08-25 03:16:00', '2020-08-25 03:16:00'),
(65, 18, 'ពណ៌ខ្មៅ', 36, 0, '2020-08-25 03:18:56', '2020-08-25 03:18:56'),
(66, 14, 'ពណ៌មាស', 37, 0, '2020-08-25 03:21:48', '2020-08-25 03:21:48'),
(67, 27, 'ពណ៌ទឹកប៊ិច', 38, 0, '2020-08-25 03:23:55', '2020-08-25 03:23:55'),
(68, 22, 'ពណ៌ភ្លាកទីន', 39, 0, '2020-08-25 03:26:25', '2020-08-25 03:26:25'),
(69, 17, 'ពណ៌ស', 39, 0, '2020-08-25 03:26:25', '2020-08-25 03:26:25'),
(70, 18, 'ពណ៌ខ្មៅ', 39, 0, '2020-08-25 03:26:25', '2020-08-25 03:26:25'),
(71, 14, 'ពណ៌មាស', 39, 0, '2020-08-25 03:26:25', '2020-08-25 03:26:25'),
(72, 24, 'ពណ៌ប្រផេះ', 40, 0, '2020-08-25 03:29:48', '2020-08-25 03:29:48'),
(73, 18, 'ពណ៌ខ្មៅ', 41, 0, '2020-08-25 03:32:55', '2020-08-25 03:32:55'),
(74, 18, 'ពណ៌ខ្មៅ', 42, 0, '2020-08-25 03:35:31', '2020-08-25 03:35:31'),
(75, NULL, 'DUMMY', 43, 1, '2020-08-25 05:11:01', '2020-08-25 05:11:01'),
(76, NULL, 'DUMMY', 44, 1, '2020-08-25 05:12:50', '2020-08-25 05:12:50'),
(77, NULL, 'DUMMY', 45, 1, '2020-08-25 05:15:21', '2020-08-25 05:15:21'),
(78, 37, 'ពណ៌ទឹកក្រូច', 46, 0, '2020-08-25 05:20:01', '2020-08-25 05:20:01'),
(79, 31, 'ពណ៌បៃតង', 46, 0, '2020-08-25 05:20:01', '2020-08-25 05:20:01'),
(80, 28, 'ពណ៌ផ្កាឈូកដិត', 46, 0, '2020-08-25 05:20:01', '2020-08-25 05:20:01'),
(81, NULL, 'DUMMY', 47, 1, '2020-08-25 05:25:01', '2020-08-25 05:25:01'),
(82, NULL, 'DUMMY', 48, 1, '2020-08-25 05:26:58', '2020-08-25 05:26:58'),
(83, NULL, 'DUMMY', 49, 1, '2020-08-25 05:29:21', '2020-08-25 05:29:21'),
(84, NULL, 'DUMMY', 50, 1, '2020-08-25 05:31:03', '2020-08-25 05:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

DROP TABLE IF EXISTS `purchase_lines`;
CREATE TABLE IF NOT EXISTS `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  KEY `purchase_lines_product_id_foreign` (`product_id`),
  KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  KEY `purchase_lines_lot_number_index` (`lot_number`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(2, 3, 2, 2, '5.0000', '157.0000', '0.00', '157.0000', '157.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:01:36', '2020-08-24 03:01:36'),
(3, 3, 2, 3, '3.0000', '157.0000', '0.00', '157.0000', '157.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:01:36', '2020-08-24 03:01:36'),
(4, 3, 2, 4, '1.0000', '157.0000', '0.00', '157.0000', '157.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:01:36', '2020-08-24 03:01:36'),
(5, 4, 3, 5, '5.0000', '324.0000', '0.00', '324.0000', '324.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:15:55', '2020-08-24 03:15:55'),
(6, 4, 3, 6, '1.0000', '324.0000', '0.00', '324.0000', '324.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:15:55', '2020-08-24 03:15:55'),
(7, 5, 5, 9, '3.0000', '115.0000', '0.00', '115.0000', '115.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:37:43', '2020-08-24 03:37:43'),
(8, 5, 5, 10, '9.0000', '115.0000', '0.00', '115.0000', '115.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:37:43', '2020-08-24 03:37:43'),
(9, 6, 4, 7, '3.0000', '115.0000', '0.00', '115.0000', '115.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:38:05', '2020-08-24 03:38:05'),
(10, 6, 4, 8, '7.0000', '115.0000', '0.00', '115.0000', '115.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:38:05', '2020-08-24 03:38:05'),
(11, 7, 6, 11, '2.0000', '271.0000', '0.00', '271.0000', '271.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:47:16', '2020-08-24 03:47:16'),
(12, 7, 6, 12, '1.0000', '271.0000', '0.00', '271.0000', '271.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:47:16', '2020-08-24 03:47:16'),
(13, 8, 7, 13, '2.0000', '243.0000', '0.00', '243.0000', '243.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:53:09', '2020-08-24 03:53:09'),
(14, 9, 8, 14, '2.0000', '202.0000', '0.00', '202.0000', '202.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 03:58:17', '2020-08-24 03:58:17'),
(15, 10, 9, 15, '1.0000', '269.0000', '0.00', '269.0000', '269.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 04:48:12', '2020-08-24 04:48:29'),
(16, 11, 10, 16, '1.0000', '207.0000', '0.00', '207.0000', '207.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 04:55:47', '2020-08-25 10:02:50'),
(17, 12, 11, 17, '1.0000', '314.0000', '0.00', '314.0000', '314.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:00:27', '2020-08-24 05:00:27'),
(18, 13, 12, 18, '1.0000', '89.0000', '0.00', '89.0000', '89.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:13:39', '2020-08-25 10:02:59'),
(19, 14, 13, 19, '4.0000', '107.0000', '0.00', '107.0000', '107.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:29:52', '2020-08-24 05:29:52'),
(20, 14, 13, 20, '1.0000', '107.0000', '0.00', '107.0000', '107.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:29:52', '2020-08-24 05:29:52'),
(21, 15, 14, 21, '3.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:36:41', '2020-08-24 05:36:41'),
(22, 16, 15, 22, '1.0000', '16.3000', '0.00', '16.3000', '16.3000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:40:25', '2020-08-24 05:40:25'),
(23, 16, 15, 23, '1.0000', '16.3000', '0.00', '16.3000', '16.3000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:40:25', '2020-08-24 05:40:25'),
(24, 16, 15, 24, '7.0000', '16.3000', '0.00', '16.3000', '16.3000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:40:25', '2020-08-24 05:40:25'),
(25, 17, 16, 25, '3.0000', '29.3000', '0.00', '29.3000', '29.3000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:43:36', '2020-08-24 05:43:36'),
(26, 17, 16, 26, '4.0000', '29.3000', '0.00', '29.3000', '29.3000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:43:36', '2020-08-24 05:43:36'),
(27, 18, 17, 27, '3.0000', '20.6000', '0.00', '20.6000', '20.6000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:48:08', '2020-08-24 05:48:08'),
(28, 18, 17, 28, '1.0000', '20.6000', '0.00', '20.6000', '20.6000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:48:08', '2020-08-24 05:48:08'),
(29, 19, 18, 29, '6.0000', '16.3000', '0.00', '16.3000', '16.3000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:50:41', '2020-08-24 05:50:41'),
(30, 20, 19, 30, '1.0000', '29.3000', '0.00', '29.3000', '29.3000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:53:55', '2020-08-24 05:53:55'),
(31, 21, 20, 31, '2.0000', '148.0000', '0.00', '148.0000', '148.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 05:57:48', '2020-08-24 05:57:48'),
(32, 22, 21, 32, '1.0000', '97.0000', '0.00', '97.0000', '97.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 06:00:09', '2020-08-24 06:00:09'),
(33, 22, 21, 33, '1.0000', '97.0000', '0.00', '97.0000', '97.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 06:00:09', '2020-08-24 06:00:09'),
(34, 23, 22, 34, '1.0000', '123.0000', '0.00', '123.0000', '123.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 06:04:24', '2020-08-24 06:04:24'),
(35, 23, 22, 35, '1.0000', '123.0000', '0.00', '123.0000', '123.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 06:04:24', '2020-08-24 06:04:24'),
(39, 25, 24, 39, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 06:51:13', '2020-08-24 06:51:13'),
(40, 25, 24, 40, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 06:51:13', '2020-08-24 06:51:13'),
(41, 25, 24, 41, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 06:51:13', '2020-08-24 06:51:13'),
(42, 26, 25, 42, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:18:46', '2020-08-25 10:02:59'),
(43, 26, 25, 43, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:18:46', '2020-08-24 07:18:46'),
(44, 26, 25, 44, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:18:46', '2020-08-24 07:18:46'),
(45, 27, 26, 45, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:33:56', '2020-08-24 07:33:56'),
(46, 27, 26, 46, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:33:56', '2020-08-24 07:33:56'),
(47, 28, 27, 47, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:34:05', '2020-08-24 07:34:05'),
(48, 28, 27, 48, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:34:05', '2020-08-24 07:34:05'),
(49, 29, 28, 49, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:35:41', '2020-08-24 07:35:41'),
(50, 29, 28, 50, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:35:41', '2020-08-24 07:35:41'),
(51, 30, 29, 51, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:37:57', '2020-08-24 07:37:57'),
(52, 30, 29, 52, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:37:57', '2020-08-24 07:37:57'),
(53, 31, 30, 53, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:39:38', '2020-08-24 07:39:38'),
(54, 31, 30, 54, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:39:38', '2020-08-24 07:39:38'),
(55, 32, 31, 55, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:54:08', '2020-08-24 07:54:08'),
(56, 32, 31, 56, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-24 07:54:08', '2020-08-24 07:54:08'),
(57, 33, 32, 57, '3.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:07:04', '2020-08-25 10:02:59'),
(58, 33, 32, 58, '4.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:07:04', '2020-08-25 03:07:04'),
(59, 34, 33, 59, '4.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:10:25', '2020-08-25 03:13:57'),
(60, 34, 33, 60, '2.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:10:25', '2020-08-25 03:13:57'),
(61, 35, 34, 61, '1.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:12:26', '2020-08-25 03:12:26'),
(62, 34, 33, 63, '1.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:13:57', '2020-08-25 03:13:57'),
(63, 36, 36, 65, '4.0000', '43.0000', '0.00', '43.0000', '43.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:19:18', '2020-08-25 03:45:16'),
(64, 37, 37, 66, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:22:15', '2020-08-25 03:22:15'),
(65, 38, 38, 67, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:24:08', '2020-08-25 03:24:08'),
(66, 39, 39, 68, '1.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(67, 39, 39, 69, '1.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(68, 39, 39, 70, '1.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(69, 39, 39, 71, '1.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(70, 40, 40, 72, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:30:19', '2020-08-25 03:30:19'),
(71, 41, 41, 73, '3.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:33:33', '2020-08-25 03:35:55'),
(72, 42, 42, 74, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 03:35:48', '2020-08-25 03:35:48'),
(73, 46, 43, 75, '2.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:11:31', '2020-08-25 05:11:31'),
(74, 47, 44, 76, '13.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:13:05', '2020-08-25 05:13:05'),
(75, 48, 45, 77, '26.0000', '2.8000', '0.00', '2.8000', '2.8000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:15:40', '2020-08-25 05:15:40'),
(76, 49, 46, 78, '2.0000', '6.0000', '0.00', '6.0000', '6.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:20:31', '2020-08-25 05:20:31'),
(77, 49, 46, 79, '2.0000', '6.0000', '0.00', '6.0000', '6.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:20:31', '2020-08-25 05:20:31'),
(78, 49, 46, 80, '1.0000', '6.0000', '0.00', '6.0000', '6.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:20:31', '2020-08-25 05:20:31'),
(79, 50, 47, 81, '5.0000', '6.0000', '0.00', '6.0000', '6.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:25:24', '2020-08-25 05:25:24'),
(80, 51, 48, 82, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:27:24', '2020-08-25 05:27:24'),
(81, 52, 49, 83, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:29:43', '2020-08-25 05:29:43'),
(82, 53, 50, 84, '1.0000', '5.0000', '0.00', '5.0000', '5.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2020-08-25 05:31:26', '2020-08-25 14:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

DROP TABLE IF EXISTS `reference_counts`;
CREATE TABLE IF NOT EXISTS `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 4, 1, '2020-08-03 07:57:20', '2020-08-03 15:41:19'),
(2, 'business_location', 1, 1, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(3, 'expense', 1, 1, '2020-08-03 16:34:08', '2020-08-03 16:34:08'),
(4, 'sell_payment', 7, 1, '2020-08-03 16:34:08', '2020-08-25 10:46:49'),
(5, 'username', 1, 1, '2020-08-25 13:07:12', '2020-08-25 13:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

DROP TABLE IF EXISTS `res_product_modifier_sets`;
CREATE TABLE IF NOT EXISTS `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product',
  KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

DROP TABLE IF EXISTS `res_tables`;
CREATE TABLE IF NOT EXISTS `res_tables` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `res_tables_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2020-08-03 07:57:20', '2020-08-03 07:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(77, 2);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

DROP TABLE IF EXISTS `selling_price_groups`;
CREATE TABLE IF NOT EXISTS `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_price_groups_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

DROP TABLE IF EXISTS `sell_line_warranties`;
CREATE TABLE IF NOT EXISTS `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

DROP TABLE IF EXISTS `stock_adjustments_temp`;
CREATE TABLE IF NOT EXISTS `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

DROP TABLE IF EXISTS `stock_adjustment_lines`;
CREATE TABLE IF NOT EXISTS `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
CREATE TABLE IF NOT EXISTS `system` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '3.4'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rates_business_id_foreign` (`business_id`),
  KEY `tax_rates_created_by_foreign` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_tax_id_foreign` (`tax_id`),
  KEY `transactions_business_id_index` (`business_id`),
  KEY `transactions_type_index` (`type`),
  KEY `transactions_contact_id_index` (`contact_id`),
  KEY `transactions_transaction_date_index` (`transaction_date`),
  KEY `transactions_created_by_index` (`created_by`),
  KEY `transactions_location_id_index` (`location_id`),
  KEY `transactions_expense_for_foreign` (`expense_for`),
  KEY `transactions_expense_category_id_index` (`expense_category_id`),
  KEY `transactions_sub_type_index` (`sub_type`),
  KEY `transactions_return_parent_id_index` (`return_parent_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', 0, 'paid', NULL, NULL, NULL, NULL, 'EP2020/0001', NULL, NULL, '2020-08-03 23:32:00', '5.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', 'ចាក់សាំងទៅយកឥវ៉ាន់', NULL, '0.0000', '5.0000', 1, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-03 16:34:08', '2020-08-03 16:41:27'),
(2, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 09:51:27', '0.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '0.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 02:51:27', '2020-08-24 02:54:15'),
(3, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:01:36', '1413.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1413.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 03:01:36', '2020-08-24 03:01:36'),
(4, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:15:55', '1944.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1944.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 03:15:55', '2020-08-24 03:15:55'),
(5, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:37:43', '1380.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1380.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 03:37:43', '2020-08-24 03:37:43'),
(6, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:38:05', '1150.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '1150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 03:38:05', '2020-08-24 03:38:05'),
(7, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:47:16', '813.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '813.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 6, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 03:47:16', '2020-08-24 03:47:16'),
(8, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:53:09', '486.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '486.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 03:53:09', '2020-08-24 03:53:09'),
(9, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:58:17', '404.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '404.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 8, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 03:58:17', '2020-08-24 03:58:17'),
(10, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 11:48:12', '269.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '269.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 9, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 04:48:12', '2020-08-24 04:48:29'),
(11, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 11:55:47', '207.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '207.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 10, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 04:55:47', '2020-08-24 04:57:21'),
(12, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:00:27', '314.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '314.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:00:27', '2020-08-24 05:00:27'),
(13, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:13:39', '89.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '89.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 12, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:13:39', '2020-08-24 05:13:39'),
(14, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:29:52', '535.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '535.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 13, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:29:52', '2020-08-24 05:29:52'),
(15, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:36:40', '51.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '51.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:36:41', '2020-08-24 05:36:41'),
(16, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:40:25', '146.7000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '146.7000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 15, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:40:25', '2020-08-24 05:40:25'),
(17, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:43:36', '205.1000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '205.1000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 16, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:43:36', '2020-08-24 05:43:36'),
(18, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:48:08', '82.4000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '82.4000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 17, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:48:08', '2020-08-24 05:48:08'),
(19, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:50:41', '97.8000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '97.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 18, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:50:41', '2020-08-24 05:50:41'),
(20, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:53:55', '29.3000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '29.3000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 19, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:53:55', '2020-08-24 05:53:55'),
(21, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:57:48', '296.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '296.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 20, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 05:57:48', '2020-08-24 05:57:48'),
(22, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 13:00:09', '194.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '194.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 21, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 06:00:09', '2020-08-24 06:00:09'),
(23, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 13:04:24', '246.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '246.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 22, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 06:04:24', '2020-08-24 06:04:24'),
(24, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 13:40:55', '45.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '45.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 23, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 06:40:55', '2020-08-24 06:40:55'),
(25, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 13:51:13', '45.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '45.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 24, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 06:51:13', '2020-08-24 06:51:13'),
(26, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 14:18:46', '45.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '45.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 25, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 07:18:46', '2020-08-24 07:18:46'),
(27, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 14:33:56', '30.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 26, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 07:33:56', '2020-08-24 07:33:56'),
(28, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 14:34:05', '30.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 07:34:05', '2020-08-24 07:34:05'),
(29, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 14:35:41', '30.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 28, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 07:35:41', '2020-08-24 07:35:41'),
(30, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 14:37:57', '30.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 29, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 07:37:57', '2020-08-24 07:37:57'),
(31, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 14:39:38', '30.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 30, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 07:39:38', '2020-08-24 07:39:38'),
(32, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 14:54:08', '30.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 31, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-24 07:54:08', '2020-08-24 07:54:08'),
(33, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:07:04', '56.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '56.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 32, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:07:04', '2020-08-25 03:07:04'),
(34, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:10:25', '56.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '56.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 33, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:10:25', '2020-08-25 03:13:57'),
(35, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:12:26', '8.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '8.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 34, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:12:26', '2020-08-25 03:12:26'),
(36, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:19:18', '172.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '172.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 36, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:19:18', '2020-08-25 03:44:31'),
(37, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:22:14', '12.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '12.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 37, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:22:15', '2020-08-25 03:22:15'),
(38, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:24:08', '13.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '13.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 38, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:24:08', '2020-08-25 03:24:08'),
(39, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:26:38', '32.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '32.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 39, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(40, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:30:19', '15.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '15.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 40, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:30:19', '2020-08-25 03:30:19'),
(41, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:33:33', '45.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '45.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 41, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:33:33', '2020-08-25 03:35:55'),
(42, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 10:35:48', '15.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '15.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 42, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 03:35:48', '2020-08-25 03:35:48'),
(44, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 1, NULL, '18Guq', '', NULL, NULL, '2020-08-25 10:38:00', '69.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '69.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-08-25 03:41:03', '2020-08-25 03:41:03'),
(46, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:11:31', '20.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '20.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 43, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 05:11:31', '2020-08-25 05:11:31'),
(47, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:13:05', '130.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '130.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 44, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 05:13:05', '2020-08-25 05:13:05'),
(48, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:15:40', '72.8000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '72.8000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 45, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 05:15:40', '2020-08-25 05:15:40'),
(49, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:20:31', '30.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 46, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 05:20:31', '2020-08-25 05:20:31'),
(50, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:25:24', '30.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 47, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 05:25:24', '2020-08-25 05:25:24'),
(51, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:27:24', '12.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '12.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 48, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 05:27:24', '2020-08-25 05:27:24'),
(52, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:29:43', '12.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '12.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 49, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 05:29:43', '2020-08-25 05:29:43'),
(53, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-01 12:31:26', '5.0000', NULL, '0.0000', NULL, '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '5.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 50, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-25 05:31:26', '2020-08-25 05:31:26'),
(58, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 1, NULL, 'MagRC', '', NULL, NULL, '2020-08-25 21:33:00', '99.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '99.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-08-25 14:33:34', '2020-08-25 14:33:34'),
(59, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 1, NULL, 'OtZL4', '', NULL, NULL, '2020-08-25 21:33:00', '99.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '99.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-08-25 14:33:38', '2020-08-25 14:33:38'),
(60, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 0, NULL, NULL, 1, NULL, '12rPD', '', NULL, NULL, '2020-08-25 21:33:00', '99.0000', NULL, '0.0000', 'percentage', '0.0000', 0, '0.0000', NULL, NULL, NULL, NULL, '0.0000', NULL, NULL, '0.0000', '99.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, '0.0000', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2020-08-25 14:33:53', '2020-08-25 14:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

DROP TABLE IF EXISTS `transaction_payments`;
CREATE TABLE IF NOT EXISTS `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_payments_created_by_index` (`created_by`),
  KEY `transaction_payments_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '5.0000', 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-03 23:34:00', 1, NULL, NULL, NULL, NULL, 'SP2020/0001', 1, '2020-08-03 16:34:08', '2020-08-03 16:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines`;
CREATE TABLE IF NOT EXISTS `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  KEY `transaction_sell_lines_children_type_index` (`children_type`),
  KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(2, 44, 36, 65, '1.0000', '0.0000', '69.0000', '69.0000', 'fixed', '0.0000', '69.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-08-25 03:41:03', '2020-08-25 03:41:03'),
(11, 58, 12, 18, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-08-25 14:33:34', '2020-08-25 14:33:34'),
(12, 59, 12, 18, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-08-25 14:33:38', '2020-08-25 14:33:38'),
(13, 60, 12, 18, '1.0000', '0.0000', '99.0000', '99.0000', 'fixed', '0.0000', '99.0000', '0.0000', NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2020-08-25 14:33:53', '2020-08-25 14:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines_purchase_lines`;
CREATE TABLE IF NOT EXISTS `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sell_line_id` (`sell_line_id`),
  KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  KEY `purchase_line_id` (`purchase_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

DROP TABLE IF EXISTS `types_of_services`;
CREATE TABLE IF NOT EXISTS `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `types_of_services_business_id_index` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types_of_services`
--

INSERT INTO `types_of_services` (`id`, `name`, `description`, `business_id`, `location_price_group`, `packing_charge`, `packing_charge_type`, `enable_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'សេវាកម្មលក់នាឡិកា', NULL, 1, '{\"1\":\"0\"}', '0.0000', 'fixed', 1, '2020-08-03 16:43:44', '2020-08-03 16:43:44'),
(2, 'លក់វែនតា', NULL, 1, '{\"1\":\"0\"}', '0.0000', 'fixed', 0, '2020-08-03 16:44:00', '2020-08-03 16:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_business_id_foreign` (`business_id`),
  KEY `units_created_by_foreign` (`created_by`),
  KEY `units_base_unit_id_index` (`base_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2020-08-03 07:57:20', '2020-08-03 07:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_business_id_foreign` (`business_id`),
  KEY `users_user_type_index` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `max_sales_discount_percent`, `allow_login`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'Mrs', 'Hang', 'Tek', 'hangtek', 'hangtek@gmail.com', '$2y$10$mqCX1XOQw1kqaOx6vSkz5.ghQc5pVoPLsiuu0SX3j2cDnOB52aZ56', 'en', NULL, NULL, 'TYtfTMuAqJyrDVIhObUmhL63tDPOw09D3GbPYcDWYLrrKpWZ9RLnly7koVLG', 1, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-08-03 07:57:20', '2020-08-03 07:57:20'),
(2, 'user', NULL, 'panha', 'yuth', 'panhayuth', 'heanpanhayuth03@gmail.com', '$2y$10$iqyFSTjXvZ/aoYAYNgqQzuEz4eU9alehIhZ/d2VsKoJN7hJNyaPne', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2020-08-25 13:07:12', '2020-08-25 13:07:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

DROP TABLE IF EXISTS `user_contact_access`;
CREATE TABLE IF NOT EXISTS `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
CREATE TABLE IF NOT EXISTS `variations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details',
  PRIMARY KEY (`id`),
  KEY `variations_product_id_foreign` (`product_id`),
  KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  KEY `variations_name_index` (`name`),
  KEY `variations_sub_sku_index` (`sub_sku`),
  KEY `variations_variation_value_id_index` (`variation_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(2, '157', 2, '6944284655782-1', 2, 1, '157.0000', '157.0000', '14.0100', '179.0000', '179.0000', '2020-08-24 02:59:52', '2020-08-24 03:54:47', NULL, NULL),
(3, '157', 2, '6944284655782-2', 3, 2, '157.0000', '157.0000', '14.0100', '179.0000', '179.0000', '2020-08-24 02:59:52', '2020-08-24 03:54:47', NULL, NULL),
(4, '157', 2, '6944284655782-3', 4, 3, '157.0000', '157.0000', '14.0100', '179.0000', '179.0000', '2020-08-24 02:59:52', '2020-08-24 03:54:47', NULL, NULL),
(5, '157', 3, 'CPH2113-1', 5, 1, '324.0000', '324.0000', '13.8900', '369.0000', '369.0000', '2020-08-24 03:15:17', '2020-08-24 03:55:23', NULL, NULL),
(6, '324', 3, 'CPH2113-2', 6, 4, '324.0000', '324.0000', '13.8900', '369.0000', '369.0000', '2020-08-24 03:15:17', '2020-08-24 03:55:23', NULL, NULL),
(7, '324', 4, 'CPH2083-1', 7, 4, '115.0000', '115.0000', '12.1700', '129.0000', '129.0000', '2020-08-24 03:31:43', '2020-08-24 03:54:05', NULL, NULL),
(8, '157', 4, 'CPH2083-2', 8, 1, '115.0000', '115.0000', '12.1700', '129.0000', '129.0000', '2020-08-24 03:31:43', '2020-08-24 03:54:05', NULL, NULL),
(9, '324', 5, 'CPH2083s-1', 9, 4, '115.0000', '115.0000', '12.1700', '129.0000', '129.0000', '2020-08-24 03:37:17', '2020-08-24 03:54:15', NULL, NULL),
(10, '115', 5, 'CPH2083s-2', 10, 5, '115.0000', '115.0000', '12.1700', '129.0000', '129.0000', '2020-08-24 03:37:17', '2020-08-24 03:54:15', NULL, NULL),
(11, '157', 6, 'CPH1989-1', 11, 2, '271.0000', '271.0000', '14.0200', '309.0000', '309.0000', '2020-08-24 03:46:50', '2020-08-24 03:55:14', NULL, NULL),
(12, '157', 6, 'CPH1989-2', 12, 3, '271.0000', '271.0000', '14.0200', '309.0000', '309.0000', '2020-08-24 03:46:50', '2020-08-24 03:55:14', NULL, NULL),
(13, '157', 7, 'CPH1937-1', 13, 3, '243.0000', '243.0000', '14.8100', '279.0000', '279.0000', '2020-08-24 03:50:51', '2020-08-24 03:54:59', NULL, NULL),
(14, '157', 8, 'CPH2059-1', 14, 2, '202.0000', '202.0000', '13.3700', '229.0000', '229.0000', '2020-08-24 03:58:01', '2020-08-24 03:58:01', NULL, NULL),
(15, '157', 9, 'SM-315G-1', 15, 3, '254.0000', '254.0000', '9.8400', '279.0000', '279.0000', '2020-08-24 04:47:57', '2020-08-24 04:57:13', NULL, NULL),
(16, '157', 10, 'SM-A217F-1', 16, 1, '207.0000', '207.0000', '10.6300', '229.0000', '229.0000', '2020-08-24 04:55:29', '2020-08-24 04:56:45', NULL, NULL),
(17, '157', 11, 'SM-A515F-1', 17, 3, '314.0000', '314.0000', '11.1500', '349.0000', '349.0000', '2020-08-24 05:00:08', '2020-08-24 05:00:08', NULL, NULL),
(18, '157', 12, 'DRA-Lx9-1', 18, 1, '89.0000', '89.0000', '11.2400', '99.0000', '99.0000', '2020-08-24 05:13:25', '2020-08-24 05:14:26', NULL, NULL),
(19, '157', 13, 'RMX2185-1', 19, 6, '107.0000', '107.0000', '11.2100', '119.0000', '119.0000', '2020-08-24 05:29:03', '2020-08-24 05:29:03', NULL, NULL),
(20, '157', 13, 'RMX2185-2', 20, 2, '107.0000', '107.0000', '11.2100', '119.0000', '119.0000', '2020-08-24 05:29:03', '2020-08-24 05:29:03', NULL, NULL),
(21, '157', 14, 'F21-1', 21, 1, '17.0000', '17.0000', '52.9400', '26.0000', '26.0000', '2020-08-24 05:36:19', '2020-08-24 05:37:12', NULL, NULL),
(22, '157', 15, 'TA-1174-1', 22, 1, '16.3000', '16.3000', '22.7000', '20.0000', '20.0000', '2020-08-24 05:40:08', '2020-08-24 05:40:08', NULL, NULL),
(23, '324', 15, 'TA-1174-2', 23, 4, '16.3000', '16.3000', '22.7000', '20.0000', '20.0000', '2020-08-24 05:40:08', '2020-08-24 05:40:08', NULL, NULL),
(24, '157', 15, 'TA-1174-3', 24, 7, '16.3000', '16.3000', '22.7000', '20.0000', '20.0000', '2020-08-24 05:40:08', '2020-08-24 05:40:08', NULL, NULL),
(25, '157', 16, 'TA-1155-1', 25, 1, '29.3000', '29.3000', '22.8700', '36.0000', '36.0000', '2020-08-24 05:43:16', '2020-08-24 05:43:16', NULL, NULL),
(26, '324', 16, 'TA-1155-2', 26, 4, '29.3000', '29.3000', '22.8700', '36.0000', '36.0000', '2020-08-24 05:43:16', '2020-08-24 05:43:16', NULL, NULL),
(27, '157', 17, 'TA-1192-1', 27, 1, '20.6000', '20.6000', '21.3600', '25.0000', '25.0000', '2020-08-24 05:47:42', '2020-08-24 05:47:42', NULL, NULL),
(28, '157', 17, 'TA-1192-2', 28, 7, '20.6000', '20.6000', '21.3600', '25.0000', '25.0000', '2020-08-24 05:47:42', '2020-08-24 05:47:42', NULL, NULL),
(29, '157', 18, 'TA-1114-1', 29, 6, '16.3000', '16.3000', '22.7000', '20.0000', '20.0000', '2020-08-24 05:50:22', '2020-08-24 05:50:22', NULL, NULL),
(30, '157', 19, 'TA-1139-1', 30, 1, '29.3000', '29.3000', '22.8700', '36.0000', '36.0000', '2020-08-24 05:53:06', '2020-08-24 05:53:38', NULL, NULL),
(31, '157', 20, 'VV1938-1', 31, 3, '148.0000', '148.0000', '14.1900', '169.0000', '169.0000', '2020-08-24 05:57:33', '2020-08-24 05:57:33', NULL, NULL),
(32, '157', 21, 'VV2015-1', 32, 1, '97.0000', '97.0000', '12.3700', '109.0000', '109.0000', '2020-08-24 05:59:56', '2020-08-24 05:59:56', NULL, NULL),
(33, '324', 21, 'VV2015-2', 33, 4, '97.0000', '97.0000', '12.3700', '109.0000', '109.0000', '2020-08-24 05:59:56', '2020-08-24 05:59:56', NULL, NULL),
(34, '324', 22, 'VV1906-1', 34, 4, '123.0000', '123.0000', '13.0100', '139.0000', '139.0000', '2020-08-24 06:04:00', '2020-08-24 06:04:00', NULL, NULL),
(35, '324', 22, 'VV1906-2', 35, 8, '123.0000', '123.0000', '13.0100', '139.0000', '139.0000', '2020-08-24 06:04:00', '2020-08-24 06:04:00', NULL, NULL),
(39, '15', 24, '9181-1', 39, 9, '15.0000', '15.0000', '66.6700', '25.0000', '25.0000', '2020-08-24 06:50:44', '2020-08-24 07:31:52', NULL, NULL),
(40, '15', 24, '9181-2', 40, 12, '15.0000', '15.0000', '66.6700', '25.0000', '25.0000', '2020-08-24 06:50:44', '2020-08-24 07:31:52', NULL, NULL),
(41, '15', 24, '9181-3', 41, 13, '15.0000', '15.0000', '86.6700', '28.0000', '28.0000', '2020-08-24 06:50:44', '2020-08-24 07:31:52', NULL, NULL),
(42, '15', 25, '9175-1', 42, 9, '15.0000', '15.0000', '113.3300', '32.0000', '32.0000', '2020-08-24 07:18:19', '2020-08-24 07:32:09', NULL, NULL),
(43, '15', 25, '9175-2', 43, 11, '15.0000', '15.0000', '53.3300', '23.0000', '23.0000', '2020-08-24 07:18:19', '2020-08-24 07:32:09', NULL, NULL),
(44, '15', 25, '9175-3', 44, 10, '15.0000', '15.0000', '86.6700', '28.0000', '28.0000', '2020-08-24 07:18:19', '2020-08-24 07:32:09', NULL, NULL),
(45, '15', 26, '9117-1', 45, 9, '15.0000', '15.0000', '46.6700', '22.0000', '22.0000', '2020-08-24 07:31:04', '2020-08-24 07:50:53', NULL, NULL),
(46, '15', 26, '9117-2', 46, 14, '15.0000', '15.0000', '53.3300', '23.0000', '23.0000', '2020-08-24 07:31:04', '2020-08-24 07:50:53', NULL, NULL),
(47, '15', 27, '9170-1', 47, 9, '15.0000', '15.0000', '66.6700', '25.0000', '25.0000', '2020-08-24 07:33:32', '2020-08-24 07:51:54', NULL, NULL),
(48, '15', 27, '9170-2', 48, 14, '15.0000', '15.0000', '66.6700', '25.0000', '25.0000', '2020-08-24 07:33:32', '2020-08-24 07:51:54', NULL, NULL),
(49, '15', 28, '9161-1', 49, 9, '15.0000', '15.0000', '46.6700', '22.0000', '22.0000', '2020-08-24 07:34:59', '2020-08-24 07:48:44', NULL, NULL),
(50, '15', 28, '9161-2', 50, 12, '15.0000', '15.0000', '86.6700', '28.0000', '28.0000', '2020-08-24 07:34:59', '2020-08-24 07:48:44', NULL, NULL),
(51, '15', 29, '9171-1', 51, 12, '15.0000', '15.0000', '66.6700', '25.0000', '25.0000', '2020-08-24 07:36:54', '2020-08-24 07:49:28', NULL, NULL),
(52, '15', 29, '9171-2', 52, 15, '15.0000', '15.0000', '86.6700', '28.0000', '28.0000', '2020-08-24 07:36:54', '2020-08-24 07:49:28', NULL, NULL),
(53, '15', 30, '9182-1', 53, 16, '15.0000', '15.0000', '66.6700', '25.0000', '25.0000', '2020-08-24 07:39:26', '2020-08-24 07:50:13', NULL, NULL),
(54, '15', 30, '9182-2', 54, 12, '15.0000', '15.0000', '66.6700', '25.0000', '25.0000', '2020-08-24 07:39:26', '2020-08-24 07:50:13', NULL, NULL),
(55, '15', 31, '9172-1', 55, 17, '15.0000', '15.0000', '53.3300', '23.0000', '23.0000', '2020-08-24 07:53:19', '2020-08-24 07:53:19', NULL, NULL),
(56, '15', 31, '9172-2', 56, 18, '15.0000', '15.0000', '53.3300', '23.0000', '23.0000', '2020-08-24 07:53:19', '2020-08-24 07:53:19', NULL, NULL),
(57, '15', 32, '8887M-1', 57, 19, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:05:40', '2020-08-25 03:14:11', NULL, NULL),
(58, '15', 32, '8887M-2', 58, 20, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:05:40', '2020-08-25 03:14:11', NULL, NULL),
(59, '15', 33, '8871m-1', 59, 9, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:10:05', '2020-08-25 03:13:45', NULL, NULL),
(60, '15', 33, '8871m-2', 60, 19, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:10:05', '2020-08-25 03:13:45', NULL, NULL),
(61, '15', 34, '8837M-1', 61, 14, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:12:16', '2020-08-25 03:12:16', NULL, NULL),
(63, '15', 33, '8871m-3', 63, 14, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:13:45', '2020-08-25 03:13:45', NULL, NULL),
(64, '15', 35, '8877M-1', 64, 14, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:16:00', '2020-08-25 03:16:00', NULL, NULL),
(65, '15', 36, 'RMA161-1', 65, 14, '43.0000', '43.0000', '60.4700', '69.0000', '69.0000', '2020-08-25 03:18:56', '2020-08-25 03:44:15', NULL, NULL),
(66, '15', 37, '2430-1', 66, 9, '12.0000', '12.0000', '50.0000', '18.0000', '18.0000', '2020-08-25 03:21:48', '2020-08-25 03:21:48', NULL, NULL),
(67, '15', 38, '1793-1', 67, 18, '13.0000', '13.0000', '61.5400', '21.0000', '21.0000', '2020-08-25 03:23:55', '2020-08-25 03:23:55', NULL, NULL),
(68, '15', 39, '2166-1', 68, 21, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:26:25', '2020-08-25 03:26:25', NULL, NULL),
(69, '15', 39, '2166-2', 69, 12, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:26:25', '2020-08-25 03:26:25', NULL, NULL),
(70, '15', 39, '2166-3', 70, 14, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:26:25', '2020-08-25 03:26:25', NULL, NULL),
(71, '15', 39, '2166-4', 71, 9, '8.0000', '8.0000', '112.5000', '17.0000', '17.0000', '2020-08-25 03:26:25', '2020-08-25 03:26:25', NULL, NULL),
(72, '15', 40, '3139-1', 72, 22, '15.0000', '15.0000', '53.3300', '23.0000', '23.0000', '2020-08-25 03:29:48', '2020-08-25 03:33:17', NULL, NULL),
(73, '15', 41, '3159-1', 73, 14, '15.0000', '15.0000', '53.3300', '23.0000', '23.0000', '2020-08-25 03:32:55', '2020-08-25 03:32:55', NULL, NULL),
(74, '15', 42, '3101-1', 74, 14, '15.0000', '15.0000', '53.3300', '23.0000', '23.0000', '2020-08-25 03:35:31', '2020-08-25 03:35:31', NULL, NULL),
(75, 'DUMMY', 43, 'WMBIG', 75, NULL, '12.0000', '12.0000', '50.0000', '18.0000', '18.0000', '2020-08-25 05:11:01', '2020-08-25 05:13:23', NULL, '[]'),
(76, 'DUMMY', 44, 'WMSMALL', 76, NULL, '10.0000', '10.0000', '60.0000', '16.0000', '16.0000', '2020-08-25 05:12:50', '2020-08-25 05:12:50', NULL, '[]'),
(77, 'DUMMY', 45, 'LC403', 77, NULL, '2.8000', '2.8000', '42.8600', '4.0000', '4.0000', '2020-08-25 05:15:21', '2020-08-25 05:15:21', NULL, '[]'),
(78, '15', 46, 'MJ-12VCB-1', 78, 23, '6.0000', '6.0000', '100.0000', '12.0000', '12.0000', '2020-08-25 05:20:01', '2020-08-25 05:20:01', NULL, NULL),
(79, '15', 46, 'MJ-12VCB-2', 79, 24, '6.0000', '6.0000', '100.0000', '12.0000', '12.0000', '2020-08-25 05:20:01', '2020-08-25 05:20:01', NULL, NULL),
(80, '15', 46, 'MJ-12VCB-3', 80, 25, '6.0000', '6.0000', '100.0000', '12.0000', '12.0000', '2020-08-25 05:20:01', '2020-08-25 05:20:01', NULL, NULL),
(81, 'DUMMY', 47, '837-12', 81, NULL, '6.0000', '6.0000', '100.0000', '12.0000', '12.0000', '2020-08-25 05:25:01', '2020-08-25 05:25:01', NULL, '[]'),
(82, 'DUMMY', 48, 'DJ220', 82, NULL, '12.0000', '12.0000', '50.0000', '18.0000', '18.0000', '2020-08-25 05:26:58', '2020-08-25 05:26:58', NULL, '[]'),
(83, 'DUMMY', 49, 'DJ120', 83, NULL, '12.0000', '12.0000', '50.0000', '18.0000', '18.0000', '2020-08-25 05:29:21', '2020-08-25 05:29:21', NULL, '[]'),
(84, 'DUMMY', 50, 'CXCASIO', 84, NULL, '5.0000', '5.0000', '100.0000', '10.0000', '10.0000', '2020-08-25 05:31:03', '2020-08-25 13:52:50', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

DROP TABLE IF EXISTS `variation_group_prices`;
CREATE TABLE IF NOT EXISTS `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

DROP TABLE IF EXISTS `variation_location_details`;
CREATE TABLE IF NOT EXISTS `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_location_details_location_id_foreign` (`location_id`),
  KEY `variation_location_details_product_id_index` (`product_id`),
  KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  KEY `variation_location_details_variation_id_index` (`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 2, 1, '5.0000', '2020-08-24 03:01:36', '2020-08-24 03:01:36'),
(3, 2, 3, 3, 1, '3.0000', '2020-08-24 03:01:36', '2020-08-24 03:01:36'),
(4, 2, 4, 4, 1, '1.0000', '2020-08-24 03:01:36', '2020-08-24 03:01:36'),
(5, 3, 5, 5, 1, '5.0000', '2020-08-24 03:15:55', '2020-08-24 03:15:55'),
(6, 3, 6, 6, 1, '1.0000', '2020-08-24 03:15:55', '2020-08-24 03:15:55'),
(7, 5, 9, 9, 1, '3.0000', '2020-08-24 03:37:43', '2020-08-24 03:37:43'),
(8, 5, 10, 10, 1, '9.0000', '2020-08-24 03:37:43', '2020-08-24 03:37:43'),
(9, 4, 7, 7, 1, '3.0000', '2020-08-24 03:38:05', '2020-08-24 03:38:05'),
(10, 4, 8, 8, 1, '7.0000', '2020-08-24 03:38:05', '2020-08-24 03:38:05'),
(11, 6, 11, 11, 1, '2.0000', '2020-08-24 03:47:16', '2020-08-24 03:47:16'),
(12, 6, 12, 12, 1, '1.0000', '2020-08-24 03:47:16', '2020-08-24 03:47:16'),
(13, 7, 13, 13, 1, '2.0000', '2020-08-24 03:53:09', '2020-08-24 03:53:09'),
(14, 8, 14, 14, 1, '2.0000', '2020-08-24 03:58:17', '2020-08-24 03:58:17'),
(15, 9, 15, 15, 1, '1.0000', '2020-08-24 04:48:12', '2020-08-24 04:48:12'),
(16, 10, 16, 16, 1, '1.0000', '2020-08-24 04:55:47', '2020-08-25 10:02:50'),
(17, 11, 17, 17, 1, '1.0000', '2020-08-24 05:00:27', '2020-08-24 05:00:27'),
(18, 12, 18, 18, 1, '1.0000', '2020-08-24 05:13:39', '2020-08-25 10:02:59'),
(19, 13, 19, 19, 1, '4.0000', '2020-08-24 05:29:52', '2020-08-24 05:29:52'),
(20, 13, 20, 20, 1, '1.0000', '2020-08-24 05:29:52', '2020-08-24 05:29:52'),
(21, 14, 21, 21, 1, '3.0000', '2020-08-24 05:36:41', '2020-08-24 05:36:41'),
(22, 15, 22, 22, 1, '1.0000', '2020-08-24 05:40:25', '2020-08-24 05:40:25'),
(23, 15, 23, 23, 1, '1.0000', '2020-08-24 05:40:25', '2020-08-24 05:40:25'),
(24, 15, 24, 24, 1, '7.0000', '2020-08-24 05:40:25', '2020-08-24 05:40:25'),
(25, 16, 25, 25, 1, '3.0000', '2020-08-24 05:43:36', '2020-08-24 05:43:36'),
(26, 16, 26, 26, 1, '4.0000', '2020-08-24 05:43:36', '2020-08-24 05:43:36'),
(27, 17, 27, 27, 1, '3.0000', '2020-08-24 05:48:08', '2020-08-24 05:48:08'),
(28, 17, 28, 28, 1, '1.0000', '2020-08-24 05:48:08', '2020-08-24 05:48:08'),
(29, 18, 29, 29, 1, '6.0000', '2020-08-24 05:50:41', '2020-08-24 05:50:41'),
(30, 19, 30, 30, 1, '1.0000', '2020-08-24 05:53:55', '2020-08-24 05:53:55'),
(31, 20, 31, 31, 1, '2.0000', '2020-08-24 05:57:48', '2020-08-24 05:57:48'),
(32, 21, 32, 32, 1, '1.0000', '2020-08-24 06:00:09', '2020-08-24 06:00:09'),
(33, 21, 33, 33, 1, '1.0000', '2020-08-24 06:00:09', '2020-08-24 06:00:09'),
(34, 22, 34, 34, 1, '1.0000', '2020-08-24 06:04:24', '2020-08-24 06:04:24'),
(35, 22, 35, 35, 1, '1.0000', '2020-08-24 06:04:24', '2020-08-24 06:04:24'),
(39, 24, 39, 39, 1, '1.0000', '2020-08-24 06:51:13', '2020-08-24 06:51:13'),
(40, 24, 40, 40, 1, '1.0000', '2020-08-24 06:51:13', '2020-08-24 06:51:13'),
(41, 24, 41, 41, 1, '1.0000', '2020-08-24 06:51:13', '2020-08-24 06:51:13'),
(42, 25, 42, 42, 1, '1.0000', '2020-08-24 07:18:46', '2020-08-25 10:02:59'),
(43, 25, 43, 43, 1, '1.0000', '2020-08-24 07:18:46', '2020-08-24 07:18:46'),
(44, 25, 44, 44, 1, '1.0000', '2020-08-24 07:18:46', '2020-08-24 07:18:46'),
(45, 26, 45, 45, 1, '1.0000', '2020-08-24 07:33:56', '2020-08-24 07:33:56'),
(46, 26, 46, 46, 1, '1.0000', '2020-08-24 07:33:56', '2020-08-24 07:33:56'),
(47, 27, 47, 47, 1, '1.0000', '2020-08-24 07:34:05', '2020-08-24 07:34:05'),
(48, 27, 48, 48, 1, '1.0000', '2020-08-24 07:34:05', '2020-08-24 07:34:05'),
(49, 28, 49, 49, 1, '1.0000', '2020-08-24 07:35:41', '2020-08-24 07:35:41'),
(50, 28, 50, 50, 1, '1.0000', '2020-08-24 07:35:41', '2020-08-24 07:35:41'),
(51, 29, 51, 51, 1, '1.0000', '2020-08-24 07:37:57', '2020-08-24 07:37:57'),
(52, 29, 52, 52, 1, '1.0000', '2020-08-24 07:37:57', '2020-08-24 07:37:57'),
(53, 30, 53, 53, 1, '1.0000', '2020-08-24 07:39:38', '2020-08-24 07:39:38'),
(54, 30, 54, 54, 1, '1.0000', '2020-08-24 07:39:38', '2020-08-24 07:39:38'),
(55, 31, 55, 55, 1, '1.0000', '2020-08-24 07:54:08', '2020-08-24 07:54:08'),
(56, 31, 56, 56, 1, '1.0000', '2020-08-24 07:54:08', '2020-08-24 07:54:08'),
(57, 32, 57, 57, 1, '3.0000', '2020-08-25 03:07:04', '2020-08-25 10:02:59'),
(58, 32, 58, 58, 1, '4.0000', '2020-08-25 03:07:04', '2020-08-25 03:07:04'),
(59, 33, 59, 59, 1, '4.0000', '2020-08-25 03:10:25', '2020-08-25 03:10:25'),
(60, 33, 60, 60, 1, '2.0000', '2020-08-25 03:10:25', '2020-08-25 03:10:25'),
(61, 34, 61, 61, 1, '1.0000', '2020-08-25 03:12:26', '2020-08-25 03:12:26'),
(62, 33, 63, 63, 1, '1.0000', '2020-08-25 03:13:57', '2020-08-25 03:13:57'),
(63, 36, 65, 65, 1, '4.0000', '2020-08-25 03:19:18', '2020-08-25 03:45:16'),
(64, 37, 66, 66, 1, '1.0000', '2020-08-25 03:22:15', '2020-08-25 03:22:15'),
(65, 38, 67, 67, 1, '1.0000', '2020-08-25 03:24:08', '2020-08-25 03:24:08'),
(66, 39, 68, 68, 1, '1.0000', '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(67, 39, 69, 69, 1, '1.0000', '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(68, 39, 70, 70, 1, '1.0000', '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(69, 39, 71, 71, 1, '1.0000', '2020-08-25 03:26:38', '2020-08-25 03:26:38'),
(70, 40, 72, 72, 1, '1.0000', '2020-08-25 03:30:19', '2020-08-25 03:30:19'),
(71, 41, 73, 73, 1, '3.0000', '2020-08-25 03:33:33', '2020-08-25 03:35:55'),
(72, 42, 74, 74, 1, '1.0000', '2020-08-25 03:35:48', '2020-08-25 03:35:48'),
(73, 43, 75, 75, 1, '2.0000', '2020-08-25 05:11:31', '2020-08-25 05:11:31'),
(74, 44, 76, 76, 1, '13.0000', '2020-08-25 05:13:05', '2020-08-25 05:13:05'),
(75, 45, 77, 77, 1, '26.0000', '2020-08-25 05:15:40', '2020-08-25 05:15:40'),
(76, 46, 78, 78, 1, '2.0000', '2020-08-25 05:20:31', '2020-08-25 05:20:31'),
(77, 46, 79, 79, 1, '2.0000', '2020-08-25 05:20:31', '2020-08-25 05:20:31'),
(78, 46, 80, 80, 1, '1.0000', '2020-08-25 05:20:31', '2020-08-25 05:20:31'),
(79, 47, 81, 81, 1, '5.0000', '2020-08-25 05:25:24', '2020-08-25 05:25:24'),
(80, 48, 82, 82, 1, '1.0000', '2020-08-25 05:27:24', '2020-08-25 05:27:24'),
(81, 49, 83, 83, 1, '1.0000', '2020-08-25 05:29:43', '2020-08-25 05:29:43'),
(82, 50, 84, 84, 1, '1.0000', '2020-08-25 05:31:26', '2020-08-25 14:56:41');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

DROP TABLE IF EXISTS `variation_templates`;
CREATE TABLE IF NOT EXISTS `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_templates_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'Black', 1, '2020-08-24 02:28:01', '2020-08-24 02:52:19'),
(2, 'Green', 1, '2020-08-24 02:29:23', '2020-08-24 02:52:27'),
(3, 'White', 1, '2020-08-24 02:29:37', '2020-08-24 02:52:40'),
(4, 'Gold', 1, '2020-08-24 02:30:00', '2020-08-24 02:53:01'),
(5, '32G', 1, '2020-08-24 02:30:43', '2020-08-24 02:30:43'),
(6, '64G', 1, '2020-08-24 02:30:52', '2020-08-24 02:30:52'),
(7, 'Blue', 1, '2020-08-24 03:08:44', '2020-08-24 03:08:44'),
(8, 'Sliver', 1, '2020-08-24 03:27:02', '2020-08-24 03:27:02'),
(9, 'Pink', 1, '2020-08-24 04:44:26', '2020-08-24 04:44:26'),
(10, 'Starry Night', 1, '2020-08-24 04:44:48', '2020-08-24 04:44:48'),
(11, 'Nebula', 1, '2020-08-24 04:44:58', '2020-08-24 04:44:58'),
(12, 'Gray', 1, '2020-08-24 05:22:55', '2020-08-24 05:22:55'),
(13, 'Red', 1, '2020-08-24 06:02:51', '2020-08-24 06:02:51'),
(14, 'ពណ៌មាស', 1, '2020-08-24 06:31:33', '2020-08-24 06:32:24'),
(15, 'ពណ៌កាហ្វេ', 1, '2020-08-24 06:32:14', '2020-08-24 06:32:14'),
(16, 'ពណ៌ខ្មៅខ្សែស្បែក', 1, '2020-08-24 06:32:58', '2020-08-24 06:32:58'),
(17, 'ពណ៌ស', 1, '2020-08-24 06:42:45', '2020-08-24 06:42:45'),
(18, 'ពណ៌ខ្មៅ', 1, '2020-08-24 06:43:02', '2020-08-24 06:43:02'),
(19, 'ពណ៌មាសលាយទឹកប៊ិច', 1, '2020-08-24 06:43:47', '2020-08-24 06:43:47'),
(20, 'ពណ៌មាសលាយខ្មៅ', 1, '2020-08-24 06:44:05', '2020-08-24 06:44:05'),
(21, 'ពណ៌សលាយទឹកប៊ិច', 1, '2020-08-24 06:44:27', '2020-08-24 06:44:27'),
(22, 'ពណ៌ភ្លាកទីន', 1, '2020-08-24 06:45:03', '2020-08-24 06:45:03'),
(23, 'ពណ៌ខ្មៅលាយកាហ្វេ', 1, '2020-08-24 06:45:31', '2020-08-24 06:45:31'),
(24, 'ពណ៌ប្រផេះ', 1, '2020-08-24 06:45:56', '2020-08-24 06:45:56'),
(25, 'ពណ៌ទឹកប្រាក់', 1, '2020-08-24 06:46:33', '2020-08-24 06:46:33'),
(26, 'ពណ៌ទឹកប្រាក់លាយមាស', 1, '2020-08-24 06:47:01', '2020-08-24 06:47:01'),
(27, 'ពណ៌ទឹកប៊ិច', 1, '2020-08-24 07:41:16', '2020-08-24 07:41:16'),
(28, 'ពណ៌ផ្កាឈូកដិត', 1, '2020-08-24 07:41:54', '2020-08-24 07:41:54'),
(29, 'ពណ៌ផ្កាឈូកស្រាល', 1, '2020-08-24 07:42:10', '2020-08-24 07:42:10'),
(30, 'ពណ៌ក្រហម', 1, '2020-08-24 07:42:21', '2020-08-24 07:42:21'),
(31, 'ពណ៌បៃតង', 1, '2020-08-24 07:42:32', '2020-08-24 07:42:32'),
(32, 'ពណ៌ទឺកមាសលាយខ្មៅ', 1, '2020-08-24 07:43:05', '2020-08-24 07:43:05'),
(33, 'ពណ៌ខៀវលាយខ្មៅ', 1, '2020-08-24 07:43:32', '2020-08-24 07:43:32'),
(34, 'ពណ៌សលាយខ្មៅ', 1, '2020-08-24 07:44:05', '2020-08-24 07:44:05'),
(35, 'ពណ៌ទឹកសមុទ្រ', 1, '2020-08-24 07:44:39', '2020-08-24 07:44:39'),
(36, 'ពណ៌ខ្មៅតូច', 1, '2020-08-24 07:45:00', '2020-08-24 07:45:00'),
(37, 'ពណ៌ទឹកក្រូច', 1, '2020-08-25 05:18:23', '2020-08-25 05:18:23'),
(38, 'cellcard012', 1, '2020-08-25 13:13:34', '2020-08-25 13:13:34'),
(39, 'cellcard092', 1, '2020-08-25 13:13:53', '2020-08-25 13:13:53'),
(40, 'cellcard017', 1, '2020-08-25 13:14:12', '2020-08-25 13:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

DROP TABLE IF EXISTS `variation_value_templates`;
CREATE TABLE IF NOT EXISTS `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_value_templates_name_index` (`name`),
  KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, '157', 1, '2020-08-24 02:59:52', '2020-08-24 02:59:52'),
(2, '157', 2, '2020-08-24 02:59:52', '2020-08-24 02:59:52'),
(3, '157', 3, '2020-08-24 02:59:52', '2020-08-24 02:59:52'),
(4, '324', 7, '2020-08-24 03:15:17', '2020-08-24 03:15:17'),
(5, '115', 8, '2020-08-24 03:37:17', '2020-08-24 03:37:17'),
(6, '157', 12, '2020-08-24 05:29:03', '2020-08-24 05:29:03'),
(7, '157', 9, '2020-08-24 05:40:08', '2020-08-24 05:40:08'),
(8, '324', 13, '2020-08-24 06:04:00', '2020-08-24 06:04:00'),
(9, '15', 14, '2020-08-24 06:40:32', '2020-08-24 06:40:32'),
(10, '15', 15, '2020-08-24 06:40:32', '2020-08-24 06:40:32'),
(11, '15', 16, '2020-08-24 06:40:32', '2020-08-24 06:40:32'),
(12, '15', 17, '2020-08-24 06:50:44', '2020-08-24 06:50:44'),
(13, '15', 19, '2020-08-24 06:50:44', '2020-08-24 06:50:44'),
(14, '15', 18, '2020-08-24 07:31:04', '2020-08-24 07:31:04'),
(15, '15', 21, '2020-08-24 07:36:54', '2020-08-24 07:36:54'),
(16, '15', 20, '2020-08-24 07:39:26', '2020-08-24 07:39:26'),
(17, '15', 23, '2020-08-24 07:53:19', '2020-08-24 07:53:19'),
(18, '15', 27, '2020-08-24 07:53:19', '2020-08-24 07:53:19'),
(19, '15', 25, '2020-08-25 03:05:40', '2020-08-25 03:05:40'),
(20, '15', 26, '2020-08-25 03:05:40', '2020-08-25 03:05:40'),
(21, '15', 22, '2020-08-25 03:26:25', '2020-08-25 03:26:25'),
(22, '15', 24, '2020-08-25 03:29:48', '2020-08-25 03:29:48'),
(23, '15', 37, '2020-08-25 05:20:01', '2020-08-25 05:20:01'),
(24, '15', 31, '2020-08-25 05:20:01', '2020-08-25 05:20:01'),
(25, '15', 28, '2020-08-25 05:20:01', '2020-08-25 05:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

DROP TABLE IF EXISTS `warranties`;
CREATE TABLE IF NOT EXISTS `warranties` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`);

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
