-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2024 at 02:54 AM
-- Server version: 8.0.30
-- PHP Version: 8.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kenna_erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(4, 'customer', 'updated', 'App\\Customer', 'updated', 5, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Nguyễn Phương Tú 1\"}, \"attributes\": {\"name\": \"Nguyễn Phương Tú\"}}', NULL, '2024-07-07 18:37:51', '2024-07-07 18:37:51'),
(5, 'customer', 'updated', 'App\\Customer', 'updated', 4, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Nguyễn Phương Nam\", \"email\": \"phuongnam1@gmail.com\", \"phone\": \"0359808268\"}, \"attributes\": {\"name\": \"Nguyễn Phương Nam 1\", \"email\": \"phuongnam@gmail.com\", \"phone\": \"0359808269\"}}', NULL, '2024-07-07 18:43:21', '2024-07-07 18:43:21'),
(6, 'customer', 'created', 'App\\Customer', 'created', 7, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Nguyễn Quang Khánh\", \"email\": \"nguyenquangkhanh@gmail.com\", \"phone\": \"0359808269\"}}', NULL, '2024-07-07 18:44:56', '2024-07-07 18:44:56'),
(7, 'Bảng Sản Phẩm', 'updated', 'App\\Product', 'updated', 12, 'App\\Models\\User', 1, '{\"old\": {\"cost\": 23000, \"name\": \"Rong biển nấu canh loại 1\", \"note\": \"Loại 1\", \"price\": 28000, \"stock\": 888, \"qty_export\": 30, \"qty_import\": 908}, \"attributes\": {\"cost\": 24000, \"name\": \"Rong biển nấu canh\", \"note\": \"Loại 2\", \"price\": 30000, \"stock\": 889, \"qty_export\": 39, \"qty_import\": 900}}', NULL, '2024-07-07 18:50:42', '2024-07-07 18:50:42'),
(8, 'Khách Hàng', 'deleted', 'App\\Customer', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Lý Trần\", \"note\": \"v1\", \"email\": \"litran@gmail.com\", \"phone\": \"0359808999\", \"address\": \"Tân Thịnh TP Thái nguyên Tỉnh Thái Nguyên\"}}', NULL, '2024-07-07 18:52:26', '2024-07-07 18:52:26'),
(9, 'Khách Hàng', 'deleted', 'App\\Customer', 'deleted', 3, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Nguyễn Quang Hải\", \"note\": \"khách hàng quen\", \"email\": \"nguyenquanghai@gmail.com\", \"phone\": \"0359808567\", \"address\": \"Tân Thịnh TP Thái nguyên Tỉnh Thái Nguyên\"}}', NULL, '2024-07-07 18:52:41', '2024-07-07 18:52:41'),
(10, 'Khách Hàng', 'deleted', 'App\\Customer', 'deleted', 4, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Nguyễn Phương Nam 1\", \"note\": \"khách vip 2\", \"email\": \"phuongnam@gmail.com\", \"phone\": \"0359808269\", \"address\": \"Tân Thịnh TP Thái nguyên Tỉnh Thái Nguyên\"}}', NULL, '2024-07-07 18:52:44', '2024-07-07 18:52:44'),
(11, 'Sản Phẩm Cho Mượn', 'updated', 'App\\Loanproduct', 'updated', 32, 'App\\Models\\User', 1, '{\"old\": {\"note\": \"Chưa trả\"}, \"attributes\": {\"note\": \"Sửa lại\"}}', NULL, '2024-07-07 18:56:18', '2024-07-07 18:56:18'),
(12, 'Sản Phẩm', 'updated', 'App\\Product', 'updated', 13, 'App\\Models\\User', 1, '{\"old\": {\"stock\": 359}, \"attributes\": {\"stock\": 349}}', NULL, '2024-07-07 18:56:18', '2024-07-07 18:56:18'),
(13, 'Đơn Hàng', 'created', 'App\\Order', 'created', 5, 'App\\Models\\User', 1, '{\"attributes\": {\"note\": \"Chị tú\", \"phone\": \"0359808567\", \"address\": \"thôn Pác Ngòi xã Nam Mẫu huyện Ba Bể\", \"discount\": 30, \"status_id\": 1, \"payment_id\": 2, \"shipping_id\": 1, \"total_price\": 2000000}}', NULL, '2024-07-07 18:59:15', '2024-07-07 18:59:15'),
(14, 'Nhà Phân Phối', 'created', 'App\\Supplier', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\": {\"name\": \"Kho hàng Minh Quân\", \"note\": \"v1\", \"email\": \"minhquan@gmail.com\", \"phone\": \"0359808267\", \"address\": \"Tân Thịnh TP Thái nguyên Tỉnh Thái Nguyên\"}}', NULL, '2024-07-07 19:01:07', '2024-07-07 19:01:07'),
(15, 'Nhà Phân Phối', 'deleted', 'App\\Purchase', 'deleted', 17, 'App\\Models\\User', 1, '{\"old\": {\"note\": \"nhập ngày 15/7\", \"supplier_id\": 5, \"total_amount\": 200000}}', NULL, '2024-07-07 19:03:22', '2024-07-07 19:03:22'),
(16, 'Phiếu chi', 'created', 'App\\Bill', 'created', 4, 'App\\Models\\User', 1, '{\"attributes\": {\"note\": \"Quay sản phẩm\", \"price\": 2000000}}', NULL, '2024-07-07 19:05:42', '2024-07-07 19:05:42'),
(17, 'Khách Hàng', 'deleted', 'App\\Customer', 'deleted', 7, 'App\\Models\\User', 1, '{\"old\": {\"name\": \"Nguyễn Quang Khánh\", \"note\": \"old\", \"email\": \"nguyenquangkhanh@gmail.com\", \"phone\": \"0359808269\", \"address\": \"Thái Nguyên\"}}', NULL, '2024-07-07 19:51:47', '2024-07-07 19:51:47');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int UNSIGNED NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `note`, `price`, `created_at`, `updated_at`) VALUES
(2, 'Thuê chụp ảnh sản phẩm1', 300000, '2024-06-27 00:22:42', '2024-06-27 00:26:07'),
(3, 'Chạy quảng cáo', 465000, '2024-06-27 00:26:22', '2024-06-27 00:26:31'),
(4, 'Quay sản phẩm', 2000000, '2024-07-07 19:05:42', '2024-07-07 19:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `note`, `created_at`, `updated_at`) VALUES
(5, 'Nguyễn Phương Tú', '0359808267', 'phuongtu@gmail.com', 'Tân Thịnh TP Thái nguyên Tỉnh Thái Nguyên', NULL, '2024-06-26 01:24:00', '2024-07-07 18:37:51');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(56, 7, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(57, 7, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(58, 7, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(59, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(60, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(61, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(62, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(63, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 8, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(65, 8, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 3),
(66, 8, 'cost', 'text', 'Cost', 0, 1, 1, 1, 1, 1, '{}', 4),
(67, 8, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 5),
(68, 8, 'stock', 'text', 'Stock', 0, 1, 1, 1, 1, 1, '{}', 6),
(69, 8, 'qty_import', 'text', 'Qty Import', 0, 1, 1, 1, 1, 1, '{}', 7),
(70, 8, 'qty_export', 'text', 'Qty Export', 0, 1, 1, 1, 1, 1, '{}', 8),
(71, 8, 'note', 'text_area', 'Note', 0, 1, 1, 1, 1, 1, '{}', 9),
(72, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(73, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(74, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 9, 'borrower', 'text', 'Borrower', 0, 1, 1, 1, 1, 1, '{}', 2),
(76, 9, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 3),
(77, 9, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 1, 1, '{}', 4),
(78, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(79, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(80, 9, 'borrowed_day', 'date', 'Borrowed Day', 0, 1, 1, 1, 1, 1, '{}', 7),
(81, 9, 'pay_day', 'date', 'Pay Day', 0, 1, 1, 1, 1, 1, '{}', 8),
(86, 9, 'loanproduct_belongstomany_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"loan_product_details\",\"pivot\":\"1\",\"taggable\":\"0\"}', 9),
(87, 9, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 9),
(88, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(89, 10, 'total_amount', 'text', 'Total Amount', 0, 1, 1, 1, 1, 1, '{}', 2),
(90, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(91, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(92, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(93, 11, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 2),
(94, 11, 'type', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{}', 3),
(95, 11, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 4),
(96, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(97, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(98, 11, 'current_amount', 'text', 'Current Amount', 0, 1, 1, 1, 1, 1, '{}', 7),
(99, 11, 'transaction_history_belongsto_total_amount_relationship', 'relationship', 'total_amounts', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\TotalAmount\",\"table\":\"total_amounts\",\"type\":\"belongsTo\",\"column\":\"total_amount_id\",\"key\":\"id\",\"label\":\"total_amount\",\"pivot_table\":\"data_rows\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(100, 11, 'total_amount_id', 'text', 'Total Amount Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(101, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(102, 12, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(103, 12, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 3),
(104, 12, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 4),
(105, 12, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 5),
(106, 12, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 6),
(107, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(108, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(109, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(110, 13, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(111, 13, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 3),
(112, 13, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 4),
(113, 13, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 5),
(114, 13, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 6),
(115, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(116, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(117, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(118, 14, 'supplier_id', 'text', 'Supplier Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(119, 14, 'total_amount', 'text', 'Total Amount', 0, 1, 1, 1, 1, 1, '{}', 3),
(120, 14, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 4),
(121, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(122, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(125, 14, 'purchase_belongsto_supplier_relationship', 'relationship', 'suppliers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Supplier\",\"table\":\"suppliers\",\"type\":\"belongsTo\",\"column\":\"supplier_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(126, 14, 'purchase_belongstomany_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"pivot_purchase_products\",\"pivot\":\"1\",\"taggable\":\"0\"}', 8),
(127, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(128, 15, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(129, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(130, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(131, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(132, 16, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(133, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(134, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(139, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(140, 20, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 2),
(141, 20, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 3),
(142, 20, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 4),
(143, 20, 'shipping_id', 'text', 'Shipping Id', 0, 1, 1, 1, 1, 1, '{}', 5),
(144, 20, 'payment_id', 'text', 'Payment Id', 0, 1, 1, 1, 1, 1, '{}', 6),
(145, 20, 'status_id', 'text', 'Status Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(146, 20, 'discount', 'text', 'Discount', 0, 1, 1, 1, 1, 1, '{}', 8),
(147, 20, 'total_price', 'text', 'Total Price', 0, 1, 1, 1, 1, 1, '{}', 9),
(148, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(149, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(150, 20, 'order_belongsto_shipping_method_relationship', 'relationship', 'shipping_methods', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\ShippingMethod\",\"table\":\"shipping_methods\",\"type\":\"belongsTo\",\"column\":\"shipping_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(151, 20, 'order_belongsto_payment_method_relationship', 'relationship', 'payment_methods', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\PaymentMethod\",\"table\":\"payment_methods\",\"type\":\"belongsTo\",\"column\":\"payment_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 13),
(153, 20, 'order_belongstomany_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"pivot_order_products\",\"pivot\":\"1\",\"taggable\":\"0\"}', 15),
(154, 20, 'order_belongsto_customer_relationship', 'relationship', 'customers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Customer\",\"table\":\"customers\",\"type\":\"belongsTo\",\"column\":\"customer_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(155, 20, 'customer_id', 'text', 'Customer Id', 0, 1, 1, 1, 1, 1, '{}', 12),
(157, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(158, 21, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(159, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(160, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(161, 20, 'order_belongsto_status_relationship', 'relationship', 'statuses', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Status\",\"table\":\"statuses\",\"type\":\"belongsTo\",\"column\":\"status_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"customers\",\"pivot\":\"0\",\"taggable\":\"0\"}', 17),
(162, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(163, 22, 'note', 'text', 'Note', 0, 1, 1, 1, 1, 1, '{}', 2),
(165, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(166, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(167, 22, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 3),
(180, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(181, 27, 'log_name', 'text', 'Bảng dữ liệu', 0, 1, 1, 1, 1, 1, '{}', 2),
(182, 27, 'description', 'text', 'Mô tả', 1, 1, 1, 1, 1, 1, '{}', 3),
(183, 27, 'subject_type', 'text', 'Tên Model', 0, 1, 1, 1, 1, 1, '{}', 4),
(184, 27, 'event', 'text', 'Thao tác', 0, 1, 1, 1, 1, 1, '{}', 5),
(185, 27, 'subject_id', 'text', 'Id bảng', 0, 1, 1, 1, 1, 1, '{}', 6),
(186, 27, 'causer_type', 'text', 'Bảng Model sửa', 0, 1, 1, 1, 1, 1, '{}', 7),
(187, 27, 'causer_id', 'text', 'Causer Id', 0, 0, 1, 1, 1, 1, '{}', 8),
(188, 27, 'properties', 'text', 'Dữ liệu', 0, 1, 1, 1, 1, 1, '{}', 9),
(189, 27, 'batch_uuid', 'text', 'Batch Uuid', 0, 0, 1, 1, 1, 1, '{}', 10),
(190, 27, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 11),
(191, 27, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(7, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2024-06-19 23:45:51', '2024-06-19 23:45:51'),
(8, 'products', 'products', 'Sản phẩm', 'Sản phẩm', NULL, 'App\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-06-20 01:28:46', '2024-06-20 01:28:46'),
(9, 'loanproducts', 'loanproducts', 'Sản phẩm quay chụp', 'Sản phẩm quay chụp', NULL, 'App\\Loanproduct', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-23 19:31:21', '2024-06-23 20:46:24'),
(10, 'total_amounts', 'total-amounts', 'Total Amount', 'Total Amounts', NULL, 'App\\TotalAmount', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-06-25 00:17:18', '2024-06-25 00:17:18'),
(11, 'transaction_histories', 'transaction-histories', 'Transaction History', 'Transaction Histories', NULL, 'App\\TransactionHistory', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-25 00:20:43', '2024-06-25 00:29:08'),
(12, 'suppliers', 'suppliers', 'Supplier', 'Suppliers', NULL, 'App\\Supplier', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-06-25 01:43:26', '2024-06-25 01:43:26'),
(13, 'customers', 'customers', 'Customer', 'Customers', NULL, 'App\\Customer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-06-25 03:14:28', '2024-06-25 03:14:28'),
(14, 'purchases', 'purchases', 'Purchase', 'Purchases', NULL, 'App\\Purchase', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-25 18:12:59', '2024-06-25 18:30:03'),
(15, 'shipping_methods', 'shipping-methods', 'Shipping Method', 'Shipping Methods', NULL, 'App\\ShippingMethod', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-06-25 20:44:25', '2024-06-25 20:44:25'),
(16, 'payment_methods', 'payment-methods', 'Payment Method', 'Payment Methods', NULL, 'App\\PaymentMethod', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-06-25 20:49:01', '2024-06-25 20:49:01'),
(20, 'orders', 'orders', 'Order', 'Orders', NULL, 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-25 21:01:45', '2024-06-25 23:49:53'),
(21, 'statuses', 'statuses', 'Status', 'Statuses', NULL, 'App\\Status', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2024-06-25 23:47:41', '2024-06-25 23:47:41'),
(22, 'bills', 'bills', 'Bill', 'Bills', NULL, 'App\\Bill', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-06-26 23:54:11', '2024-06-26 23:55:06'),
(27, 'activity_logs', 'activity-logs', 'Lịch sử hoạt động', 'Lịch sử hoạt động', NULL, 'App\\ActivityLog', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-07-07 18:25:33', '2024-07-07 19:08:44');

-- --------------------------------------------------------

--
-- Table structure for table `loanproducts`
--

CREATE TABLE `loanproducts` (
  `id` int UNSIGNED NOT NULL,
  `borrower` text COLLATE utf8mb4_unicode_ci,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `borrowed_day` date DEFAULT NULL,
  `pay_day` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loanproducts`
--

INSERT INTO `loanproducts` (`id`, `borrower`, `note`, `status`, `created_at`, `updated_at`, `borrowed_day`, `pay_day`, `phone`) VALUES
(30, 'Nguyễn Quang Hải', 'Chị tú cho mượn', 1, '2024-06-24 20:37:09', '2024-06-24 20:54:36', '2024-06-27', '2024-06-28', '0359808567'),
(31, 'Nguyễn Quang Hải', 'Đã trả', 1, '2024-06-24 20:44:50', '2024-06-24 20:44:50', '2024-06-28', '2024-06-28', '0359808567'),
(32, 'Nguyễn Quang Hải', 'Sửa lại', 0, '2024-06-24 20:45:32', '2024-07-07 18:56:18', '2024-06-25', '2024-06-25', '0359808567');

-- --------------------------------------------------------

--
-- Table structure for table `loan_product_details`
--

CREATE TABLE `loan_product_details` (
  `id` int UNSIGNED NOT NULL,
  `loanproduct_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `qty_loan` int DEFAULT NULL,
  `qty_returned` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_product_details`
--

INSERT INTO `loan_product_details` (`id`, `loanproduct_id`, `product_id`, `qty_loan`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 1, 12, NULL, NULL, NULL, NULL),
(2, 1, 13, NULL, NULL, NULL, NULL),
(3, 2, 12, NULL, NULL, NULL, NULL),
(4, 3, 13, NULL, NULL, NULL, NULL),
(5, 5, 12, 12, 10, '2024-06-24 02:04:15', '2024-06-24 02:04:15'),
(6, 5, 13, 13, 10, '2024-06-24 02:04:15', '2024-06-24 02:04:15'),
(7, 6, 13, 13, 13, '2024-06-24 02:13:30', '2024-06-24 02:13:30'),
(8, 7, 13, 21, 21, '2024-06-24 02:20:56', '2024-06-24 02:20:56'),
(9, 7, 12, 20, 19, '2024-06-24 02:20:56', '2024-06-24 02:20:56'),
(10, 8, 12, 12, 12, '2024-06-24 18:20:49', '2024-06-24 18:20:49'),
(11, 8, 13, 16, 15, '2024-06-24 18:20:49', '2024-06-24 18:20:49'),
(12, 9, 12, 1, NULL, '2024-06-24 18:23:56', '2024-06-24 18:23:56'),
(13, 9, 13, 2, NULL, '2024-06-24 18:23:56', '2024-06-24 18:23:56'),
(14, 9, 12, 1, 1, '2024-06-24 19:00:17', '2024-06-24 19:00:17'),
(15, 9, 13, 2, 0, '2024-06-24 19:00:17', '2024-06-24 19:00:17'),
(16, 8, 12, 12, 12, '2024-06-24 19:04:39', '2024-06-24 19:04:39'),
(17, 8, 13, 16, 15, '2024-06-24 19:04:39', '2024-06-24 19:04:39'),
(18, 10, 12, 2, 2, '2024-06-24 19:16:39', '2024-06-24 19:18:53'),
(19, 10, 13, 3, 3, '2024-06-24 19:16:39', '2024-06-24 19:17:23'),
(20, 13, 13, 20, 20, '2024-06-24 19:58:02', '2024-06-24 19:58:02'),
(21, 14, 13, 20, 20, '2024-06-24 19:58:47', '2024-06-24 19:58:47'),
(22, 15, 13, 20, 20, '2024-06-24 19:59:29', '2024-06-24 19:59:29'),
(23, 16, 13, 20, 20, '2024-06-24 19:59:42', '2024-06-24 19:59:42'),
(24, 17, 13, 20, 20, '2024-06-24 20:00:13', '2024-06-24 20:00:13'),
(25, 18, 13, 20, 20, '2024-06-24 20:01:36', '2024-06-24 20:01:36'),
(26, 19, 13, 81, 81, '2024-06-24 20:16:51', '2024-06-24 20:16:51'),
(27, 20, 12, 81, NULL, '2024-06-24 20:18:12', '2024-06-24 20:18:12'),
(28, 21, 12, 90, NULL, '2024-06-24 20:19:36', '2024-06-24 20:19:36'),
(29, 22, 12, 1, 1, '2024-06-24 20:21:03', '2024-06-24 20:21:03'),
(30, 23, 12, 100, NULL, '2024-06-24 20:23:44', '2024-06-24 20:23:44'),
(31, 24, 12, 100, NULL, '2024-06-24 20:24:44', '2024-06-24 20:24:44'),
(32, 25, 13, 81, NULL, '2024-06-24 20:28:29', '2024-06-24 20:28:29'),
(33, 26, 12, 10, NULL, '2024-06-24 20:29:06', '2024-06-24 20:29:06'),
(34, 27, 12, 60, NULL, '2024-06-24 20:32:42', '2024-06-24 20:32:42'),
(35, 28, 12, 10, NULL, '2024-06-24 20:33:13', '2024-06-24 20:33:13'),
(36, NULL, 12, 50, NULL, '2024-06-24 20:35:38', '2024-06-24 20:35:38'),
(37, NULL, 12, 10, NULL, '2024-06-24 20:36:09', '2024-06-24 20:36:09'),
(38, 30, 12, 10, 10, '2024-06-24 20:37:09', '2024-06-24 20:54:36'),
(39, 31, 13, 20, 20, '2024-06-24 20:44:50', '2024-06-24 20:44:50'),
(40, 32, 13, 10, 10, '2024-06-24 20:45:32', '2024-06-24 20:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(2, 'home_menu', '2024-06-20 02:17:40', '2024-06-20 02:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(3, 1, 'Tài khoản', '', '_self', NULL, '#000000', 14, 1, '2024-06-19 20:12:05', '2024-06-19 20:21:15', 'voyager.users.index', 'null'),
(4, 1, 'Phân quyền', '', '_self', NULL, '#000000', 14, 2, '2024-06-19 20:12:05', '2024-06-19 20:21:05', 'voyager.roles.index', 'null'),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 6, '2024-06-19 20:12:05', '2024-07-07 19:15:44', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2024-06-19 20:12:05', '2024-07-07 19:15:44', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2024-06-19 20:12:05', '2024-07-07 19:15:44', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2024-06-19 20:12:05', '2024-07-07 19:15:44', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2024-06-19 20:12:05', '2024-07-07 19:15:44', 'voyager.bread.index', NULL),
(10, 1, 'Cấu hình', '', '_self', 'voyager-settings', '#000000', NULL, 5, '2024-06-19 20:12:05', '2024-07-07 19:15:44', 'voyager.settings.index', 'null'),
(14, 1, 'Quản lí tài khoản', '', '_self', 'voyager-person', '#000000', NULL, 4, '2024-06-19 20:20:30', '2024-07-07 19:15:44', NULL, ''),
(15, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 2, '2024-06-19 23:45:51', '2024-07-07 19:15:46', 'voyager.dashboard', NULL),
(20, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 5, 5, '2024-06-19 23:45:51', '2024-07-07 19:15:44', 'voyager.categories.index', NULL),
(21, 1, 'Sản phẩm', '', '_self', NULL, NULL, 5, 6, '2024-06-20 01:28:47', '2024-07-07 19:15:44', 'voyager.products.index', NULL),
(22, 2, 'Thống kê', '/manager', '_self', 'app-menu__icon fa fa-dashboard', '#000000', NULL, 1, '2024-06-20 02:19:04', '2024-06-20 02:39:20', NULL, ''),
(23, 2, 'Sản Phẩm', '#', '_self', 'app-menu__icon fa fa-indent', '#000000', NULL, 3, '2024-06-20 02:20:42', '2024-06-25 21:19:45', NULL, ''),
(24, 2, 'Thêm sản phẩm', '/manager/product/create', '_self', 'icon fa fa-plus', '#000000', 23, 1, '2024-06-20 02:21:20', '2024-06-20 02:54:18', NULL, ''),
(25, 2, 'Quản lý', '/manager/product', '_self', 'icon fa fa-edit', '#000000', 23, 2, '2024-06-20 02:22:05', '2024-06-20 02:39:44', NULL, ''),
(26, 1, 'Sản phẩm quay chụp', '', '_self', NULL, NULL, 5, 7, '2024-06-23 19:31:22', '2024-07-07 19:15:44', 'voyager.loanproducts.index', NULL),
(27, 2, 'Sản phẩm cho mượn', '#', '_self', 'app-menu__icon fa fa-briefcase', '#000000', NULL, 4, '2024-06-23 20:03:43', '2024-06-25 23:59:22', NULL, ''),
(28, 2, 'Thêm sản phẩm cho mượn', '/manager/loanproduct/create', '_self', 'icon fa fa-plus', '#000000', 27, 1, '2024-06-23 20:05:20', '2024-06-23 20:06:30', NULL, ''),
(29, 2, 'Quản lý', '/manager/loanproduct', '_self', 'icon fa fa-edit', '#000000', 27, 2, '2024-06-23 20:06:04', '2024-06-23 20:06:06', NULL, ''),
(30, 1, 'Total Amounts', '', '_self', NULL, NULL, 5, 8, '2024-06-25 00:17:18', '2024-07-07 19:15:44', 'voyager.total-amounts.index', NULL),
(31, 1, 'Transaction Histories', '', '_self', NULL, NULL, 5, 9, '2024-06-25 00:20:43', '2024-07-07 19:15:44', 'voyager.transaction-histories.index', NULL),
(32, 1, 'Suppliers', '', '_self', NULL, NULL, 5, 10, '2024-06-25 01:43:26', '2024-07-07 19:15:44', 'voyager.suppliers.index', NULL),
(33, 2, 'Nhà cung cấp', '#', '_self', 'app-menu__icon fa fa-handshake-o', '#000000', NULL, 5, '2024-06-25 01:44:46', '2024-06-25 21:19:45', NULL, ''),
(34, 2, 'Thêm nhà cung cấp', '/manager/supplier/create', '_self', 'icon fa fa-plus', '#000000', 33, 1, '2024-06-25 01:45:47', '2024-06-25 01:46:51', NULL, ''),
(35, 2, 'Quản lý', '/manager/supplier', '_self', 'icon fa fa-edit', '#000000', 33, 2, '2024-06-25 01:46:19', '2024-06-25 01:48:00', NULL, ''),
(36, 1, 'Customers', '', '_self', NULL, NULL, 5, 11, '2024-06-25 03:14:28', '2024-07-07 19:15:44', 'voyager.customers.index', NULL),
(37, 2, 'Khách hàng', '#', '_self', 'app-menu__icon fa fa-users', '#000000', NULL, 6, '2024-06-25 03:15:25', '2024-06-25 21:19:45', NULL, ''),
(38, 2, 'Thêm khách hàng', '/manager/customer/create', '_self', 'icon fa fa-plus', '#000000', 37, 1, '2024-06-25 03:15:55', '2024-06-25 03:16:03', NULL, ''),
(39, 2, 'Quản lý', '/manager/customer', '_self', 'icon fa fa-edit', '#000000', 37, 2, '2024-06-25 03:16:29', '2024-06-25 03:16:37', NULL, ''),
(40, 1, 'Purchases', '', '_self', NULL, NULL, 5, 12, '2024-06-25 18:12:59', '2024-07-07 19:15:44', 'voyager.purchases.index', NULL),
(41, 2, 'Nhập kho hàng', '#', '_self', 'app-menu__icon fa fa-exchange', '#000000', NULL, 7, '2024-06-25 18:38:04', '2024-06-25 21:19:45', NULL, ''),
(42, 2, 'Thêm mới nhập kho', '/manager/purchase/create', '_self', 'icon fa fa-plus', '#000000', 41, 1, '2024-06-25 18:38:55', '2024-06-25 18:39:02', NULL, ''),
(43, 2, 'Quản lý kho', '/manager/purchase', '_self', 'icon fa fa-edit', '#000000', 41, 2, '2024-06-25 18:39:27', '2024-06-25 18:39:29', NULL, ''),
(44, 1, 'Shipping Methods', '', '_self', NULL, NULL, 5, 14, '2024-06-25 20:44:25', '2024-07-07 19:15:44', 'voyager.shipping-methods.index', NULL),
(45, 1, 'Payment Methods', '', '_self', NULL, NULL, 5, 13, '2024-06-25 20:49:01', '2024-07-07 19:15:44', 'voyager.payment-methods.index', NULL),
(49, 1, 'Orders', '', '_self', NULL, NULL, 5, 15, '2024-06-25 21:01:45', '2024-07-07 19:15:44', 'voyager.orders.index', NULL),
(50, 2, 'Đơn hàng', '#', '_self', 'app-menu__icon fa fa-cart-plus', '#000000', NULL, 2, '2024-06-25 21:19:41', '2024-06-26 00:15:54', NULL, ''),
(51, 2, 'Thêm đơn hàng', '/manager/order/create', '_self', 'icon fa fa-plus', '#000000', 50, 1, '2024-06-25 21:20:27', '2024-06-25 21:20:31', NULL, ''),
(52, 2, 'Quản lý đơn hàng', '/manager/order', '_self', 'icon fa fa-edit', '#000000', 50, 2, '2024-06-25 21:21:03', '2024-06-25 21:21:07', NULL, ''),
(53, 1, 'Statuses', '', '_self', NULL, NULL, 5, 16, '2024-06-25 23:47:41', '2024-07-07 19:15:44', 'voyager.statuses.index', NULL),
(54, 1, 'Bills', '', '_self', NULL, NULL, 5, 17, '2024-06-26 23:54:11', '2024-07-07 19:15:44', 'voyager.bills.index', NULL),
(55, 2, 'Phiếu chi tiêu', '#', '_self', 'app-menu__icon fa fa-file-text-o', '#000000', NULL, 8, '2024-06-27 00:08:52', '2024-06-27 00:08:58', NULL, ''),
(56, 2, 'Thêm mới', '/manager/bill/create', '_self', 'icon fa fa-plus', '#000000', 55, 1, '2024-06-27 00:09:25', '2024-06-27 00:09:32', NULL, ''),
(57, 2, 'Quản lý phiếu chi', '/manager/bill', '_self', 'icon fa fa-edit', '#000000', 55, 2, '2024-06-27 00:10:02', '2024-06-27 00:10:05', NULL, ''),
(60, 1, 'Lịch sử hoạt động', '', '_self', 'voyager-categories', '#000000', NULL, 3, '2024-07-07 18:25:33', '2024-07-07 19:15:46', 'voyager.activity-logs.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(29, '2024_06_29_095441_create_activity_log_table', 3),
(30, '2024_06_29_095442_add_event_column_to_activity_log_table', 4),
(31, '2024_06_29_095443_add_batch_uuid_column_to_activity_log_table', 5),
(32, '2024_06_29_095441_create_activity_logs_table', 6),
(33, '2024_06_29_095442_add_event_column_to_activity_logs_table', 7),
(34, '2024_06_29_095443_add_batch_uuid_column_to_activity_logs_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `shipping_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `total_price` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `address`, `phone`, `note`, `shipping_id`, `payment_id`, `status_id`, `discount`, `total_price`, `created_at`, `updated_at`, `customer_id`) VALUES
(4, 'Tân Thịnh TP Thái nguyên Tỉnh Thái Nguyên', '0359808567', 'nhập ngày 15/7', 4, 3, 3, NULL, 250000, '2024-06-26 03:29:00', '2024-07-07 19:50:37', 5),
(5, 'thôn Pác Ngòi xã Nam Mẫu huyện Ba Bể', '0359808567', 'Chị tú', 1, 2, 1, 30, 2000000, '2024-07-07 18:59:15', '2024-07-07 18:59:15', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Chuyển khoản qua ngân hàng', '2024-06-25 20:49:34', '2024-06-25 20:49:34'),
(3, 'Thanh toán khi nhận hàng', '2024-06-25 20:49:51', '2024-06-25 20:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(2, 'browse_bread', NULL, '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(3, 'browse_database', NULL, '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(4, 'browse_media', NULL, '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(5, 'browse_compass', NULL, '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(6, 'browse_menus', 'menus', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(7, 'read_menus', 'menus', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(8, 'edit_menus', 'menus', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(9, 'add_menus', 'menus', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(10, 'delete_menus', 'menus', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(11, 'browse_roles', 'roles', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(12, 'read_roles', 'roles', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(13, 'edit_roles', 'roles', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(14, 'add_roles', 'roles', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(15, 'delete_roles', 'roles', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(16, 'browse_users', 'users', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(17, 'read_users', 'users', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(18, 'edit_users', 'users', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(19, 'add_users', 'users', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(20, 'delete_users', 'users', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(21, 'browse_settings', 'settings', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(22, 'read_settings', 'settings', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(23, 'edit_settings', 'settings', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(24, 'add_settings', 'settings', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(25, 'delete_settings', 'settings', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(41, 'browse_categories', 'categories', '2024-06-19 23:45:51', '2024-06-19 23:45:51'),
(42, 'read_categories', 'categories', '2024-06-19 23:45:51', '2024-06-19 23:45:51'),
(43, 'edit_categories', 'categories', '2024-06-19 23:45:51', '2024-06-19 23:45:51'),
(44, 'add_categories', 'categories', '2024-06-19 23:45:51', '2024-06-19 23:45:51'),
(45, 'delete_categories', 'categories', '2024-06-19 23:45:51', '2024-06-19 23:45:51'),
(46, 'browse_products', 'products', '2024-06-20 01:28:47', '2024-06-20 01:28:47'),
(47, 'read_products', 'products', '2024-06-20 01:28:47', '2024-06-20 01:28:47'),
(48, 'edit_products', 'products', '2024-06-20 01:28:47', '2024-06-20 01:28:47'),
(49, 'add_products', 'products', '2024-06-20 01:28:47', '2024-06-20 01:28:47'),
(50, 'delete_products', 'products', '2024-06-20 01:28:47', '2024-06-20 01:28:47'),
(51, 'browse_loanproducts', 'loanproducts', '2024-06-23 19:31:21', '2024-06-23 19:31:21'),
(52, 'read_loanproducts', 'loanproducts', '2024-06-23 19:31:21', '2024-06-23 19:31:21'),
(53, 'edit_loanproducts', 'loanproducts', '2024-06-23 19:31:21', '2024-06-23 19:31:21'),
(54, 'add_loanproducts', 'loanproducts', '2024-06-23 19:31:21', '2024-06-23 19:31:21'),
(55, 'delete_loanproducts', 'loanproducts', '2024-06-23 19:31:21', '2024-06-23 19:31:21'),
(56, 'browse_total_amounts', 'total_amounts', '2024-06-25 00:17:18', '2024-06-25 00:17:18'),
(57, 'read_total_amounts', 'total_amounts', '2024-06-25 00:17:18', '2024-06-25 00:17:18'),
(58, 'edit_total_amounts', 'total_amounts', '2024-06-25 00:17:18', '2024-06-25 00:17:18'),
(59, 'add_total_amounts', 'total_amounts', '2024-06-25 00:17:18', '2024-06-25 00:17:18'),
(60, 'delete_total_amounts', 'total_amounts', '2024-06-25 00:17:18', '2024-06-25 00:17:18'),
(61, 'browse_transaction_histories', 'transaction_histories', '2024-06-25 00:20:43', '2024-06-25 00:20:43'),
(62, 'read_transaction_histories', 'transaction_histories', '2024-06-25 00:20:43', '2024-06-25 00:20:43'),
(63, 'edit_transaction_histories', 'transaction_histories', '2024-06-25 00:20:43', '2024-06-25 00:20:43'),
(64, 'add_transaction_histories', 'transaction_histories', '2024-06-25 00:20:43', '2024-06-25 00:20:43'),
(65, 'delete_transaction_histories', 'transaction_histories', '2024-06-25 00:20:43', '2024-06-25 00:20:43'),
(66, 'browse_suppliers', 'suppliers', '2024-06-25 01:43:26', '2024-06-25 01:43:26'),
(67, 'read_suppliers', 'suppliers', '2024-06-25 01:43:26', '2024-06-25 01:43:26'),
(68, 'edit_suppliers', 'suppliers', '2024-06-25 01:43:26', '2024-06-25 01:43:26'),
(69, 'add_suppliers', 'suppliers', '2024-06-25 01:43:26', '2024-06-25 01:43:26'),
(70, 'delete_suppliers', 'suppliers', '2024-06-25 01:43:26', '2024-06-25 01:43:26'),
(71, 'browse_customers', 'customers', '2024-06-25 03:14:28', '2024-06-25 03:14:28'),
(72, 'read_customers', 'customers', '2024-06-25 03:14:28', '2024-06-25 03:14:28'),
(73, 'edit_customers', 'customers', '2024-06-25 03:14:28', '2024-06-25 03:14:28'),
(74, 'add_customers', 'customers', '2024-06-25 03:14:28', '2024-06-25 03:14:28'),
(75, 'delete_customers', 'customers', '2024-06-25 03:14:28', '2024-06-25 03:14:28'),
(76, 'browse_purchases', 'purchases', '2024-06-25 18:12:59', '2024-06-25 18:12:59'),
(77, 'read_purchases', 'purchases', '2024-06-25 18:12:59', '2024-06-25 18:12:59'),
(78, 'edit_purchases', 'purchases', '2024-06-25 18:12:59', '2024-06-25 18:12:59'),
(79, 'add_purchases', 'purchases', '2024-06-25 18:12:59', '2024-06-25 18:12:59'),
(80, 'delete_purchases', 'purchases', '2024-06-25 18:12:59', '2024-06-25 18:12:59'),
(81, 'browse_shipping_methods', 'shipping_methods', '2024-06-25 20:44:25', '2024-06-25 20:44:25'),
(82, 'read_shipping_methods', 'shipping_methods', '2024-06-25 20:44:25', '2024-06-25 20:44:25'),
(83, 'edit_shipping_methods', 'shipping_methods', '2024-06-25 20:44:25', '2024-06-25 20:44:25'),
(84, 'add_shipping_methods', 'shipping_methods', '2024-06-25 20:44:25', '2024-06-25 20:44:25'),
(85, 'delete_shipping_methods', 'shipping_methods', '2024-06-25 20:44:25', '2024-06-25 20:44:25'),
(86, 'browse_payment_methods', 'payment_methods', '2024-06-25 20:49:01', '2024-06-25 20:49:01'),
(87, 'read_payment_methods', 'payment_methods', '2024-06-25 20:49:01', '2024-06-25 20:49:01'),
(88, 'edit_payment_methods', 'payment_methods', '2024-06-25 20:49:01', '2024-06-25 20:49:01'),
(89, 'add_payment_methods', 'payment_methods', '2024-06-25 20:49:01', '2024-06-25 20:49:01'),
(90, 'delete_payment_methods', 'payment_methods', '2024-06-25 20:49:01', '2024-06-25 20:49:01'),
(106, 'browse_orders', 'orders', '2024-06-25 21:01:45', '2024-06-25 21:01:45'),
(107, 'read_orders', 'orders', '2024-06-25 21:01:45', '2024-06-25 21:01:45'),
(108, 'edit_orders', 'orders', '2024-06-25 21:01:45', '2024-06-25 21:01:45'),
(109, 'add_orders', 'orders', '2024-06-25 21:01:45', '2024-06-25 21:01:45'),
(110, 'delete_orders', 'orders', '2024-06-25 21:01:45', '2024-06-25 21:01:45'),
(111, 'browse_statuses', 'statuses', '2024-06-25 23:47:41', '2024-06-25 23:47:41'),
(112, 'read_statuses', 'statuses', '2024-06-25 23:47:41', '2024-06-25 23:47:41'),
(113, 'edit_statuses', 'statuses', '2024-06-25 23:47:41', '2024-06-25 23:47:41'),
(114, 'add_statuses', 'statuses', '2024-06-25 23:47:41', '2024-06-25 23:47:41'),
(115, 'delete_statuses', 'statuses', '2024-06-25 23:47:41', '2024-06-25 23:47:41'),
(116, 'browse_bills', 'bills', '2024-06-26 23:54:11', '2024-06-26 23:54:11'),
(117, 'read_bills', 'bills', '2024-06-26 23:54:11', '2024-06-26 23:54:11'),
(118, 'edit_bills', 'bills', '2024-06-26 23:54:11', '2024-06-26 23:54:11'),
(119, 'add_bills', 'bills', '2024-06-26 23:54:11', '2024-06-26 23:54:11'),
(120, 'delete_bills', 'bills', '2024-06-26 23:54:11', '2024-06-26 23:54:11'),
(131, 'browse_activity_logs', 'activity_logs', '2024-07-07 18:25:33', '2024-07-07 18:25:33'),
(132, 'read_activity_logs', 'activity_logs', '2024-07-07 18:25:33', '2024-07-07 18:25:33'),
(133, 'edit_activity_logs', 'activity_logs', '2024-07-07 18:25:33', '2024-07-07 18:25:33'),
(134, 'add_activity_logs', 'activity_logs', '2024-07-07 18:25:33', '2024-07-07 18:25:33'),
(135, 'delete_activity_logs', 'activity_logs', '2024-07-07 18:25:33', '2024-07-07 18:25:33');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
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
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pivot_order_products`
--

CREATE TABLE `pivot_order_products` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pivot_order_products`
--

INSERT INTO `pivot_order_products` (`id`, `order_id`, `product_id`, `created_at`, `updated_at`, `qty`) VALUES
(1, 1, 12, NULL, NULL, NULL),
(2, 1, 13, NULL, NULL, NULL),
(3, NULL, 12, '2024-06-26 02:04:07', '2024-06-26 02:04:07', 10),
(4, NULL, 13, '2024-06-26 02:04:07', '2024-06-26 02:04:07', 10),
(5, 3, 12, '2024-06-26 02:07:46', '2024-06-26 02:07:46', 10),
(6, 3, 13, '2024-06-26 02:07:46', '2024-06-26 02:07:46', 20),
(7, 4, 12, '2024-06-26 03:29:31', '2024-06-26 03:29:31', 10),
(8, 4, 13, '2024-06-26 03:29:31', '2024-06-26 03:29:31', 10),
(9, 5, 12, NULL, NULL, NULL),
(10, 5, 13, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pivot_purchase_products`
--

CREATE TABLE `pivot_purchase_products` (
  `id` int UNSIGNED NOT NULL,
  `purchase_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `qty_import` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pivot_purchase_products`
--

INSERT INTO `pivot_purchase_products` (`id`, `purchase_id`, `product_id`, `created_at`, `updated_at`, `qty_import`) VALUES
(1, 1, 12, NULL, NULL, NULL),
(2, 1, 13, NULL, NULL, NULL),
(3, 2, 12, NULL, NULL, NULL),
(4, 2, 13, NULL, NULL, NULL),
(5, 3, 13, NULL, NULL, NULL),
(6, 4, 12, NULL, NULL, NULL),
(7, 4, 13, NULL, NULL, NULL),
(8, 5, 12, '2024-06-25 19:23:30', '2024-06-25 19:23:30', NULL),
(9, 5, 13, '2024-06-25 19:23:30', '2024-06-25 19:23:30', NULL),
(10, 6, 12, '2024-06-25 19:24:29', '2024-06-25 19:24:29', NULL),
(11, 7, 12, '2024-06-25 19:26:37', '2024-06-25 19:26:37', NULL),
(12, 8, 13, '2024-06-25 19:27:10', '2024-06-25 19:27:10', NULL),
(13, 9, 12, '2024-06-25 19:27:44', '2024-06-25 19:27:44', NULL),
(14, 10, 12, '2024-06-25 19:28:18', '2024-06-25 19:28:18', NULL),
(15, 11, 12, '2024-06-25 19:34:14', '2024-06-25 19:34:14', NULL),
(16, 11, 13, '2024-06-25 19:34:14', '2024-06-25 19:34:14', NULL),
(17, 16, 12, '2024-06-25 20:06:51', '2024-06-25 20:06:51', 100),
(18, 17, 12, '2024-06-25 20:09:15', '2024-06-25 20:09:15', 200),
(19, 17, 13, '2024-06-25 20:09:15', '2024-06-25 20:09:15', 150),
(20, 18, 12, '2024-06-25 20:09:38', '2024-06-25 20:09:38', 200);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `qty_import` int DEFAULT NULL,
  `qty_export` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `cost`, `price`, `stock`, `qty_import`, `qty_export`, `note`, `created_at`, `updated_at`) VALUES
(12, 'Rong biển nấu canh', '/storage/images/product/14c96313-076d-40ca-8c5b-7572ed798ccc.png', 24000, 30000, 889, 900, 39, 'Loại 2', '2024-06-23 18:37:30', '2024-07-07 18:50:42'),
(13, 'Rong biển 16 gói', '/storage/images/product/1438cb7b-5923-4b20-b7ff-ee34ed0c0214.jpg', 10000, 15000, 349, 359, 20, 'Rong biển loại 1', '2024-06-23 18:43:33', '2024-07-07 18:56:18');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int UNSIGNED NOT NULL,
  `supplier_id` int DEFAULT NULL,
  `total_amount` bigint DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `supplier_id`, `total_amount`, `note`, `created_at`, `updated_at`) VALUES
(18, 5, 1000000, 'nhập ngày 18/7', '2024-06-25 20:09:38', '2024-06-25 20:09:38');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2024-06-19 20:12:05', '2024-06-19 20:12:05'),
(2, 'user', 'Normal User', '2024-06-19 20:12:05', '2024-06-19 20:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Kenna ERP', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(12, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(13, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(14, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Chuyển hàng qua bưu điện', '2024-06-25 20:45:38', '2024-06-25 20:45:38'),
(2, 'Giao Hàng Nhanh', '2024-06-25 20:46:34', '2024-06-25 20:46:34'),
(3, 'Giao Hàng Tiết Kiệm', '2024-06-25 20:46:49', '2024-06-25 20:46:49'),
(4, 'Viettel Post', '2024-06-25 20:46:58', '2024-06-25 20:46:58'),
(5, 'J&T Express', '2024-06-25 20:47:06', '2024-06-25 20:47:06'),
(7, 'Gửi hàng qua xe khách', '2024-06-25 20:47:44', '2024-06-25 20:47:44'),
(8, 'Tự vận chuyển', '2024-06-25 20:47:57', '2024-06-25 20:47:57');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Đang gửi', '2024-06-25 23:47:54', '2024-06-25 23:47:54'),
(2, 'Đã nhận', '2024-06-25 23:48:03', '2024-06-25 23:48:03'),
(3, 'Hoàn trả', '2024-06-25 23:48:00', '2024-06-26 00:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `email`, `address`, `note`, `created_at`, `updated_at`) VALUES
(5, 'Kho hàng Hà Linh', '0359808567', 'halinh@gmail.com', 'Tân Thịnh TP Thái nguyên Tỉnh Thái Nguyên', 'cơ sở 1', '2024-06-25 18:31:09', '2024-06-25 18:31:09'),
(6, 'Kho hàng Minh Quân', '0359808267', 'minhquan@gmail.com', 'Tân Thịnh TP Thái nguyên Tỉnh Thái Nguyên', 'v1', '2024-07-07 19:01:07', '2024-07-07 19:01:07');

-- --------------------------------------------------------

--
-- Table structure for table `total_amounts`
--

CREATE TABLE `total_amounts` (
  `id` int UNSIGNED NOT NULL,
  `total_amount` bigint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `total_amounts`
--

INSERT INTO `total_amounts` (`id`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 0, '2024-06-25 00:17:00', '2024-06-26 03:33:24');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_histories`
--

CREATE TABLE `transaction_histories` (
  `id` int UNSIGNED NOT NULL,
  `price` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `current_amount` bigint DEFAULT NULL,
  `total_amount_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_histories`
--

INSERT INTO `transaction_histories` (`id`, `price`, `type`, `note`, `created_at`, `updated_at`, `current_amount`, `total_amount_id`) VALUES
(20, 200000000, 'in', NULL, '2024-06-25 02:54:01', '2024-06-25 02:54:01', NULL, NULL),
(21, 198000000, 'out', NULL, '2024-06-25 19:35:04', '2024-06-25 19:35:04', NULL, NULL),
(22, 2000000, 'in', NULL, '2024-06-25 20:06:22', '2024-06-25 20:06:22', NULL, NULL),
(23, 2700000, 'out', NULL, '2024-06-26 03:28:21', '2024-06-26 03:28:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2024-06-19 20:12:06', '2024-06-19 20:12:06'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2024-06-19 20:12:06', '2024-06-19 20:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users\\July2024\\XfLlMhFdSQCAgNxWpRiB.png', NULL, '$2y$10$U7BJnaVZeOQayq2ZINxBkuo7IjCI4YPBSRWGwuRPVzKo2U.hCXE2e', '4BC0SfCnEwBDoADHTAv39BQd7VV6QUP3poJ0mO90TsihsbkOcSQ3sSQuZIf5', '{\"locale\":\"vi\"}', '2024-06-19 20:12:06', '2024-07-07 17:57:44'),
(2, 2, 'Nguyễn Quang hải', 'nguyenquanghai@gmail.com', 'users/default.png', NULL, '$2y$10$frOtZ.JrbfZ4ttbeFvR79uC1e2vm3AR/FwXFXVTT2UBKLMEVjV8w.', NULL, NULL, '2024-06-19 21:14:12', '2024-06-19 21:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_logs_log_name_index` (`log_name`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `loanproducts`
--
ALTER TABLE `loanproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_product_details`
--
ALTER TABLE `loan_product_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pivot_order_products`
--
ALTER TABLE `pivot_order_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pivot_purchase_products`
--
ALTER TABLE `pivot_purchase_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `total_amounts`
--
ALTER TABLE `total_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_histories`
--
ALTER TABLE `transaction_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `loanproducts`
--
ALTER TABLE `loanproducts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `loan_product_details`
--
ALTER TABLE `loan_product_details`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pivot_order_products`
--
ALTER TABLE `pivot_order_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pivot_purchase_products`
--
ALTER TABLE `pivot_purchase_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `total_amounts`
--
ALTER TABLE `total_amounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction_histories`
--
ALTER TABLE `transaction_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
