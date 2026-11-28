-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2026 at 12:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aariva-punch`
--

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_access_token`
--

CREATE TABLE `kimai2_access_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `last_usage` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_activities`
--

CREATE TABLE `kimai2_activities` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `comment` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `time_budget` int(11) NOT NULL DEFAULT 0,
  `budget` double NOT NULL DEFAULT 0,
  `budget_type` varchar(10) DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_text` longtext DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_activities`
--

INSERT INTO `kimai2_activities` (`id`, `project_id`, `name`, `comment`, `visible`, `color`, `time_budget`, `budget`, `budget_type`, `billable`, `invoice_text`, `number`, `created_at`) VALUES
(21, NULL, 'Meetings', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:27:20'),
(22, NULL, 'Development', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:23'),
(23, NULL, 'Design', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:23'),
(24, NULL, 'Support / BAU', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:23'),
(25, NULL, 'Content', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:23'),
(26, NULL, 'Project delivery', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:26'),
(27, NULL, 'Governance & reporting', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:26'),
(28, NULL, 'Stakeholder engagement', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:26'),
(29, NULL, 'Admin & BAU', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:26'),
(30, NULL, 'Training', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:26'),
(31, NULL, 'Meetings', NULL, 1, NULL, 0, 0, NULL, 1, NULL, NULL, '2026-11-28 10:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_activities_meta`
--

CREATE TABLE `kimai2_activities_meta` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_activities_rates`
--

CREATE TABLE `kimai2_activities_rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_activities_teams`
--

CREATE TABLE `kimai2_activities_teams` (
  `activity_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_bookmarks`
--

CREATE TABLE `kimai2_bookmarks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_configuration`
--

CREATE TABLE `kimai2_configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_configuration`
--

INSERT INTO `kimai2_configuration` (`id`, `name`, `value`) VALUES
(1, 'defaults.customer.language', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers`
--

CREATE TABLE `kimai2_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `country` varchar(2) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `homepage` varchar(100) DEFAULT NULL,
  `timezone` varchar(64) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `time_budget` int(11) NOT NULL DEFAULT 0,
  `budget` double NOT NULL DEFAULT 0,
  `vat_id` varchar(50) DEFAULT NULL,
  `budget_type` varchar(10) DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_template_id` int(11) DEFAULT NULL,
  `invoice_text` longtext DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `address_line1` varchar(150) DEFAULT NULL,
  `address_line2` varchar(150) DEFAULT NULL,
  `address_line3` varchar(150) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `buyer_reference` varchar(50) DEFAULT NULL,
  `invoice_email` varchar(75) DEFAULT NULL,
  `language` varchar(35) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_customers`
--

INSERT INTO `kimai2_customers` (`id`, `name`, `number`, `comment`, `visible`, `company`, `contact`, `address`, `country`, `currency`, `phone`, `fax`, `mobile`, `email`, `homepage`, `timezone`, `color`, `time_budget`, `budget`, `vat_id`, `budget_type`, `billable`, `invoice_template_id`, `invoice_text`, `created_at`, `address_line1`, `address_line2`, `address_line3`, `postcode`, `city`, `buyer_reference`, `invoice_email`, `language`) VALUES
(8, 'Aariva Internal', 'AARIVA', 'Internal product work at minimal self-rates.', 1, 'Aariva Solution Ltd', 'Naresh Shahi', NULL, 'GB', 'GBP', NULL, NULL, NULL, 'hello@aariva.co.uk', NULL, 'Europe/London', NULL, 0, 0, NULL, NULL, 1, NULL, NULL, '2026-11-28 10:30:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en'),
(10, 'West Yorkshire Combined Authority', 'WYCA', 'Demo tenant for WYCA Future Ways of Working — BAU and programme time.', 1, 'West Yorkshire Combined Authority', 'Claire Morrison', NULL, 'GB', 'GBP', NULL, NULL, NULL, 'timerecording-demo@wyca-demo.gov.uk', NULL, 'Europe/London', NULL, 0, 0, NULL, NULL, 1, NULL, NULL, '2026-11-28 10:30:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers_comments`
--

CREATE TABLE `kimai2_customers_comments` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers_meta`
--

CREATE TABLE `kimai2_customers_meta` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers_rates`
--

CREATE TABLE `kimai2_customers_rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_customers_teams`
--

CREATE TABLE `kimai2_customers_teams` (
  `customer_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_customers_teams`
--

INSERT INTO `kimai2_customers_teams` (`customer_id`, `team_id`) VALUES
(8, 11),
(10, 13),
(10, 14),
(10, 15),
(10, 16);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_export_templates`
--

CREATE TABLE `kimai2_export_templates` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `renderer` varchar(20) NOT NULL,
  `language` varchar(35) DEFAULT NULL,
  `columns` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`columns`)),
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_invoices`
--

CREATE TABLE `kimai2_invoices` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `timezone` varchar(64) NOT NULL,
  `total` double NOT NULL,
  `tax` double NOT NULL,
  `currency` varchar(3) NOT NULL,
  `status` varchar(20) NOT NULL,
  `due_days` int(11) NOT NULL,
  `vat` double NOT NULL,
  `invoice_filename` varchar(150) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_invoices_meta`
--

CREATE TABLE `kimai2_invoices_meta` (
  `id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_invoice_templates`
--

CREATE TABLE `kimai2_invoice_templates` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `due_days` int(11) NOT NULL,
  `vat` double DEFAULT 0,
  `calculator` varchar(20) NOT NULL,
  `number_generator` varchar(20) NOT NULL,
  `renderer` varchar(20) NOT NULL,
  `payment_terms` text DEFAULT NULL,
  `vat_id` varchar(50) DEFAULT NULL,
  `contact` longtext DEFAULT NULL,
  `payment_details` longtext DEFAULT NULL,
  `language` varchar(35) NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_invoice_templates_meta`
--

CREATE TABLE `kimai2_invoice_templates_meta` (
  `id` int(11) NOT NULL,
  `template_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects`
--

CREATE TABLE `kimai2_projects` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `order_number` tinytext DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL,
  `budget` double NOT NULL DEFAULT 0,
  `color` varchar(7) DEFAULT NULL,
  `time_budget` int(11) NOT NULL DEFAULT 0,
  `order_date` datetime DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `timezone` varchar(64) DEFAULT NULL,
  `budget_type` varchar(10) DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_text` longtext DEFAULT NULL,
  `global_activities` tinyint(1) NOT NULL DEFAULT 1,
  `number` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `locked_until` date DEFAULT NULL COMMENT '(DC2Type:date_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_projects`
--

INSERT INTO `kimai2_projects` (`id`, `customer_id`, `name`, `order_number`, `comment`, `visible`, `budget`, `color`, `time_budget`, `order_date`, `start`, `end`, `timezone`, `budget_type`, `billable`, `invoice_text`, `global_activities`, `number`, `created_at`, `locked_until`) VALUES
(34, 10, 'BAU – Transport', NULL, 'Day-to-day transport service activity.', 1, 0, NULL, 0, NULL, '2026-01-06 09:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL),
(35, 10, 'BAU – Economic Growth', NULL, 'Business support and growth service BAU.', 1, 0, NULL, 0, NULL, '2026-01-06 09:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL),
(36, 10, 'BAU – Corporate Services', NULL, 'HR, finance liaison, digital and admin BAU.', 1, 0, NULL, 0, NULL, '2026-01-06 09:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL),
(37, 10, 'BAU – Policy & Strategy', NULL, 'Policy development and briefing BAU.', 1, 0, NULL, 0, NULL, '2026-01-06 09:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL),
(38, 10, 'BAU – Place & Housing', NULL, 'Place and housing service BAU.', 1, 0, NULL, 0, NULL, '2026-01-06 09:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL),
(39, 10, 'Mass Transit Programme', NULL, 'West Yorkshire mass transit programme work.', 1, 0, NULL, 0, NULL, '2026-02-02 09:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL),
(40, 10, 'Brownfield Housing Fund', NULL, 'Brownfield housing fund delivery.', 1, 0, NULL, 0, NULL, '2026-03-02 09:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL),
(41, 10, 'Skills Bootcamps', NULL, 'Skills bootcamps programme.', 1, 0, NULL, 0, NULL, '2026-04-06 08:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL),
(42, 10, 'Future Ways of Working – Flexitime Pilot', NULL, 'Internal flexitime / time-recording pilot.', 1, 0, NULL, 0, NULL, '2026-09-01 08:00:00', NULL, 'Europe/London', NULL, 1, NULL, 1, NULL, '2026-11-28 10:30:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects_comments`
--

CREATE TABLE `kimai2_projects_comments` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects_meta`
--

CREATE TABLE `kimai2_projects_meta` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects_rates`
--

CREATE TABLE `kimai2_projects_rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `rate` double NOT NULL,
  `fixed` tinyint(1) NOT NULL,
  `internal_rate` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_projects_teams`
--

CREATE TABLE `kimai2_projects_teams` (
  `project_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_projects_teams`
--

INSERT INTO `kimai2_projects_teams` (`project_id`, `team_id`) VALUES
(34, 13),
(35, 14),
(36, 15),
(37, 16),
(38, 16),
(39, 13),
(40, 14),
(41, 14),
(42, 15);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_roles`
--

CREATE TABLE `kimai2_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_roles`
--

INSERT INTO `kimai2_roles` (`id`, `name`) VALUES
(3, 'ROLE_ADMIN'),
(4, 'ROLE_SUPER_ADMIN'),
(2, 'ROLE_TEAMLEAD'),
(1, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_roles_permissions`
--

CREATE TABLE `kimai2_roles_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `allowed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_sessions`
--

CREATE TABLE `kimai2_sessions` (
  `id` varchar(128) NOT NULL,
  `data` blob NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `lifetime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_sessions`
--

INSERT INTO `kimai2_sessions` (`id`, `data`, `time`, `lifetime`) VALUES
('a6ltpuiukm7t17a9eic7cpshdr', 0x5f7366325f617474726962757465737c613a31363a7b733a32333a225f73656375726974792e6c6173745f757365726e616d65223b733a33323a22636c616972652e6d6f727269736f6e40777963612d64656d6f2e676f762e756b223b733a32323a225f73656375726974795f736563757265645f61726561223b733a3436363a224f3a37343a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c557365726e616d6550617373776f7264546f6b656e223a333a7b693a303b4e3b693a313b733a31323a22736563757265645f61726561223b693a323b613a353a7b693a303b4f3a31353a224170705c456e746974795c55736572223a363a7b733a323a226964223b693a373b733a383a22757365726e616d65223b733a31353a22636c616972652e6d6f727269736f6e223b733a373a22656e61626c6564223b623a313b733a353a22656d61696c223b733a33323a22636c616972652e6d6f727269736f6e40777963612d64656d6f2e676f762e756b223b733a383a2270617373776f7264223b733a36303a222432792431332431685a416c434a76703344446430724f41375868634f58756765312e43524855473273515a426b5665336a654c5773723437464b4f223b733a31333a227369676e617475726544617465223b4e3b7d693a313b623a313b693a323b4e3b693a333b613a303a7b7d693a343b613a323a7b693a303b733a31363a22524f4c455f53555045525f41444d494e223b693a313b733a393a22524f4c455f55534552223b7d7d7d223b733a31303a225f637372662f666f726d223b733a34333a2250326a33496e6671654b377a3251537a327347506959785133475a5f7633462d644b526673593730573934223b733a31323a225f637372662f736561726368223b733a34333a226d38776f49635a4b47643933543155417167627a52726c395254336466594d61584c563431426d4c54594d223b733a32323a225f637372662f646174617461626c655f757064617465223b733a34333a22677352524f756c7a31366c76577175324e2d6456436a4a4f30314831507a5a52504b315076545963653449223b733a32363a225f637372662f656e7469746965735f6d756c7469757064617465223b733a34333a227a4a546974724d6f636874557a6b773134586c706b7267564c434f53556f4f434e554b356a344957504b67223b733a32303a225f637372662f74696d6573686565745f65646974223b733a34333a226d724d4d4848784c687763376d5a3977537731324c726a2d57757a793172567a50797170307a7937465767223b733a32383a225f637372662f61646d696e5f696e766f6963655f74656d706c617465223b733a34333a226156705f397a76494a535a426370653358624f35613932326c354c734b73397959624d6d44467651465359223b733a32303a225f637372662f696e766f6963652e737461747573223b733a34333a2257694c4373497736706f744c43796165576342504d554d6c3478554949376b6250356f72523935746e3977223b733a32373a225f637372662f61646d696e5f70726f6a6563745f636f6d6d656e74223b733a34333a2233566b4e326e4e546a6454787375386373547234733566315f5643486f7a39723554534c3947684f635a38223b733a32383a225f637372662f61646d696e5f637573746f6d65725f636f6d6d656e74223b733a34333a2249537371433854786753724b6e5838316375374e63596547394e54477a61334132494c6c665f4e43325473223b733a32363a225f637372662f74696d6573686565745f717569636b5f65646974223b733a34333a226441564663425f5445482d6354474f3644414d7541694b61506952656e39476f3861585439376f69653141223b733a32373a225f637372662f757365725f726f6c655f7065726d697373696f6e73223b733a34333a22727838333238734662556455334679304a75584d3336786a6c4f7a756f3834437076556d7833466b504d49223b733a32313a225f637372662f61646d696e5f7465616d5f65646974223b733a34333a2261386150496f535756765f5665417244747537583133693473536157666631424332646b42626b38695359223b733a32343a225f637372662f7465616d5f637573746f6d65725f666f726d223b733a34333a2243686159574e4c425a656248515a38483634725448756d45304f594641427279675033565a63426d596334223b733a32333a225f637372662f7465616d5f70726f6a6563745f666f726d223b733a34333a224952787169496c437570637968423256526a66744a63784a49344741716570584936315146483077307955223b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313739353836343733303b733a313a2263223b693a313739353836323433363b733a313a226c223b693a303b7d, 1795864730, 1795866170);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_tags`
--

CREATE TABLE `kimai2_tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(7) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_teams`
--

CREATE TABLE `kimai2_teams` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_teams`
--

INSERT INTO `kimai2_teams` (`id`, `name`, `color`) VALUES
(11, 'Aariva Products', NULL),
(12, 'CTTC Delivery', NULL),
(13, 'WYCA Demo – Transport', NULL),
(14, 'WYCA Demo – Economic Growth', NULL),
(15, 'WYCA Demo – Corporate Services', NULL),
(16, 'WYCA Demo – Policy & Place', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_timesheet`
--

CREATE TABLE `kimai2_timesheet` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rate` double NOT NULL,
  `fixed_rate` double DEFAULT NULL,
  `hourly_rate` double DEFAULT NULL,
  `exported` tinyint(1) NOT NULL DEFAULT 0,
  `timezone` varchar(64) NOT NULL,
  `internal_rate` double DEFAULT NULL,
  `billable` tinyint(1) DEFAULT 1,
  `category` varchar(10) NOT NULL DEFAULT 'work',
  `modified_at` datetime DEFAULT NULL,
  `date_tz` date NOT NULL,
  `break` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_timesheet`
--

INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(9412, 9, 29, 34, '2026-01-06 09:00:00', '2026-01-06 15:30:00', 23400, 'Admin & BAU – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-01-06', 0),
(9413, 9, 26, 34, '2026-01-07 09:00:00', '2026-01-07 12:00:00', 10800, 'Project delivery – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:26', '2026-01-07', 0),
(9414, 9, 28, 34, '2026-01-08 09:30:00', '2026-01-08 16:54:00', 26640, 'Stakeholder engagement – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-01-08', 0),
(9415, 9, 26, 34, '2026-01-09 09:15:00', '2026-01-09 16:15:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-01-09', 0),
(9416, 9, 26, 34, '2026-01-12 09:00:00', '2026-01-12 16:00:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-01-12', 0),
(9417, 9, 30, 34, '2026-01-13 09:30:00', '2026-01-13 12:30:00', 10800, 'Training – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:26', '2026-01-13', 0),
(9418, 9, 26, 34, '2026-01-14 09:30:00', '2026-01-14 16:00:00', 23400, 'Project delivery – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-01-14', 0),
(9419, 9, 28, 34, '2026-01-16 09:00:00', '2026-01-16 14:00:00', 18000, 'Stakeholder engagement – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:26', '2026-01-16', 0),
(9420, 9, 26, 34, '2026-01-20 09:00:00', '2026-01-20 15:00:00', 21600, 'Project delivery – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:26', '2026-01-20', 0),
(9421, 9, 27, 34, '2026-01-22 09:15:00', '2026-01-22 16:15:00', 25200, 'Governance & reporting – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-01-22', 0),
(9422, 9, 28, 34, '2026-01-23 09:15:00', '2026-01-23 15:45:00', 23400, 'Stakeholder engagement – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-01-23', 0),
(9423, 9, 27, 34, '2026-01-26 09:15:00', '2026-01-26 16:15:00', 25200, 'Governance & reporting – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-01-26', 0),
(9424, 9, 26, 34, '2026-01-27 09:15:00', '2026-01-27 14:15:00', 18000, 'Project delivery – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:26', '2026-01-27', 0),
(9425, 9, 27, 34, '2026-01-29 09:30:00', '2026-01-29 12:30:00', 10800, 'Governance & reporting – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:26', '2026-01-29', 0),
(9426, 9, 30, 34, '2026-02-02 09:15:00', '2026-02-02 16:15:00', 25200, 'Training – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-02-02', 0),
(9427, 9, 27, 34, '2026-02-03 09:15:00', '2026-02-03 16:15:00', 25200, 'Governance & reporting – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-02-03', 0),
(9428, 9, 26, 34, '2026-02-04 09:15:00', '2026-02-04 16:15:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-02-04', 0),
(9429, 9, 28, 34, '2026-02-05 09:30:00', '2026-02-05 13:30:00', 14400, 'Stakeholder engagement – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:26', '2026-02-05', 0),
(9430, 9, 28, 34, '2026-02-06 09:00:00', '2026-02-06 15:00:00', 21600, 'Stakeholder engagement – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:26', '2026-02-06', 0),
(9431, 9, 28, 34, '2026-02-09 09:30:00', '2026-02-09 13:00:00', 12600, 'Stakeholder engagement – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:26', '2026-02-09', 0),
(9432, 9, 26, 34, '2026-02-10 09:30:00', '2026-02-10 16:54:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-02-10', 0),
(9433, 9, 26, 34, '2026-02-12 09:30:00', '2026-02-12 11:30:00', 7200, 'Project delivery – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-02-12', 0),
(9434, 9, 29, 34, '2026-02-13 09:00:00', '2026-02-13 16:00:00', 25200, 'Admin & BAU – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-02-13', 0),
(9435, 9, 29, 34, '2026-02-16 09:30:00', '2026-02-16 12:30:00', 10800, 'Admin & BAU – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:26', '2026-02-16', 0),
(9436, 9, 28, 34, '2026-02-17 09:15:00', '2026-02-17 11:45:00', 9000, 'Stakeholder engagement – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-02-17', 0),
(9437, 9, 26, 34, '2026-02-18 09:30:00', '2026-02-18 16:30:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-02-18', 0),
(9438, 9, 26, 34, '2026-02-19 09:30:00', '2026-02-19 12:00:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-02-19', 0),
(9439, 9, 26, 34, '2026-02-24 09:00:00', '2026-02-24 12:00:00', 10800, 'Project delivery – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:26', '2026-02-24', 0),
(9440, 9, 27, 34, '2026-02-25 09:00:00', '2026-02-25 11:30:00', 9000, 'Governance & reporting – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-02-25', 0),
(9441, 9, 27, 34, '2026-03-02 09:30:00', '2026-03-02 16:54:00', 26640, 'Governance & reporting – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-03-02', 0),
(9442, 9, 30, 34, '2026-03-03 09:15:00', '2026-03-03 13:15:00', 14400, 'Training – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:26', '2026-03-03', 0),
(9443, 9, 26, 34, '2026-03-04 09:00:00', '2026-03-04 14:00:00', 18000, 'Project delivery – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:26', '2026-03-04', 0),
(9444, 9, 27, 34, '2026-03-11 09:15:00', '2026-03-11 15:15:00', 21600, 'Governance & reporting – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:26', '2026-03-11', 0),
(9445, 9, 26, 34, '2026-03-12 09:30:00', '2026-03-12 11:30:00', 7200, 'Project delivery – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-03-12', 0),
(9446, 9, 26, 34, '2026-03-13 09:00:00', '2026-03-13 15:30:00', 23400, 'Project delivery – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-03-13', 0),
(9447, 9, 26, 34, '2026-03-16 09:30:00', '2026-03-16 12:00:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-03-16', 0),
(9448, 9, 29, 34, '2026-03-17 09:00:00', '2026-03-17 12:00:00', 10800, 'Admin & BAU – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:26', '2026-03-17', 0),
(9449, 9, 29, 34, '2026-03-18 09:00:00', '2026-03-18 15:30:00', 23400, 'Admin & BAU – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-03-18', 0),
(9450, 9, 29, 34, '2026-03-23 09:00:00', '2026-03-23 11:30:00', 9000, 'Admin & BAU – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-03-23', 0),
(9451, 9, 31, 34, '2026-03-25 09:30:00', '2026-03-25 16:54:00', 26640, 'Meetings – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-03-25', 0),
(9452, 9, 28, 34, '2026-03-27 09:00:00', '2026-03-27 11:30:00', 9000, 'Stakeholder engagement – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-03-27', 0),
(9453, 9, 26, 34, '2026-03-30 08:30:00', '2026-03-30 15:54:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-03-30', 0),
(9454, 9, 30, 34, '2026-03-31 08:15:00', '2026-03-31 12:15:00', 14400, 'Training – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:26', '2026-03-31', 0),
(9455, 9, 26, 34, '2026-04-02 08:00:00', '2026-04-02 15:24:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-04-02', 0),
(9456, 9, 26, 34, '2026-04-03 08:30:00', '2026-04-03 15:30:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-04-03', 0),
(9457, 9, 29, 34, '2026-04-06 08:00:00', '2026-04-06 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-04-06', 0),
(9458, 9, 26, 34, '2026-04-07 08:00:00', '2026-04-07 10:30:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-04-07', 0),
(9459, 9, 27, 34, '2026-04-09 08:00:00', '2026-04-09 12:00:00', 14400, 'Governance & reporting – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:26', '2026-04-09', 0),
(9460, 9, 28, 34, '2026-04-10 08:30:00', '2026-04-10 10:30:00', 7200, 'Stakeholder engagement – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-04-10', 0),
(9461, 9, 29, 34, '2026-04-13 08:00:00', '2026-04-13 10:00:00', 7200, 'Admin & BAU – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-04-13', 0),
(9462, 9, 26, 34, '2026-04-15 08:00:00', '2026-04-15 15:24:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-04-15', 0),
(9463, 9, 26, 34, '2026-04-16 08:15:00', '2026-04-16 12:15:00', 14400, 'Project delivery – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:26', '2026-04-16', 0),
(9464, 9, 26, 34, '2026-04-17 08:00:00', '2026-04-17 10:30:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-04-17', 0),
(9465, 9, 26, 34, '2026-04-20 08:30:00', '2026-04-20 15:30:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-04-20', 0),
(9466, 9, 26, 34, '2026-04-23 08:15:00', '2026-04-23 11:15:00', 10800, 'Project delivery – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:26', '2026-04-23', 0),
(9467, 9, 31, 34, '2026-04-28 08:00:00', '2026-04-28 13:00:00', 18000, 'Meetings – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:26', '2026-04-28', 0),
(9468, 9, 26, 34, '2026-04-29 08:15:00', '2026-04-29 15:15:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-04-29', 0),
(9469, 9, 26, 34, '2026-04-30 08:15:00', '2026-04-30 15:15:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-04-30', 0),
(9470, 9, 26, 34, '2026-05-07 08:15:00', '2026-05-07 10:45:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-05-07', 0),
(9471, 9, 27, 34, '2026-05-08 08:15:00', '2026-05-08 15:15:00', 25200, 'Governance & reporting – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-05-08', 0),
(9472, 9, 26, 34, '2026-05-11 08:15:00', '2026-05-11 14:45:00', 23400, 'Project delivery – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-05-11', 0),
(9473, 9, 29, 34, '2026-05-12 08:15:00', '2026-05-12 10:45:00', 9000, 'Admin & BAU – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-05-12', 0),
(9474, 9, 26, 34, '2026-05-14 08:30:00', '2026-05-14 11:00:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-05-14', 0),
(9475, 9, 27, 34, '2026-05-15 08:15:00', '2026-05-15 12:15:00', 14400, 'Governance & reporting – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:26', '2026-05-15', 0),
(9476, 9, 27, 34, '2026-05-18 08:30:00', '2026-05-18 12:00:00', 12600, 'Governance & reporting – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:26', '2026-05-18', 0),
(9477, 9, 30, 34, '2026-05-19 08:30:00', '2026-05-19 12:00:00', 12600, 'Training – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:26', '2026-05-19', 0),
(9478, 9, 26, 34, '2026-05-26 08:15:00', '2026-05-26 11:45:00', 12600, 'Project delivery – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:26', '2026-05-26', 0),
(9479, 9, 26, 34, '2026-05-27 08:00:00', '2026-05-27 12:00:00', 14400, 'Project delivery – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:26', '2026-05-27', 0),
(9480, 9, 31, 34, '2026-05-29 08:15:00', '2026-05-29 15:15:00', 25200, 'Meetings – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-05-29', 0),
(9481, 9, 29, 34, '2026-06-01 08:30:00', '2026-06-01 12:00:00', 12600, 'Admin & BAU – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:26', '2026-06-01', 0),
(9482, 9, 26, 34, '2026-06-02 08:30:00', '2026-06-02 11:30:00', 10800, 'Project delivery – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:26', '2026-06-02', 0),
(9483, 9, 29, 34, '2026-06-03 08:30:00', '2026-06-03 10:30:00', 7200, 'Admin & BAU – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-06-03', 0),
(9484, 9, 29, 34, '2026-06-08 08:00:00', '2026-06-08 12:00:00', 14400, 'Admin & BAU – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:26', '2026-06-08', 0),
(9485, 9, 27, 34, '2026-06-09 08:00:00', '2026-06-09 15:00:00', 25200, 'Governance & reporting – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-06-09', 0),
(9486, 9, 26, 34, '2026-06-15 08:00:00', '2026-06-15 13:00:00', 18000, 'Project delivery – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:26', '2026-06-15', 0),
(9487, 9, 26, 34, '2026-06-19 08:15:00', '2026-06-19 10:45:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-06-19', 0),
(9488, 9, 26, 34, '2026-06-22 08:30:00', '2026-06-22 15:30:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-06-22', 0),
(9489, 9, 29, 34, '2026-06-23 08:15:00', '2026-06-23 10:45:00', 9000, 'Admin & BAU – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:26', '2026-06-23', 0),
(9490, 9, 26, 34, '2026-06-24 08:00:00', '2026-06-24 14:30:00', 23400, 'Project delivery – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-06-24', 0),
(9491, 9, 27, 34, '2026-06-25 08:30:00', '2026-06-25 15:30:00', 25200, 'Governance & reporting – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-06-25', 0),
(9492, 9, 26, 34, '2026-06-26 08:15:00', '2026-06-26 15:39:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-06-26', 0),
(9493, 9, 26, 34, '2026-06-29 08:15:00', '2026-06-29 14:15:00', 21600, 'Project delivery – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:26', '2026-06-29', 0),
(9494, 9, 29, 34, '2026-06-30 08:00:00', '2026-06-30 10:00:00', 7200, 'Admin & BAU – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-06-30', 0),
(9495, 9, 26, 34, '2026-07-02 08:15:00', '2026-07-02 15:39:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-07-02', 0),
(9496, 9, 28, 34, '2026-07-03 08:30:00', '2026-07-03 15:00:00', 23400, 'Stakeholder engagement – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-07-03', 0),
(9497, 9, 28, 34, '2026-07-06 08:00:00', '2026-07-06 10:00:00', 7200, 'Stakeholder engagement – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-07-06', 0),
(9498, 9, 26, 34, '2026-07-08 08:00:00', '2026-07-08 14:00:00', 21600, 'Project delivery – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:26', '2026-07-08', 0),
(9499, 9, 26, 34, '2026-07-10 08:30:00', '2026-07-10 15:54:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-07-10', 0),
(9500, 9, 28, 34, '2026-07-13 08:15:00', '2026-07-13 15:15:00', 25200, 'Stakeholder engagement – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-07-13', 0),
(9501, 9, 26, 34, '2026-07-14 08:30:00', '2026-07-14 12:00:00', 12600, 'Project delivery – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:26', '2026-07-14', 0),
(9502, 9, 28, 34, '2026-07-16 08:00:00', '2026-07-16 15:24:00', 26640, 'Stakeholder engagement – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:26', '2026-07-16', 0),
(9503, 9, 26, 34, '2026-07-21 08:30:00', '2026-07-21 15:30:00', 25200, 'Project delivery – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:26', '2026-07-21', 0),
(9504, 9, 28, 34, '2026-07-22 08:00:00', '2026-07-22 13:00:00', 18000, 'Stakeholder engagement – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:26', '2026-07-22', 0),
(9505, 9, 28, 34, '2026-07-28 08:00:00', '2026-07-28 10:00:00', 7200, 'Stakeholder engagement – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-07-28', 0),
(9506, 9, 26, 34, '2026-07-29 08:15:00', '2026-07-29 13:15:00', 18000, 'Project delivery – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:26', '2026-07-29', 0),
(9507, 9, 29, 34, '2026-07-30 08:30:00', '2026-07-30 14:30:00', 21600, 'Admin & BAU – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:26', '2026-07-30', 0),
(9508, 9, 29, 34, '2026-08-03 08:15:00', '2026-08-03 13:15:00', 18000, 'Admin & BAU – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:26', '2026-08-03', 0),
(9509, 9, 27, 34, '2026-08-04 08:30:00', '2026-08-04 15:00:00', 23400, 'Governance & reporting – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:26', '2026-08-04', 0),
(9510, 9, 29, 34, '2026-08-05 08:30:00', '2026-08-05 10:30:00', 7200, 'Admin & BAU – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-08-05', 0),
(9511, 9, 26, 34, '2026-08-07 08:00:00', '2026-08-07 10:00:00', 7200, 'Project delivery – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:26', '2026-08-07', 0),
(9512, 9, 26, 34, '2026-08-10 08:30:00', '2026-08-10 15:54:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-08-10', 0),
(9513, 9, 26, 34, '2026-08-12 08:00:00', '2026-08-12 14:30:00', 23400, 'Project delivery – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-08-12', 0),
(9514, 9, 26, 34, '2026-08-13 08:00:00', '2026-08-13 11:00:00', 10800, 'Project delivery – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-08-13', 0),
(9515, 9, 27, 34, '2026-08-17 08:15:00', '2026-08-17 15:39:00', 26640, 'Governance & reporting – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-08-17', 0),
(9516, 9, 29, 34, '2026-08-18 08:15:00', '2026-08-18 14:45:00', 23400, 'Admin & BAU – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-08-18', 0),
(9517, 9, 30, 34, '2026-08-20 08:00:00', '2026-08-20 14:30:00', 23400, 'Training – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-08-20', 0),
(9518, 9, 26, 34, '2026-08-21 08:30:00', '2026-08-21 14:30:00', 21600, 'Project delivery – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-08-21', 0),
(9519, 9, 26, 34, '2026-08-24 08:15:00', '2026-08-24 14:45:00', 23400, 'Project delivery – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-08-24', 0),
(9520, 9, 26, 34, '2026-08-25 08:00:00', '2026-08-25 14:30:00', 23400, 'Project delivery – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-08-25', 0),
(9521, 9, 27, 34, '2026-08-26 08:00:00', '2026-08-26 11:00:00', 10800, 'Governance & reporting – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-08-26', 0),
(9522, 9, 26, 34, '2026-08-27 08:30:00', '2026-08-27 10:30:00', 7200, 'Project delivery – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:27', '2026-08-27', 0),
(9523, 9, 29, 34, '2026-09-02 08:30:00', '2026-09-02 15:00:00', 23400, 'Admin & BAU – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-09-02', 0),
(9524, 9, 26, 34, '2026-09-03 08:15:00', '2026-09-03 14:15:00', 21600, 'Project delivery – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-09-03', 0),
(9525, 9, 31, 34, '2026-09-04 08:15:00', '2026-09-04 14:45:00', 23400, 'Meetings – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-09-04', 0),
(9526, 9, 30, 34, '2026-09-09 08:00:00', '2026-09-09 15:24:00', 26640, 'Training – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-09-09', 0),
(9527, 9, 26, 34, '2026-09-11 08:30:00', '2026-09-11 12:30:00', 14400, 'Project delivery – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-09-11', 0),
(9528, 9, 31, 34, '2026-09-16 08:15:00', '2026-09-16 11:15:00', 10800, 'Meetings – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-09-16', 0),
(9529, 9, 29, 34, '2026-09-17 08:30:00', '2026-09-17 15:30:00', 25200, 'Admin & BAU – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-09-17', 0),
(9530, 9, 26, 34, '2026-09-18 08:30:00', '2026-09-18 12:00:00', 12600, 'Project delivery – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-09-18', 0),
(9531, 9, 28, 34, '2026-09-21 08:30:00', '2026-09-21 15:00:00', 23400, 'Stakeholder engagement – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-09-21', 0),
(9532, 9, 26, 34, '2026-09-22 08:15:00', '2026-09-22 14:45:00', 23400, 'Project delivery – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-09-22', 0),
(9533, 9, 27, 34, '2026-09-23 08:15:00', '2026-09-23 15:39:00', 26640, 'Governance & reporting – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-09-23', 0),
(9534, 9, 28, 34, '2026-09-24 08:15:00', '2026-09-24 11:15:00', 10800, 'Stakeholder engagement – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-09-24', 0),
(9535, 9, 26, 34, '2026-09-25 08:00:00', '2026-09-25 12:00:00', 14400, 'Project delivery – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-09-25', 0),
(9536, 9, 26, 34, '2026-09-29 08:00:00', '2026-09-29 10:30:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-09-29', 0),
(9537, 9, 26, 34, '2026-09-30 08:30:00', '2026-09-30 15:54:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-09-30', 0),
(9538, 9, 26, 34, '2026-10-01 08:00:00', '2026-10-01 14:00:00', 21600, 'Project delivery – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-10-01', 0),
(9539, 9, 28, 34, '2026-10-06 08:30:00', '2026-10-06 12:00:00', 12600, 'Stakeholder engagement – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-10-06', 0),
(9540, 9, 26, 34, '2026-10-07 08:00:00', '2026-10-07 13:00:00', 18000, 'Project delivery – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-10-07', 0),
(9541, 9, 26, 34, '2026-10-08 08:15:00', '2026-10-08 14:15:00', 21600, 'Project delivery – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-10-08', 0),
(9542, 9, 28, 34, '2026-10-12 08:30:00', '2026-10-12 15:54:00', 26640, 'Stakeholder engagement – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-10-12', 0),
(9543, 9, 29, 34, '2026-10-14 08:00:00', '2026-10-14 10:00:00', 7200, 'Admin & BAU – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:27', '2026-10-14', 0),
(9544, 9, 27, 34, '2026-10-15 08:15:00', '2026-10-15 15:15:00', 25200, 'Governance & reporting – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-10-15', 0),
(9545, 9, 30, 34, '2026-10-16 08:15:00', '2026-10-16 11:15:00', 10800, 'Training – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-10-16', 0),
(9546, 9, 26, 34, '2026-10-19 08:30:00', '2026-10-19 10:30:00', 7200, 'Project delivery – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:27', '2026-10-19', 0),
(9547, 9, 28, 34, '2026-10-20 08:15:00', '2026-10-20 12:15:00', 14400, 'Stakeholder engagement – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-10-20', 0),
(9548, 9, 26, 34, '2026-10-21 08:30:00', '2026-10-21 15:54:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-10-21', 0),
(9549, 9, 26, 34, '2026-10-22 08:15:00', '2026-10-22 15:39:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-10-22', 0),
(9550, 9, 26, 34, '2026-10-23 08:15:00', '2026-10-23 15:39:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-10-23', 0),
(9551, 9, 29, 34, '2026-10-26 09:00:00', '2026-10-26 16:00:00', 25200, 'Admin & BAU – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-10-26', 0),
(9552, 9, 29, 34, '2026-10-27 09:15:00', '2026-10-27 16:39:00', 26640, 'Admin & BAU – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-10-27', 0),
(9553, 9, 27, 34, '2026-10-28 09:30:00', '2026-10-28 13:30:00', 14400, 'Governance & reporting – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-10-28', 0),
(9554, 9, 26, 34, '2026-10-29 09:15:00', '2026-10-29 11:45:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-10-29', 0),
(9555, 9, 27, 34, '2026-10-30 09:00:00', '2026-10-30 14:00:00', 18000, 'Governance & reporting – BAU – Transport', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-10-30', 0),
(9556, 9, 28, 34, '2026-11-02 09:15:00', '2026-11-02 15:15:00', 21600, 'Stakeholder engagement – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-11-02', 0),
(9557, 9, 29, 34, '2026-11-03 09:30:00', '2026-11-03 13:30:00', 14400, 'Admin & BAU – BAU – Transport', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-11-03', 0),
(9558, 9, 26, 34, '2026-11-04 09:00:00', '2026-11-04 11:30:00', 9000, 'Project delivery – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-11-04', 0),
(9559, 9, 26, 34, '2026-11-06 09:30:00', '2026-11-06 12:30:00', 10800, 'Project delivery – BAU – Transport', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-11-06', 0),
(9560, 9, 28, 34, '2026-11-09 09:00:00', '2026-11-09 12:30:00', 12600, 'Stakeholder engagement – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-11-09', 0),
(9561, 9, 28, 34, '2026-11-11 09:15:00', '2026-11-11 11:45:00', 9000, 'Stakeholder engagement – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-11-11', 0),
(9562, 9, 26, 34, '2026-11-12 09:30:00', '2026-11-12 13:00:00', 12600, 'Project delivery – BAU – Transport', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-11-12', 0),
(9563, 9, 31, 34, '2026-11-13 09:00:00', '2026-11-13 11:30:00', 9000, 'Meetings – BAU – Transport', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-11-13', 0),
(9564, 9, 29, 34, '2026-11-16 09:30:00', '2026-11-16 15:30:00', 21600, 'Admin & BAU – BAU – Transport', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-11-16', 0),
(9565, 9, 26, 34, '2026-11-17 09:30:00', '2026-11-17 11:30:00', 7200, 'Project delivery – BAU – Transport', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:27', '2026-11-17', 0),
(9566, 9, 28, 34, '2026-11-18 09:30:00', '2026-11-18 16:00:00', 23400, 'Stakeholder engagement – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-11-18', 0),
(9567, 9, 29, 34, '2026-11-20 09:15:00', '2026-11-20 16:39:00', 26640, 'Admin & BAU – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-11-20', 0),
(9568, 9, 27, 34, '2026-11-23 09:00:00', '2026-11-23 16:00:00', 25200, 'Governance & reporting – BAU – Transport', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-11-23', 0),
(9569, 9, 26, 34, '2026-11-25 09:15:00', '2026-11-25 16:39:00', 26640, 'Project delivery – BAU – Transport', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-11-25', 0),
(9570, 9, 28, 34, '2026-11-26 09:00:00', '2026-11-26 15:30:00', 23400, 'Stakeholder engagement – BAU – Transport', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-11-26', 0),
(9571, 11, 26, 34, '2026-01-07 09:15:00', '2026-01-07 14:15:00', 18000, 'Project delivery – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-01-07', 0),
(9572, 11, 29, 34, '2026-01-08 09:00:00', '2026-01-08 16:24:00', 26640, 'Admin & BAU – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-01-08', 0),
(9573, 11, 27, 34, '2026-01-09 09:15:00', '2026-01-09 14:15:00', 18000, 'Governance & reporting – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-01-09', 0),
(9574, 11, 28, 34, '2026-01-12 09:30:00', '2026-01-12 16:00:00', 23400, 'Stakeholder engagement – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-12', 0),
(9575, 11, 26, 34, '2026-01-13 09:15:00', '2026-01-13 16:15:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-01-13', 0),
(9576, 11, 26, 34, '2026-01-14 09:30:00', '2026-01-14 16:00:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-14', 0),
(9577, 11, 26, 34, '2026-01-16 09:30:00', '2026-01-16 13:30:00', 14400, 'Project delivery – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-01-16', 0),
(9578, 11, 29, 34, '2026-01-20 09:30:00', '2026-01-20 12:30:00', 10800, 'Admin & BAU – BAU – Transport', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:27', '2026-01-20', 0),
(9579, 11, 29, 34, '2026-01-21 09:30:00', '2026-01-21 13:00:00', 12600, 'Admin & BAU – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-01-21', 0),
(9580, 11, 26, 34, '2026-01-22 09:15:00', '2026-01-22 13:15:00', 14400, 'Project delivery – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-01-22', 0),
(9581, 11, 29, 34, '2026-01-26 09:30:00', '2026-01-26 13:00:00', 12600, 'Admin & BAU – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-01-26', 0),
(9582, 11, 29, 34, '2026-01-27 09:00:00', '2026-01-27 16:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-01-27', 0),
(9583, 11, 26, 34, '2026-01-28 09:30:00', '2026-01-28 16:00:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-28', 0),
(9584, 11, 26, 34, '2026-01-30 09:00:00', '2026-01-30 16:00:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-01-30', 0),
(9585, 11, 26, 34, '2026-02-02 09:30:00', '2026-02-02 16:00:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-02-02', 0),
(9586, 11, 27, 34, '2026-02-04 09:00:00', '2026-02-04 14:00:00', 18000, 'Governance & reporting – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-02-04', 0),
(9587, 11, 31, 34, '2026-02-05 09:00:00', '2026-02-05 12:30:00', 12600, 'Meetings – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-02-05', 0),
(9588, 11, 26, 34, '2026-02-06 09:15:00', '2026-02-06 15:15:00', 21600, 'Project delivery – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-02-06', 0),
(9589, 11, 26, 34, '2026-02-09 09:15:00', '2026-02-09 11:15:00', 7200, 'Project delivery – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-02-09', 0),
(9590, 11, 26, 34, '2026-02-10 09:00:00', '2026-02-10 11:30:00', 9000, 'Project delivery – BAU – Transport', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:27', '2026-02-10', 0),
(9591, 11, 26, 34, '2026-02-11 09:15:00', '2026-02-11 12:45:00', 12600, 'Project delivery – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-02-11', 0),
(9592, 11, 30, 34, '2026-02-12 09:00:00', '2026-02-12 12:00:00', 10800, 'Training – BAU – Transport', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:27', '2026-02-12', 0),
(9593, 11, 26, 34, '2026-02-13 09:15:00', '2026-02-13 14:15:00', 18000, 'Project delivery – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-02-13', 0),
(9594, 11, 29, 34, '2026-02-16 09:30:00', '2026-02-16 15:30:00', 21600, 'Admin & BAU – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-02-16', 0),
(9595, 11, 29, 34, '2026-02-18 09:00:00', '2026-02-18 15:00:00', 21600, 'Admin & BAU – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-02-18', 0),
(9596, 11, 28, 34, '2026-02-19 09:30:00', '2026-02-19 13:30:00', 14400, 'Stakeholder engagement – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-02-19', 0),
(9597, 11, 29, 34, '2026-02-20 09:30:00', '2026-02-20 16:30:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-02-20', 0),
(9598, 11, 27, 34, '2026-02-26 09:00:00', '2026-02-26 16:00:00', 25200, 'Governance & reporting – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-02-26', 0),
(9599, 11, 31, 34, '2026-02-27 09:30:00', '2026-02-27 13:30:00', 14400, 'Meetings – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-02-27', 0),
(9600, 11, 29, 34, '2026-03-03 09:30:00', '2026-03-03 16:30:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-03-03', 0),
(9601, 11, 29, 34, '2026-03-04 09:15:00', '2026-03-04 16:39:00', 26640, 'Admin & BAU – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-03-04', 0),
(9602, 11, 26, 34, '2026-03-05 09:15:00', '2026-03-05 14:15:00', 18000, 'Project delivery – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-03-05', 0),
(9603, 11, 26, 34, '2026-03-06 09:15:00', '2026-03-06 16:39:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-03-06', 0),
(9604, 11, 26, 34, '2026-03-09 09:30:00', '2026-03-09 13:30:00', 14400, 'Project delivery – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-03-09', 0),
(9605, 11, 26, 34, '2026-03-10 09:15:00', '2026-03-10 12:45:00', 12600, 'Project delivery – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-03-10', 0),
(9606, 11, 26, 34, '2026-03-11 09:00:00', '2026-03-11 16:00:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-03-11', 0),
(9607, 11, 26, 34, '2026-03-13 09:00:00', '2026-03-13 15:30:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-03-13', 0),
(9608, 11, 31, 34, '2026-03-17 09:15:00', '2026-03-17 16:15:00', 25200, 'Meetings – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-03-17', 0),
(9609, 11, 26, 34, '2026-03-18 09:30:00', '2026-03-18 12:30:00', 10800, 'Project delivery – BAU – Transport', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:27', '2026-03-18', 0),
(9610, 11, 26, 34, '2026-03-20 09:00:00', '2026-03-20 13:00:00', 14400, 'Project delivery – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-03-20', 0),
(9611, 11, 26, 34, '2026-03-24 09:15:00', '2026-03-24 13:15:00', 14400, 'Project delivery – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-03-24', 0),
(9612, 11, 29, 34, '2026-03-25 09:15:00', '2026-03-25 12:15:00', 10800, 'Admin & BAU – BAU – Transport', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:27', '2026-03-25', 0),
(9613, 11, 29, 34, '2026-03-26 09:30:00', '2026-03-26 16:30:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-03-26', 0),
(9614, 11, 29, 34, '2026-03-27 09:00:00', '2026-03-27 16:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-03-27', 0),
(9615, 11, 26, 34, '2026-03-31 08:30:00', '2026-03-31 14:30:00', 21600, 'Project delivery – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-03-31', 0),
(9616, 11, 29, 34, '2026-04-02 08:00:00', '2026-04-02 12:00:00', 14400, 'Admin & BAU – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-04-02', 0),
(9617, 11, 26, 34, '2026-04-06 08:30:00', '2026-04-06 15:54:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-04-06', 0),
(9618, 11, 29, 34, '2026-04-08 08:00:00', '2026-04-08 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-04-08', 0),
(9619, 11, 29, 34, '2026-04-09 08:30:00', '2026-04-09 15:30:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-04-09', 0),
(9620, 11, 28, 34, '2026-04-10 08:30:00', '2026-04-10 12:00:00', 12600, 'Stakeholder engagement – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-04-10', 0),
(9621, 11, 26, 34, '2026-04-17 08:00:00', '2026-04-17 13:00:00', 18000, 'Project delivery – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-04-17', 0),
(9622, 11, 26, 34, '2026-04-21 08:30:00', '2026-04-21 12:00:00', 12600, 'Project delivery – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-04-21', 0),
(9623, 11, 27, 34, '2026-04-22 08:30:00', '2026-04-22 15:30:00', 25200, 'Governance & reporting – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-04-22', 0),
(9624, 11, 26, 34, '2026-04-23 08:15:00', '2026-04-23 14:45:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-04-23', 0),
(9625, 11, 29, 34, '2026-04-27 08:00:00', '2026-04-27 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-04-27', 0),
(9626, 11, 28, 34, '2026-04-30 08:15:00', '2026-04-30 14:45:00', 23400, 'Stakeholder engagement – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-04-30', 0),
(9627, 11, 29, 34, '2026-05-04 08:30:00', '2026-05-04 10:30:00', 7200, 'Admin & BAU – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-05-04', 0),
(9628, 11, 26, 34, '2026-05-05 08:30:00', '2026-05-05 15:30:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-05-05', 0),
(9629, 11, 26, 34, '2026-05-07 08:30:00', '2026-05-07 14:30:00', 21600, 'Project delivery – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-05-07', 0),
(9630, 11, 26, 34, '2026-05-08 08:30:00', '2026-05-08 10:30:00', 7200, 'Project delivery – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-05-08', 0),
(9631, 11, 26, 34, '2026-05-11 08:15:00', '2026-05-11 15:15:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-05-11', 0),
(9632, 11, 29, 34, '2026-05-12 08:30:00', '2026-05-12 15:00:00', 23400, 'Admin & BAU – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-05-12', 0),
(9633, 11, 27, 34, '2026-05-14 08:15:00', '2026-05-14 15:39:00', 26640, 'Governance & reporting – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-14', 0),
(9634, 11, 27, 34, '2026-05-15 08:15:00', '2026-05-15 15:39:00', 26640, 'Governance & reporting – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-15', 0),
(9635, 11, 26, 34, '2026-05-18 08:15:00', '2026-05-18 15:39:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-18', 0),
(9636, 11, 29, 34, '2026-05-19 08:15:00', '2026-05-19 11:45:00', 12600, 'Admin & BAU – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-05-19', 0),
(9637, 11, 29, 34, '2026-05-20 08:15:00', '2026-05-20 15:39:00', 26640, 'Admin & BAU – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-20', 0),
(9638, 11, 28, 34, '2026-05-21 08:30:00', '2026-05-21 11:00:00', 9000, 'Stakeholder engagement – BAU – Transport', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:27', '2026-05-21', 0),
(9639, 11, 26, 34, '2026-05-25 08:00:00', '2026-05-25 15:00:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-05-25', 0),
(9640, 11, 26, 34, '2026-05-26 08:30:00', '2026-05-26 11:30:00', 10800, 'Project delivery – BAU – Transport', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:27', '2026-05-26', 0),
(9641, 11, 26, 34, '2026-05-27 08:15:00', '2026-05-27 15:39:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-27', 0),
(9642, 11, 30, 34, '2026-06-01 08:00:00', '2026-06-01 11:00:00', 10800, 'Training – BAU – Transport', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:27', '2026-06-01', 0),
(9643, 11, 27, 34, '2026-06-02 08:30:00', '2026-06-02 12:00:00', 12600, 'Governance & reporting – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-06-02', 0),
(9644, 11, 28, 34, '2026-06-03 08:15:00', '2026-06-03 14:45:00', 23400, 'Stakeholder engagement – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-03', 0),
(9645, 11, 27, 34, '2026-06-08 08:15:00', '2026-06-08 10:15:00', 7200, 'Governance & reporting – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-06-08', 0),
(9646, 11, 26, 34, '2026-06-09 08:30:00', '2026-06-09 11:00:00', 9000, 'Project delivery – BAU – Transport', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:27', '2026-06-09', 0),
(9647, 11, 28, 34, '2026-06-11 08:30:00', '2026-06-11 12:00:00', 12600, 'Stakeholder engagement – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-06-11', 0),
(9648, 11, 26, 34, '2026-06-12 08:30:00', '2026-06-12 15:54:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-06-12', 0),
(9649, 11, 29, 34, '2026-06-15 08:30:00', '2026-06-15 15:54:00', 26640, 'Admin & BAU – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-06-15', 0),
(9650, 11, 29, 34, '2026-06-18 08:30:00', '2026-06-18 12:30:00', 14400, 'Admin & BAU – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-06-18', 0),
(9651, 11, 29, 34, '2026-06-22 08:00:00', '2026-06-22 13:00:00', 18000, 'Admin & BAU – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-06-22', 0),
(9652, 11, 28, 34, '2026-06-24 08:00:00', '2026-06-24 10:00:00', 7200, 'Stakeholder engagement – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-06-24', 0),
(9653, 11, 27, 34, '2026-06-26 08:30:00', '2026-06-26 15:00:00', 23400, 'Governance & reporting – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-26', 0),
(9654, 11, 30, 34, '2026-07-01 08:30:00', '2026-07-01 12:00:00', 12600, 'Training – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-07-01', 0),
(9655, 11, 31, 34, '2026-07-03 08:30:00', '2026-07-03 15:30:00', 25200, 'Meetings – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-07-03', 0),
(9656, 11, 29, 34, '2026-07-06 08:15:00', '2026-07-06 14:45:00', 23400, 'Admin & BAU – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-07-06', 0),
(9657, 11, 27, 34, '2026-07-07 08:15:00', '2026-07-07 15:39:00', 26640, 'Governance & reporting – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-07-07', 0),
(9658, 11, 26, 34, '2026-07-08 08:00:00', '2026-07-08 10:00:00', 7200, 'Project delivery – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-07-08', 0),
(9659, 11, 29, 34, '2026-07-14 08:15:00', '2026-07-14 12:15:00', 14400, 'Admin & BAU – BAU – Transport', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:27', '2026-07-14', 0),
(9660, 11, 28, 34, '2026-07-15 08:00:00', '2026-07-15 10:30:00', 9000, 'Stakeholder engagement – BAU – Transport', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:27', '2026-07-15', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(9661, 11, 26, 34, '2026-07-16 08:00:00', '2026-07-16 15:24:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-07-16', 0),
(9662, 11, 28, 34, '2026-07-21 08:30:00', '2026-07-21 10:30:00', 7200, 'Stakeholder engagement – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-07-21', 0),
(9663, 11, 28, 34, '2026-07-28 08:00:00', '2026-07-28 10:00:00', 7200, 'Stakeholder engagement – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-07-28', 0),
(9664, 11, 29, 34, '2026-07-29 08:15:00', '2026-07-29 11:45:00', 12600, 'Admin & BAU – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-07-29', 0),
(9665, 11, 26, 34, '2026-07-30 08:30:00', '2026-07-30 15:54:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-07-30', 0),
(9666, 11, 26, 34, '2026-07-31 08:15:00', '2026-07-31 15:39:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-07-31', 0),
(9667, 11, 26, 34, '2026-08-03 08:00:00', '2026-08-03 14:30:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-08-03', 0),
(9668, 11, 26, 34, '2026-08-04 08:15:00', '2026-08-04 15:15:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-08-04', 0),
(9669, 11, 29, 34, '2026-08-05 08:00:00', '2026-08-05 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-08-05', 0),
(9670, 11, 28, 34, '2026-08-06 08:00:00', '2026-08-06 14:00:00', 21600, 'Stakeholder engagement – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-08-06', 0),
(9671, 11, 30, 34, '2026-08-07 08:15:00', '2026-08-07 15:15:00', 25200, 'Training – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-08-07', 0),
(9672, 11, 26, 34, '2026-08-10 08:30:00', '2026-08-10 15:54:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-08-10', 0),
(9673, 11, 30, 34, '2026-08-12 08:30:00', '2026-08-12 11:00:00', 9000, 'Training – BAU – Transport', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:27', '2026-08-12', 0),
(9674, 11, 30, 34, '2026-08-13 08:15:00', '2026-08-13 14:45:00', 23400, 'Training – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-08-13', 0),
(9675, 11, 26, 34, '2026-08-14 08:00:00', '2026-08-14 14:30:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-08-14', 0),
(9676, 11, 26, 34, '2026-08-18 08:00:00', '2026-08-18 15:24:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-08-18', 0),
(9677, 11, 29, 34, '2026-08-19 08:15:00', '2026-08-19 11:45:00', 12600, 'Admin & BAU – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-08-19', 0),
(9678, 11, 30, 34, '2026-08-20 08:15:00', '2026-08-20 13:15:00', 18000, 'Training – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-08-20', 0),
(9679, 11, 26, 34, '2026-08-21 08:30:00', '2026-08-21 13:30:00', 18000, 'Project delivery – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-08-21', 0),
(9680, 11, 28, 34, '2026-08-24 08:15:00', '2026-08-24 15:39:00', 26640, 'Stakeholder engagement – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-08-24', 0),
(9681, 11, 26, 34, '2026-08-28 08:30:00', '2026-08-28 10:30:00', 7200, 'Project delivery – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-08-28', 0),
(9682, 11, 26, 34, '2026-08-31 08:30:00', '2026-08-31 11:00:00', 9000, 'Project delivery – BAU – Transport', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:27', '2026-08-31', 0),
(9683, 11, 31, 34, '2026-09-02 08:00:00', '2026-09-02 14:00:00', 21600, 'Meetings – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-09-02', 0),
(9684, 11, 28, 34, '2026-09-03 08:15:00', '2026-09-03 15:39:00', 26640, 'Stakeholder engagement – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-09-03', 0),
(9685, 11, 26, 34, '2026-09-04 08:00:00', '2026-09-04 15:00:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-09-04', 0),
(9686, 11, 28, 34, '2026-09-07 08:15:00', '2026-09-07 15:15:00', 25200, 'Stakeholder engagement – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-09-07', 0),
(9687, 11, 31, 34, '2026-09-08 08:00:00', '2026-09-08 14:00:00', 21600, 'Meetings – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-09-08', 0),
(9688, 11, 27, 34, '2026-09-09 08:00:00', '2026-09-09 15:24:00', 26640, 'Governance & reporting – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-09-09', 0),
(9689, 11, 28, 34, '2026-09-10 08:30:00', '2026-09-10 15:00:00', 23400, 'Stakeholder engagement – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-09-10', 0),
(9690, 11, 28, 34, '2026-09-11 08:30:00', '2026-09-11 14:30:00', 21600, 'Stakeholder engagement – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-09-11', 0),
(9691, 11, 29, 34, '2026-09-14 08:00:00', '2026-09-14 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-09-14', 0),
(9692, 11, 29, 34, '2026-09-16 08:30:00', '2026-09-16 15:30:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-09-16', 0),
(9693, 11, 26, 34, '2026-09-18 08:30:00', '2026-09-18 15:30:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-09-18', 0),
(9694, 11, 29, 34, '2026-09-24 08:00:00', '2026-09-24 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-09-24', 0),
(9695, 11, 29, 34, '2026-09-25 08:30:00', '2026-09-25 15:30:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-09-25', 0),
(9696, 11, 29, 34, '2026-09-29 08:00:00', '2026-09-29 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-09-29', 0),
(9697, 11, 27, 34, '2026-10-05 08:00:00', '2026-10-05 11:30:00', 12600, 'Governance & reporting – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-10-05', 0),
(9698, 11, 27, 34, '2026-10-08 08:30:00', '2026-10-08 14:30:00', 21600, 'Governance & reporting – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-10-08', 0),
(9699, 11, 29, 34, '2026-10-09 08:15:00', '2026-10-09 13:15:00', 18000, 'Admin & BAU – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-10-09', 0),
(9700, 11, 27, 34, '2026-10-12 08:30:00', '2026-10-12 11:30:00', 10800, 'Governance & reporting – BAU – Transport', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:27', '2026-10-12', 0),
(9701, 11, 29, 34, '2026-10-13 08:00:00', '2026-10-13 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-13', 0),
(9702, 11, 29, 34, '2026-10-15 08:15:00', '2026-10-15 14:45:00', 23400, 'Admin & BAU – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-10-15', 0),
(9703, 11, 26, 34, '2026-10-16 08:15:00', '2026-10-16 15:15:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-16', 0),
(9704, 11, 26, 34, '2026-10-19 08:15:00', '2026-10-19 15:15:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-19', 0),
(9705, 11, 30, 34, '2026-10-20 08:00:00', '2026-10-20 15:00:00', 25200, 'Training – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-20', 0),
(9706, 11, 26, 34, '2026-10-21 08:00:00', '2026-10-21 15:00:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-21', 0),
(9707, 11, 26, 34, '2026-10-22 08:30:00', '2026-10-22 15:30:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-22', 0),
(9708, 11, 27, 34, '2026-10-23 08:30:00', '2026-10-23 15:30:00', 25200, 'Governance & reporting – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-23', 0),
(9709, 11, 29, 34, '2026-10-26 09:15:00', '2026-10-26 11:45:00', 9000, 'Admin & BAU – BAU – Transport', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:27', '2026-10-26', 0),
(9710, 11, 29, 34, '2026-10-27 09:30:00', '2026-10-27 12:30:00', 10800, 'Admin & BAU – BAU – Transport', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:27', '2026-10-27', 0),
(9711, 11, 29, 34, '2026-10-28 09:30:00', '2026-10-28 16:30:00', 25200, 'Admin & BAU – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-28', 0),
(9712, 11, 27, 34, '2026-10-29 09:00:00', '2026-10-29 16:00:00', 25200, 'Governance & reporting – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-10-29', 0),
(9713, 11, 26, 34, '2026-10-30 09:00:00', '2026-10-30 16:24:00', 26640, 'Project delivery – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-10-30', 0),
(9714, 11, 26, 34, '2026-11-02 09:00:00', '2026-11-02 15:30:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-11-02', 0),
(9715, 11, 27, 34, '2026-11-03 09:30:00', '2026-11-03 16:00:00', 23400, 'Governance & reporting – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-11-03', 0),
(9716, 11, 26, 34, '2026-11-04 09:15:00', '2026-11-04 15:15:00', 21600, 'Project delivery – BAU – Transport', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:27', '2026-11-04', 0),
(9717, 11, 26, 34, '2026-11-05 09:00:00', '2026-11-05 11:00:00', 7200, 'Project delivery – BAU – Transport', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:27', '2026-11-05', 0),
(9718, 11, 26, 34, '2026-11-09 09:30:00', '2026-11-09 14:30:00', 18000, 'Project delivery – BAU – Transport', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:27', '2026-11-09', 0),
(9719, 11, 26, 34, '2026-11-10 09:00:00', '2026-11-10 15:30:00', 23400, 'Project delivery – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-11-10', 0),
(9720, 11, 26, 34, '2026-11-11 09:00:00', '2026-11-11 11:30:00', 9000, 'Project delivery – BAU – Transport', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:27', '2026-11-11', 0),
(9721, 11, 27, 34, '2026-11-12 09:30:00', '2026-11-12 16:54:00', 26640, 'Governance & reporting – BAU – Transport', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:27', '2026-11-12', 0),
(9722, 11, 26, 34, '2026-11-13 09:15:00', '2026-11-13 12:45:00', 12600, 'Project delivery – BAU – Transport', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:27', '2026-11-13', 0),
(9723, 11, 31, 34, '2026-11-17 09:15:00', '2026-11-17 16:15:00', 25200, 'Meetings – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-11-17', 0),
(9724, 11, 26, 34, '2026-11-18 09:00:00', '2026-11-18 16:00:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-11-18', 0),
(9725, 11, 27, 34, '2026-11-23 09:30:00', '2026-11-23 16:00:00', 23400, 'Governance & reporting – BAU – Transport', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-11-23', 0),
(9726, 11, 27, 34, '2026-11-24 09:00:00', '2026-11-24 16:00:00', 25200, 'Governance & reporting – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-11-24', 0),
(9727, 11, 26, 34, '2026-11-26 09:30:00', '2026-11-26 16:30:00', 25200, 'Project delivery – BAU – Transport', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:27', '2026-11-26', 0),
(9728, 12, 26, 34, '2026-01-07 09:00:00', '2026-01-07 15:00:00', 21600, 'Project delivery – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-01-07', 0),
(9729, 12, 26, 34, '2026-01-08 09:15:00', '2026-01-08 16:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-08', 0),
(9730, 12, 30, 34, '2026-01-12 09:30:00', '2026-01-12 16:30:00', 25200, 'Training – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-12', 0),
(9731, 12, 29, 34, '2026-01-13 09:30:00', '2026-01-13 13:00:00', 12600, 'Admin & BAU – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-01-13', 0),
(9732, 12, 26, 34, '2026-01-14 09:15:00', '2026-01-14 16:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-14', 0),
(9733, 12, 30, 34, '2026-01-15 09:30:00', '2026-01-15 11:30:00', 7200, 'Training – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-01-15', 0),
(9734, 12, 26, 34, '2026-01-16 09:00:00', '2026-01-16 14:00:00', 18000, 'Project delivery – BAU – Transport', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:27', '2026-01-16', 0),
(9735, 12, 30, 34, '2026-01-19 09:30:00', '2026-01-19 14:30:00', 18000, 'Training – BAU – Transport', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:27', '2026-01-19', 0),
(9736, 12, 27, 34, '2026-01-20 09:00:00', '2026-01-20 16:00:00', 25200, 'Governance & reporting – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-20', 0),
(9737, 12, 31, 34, '2026-01-21 09:00:00', '2026-01-21 11:30:00', 9000, 'Meetings – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-01-21', 0),
(9738, 12, 27, 34, '2026-01-22 09:15:00', '2026-01-22 16:15:00', 25200, 'Governance & reporting – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-22', 0),
(9739, 12, 26, 34, '2026-01-23 09:15:00', '2026-01-23 16:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-01-23', 0),
(9740, 12, 26, 34, '2026-01-27 09:30:00', '2026-01-27 16:00:00', 23400, 'Project delivery – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-01-27', 0),
(9741, 12, 30, 34, '2026-01-28 09:30:00', '2026-01-28 13:30:00', 14400, 'Training – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-01-28', 0),
(9742, 12, 30, 34, '2026-01-29 09:15:00', '2026-01-29 11:15:00', 7200, 'Training – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-01-29', 0),
(9743, 12, 28, 34, '2026-02-02 09:15:00', '2026-02-02 12:15:00', 10800, 'Stakeholder engagement – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-02-02', 0),
(9744, 12, 26, 34, '2026-02-04 09:15:00', '2026-02-04 15:15:00', 21600, 'Project delivery – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-02-04', 0),
(9745, 12, 26, 34, '2026-02-05 09:00:00', '2026-02-05 11:00:00', 7200, 'Project delivery – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-02-05', 0),
(9746, 12, 26, 34, '2026-02-09 09:30:00', '2026-02-09 16:30:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-02-09', 0),
(9747, 12, 29, 34, '2026-02-12 09:30:00', '2026-02-12 12:30:00', 10800, 'Admin & BAU – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-02-12', 0),
(9748, 12, 29, 34, '2026-02-16 09:00:00', '2026-02-16 12:30:00', 12600, 'Admin & BAU – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-02-16', 0),
(9749, 12, 26, 34, '2026-02-17 09:15:00', '2026-02-17 12:45:00', 12600, 'Project delivery – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-02-17', 0),
(9750, 12, 26, 34, '2026-02-18 09:00:00', '2026-02-18 12:30:00', 12600, 'Project delivery – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-02-18', 0),
(9751, 12, 26, 34, '2026-02-20 09:30:00', '2026-02-20 13:00:00', 12600, 'Project delivery – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-02-20', 0),
(9752, 12, 29, 34, '2026-02-23 09:15:00', '2026-02-23 11:45:00', 9000, 'Admin & BAU – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-02-23', 0),
(9753, 12, 26, 34, '2026-02-26 09:15:00', '2026-02-26 16:39:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-02-26', 0),
(9754, 12, 28, 34, '2026-03-02 09:30:00', '2026-03-02 16:30:00', 25200, 'Stakeholder engagement – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-03-02', 0),
(9755, 12, 26, 34, '2026-03-03 09:00:00', '2026-03-03 12:30:00', 12600, 'Project delivery – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-03-03', 0),
(9756, 12, 26, 34, '2026-03-04 09:15:00', '2026-03-04 16:39:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-03-04', 0),
(9757, 12, 26, 34, '2026-03-05 09:30:00', '2026-03-05 16:54:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-03-05', 0),
(9758, 12, 29, 34, '2026-03-06 09:00:00', '2026-03-06 16:24:00', 26640, 'Admin & BAU – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-03-06', 0),
(9759, 12, 26, 34, '2026-03-09 09:30:00', '2026-03-09 16:30:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-03-09', 0),
(9760, 12, 29, 34, '2026-03-10 09:30:00', '2026-03-10 16:00:00', 23400, 'Admin & BAU – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-03-10', 0),
(9761, 12, 26, 34, '2026-03-12 09:30:00', '2026-03-12 12:00:00', 9000, 'Project delivery – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-03-12', 0),
(9762, 12, 26, 34, '2026-03-13 09:00:00', '2026-03-13 12:00:00', 10800, 'Project delivery – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-03-13', 0),
(9763, 12, 28, 34, '2026-03-17 09:00:00', '2026-03-17 15:00:00', 21600, 'Stakeholder engagement – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-03-17', 0),
(9764, 12, 26, 34, '2026-03-18 09:15:00', '2026-03-18 11:15:00', 7200, 'Project delivery – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-03-18', 0),
(9765, 12, 26, 34, '2026-03-19 09:00:00', '2026-03-19 16:24:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-03-19', 0),
(9766, 12, 31, 34, '2026-03-20 09:00:00', '2026-03-20 15:30:00', 23400, 'Meetings – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-03-20', 0),
(9767, 12, 28, 34, '2026-03-23 09:15:00', '2026-03-23 15:15:00', 21600, 'Stakeholder engagement – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-03-23', 0),
(9768, 12, 27, 34, '2026-03-24 09:00:00', '2026-03-24 15:30:00', 23400, 'Governance & reporting – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-03-24', 0),
(9769, 12, 31, 34, '2026-03-26 09:15:00', '2026-03-26 12:45:00', 12600, 'Meetings – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-03-26', 0),
(9770, 12, 26, 34, '2026-03-27 09:00:00', '2026-03-27 15:00:00', 21600, 'Project delivery – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-03-27', 0),
(9771, 12, 28, 34, '2026-03-30 08:00:00', '2026-03-30 15:24:00', 26640, 'Stakeholder engagement – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-03-30', 0),
(9772, 12, 29, 34, '2026-03-31 08:00:00', '2026-03-31 15:24:00', 26640, 'Admin & BAU – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-03-31', 0),
(9773, 12, 28, 34, '2026-04-01 08:15:00', '2026-04-01 10:15:00', 7200, 'Stakeholder engagement – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-04-01', 0),
(9774, 12, 26, 34, '2026-04-02 08:00:00', '2026-04-02 15:00:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-04-02', 0),
(9775, 12, 31, 34, '2026-04-03 08:30:00', '2026-04-03 12:00:00', 12600, 'Meetings – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-04-03', 0),
(9776, 12, 26, 34, '2026-04-06 08:00:00', '2026-04-06 14:30:00', 23400, 'Project delivery – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-04-06', 0),
(9777, 12, 31, 34, '2026-04-07 08:30:00', '2026-04-07 15:54:00', 26640, 'Meetings – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-04-07', 0),
(9778, 12, 26, 34, '2026-04-08 08:00:00', '2026-04-08 15:00:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-04-08', 0),
(9779, 12, 27, 34, '2026-04-09 08:30:00', '2026-04-09 15:00:00', 23400, 'Governance & reporting – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-04-09', 0),
(9780, 12, 28, 34, '2026-04-10 08:00:00', '2026-04-10 15:00:00', 25200, 'Stakeholder engagement – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-04-10', 0),
(9781, 12, 27, 34, '2026-04-14 08:30:00', '2026-04-14 12:00:00', 12600, 'Governance & reporting – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-04-14', 0),
(9782, 12, 30, 34, '2026-04-15 08:30:00', '2026-04-15 15:00:00', 23400, 'Training – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-04-15', 0),
(9783, 12, 27, 34, '2026-04-16 08:00:00', '2026-04-16 14:00:00', 21600, 'Governance & reporting – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-04-16', 0),
(9784, 12, 26, 34, '2026-04-17 08:15:00', '2026-04-17 14:15:00', 21600, 'Project delivery – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-04-17', 0),
(9785, 12, 27, 34, '2026-04-20 08:30:00', '2026-04-20 12:00:00', 12600, 'Governance & reporting – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-04-20', 0),
(9786, 12, 26, 34, '2026-04-21 08:15:00', '2026-04-21 15:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-04-21', 0),
(9787, 12, 27, 34, '2026-04-22 08:15:00', '2026-04-22 14:15:00', 21600, 'Governance & reporting – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-04-22', 0),
(9788, 12, 27, 34, '2026-04-23 08:30:00', '2026-04-23 12:00:00', 12600, 'Governance & reporting – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-04-23', 0),
(9789, 12, 30, 34, '2026-04-27 08:00:00', '2026-04-27 14:30:00', 23400, 'Training – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-04-27', 0),
(9790, 12, 28, 34, '2026-04-28 08:30:00', '2026-04-28 12:30:00', 14400, 'Stakeholder engagement – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-04-28', 0),
(9791, 12, 26, 34, '2026-04-30 08:00:00', '2026-04-30 11:30:00', 12600, 'Project delivery – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-04-30', 0),
(9792, 12, 29, 34, '2026-05-01 08:15:00', '2026-05-01 15:39:00', 26640, 'Admin & BAU – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-05-01', 0),
(9793, 12, 27, 34, '2026-05-05 08:00:00', '2026-05-05 15:00:00', 25200, 'Governance & reporting – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-05-05', 0),
(9794, 12, 27, 34, '2026-05-06 08:15:00', '2026-05-06 10:45:00', 9000, 'Governance & reporting – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-05-06', 0),
(9795, 12, 27, 34, '2026-05-07 08:00:00', '2026-05-07 15:00:00', 25200, 'Governance & reporting – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-05-07', 0),
(9796, 12, 29, 34, '2026-05-08 08:00:00', '2026-05-08 13:00:00', 18000, 'Admin & BAU – BAU – Transport', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:27', '2026-05-08', 0),
(9797, 12, 28, 34, '2026-05-11 08:30:00', '2026-05-11 11:00:00', 9000, 'Stakeholder engagement – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-05-11', 0),
(9798, 12, 26, 34, '2026-05-13 08:00:00', '2026-05-13 15:00:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-05-13', 0),
(9799, 12, 31, 34, '2026-05-15 08:30:00', '2026-05-15 11:00:00', 9000, 'Meetings – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-05-15', 0),
(9800, 12, 27, 34, '2026-05-21 08:30:00', '2026-05-21 12:00:00', 12600, 'Governance & reporting – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-05-21', 0),
(9801, 12, 29, 34, '2026-05-25 08:15:00', '2026-05-25 12:15:00', 14400, 'Admin & BAU – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-05-25', 0),
(9802, 12, 29, 34, '2026-06-01 08:00:00', '2026-06-01 11:30:00', 12600, 'Admin & BAU – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-06-01', 0),
(9803, 12, 29, 34, '2026-06-03 08:00:00', '2026-06-03 15:00:00', 25200, 'Admin & BAU – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-03', 0),
(9804, 12, 26, 34, '2026-06-04 08:15:00', '2026-06-04 12:15:00', 14400, 'Project delivery – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-06-04', 0),
(9805, 12, 29, 34, '2026-06-05 08:00:00', '2026-06-05 15:24:00', 26640, 'Admin & BAU – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-06-05', 0),
(9806, 12, 26, 34, '2026-06-08 08:00:00', '2026-06-08 15:00:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-08', 0),
(9807, 12, 26, 34, '2026-06-09 08:15:00', '2026-06-09 15:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-09', 0),
(9808, 12, 28, 34, '2026-06-12 08:30:00', '2026-06-12 12:00:00', 12600, 'Stakeholder engagement – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-06-12', 0),
(9809, 12, 26, 34, '2026-06-17 08:00:00', '2026-06-17 15:24:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-06-17', 0),
(9810, 12, 26, 34, '2026-06-18 08:30:00', '2026-06-18 12:30:00', 14400, 'Project delivery – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-06-18', 0),
(9811, 12, 27, 34, '2026-06-19 08:15:00', '2026-06-19 11:15:00', 10800, 'Governance & reporting – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-06-19', 0),
(9812, 12, 26, 34, '2026-06-23 08:30:00', '2026-06-23 11:00:00', 9000, 'Project delivery – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-06-23', 0),
(9813, 12, 29, 34, '2026-06-24 08:30:00', '2026-06-24 15:30:00', 25200, 'Admin & BAU – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-24', 0),
(9814, 12, 26, 34, '2026-06-25 08:30:00', '2026-06-25 15:30:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-25', 0),
(9815, 12, 26, 34, '2026-06-26 08:30:00', '2026-06-26 12:00:00', 12600, 'Project delivery – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-06-26', 0),
(9816, 12, 27, 34, '2026-06-29 08:30:00', '2026-06-29 15:30:00', 25200, 'Governance & reporting – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-29', 0),
(9817, 12, 28, 34, '2026-06-30 08:15:00', '2026-06-30 15:15:00', 25200, 'Stakeholder engagement – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-06-30', 0),
(9818, 12, 26, 34, '2026-07-01 08:00:00', '2026-07-01 14:30:00', 23400, 'Project delivery – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-07-01', 0),
(9819, 12, 26, 34, '2026-07-02 08:30:00', '2026-07-02 12:00:00', 12600, 'Project delivery – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-07-02', 0),
(9820, 12, 29, 34, '2026-07-03 08:00:00', '2026-07-03 11:30:00', 12600, 'Admin & BAU – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-07-03', 0),
(9821, 12, 26, 34, '2026-07-06 08:30:00', '2026-07-06 11:00:00', 9000, 'Project delivery – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-07-06', 0),
(9822, 12, 29, 34, '2026-07-07 08:30:00', '2026-07-07 11:30:00', 10800, 'Admin & BAU – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-07-07', 0),
(9823, 12, 26, 34, '2026-07-09 08:30:00', '2026-07-09 14:30:00', 21600, 'Project delivery – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-07-09', 0),
(9824, 12, 29, 34, '2026-07-14 08:15:00', '2026-07-14 15:15:00', 25200, 'Admin & BAU – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-07-14', 0),
(9825, 12, 26, 34, '2026-07-15 08:15:00', '2026-07-15 14:15:00', 21600, 'Project delivery – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-07-15', 0),
(9826, 12, 28, 34, '2026-07-16 08:15:00', '2026-07-16 15:15:00', 25200, 'Stakeholder engagement – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-07-16', 0),
(9827, 12, 29, 34, '2026-07-20 08:30:00', '2026-07-20 15:00:00', 23400, 'Admin & BAU – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-07-20', 0),
(9828, 12, 26, 34, '2026-07-21 08:30:00', '2026-07-21 12:30:00', 14400, 'Project delivery – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-07-21', 0),
(9829, 12, 26, 34, '2026-07-30 08:15:00', '2026-07-30 15:39:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-07-30', 0),
(9830, 12, 26, 34, '2026-07-31 08:00:00', '2026-07-31 11:00:00', 10800, 'Project delivery – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-07-31', 0),
(9831, 12, 29, 34, '2026-08-03 08:30:00', '2026-08-03 15:00:00', 23400, 'Admin & BAU – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-08-03', 0),
(9832, 12, 26, 34, '2026-08-04 08:30:00', '2026-08-04 15:54:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-08-04', 0),
(9833, 12, 26, 34, '2026-08-05 08:30:00', '2026-08-05 15:00:00', 23400, 'Project delivery – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-08-05', 0),
(9834, 12, 28, 34, '2026-08-06 08:15:00', '2026-08-06 11:45:00', 12600, 'Stakeholder engagement – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-08-06', 0),
(9835, 12, 26, 34, '2026-08-07 08:00:00', '2026-08-07 15:00:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-08-07', 0),
(9836, 12, 26, 34, '2026-08-10 08:30:00', '2026-08-10 15:54:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-08-10', 0),
(9837, 12, 27, 34, '2026-08-11 08:30:00', '2026-08-11 15:30:00', 25200, 'Governance & reporting – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-08-11', 0),
(9838, 12, 26, 34, '2026-08-12 08:00:00', '2026-08-12 15:24:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-08-12', 0),
(9839, 12, 31, 34, '2026-08-14 08:15:00', '2026-08-14 10:45:00', 9000, 'Meetings – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-08-14', 0),
(9840, 12, 26, 34, '2026-08-17 08:15:00', '2026-08-17 15:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-08-17', 0),
(9841, 12, 26, 34, '2026-08-18 08:00:00', '2026-08-18 15:00:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-08-18', 0),
(9842, 12, 26, 34, '2026-08-19 08:15:00', '2026-08-19 15:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-08-19', 0),
(9843, 12, 26, 34, '2026-08-20 08:30:00', '2026-08-20 14:30:00', 21600, 'Project delivery – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-08-20', 0),
(9844, 12, 28, 34, '2026-08-21 08:30:00', '2026-08-21 15:54:00', 26640, 'Stakeholder engagement – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-08-21', 0),
(9845, 12, 26, 34, '2026-08-26 08:00:00', '2026-08-26 10:00:00', 7200, 'Project delivery – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-08-26', 0),
(9846, 12, 27, 34, '2026-08-27 08:30:00', '2026-08-27 12:30:00', 14400, 'Governance & reporting – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-08-27', 0),
(9847, 12, 29, 34, '2026-08-28 08:15:00', '2026-08-28 10:15:00', 7200, 'Admin & BAU – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-08-28', 0),
(9848, 12, 27, 34, '2026-08-31 08:15:00', '2026-08-31 10:45:00', 9000, 'Governance & reporting – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-08-31', 0),
(9849, 12, 31, 34, '2026-09-01 08:15:00', '2026-09-01 15:15:00', 25200, 'Meetings – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-09-01', 0),
(9850, 12, 29, 34, '2026-09-02 08:15:00', '2026-09-02 15:15:00', 25200, 'Admin & BAU – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-09-02', 0),
(9851, 12, 28, 34, '2026-09-04 08:00:00', '2026-09-04 10:30:00', 9000, 'Stakeholder engagement – BAU – Transport', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:27', '2026-09-04', 0),
(9852, 12, 26, 34, '2026-09-07 08:15:00', '2026-09-07 14:45:00', 23400, 'Project delivery – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-09-07', 0),
(9853, 12, 27, 34, '2026-09-08 08:15:00', '2026-09-08 11:15:00', 10800, 'Governance & reporting – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-09-08', 0),
(9854, 12, 31, 34, '2026-09-09 08:00:00', '2026-09-09 15:00:00', 25200, 'Meetings – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-09-09', 0),
(9855, 12, 27, 34, '2026-09-10 08:00:00', '2026-09-10 15:00:00', 25200, 'Governance & reporting – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-09-10', 0),
(9856, 12, 28, 34, '2026-09-11 08:15:00', '2026-09-11 10:15:00', 7200, 'Stakeholder engagement – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-09-11', 0),
(9857, 12, 29, 34, '2026-09-14 08:15:00', '2026-09-14 10:15:00', 7200, 'Admin & BAU – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-09-14', 0),
(9858, 12, 27, 34, '2026-09-16 08:30:00', '2026-09-16 12:30:00', 14400, 'Governance & reporting – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-09-16', 0),
(9859, 12, 31, 34, '2026-09-17 08:30:00', '2026-09-17 12:30:00', 14400, 'Meetings – BAU – Transport', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:27', '2026-09-17', 0),
(9860, 12, 26, 34, '2026-09-21 08:30:00', '2026-09-21 15:30:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-09-21', 0),
(9861, 12, 29, 34, '2026-09-22 08:15:00', '2026-09-22 14:15:00', 21600, 'Admin & BAU – BAU – Transport', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:27', '2026-09-22', 0),
(9862, 12, 29, 34, '2026-09-23 08:30:00', '2026-09-23 15:54:00', 26640, 'Admin & BAU – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-09-23', 0),
(9863, 12, 30, 34, '2026-09-28 08:15:00', '2026-09-28 15:15:00', 25200, 'Training – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-09-28', 0),
(9864, 12, 26, 34, '2026-09-29 08:00:00', '2026-09-29 15:24:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-09-29', 0),
(9865, 12, 26, 34, '2026-09-30 08:00:00', '2026-09-30 15:00:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-09-30', 0),
(9866, 12, 28, 34, '2026-10-01 08:00:00', '2026-10-01 11:00:00', 10800, 'Stakeholder engagement – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-10-01', 0),
(9867, 12, 30, 34, '2026-10-02 08:15:00', '2026-10-02 11:15:00', 10800, 'Training – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-10-02', 0),
(9868, 12, 26, 34, '2026-10-05 08:00:00', '2026-10-05 11:00:00', 10800, 'Project delivery – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-10-05', 0),
(9869, 12, 29, 34, '2026-10-06 08:15:00', '2026-10-06 10:15:00', 7200, 'Admin & BAU – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-10-06', 0),
(9870, 12, 26, 34, '2026-10-07 08:30:00', '2026-10-07 15:30:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-10-07', 0),
(9871, 12, 29, 34, '2026-10-08 08:15:00', '2026-10-08 11:15:00', 10800, 'Admin & BAU – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-10-08', 0),
(9872, 12, 27, 34, '2026-10-09 08:15:00', '2026-10-09 11:45:00', 12600, 'Governance & reporting – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-10-09', 0),
(9873, 12, 26, 34, '2026-10-12 08:00:00', '2026-10-12 13:00:00', 18000, 'Project delivery – BAU – Transport', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:27', '2026-10-12', 0),
(9874, 12, 27, 34, '2026-10-13 08:00:00', '2026-10-13 11:00:00', 10800, 'Governance & reporting – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-10-13', 0),
(9875, 12, 26, 34, '2026-10-14 08:15:00', '2026-10-14 15:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-10-14', 0),
(9876, 12, 26, 34, '2026-10-19 08:30:00', '2026-10-19 13:30:00', 18000, 'Project delivery – BAU – Transport', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:27', '2026-10-19', 0),
(9877, 12, 29, 34, '2026-10-20 08:00:00', '2026-10-20 15:24:00', 26640, 'Admin & BAU – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-10-20', 0),
(9878, 12, 26, 34, '2026-10-21 08:30:00', '2026-10-21 15:30:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-10-21', 0),
(9879, 12, 30, 34, '2026-10-22 08:00:00', '2026-10-22 10:00:00', 7200, 'Training – BAU – Transport', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:27', '2026-10-22', 0),
(9880, 12, 31, 34, '2026-10-23 08:15:00', '2026-10-23 11:15:00', 10800, 'Meetings – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-10-23', 0),
(9881, 12, 26, 34, '2026-10-27 09:30:00', '2026-10-27 16:30:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-10-27', 0),
(9882, 12, 30, 34, '2026-10-29 09:30:00', '2026-10-29 16:00:00', 23400, 'Training – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-10-29', 0),
(9883, 12, 28, 34, '2026-10-30 09:00:00', '2026-10-30 16:00:00', 25200, 'Stakeholder engagement – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-10-30', 0),
(9884, 12, 26, 34, '2026-11-02 09:15:00', '2026-11-02 16:15:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-11-02', 0),
(9885, 12, 30, 34, '2026-11-03 09:15:00', '2026-11-03 12:15:00', 10800, 'Training – BAU – Transport', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:27', '2026-11-03', 0),
(9886, 12, 26, 34, '2026-11-09 09:00:00', '2026-11-09 15:30:00', 23400, 'Project delivery – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-11-09', 0),
(9887, 12, 26, 34, '2026-11-10 09:15:00', '2026-11-10 12:45:00', 12600, 'Project delivery – BAU – Transport', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:27', '2026-11-10', 0),
(9888, 12, 29, 34, '2026-11-12 09:15:00', '2026-11-12 15:45:00', 23400, 'Admin & BAU – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-11-12', 0),
(9889, 12, 26, 34, '2026-11-16 09:30:00', '2026-11-16 16:30:00', 25200, 'Project delivery – BAU – Transport', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:27', '2026-11-16', 0),
(9890, 12, 28, 34, '2026-11-17 09:30:00', '2026-11-17 16:00:00', 23400, 'Stakeholder engagement – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-11-17', 0),
(9891, 12, 26, 34, '2026-11-18 09:15:00', '2026-11-18 16:39:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-11-18', 0),
(9892, 12, 26, 34, '2026-11-23 09:30:00', '2026-11-23 16:54:00', 26640, 'Project delivery – BAU – Transport', 222, NULL, 30, 0, 'Europe/London', 192.4, 1, 'work', '2026-11-28 10:30:27', '2026-11-23', 0),
(9893, 12, 31, 34, '2026-11-26 09:00:00', '2026-11-26 15:30:00', 23400, 'Meetings – BAU – Transport', 195, NULL, 30, 0, 'Europe/London', 169, 1, 'work', '2026-11-28 10:30:27', '2026-11-26', 0),
(9894, 10, 28, 35, '2026-01-08 09:30:00', '2026-01-08 16:54:00', 26640, 'Stakeholder engagement – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-01-08', 0),
(9895, 10, 26, 35, '2026-01-13 09:15:00', '2026-01-13 16:15:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-01-13', 0),
(9896, 10, 26, 35, '2026-01-16 09:00:00', '2026-01-16 11:30:00', 9000, 'Project delivery – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-01-16', 0),
(9897, 10, 26, 35, '2026-01-19 09:30:00', '2026-01-19 16:54:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-01-19', 0),
(9898, 10, 29, 35, '2026-01-20 09:30:00', '2026-01-20 13:30:00', 14400, 'Admin & BAU – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-01-20', 0),
(9899, 10, 29, 35, '2026-01-21 09:30:00', '2026-01-21 16:30:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-01-21', 0),
(9900, 10, 29, 35, '2026-01-27 09:15:00', '2026-01-27 16:15:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-01-27', 0),
(9901, 10, 28, 35, '2026-01-28 09:15:00', '2026-01-28 16:39:00', 26640, 'Stakeholder engagement – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-01-28', 0),
(9902, 10, 29, 35, '2026-01-29 09:30:00', '2026-01-29 13:00:00', 12600, 'Admin & BAU – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-01-29', 0),
(9903, 10, 26, 35, '2026-01-30 09:30:00', '2026-01-30 12:00:00', 9000, 'Project delivery – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-01-30', 0),
(9904, 10, 26, 35, '2026-02-02 09:00:00', '2026-02-02 15:00:00', 21600, 'Project delivery – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-02-02', 0),
(9905, 10, 30, 35, '2026-02-03 09:30:00', '2026-02-03 16:54:00', 26640, 'Training – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-02-03', 0),
(9906, 10, 26, 35, '2026-02-04 09:30:00', '2026-02-04 13:30:00', 14400, 'Project delivery – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-02-04', 0),
(9907, 10, 26, 35, '2026-02-06 09:15:00', '2026-02-06 12:15:00', 10800, 'Project delivery – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-02-06', 0),
(9908, 10, 26, 35, '2026-02-09 09:30:00', '2026-02-09 14:30:00', 18000, 'Project delivery – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-02-09', 0),
(9909, 10, 28, 35, '2026-02-10 09:15:00', '2026-02-10 15:45:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-02-10', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(9910, 10, 28, 35, '2026-02-11 09:30:00', '2026-02-11 16:30:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-02-11', 0),
(9911, 10, 29, 35, '2026-02-12 09:00:00', '2026-02-12 16:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-02-12', 0),
(9912, 10, 29, 35, '2026-02-16 09:15:00', '2026-02-16 12:15:00', 10800, 'Admin & BAU – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-02-16', 0),
(9913, 10, 27, 35, '2026-02-17 09:15:00', '2026-02-17 14:15:00', 18000, 'Governance & reporting – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-02-17', 0),
(9914, 10, 28, 35, '2026-02-18 09:30:00', '2026-02-18 16:00:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-02-18', 0),
(9915, 10, 26, 35, '2026-02-19 09:00:00', '2026-02-19 11:30:00', 9000, 'Project delivery – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-02-19', 0),
(9916, 10, 27, 35, '2026-02-20 09:00:00', '2026-02-20 16:24:00', 26640, 'Governance & reporting – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-02-20', 0),
(9917, 10, 26, 35, '2026-02-23 09:30:00', '2026-02-23 13:00:00', 12600, 'Project delivery – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-02-23', 0),
(9918, 10, 28, 35, '2026-02-25 09:00:00', '2026-02-25 16:00:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-02-25', 0),
(9919, 10, 27, 35, '2026-02-26 09:30:00', '2026-02-26 16:00:00', 23400, 'Governance & reporting – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-02-26', 0),
(9920, 10, 27, 35, '2026-03-02 09:30:00', '2026-03-02 16:54:00', 26640, 'Governance & reporting – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-03-02', 0),
(9921, 10, 28, 35, '2026-03-03 09:15:00', '2026-03-03 11:45:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-03-03', 0),
(9922, 10, 28, 35, '2026-03-04 09:00:00', '2026-03-04 12:00:00', 10800, 'Stakeholder engagement – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-03-04', 0),
(9923, 10, 27, 35, '2026-03-06 09:15:00', '2026-03-06 12:45:00', 12600, 'Governance & reporting – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-03-06', 0),
(9924, 10, 26, 35, '2026-03-10 09:15:00', '2026-03-10 14:15:00', 18000, 'Project delivery – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-03-10', 0),
(9925, 10, 27, 35, '2026-03-12 09:30:00', '2026-03-12 16:54:00', 26640, 'Governance & reporting – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-03-12', 0),
(9926, 10, 31, 35, '2026-03-13 09:15:00', '2026-03-13 11:45:00', 9000, 'Meetings – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-03-13', 0),
(9927, 10, 26, 35, '2026-03-16 09:30:00', '2026-03-16 16:30:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-03-16', 0),
(9928, 10, 26, 35, '2026-03-17 09:15:00', '2026-03-17 14:15:00', 18000, 'Project delivery – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-03-17', 0),
(9929, 10, 27, 35, '2026-03-19 09:30:00', '2026-03-19 16:30:00', 25200, 'Governance & reporting – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-03-19', 0),
(9930, 10, 29, 35, '2026-03-20 09:15:00', '2026-03-20 15:45:00', 23400, 'Admin & BAU – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-03-20', 0),
(9931, 10, 29, 35, '2026-03-24 09:30:00', '2026-03-24 16:54:00', 26640, 'Admin & BAU – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-03-24', 0),
(9932, 10, 26, 35, '2026-03-25 09:15:00', '2026-03-25 14:15:00', 18000, 'Project delivery – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-03-25', 0),
(9933, 10, 26, 35, '2026-03-26 09:15:00', '2026-03-26 16:39:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-03-26', 0),
(9934, 10, 26, 35, '2026-03-30 08:15:00', '2026-03-30 10:45:00', 9000, 'Project delivery – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-03-30', 0),
(9935, 10, 29, 35, '2026-03-31 08:00:00', '2026-03-31 15:24:00', 26640, 'Admin & BAU – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-03-31', 0),
(9936, 10, 29, 35, '2026-04-02 08:15:00', '2026-04-02 12:15:00', 14400, 'Admin & BAU – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-04-02', 0),
(9937, 10, 29, 35, '2026-04-03 08:30:00', '2026-04-03 11:30:00', 10800, 'Admin & BAU – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-04-03', 0),
(9938, 10, 28, 35, '2026-04-06 08:00:00', '2026-04-06 14:30:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-04-06', 0),
(9939, 10, 27, 35, '2026-04-07 08:30:00', '2026-04-07 15:00:00', 23400, 'Governance & reporting – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-04-07', 0),
(9940, 10, 28, 35, '2026-04-08 08:00:00', '2026-04-08 14:30:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-04-08', 0),
(9941, 10, 27, 35, '2026-04-09 08:30:00', '2026-04-09 10:30:00', 7200, 'Governance & reporting – BAU – Economic Growth', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:27', '2026-04-09', 0),
(9942, 10, 26, 35, '2026-04-10 08:00:00', '2026-04-10 15:24:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-04-10', 0),
(9943, 10, 29, 35, '2026-04-13 08:00:00', '2026-04-13 15:24:00', 26640, 'Admin & BAU – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-04-13', 0),
(9944, 10, 26, 35, '2026-04-14 08:15:00', '2026-04-14 15:15:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-04-14', 0),
(9945, 10, 26, 35, '2026-04-15 08:00:00', '2026-04-15 14:00:00', 21600, 'Project delivery – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-04-15', 0),
(9946, 10, 29, 35, '2026-04-16 08:00:00', '2026-04-16 11:30:00', 12600, 'Admin & BAU – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-04-16', 0),
(9947, 10, 29, 35, '2026-04-17 08:00:00', '2026-04-17 13:00:00', 18000, 'Admin & BAU – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-04-17', 0),
(9948, 10, 29, 35, '2026-04-20 08:30:00', '2026-04-20 15:00:00', 23400, 'Admin & BAU – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-04-20', 0),
(9949, 10, 28, 35, '2026-04-21 08:15:00', '2026-04-21 10:45:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-04-21', 0),
(9950, 10, 26, 35, '2026-04-22 08:15:00', '2026-04-22 10:15:00', 7200, 'Project delivery – BAU – Economic Growth', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:27', '2026-04-22', 0),
(9951, 10, 27, 35, '2026-04-23 08:30:00', '2026-04-23 15:30:00', 25200, 'Governance & reporting – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-04-23', 0),
(9952, 10, 27, 35, '2026-04-24 08:30:00', '2026-04-24 10:30:00', 7200, 'Governance & reporting – BAU – Economic Growth', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:27', '2026-04-24', 0),
(9953, 10, 27, 35, '2026-04-30 08:15:00', '2026-04-30 14:15:00', 21600, 'Governance & reporting – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-04-30', 0),
(9954, 10, 28, 35, '2026-05-04 08:30:00', '2026-05-04 15:54:00', 26640, 'Stakeholder engagement – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-04', 0),
(9955, 10, 29, 35, '2026-05-07 08:00:00', '2026-05-07 15:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-05-07', 0),
(9956, 10, 28, 35, '2026-05-12 08:30:00', '2026-05-12 15:54:00', 26640, 'Stakeholder engagement – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-12', 0),
(9957, 10, 27, 35, '2026-05-14 08:00:00', '2026-05-14 12:00:00', 14400, 'Governance & reporting – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-05-14', 0),
(9958, 10, 27, 35, '2026-05-18 08:00:00', '2026-05-18 15:24:00', 26640, 'Governance & reporting – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-18', 0),
(9959, 10, 26, 35, '2026-05-19 08:15:00', '2026-05-19 10:45:00', 9000, 'Project delivery – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-05-19', 0),
(9960, 10, 26, 35, '2026-05-21 08:00:00', '2026-05-21 15:24:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-05-21', 0),
(9961, 10, 27, 35, '2026-05-22 08:00:00', '2026-05-22 11:30:00', 12600, 'Governance & reporting – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-05-22', 0),
(9962, 10, 26, 35, '2026-05-25 08:30:00', '2026-05-25 12:30:00', 14400, 'Project delivery – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-05-25', 0),
(9963, 10, 26, 35, '2026-05-27 08:30:00', '2026-05-27 12:30:00', 14400, 'Project delivery – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-05-27', 0),
(9964, 10, 29, 35, '2026-05-28 08:00:00', '2026-05-28 15:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-05-28', 0),
(9965, 10, 29, 35, '2026-05-29 08:30:00', '2026-05-29 15:30:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-05-29', 0),
(9966, 10, 30, 35, '2026-06-01 08:30:00', '2026-06-01 15:00:00', 23400, 'Training – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-06-01', 0),
(9967, 10, 26, 35, '2026-06-02 08:30:00', '2026-06-02 11:30:00', 10800, 'Project delivery – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-06-02', 0),
(9968, 10, 28, 35, '2026-06-03 08:30:00', '2026-06-03 14:30:00', 21600, 'Stakeholder engagement – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-06-03', 0),
(9969, 10, 27, 35, '2026-06-08 08:15:00', '2026-06-08 11:45:00', 12600, 'Governance & reporting – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-06-08', 0),
(9970, 10, 26, 35, '2026-06-09 08:30:00', '2026-06-09 15:54:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-06-09', 0),
(9971, 10, 26, 35, '2026-06-10 08:15:00', '2026-06-10 13:15:00', 18000, 'Project delivery – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-06-10', 0),
(9972, 10, 26, 35, '2026-06-11 08:00:00', '2026-06-11 14:30:00', 23400, 'Project delivery – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-06-11', 0),
(9973, 10, 28, 35, '2026-06-12 08:00:00', '2026-06-12 14:30:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-06-12', 0),
(9974, 10, 26, 35, '2026-06-15 08:00:00', '2026-06-15 14:30:00', 23400, 'Project delivery – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-06-15', 0),
(9975, 10, 26, 35, '2026-06-17 08:15:00', '2026-06-17 15:39:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-06-17', 0),
(9976, 10, 27, 35, '2026-06-22 08:15:00', '2026-06-22 15:15:00', 25200, 'Governance & reporting – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-06-22', 0),
(9977, 10, 27, 35, '2026-06-24 08:00:00', '2026-06-24 15:24:00', 26640, 'Governance & reporting – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-06-24', 0),
(9978, 10, 31, 35, '2026-06-25 08:15:00', '2026-06-25 15:15:00', 25200, 'Meetings – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-06-25', 0),
(9979, 10, 26, 35, '2026-06-29 08:30:00', '2026-06-29 11:30:00', 10800, 'Project delivery – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-06-29', 0),
(9980, 10, 26, 35, '2026-07-01 08:00:00', '2026-07-01 15:00:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-01', 0),
(9981, 10, 26, 35, '2026-07-02 08:15:00', '2026-07-02 11:45:00', 12600, 'Project delivery – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-07-02', 0),
(9982, 10, 27, 35, '2026-07-06 08:00:00', '2026-07-06 15:00:00', 25200, 'Governance & reporting – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-06', 0),
(9983, 10, 26, 35, '2026-07-07 08:00:00', '2026-07-07 15:00:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-07', 0),
(9984, 10, 28, 35, '2026-07-08 08:00:00', '2026-07-08 13:00:00', 18000, 'Stakeholder engagement – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-07-08', 0),
(9985, 10, 28, 35, '2026-07-09 08:15:00', '2026-07-09 15:15:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-09', 0),
(9986, 10, 29, 35, '2026-07-13 08:30:00', '2026-07-13 13:30:00', 18000, 'Admin & BAU – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-07-13', 0),
(9987, 10, 29, 35, '2026-07-15 08:15:00', '2026-07-15 12:15:00', 14400, 'Admin & BAU – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-07-15', 0),
(9988, 10, 26, 35, '2026-07-16 08:15:00', '2026-07-16 11:45:00', 12600, 'Project delivery – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-07-16', 0),
(9989, 10, 26, 35, '2026-07-17 08:15:00', '2026-07-17 15:15:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-17', 0),
(9990, 10, 27, 35, '2026-07-20 08:00:00', '2026-07-20 15:00:00', 25200, 'Governance & reporting – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-20', 0),
(9991, 10, 29, 35, '2026-07-21 08:00:00', '2026-07-21 10:30:00', 9000, 'Admin & BAU – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:27', '2026-07-21', 0),
(9992, 10, 26, 35, '2026-07-22 08:00:00', '2026-07-22 11:30:00', 12600, 'Project delivery – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:27', '2026-07-22', 0),
(9993, 10, 29, 35, '2026-07-23 08:00:00', '2026-07-23 14:30:00', 23400, 'Admin & BAU – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-07-23', 0),
(9994, 10, 27, 35, '2026-07-24 08:00:00', '2026-07-24 15:24:00', 26640, 'Governance & reporting – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-07-24', 0),
(9995, 10, 26, 35, '2026-07-27 08:15:00', '2026-07-27 15:15:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-27', 0),
(9996, 10, 29, 35, '2026-07-28 08:15:00', '2026-07-28 15:15:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-28', 0),
(9997, 10, 29, 35, '2026-07-29 08:15:00', '2026-07-29 15:39:00', 26640, 'Admin & BAU – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-07-29', 0),
(9998, 10, 29, 35, '2026-07-30 08:00:00', '2026-07-30 15:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-07-30', 0),
(9999, 10, 27, 35, '2026-08-03 08:30:00', '2026-08-03 15:30:00', 25200, 'Governance & reporting – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-08-03', 0),
(10000, 10, 27, 35, '2026-08-04 08:30:00', '2026-08-04 15:30:00', 25200, 'Governance & reporting – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-08-04', 0),
(10001, 10, 26, 35, '2026-08-06 08:00:00', '2026-08-06 12:00:00', 14400, 'Project delivery – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:27', '2026-08-06', 0),
(10002, 10, 29, 35, '2026-08-07 08:15:00', '2026-08-07 15:15:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-08-07', 0),
(10003, 10, 26, 35, '2026-08-10 08:00:00', '2026-08-10 15:00:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-08-10', 0),
(10004, 10, 26, 35, '2026-08-11 08:30:00', '2026-08-11 13:30:00', 18000, 'Project delivery – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:27', '2026-08-11', 0),
(10005, 10, 26, 35, '2026-08-12 08:30:00', '2026-08-12 15:00:00', 23400, 'Project delivery – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:27', '2026-08-12', 0),
(10006, 10, 26, 35, '2026-08-13 08:30:00', '2026-08-13 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:27', '2026-08-13', 0),
(10007, 10, 27, 35, '2026-08-14 08:15:00', '2026-08-14 14:15:00', 21600, 'Governance & reporting – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:27', '2026-08-14', 0),
(10008, 10, 26, 35, '2026-08-18 08:00:00', '2026-08-18 11:00:00', 10800, 'Project delivery – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-08-18', 0),
(10009, 10, 29, 35, '2026-08-19 08:15:00', '2026-08-19 11:15:00', 10800, 'Admin & BAU – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:27', '2026-08-19', 0),
(10010, 10, 27, 35, '2026-08-21 08:00:00', '2026-08-21 15:24:00', 26640, 'Governance & reporting – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-08-21', 0),
(10011, 10, 26, 35, '2026-08-27 08:15:00', '2026-08-27 15:39:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:27', '2026-08-27', 0),
(10012, 10, 28, 35, '2026-08-28 08:00:00', '2026-08-28 15:00:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-08-28', 0),
(10013, 10, 28, 35, '2026-08-31 08:15:00', '2026-08-31 15:15:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-08-31', 0),
(10014, 10, 29, 35, '2026-09-09 08:15:00', '2026-09-09 14:45:00', 23400, 'Admin & BAU – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:28', '2026-09-09', 0),
(10015, 10, 26, 35, '2026-09-10 08:30:00', '2026-09-10 11:30:00', 10800, 'Project delivery – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:28', '2026-09-10', 0),
(10016, 10, 31, 35, '2026-09-14 08:15:00', '2026-09-14 15:39:00', 26640, 'Meetings – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:28', '2026-09-14', 0),
(10017, 10, 26, 35, '2026-09-15 08:00:00', '2026-09-15 15:00:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-09-15', 0),
(10018, 10, 29, 35, '2026-09-17 08:30:00', '2026-09-17 15:30:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-09-17', 0),
(10019, 10, 26, 35, '2026-09-21 08:00:00', '2026-09-21 15:00:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-09-21', 0),
(10020, 10, 29, 35, '2026-09-22 08:30:00', '2026-09-22 14:30:00', 21600, 'Admin & BAU – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:28', '2026-09-22', 0),
(10021, 10, 27, 35, '2026-09-24 08:15:00', '2026-09-24 11:15:00', 10800, 'Governance & reporting – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:28', '2026-09-24', 0),
(10022, 10, 26, 35, '2026-09-25 08:30:00', '2026-09-25 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-09-25', 0),
(10023, 10, 28, 35, '2026-09-28 08:00:00', '2026-09-28 14:00:00', 21600, 'Stakeholder engagement – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:28', '2026-09-28', 0),
(10024, 10, 28, 35, '2026-09-29 08:30:00', '2026-09-29 10:30:00', 7200, 'Stakeholder engagement – BAU – Economic Growth', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:28', '2026-09-29', 0),
(10025, 10, 29, 35, '2026-09-30 08:15:00', '2026-09-30 10:45:00', 9000, 'Admin & BAU – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:28', '2026-09-30', 0),
(10026, 10, 26, 35, '2026-10-01 08:15:00', '2026-10-01 11:45:00', 12600, 'Project delivery – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:28', '2026-10-01', 0),
(10027, 10, 27, 35, '2026-10-02 08:15:00', '2026-10-02 13:15:00', 18000, 'Governance & reporting – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:28', '2026-10-02', 0),
(10028, 10, 29, 35, '2026-10-05 08:00:00', '2026-10-05 14:30:00', 23400, 'Admin & BAU – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:28', '2026-10-05', 0),
(10029, 10, 26, 35, '2026-10-06 08:00:00', '2026-10-06 12:00:00', 14400, 'Project delivery – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:28', '2026-10-06', 0),
(10030, 10, 28, 35, '2026-10-08 08:15:00', '2026-10-08 15:39:00', 26640, 'Stakeholder engagement – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-08', 0),
(10031, 10, 26, 35, '2026-10-09 08:30:00', '2026-10-09 11:00:00', 9000, 'Project delivery – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:28', '2026-10-09', 0),
(10032, 10, 26, 35, '2026-10-12 08:15:00', '2026-10-12 14:45:00', 23400, 'Project delivery – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:28', '2026-10-12', 0),
(10033, 10, 26, 35, '2026-10-13 08:00:00', '2026-10-13 15:24:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-13', 0),
(10034, 10, 26, 35, '2026-10-14 08:15:00', '2026-10-14 15:39:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-14', 0),
(10035, 10, 30, 35, '2026-10-15 08:30:00', '2026-10-15 10:30:00', 7200, 'Training – BAU – Economic Growth', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:28', '2026-10-15', 0),
(10036, 10, 28, 35, '2026-10-16 08:00:00', '2026-10-16 10:30:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:28', '2026-10-16', 0),
(10037, 10, 26, 35, '2026-10-22 08:15:00', '2026-10-22 14:45:00', 23400, 'Project delivery – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:28', '2026-10-22', 0),
(10038, 10, 27, 35, '2026-10-23 08:30:00', '2026-10-23 11:30:00', 10800, 'Governance & reporting – BAU – Economic Growth', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:28', '2026-10-23', 0),
(10039, 10, 29, 35, '2026-10-27 09:00:00', '2026-10-27 16:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-10-27', 0),
(10040, 10, 30, 35, '2026-10-29 09:30:00', '2026-10-29 16:54:00', 26640, 'Training – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-29', 0),
(10041, 10, 26, 35, '2026-10-30 09:15:00', '2026-10-30 14:15:00', 18000, 'Project delivery – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:28', '2026-10-30', 0),
(10042, 10, 26, 35, '2026-11-02 09:00:00', '2026-11-02 16:00:00', 25200, 'Project delivery – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-11-02', 0),
(10043, 10, 29, 35, '2026-11-03 09:30:00', '2026-11-03 15:30:00', 21600, 'Admin & BAU – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:28', '2026-11-03', 0),
(10044, 10, 27, 35, '2026-11-04 09:15:00', '2026-11-04 12:45:00', 12600, 'Governance & reporting – BAU – Economic Growth', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:28', '2026-11-04', 0),
(10045, 10, 27, 35, '2026-11-05 09:30:00', '2026-11-05 16:30:00', 25200, 'Governance & reporting – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-11-05', 0),
(10046, 10, 26, 35, '2026-11-06 09:15:00', '2026-11-06 16:39:00', 26640, 'Project delivery – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:28', '2026-11-06', 0),
(10047, 10, 27, 35, '2026-11-09 09:15:00', '2026-11-09 14:15:00', 18000, 'Governance & reporting – BAU – Economic Growth', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:28', '2026-11-09', 0),
(10048, 10, 31, 35, '2026-11-10 09:30:00', '2026-11-10 13:30:00', 14400, 'Meetings – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:28', '2026-11-10', 0),
(10049, 10, 28, 35, '2026-11-11 09:15:00', '2026-11-11 16:15:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:28', '2026-11-11', 0),
(10050, 10, 29, 35, '2026-11-13 09:15:00', '2026-11-13 13:15:00', 14400, 'Admin & BAU – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:28', '2026-11-13', 0),
(10051, 10, 27, 35, '2026-11-16 09:00:00', '2026-11-16 11:00:00', 7200, 'Governance & reporting – BAU – Economic Growth', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:28', '2026-11-16', 0),
(10052, 10, 27, 35, '2026-11-17 09:00:00', '2026-11-17 15:30:00', 23400, 'Governance & reporting – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:28', '2026-11-17', 0),
(10053, 10, 28, 35, '2026-11-18 09:30:00', '2026-11-18 15:30:00', 21600, 'Stakeholder engagement – BAU – Economic Growth', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:28', '2026-11-18', 0),
(10054, 10, 28, 35, '2026-11-19 09:00:00', '2026-11-19 16:24:00', 26640, 'Stakeholder engagement – BAU – Economic Growth', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:28', '2026-11-19', 0),
(10055, 10, 31, 35, '2026-11-24 09:00:00', '2026-11-24 15:30:00', 23400, 'Meetings – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:28', '2026-11-24', 0),
(10056, 10, 28, 35, '2026-11-26 09:30:00', '2026-11-26 16:00:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:28', '2026-11-26', 0),
(10057, 10, 26, 35, '2026-11-27 09:15:00', '2026-11-27 13:15:00', 14400, 'Project delivery – BAU – Economic Growth', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:28', '2026-11-27', 0),
(10058, 13, 27, 35, '2026-01-06 09:00:00', '2026-01-06 12:00:00', 10800, 'Governance & reporting – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-01-06', 0),
(10059, 13, 28, 35, '2026-01-08 09:30:00', '2026-01-08 16:30:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-01-08', 0),
(10060, 13, 26, 35, '2026-01-09 09:00:00', '2026-01-09 12:00:00', 10800, 'Project delivery – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-01-09', 0),
(10061, 13, 28, 35, '2026-01-12 09:15:00', '2026-01-12 11:45:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-01-12', 0),
(10062, 13, 31, 35, '2026-01-13 09:00:00', '2026-01-13 12:00:00', 10800, 'Meetings – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-01-13', 0),
(10063, 13, 26, 35, '2026-01-14 09:30:00', '2026-01-14 16:54:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-01-14', 0),
(10064, 13, 27, 35, '2026-01-15 09:00:00', '2026-01-15 12:00:00', 10800, 'Governance & reporting – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-01-15', 0),
(10065, 13, 26, 35, '2026-01-16 09:00:00', '2026-01-16 11:30:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-01-16', 0),
(10066, 13, 26, 35, '2026-01-19 09:30:00', '2026-01-19 16:00:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-01-19', 0),
(10067, 13, 26, 35, '2026-01-20 09:30:00', '2026-01-20 16:54:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-01-20', 0),
(10068, 13, 26, 35, '2026-01-22 09:00:00', '2026-01-22 15:30:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-01-22', 0),
(10069, 13, 31, 35, '2026-01-23 09:00:00', '2026-01-23 12:30:00', 12600, 'Meetings – BAU – Economic Growth', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:28', '2026-01-23', 0),
(10070, 13, 27, 35, '2026-01-26 09:00:00', '2026-01-26 11:30:00', 9000, 'Governance & reporting – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-01-26', 0),
(10071, 13, 28, 35, '2026-01-27 09:15:00', '2026-01-27 11:15:00', 7200, 'Stakeholder engagement – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-01-27', 0),
(10072, 13, 29, 35, '2026-01-29 09:30:00', '2026-01-29 16:54:00', 26640, 'Admin & BAU – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-01-29', 0),
(10073, 13, 27, 35, '2026-01-30 09:15:00', '2026-01-30 13:15:00', 14400, 'Governance & reporting – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-01-30', 0),
(10074, 13, 29, 35, '2026-02-02 09:30:00', '2026-02-02 13:30:00', 14400, 'Admin & BAU – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-02-02', 0),
(10075, 13, 28, 35, '2026-02-03 09:00:00', '2026-02-03 11:30:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-02-03', 0),
(10076, 13, 26, 35, '2026-02-04 09:15:00', '2026-02-04 15:45:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-02-04', 0),
(10077, 13, 26, 35, '2026-02-05 09:30:00', '2026-02-05 14:30:00', 18000, 'Project delivery – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-02-05', 0),
(10078, 13, 28, 35, '2026-02-06 09:15:00', '2026-02-06 12:15:00', 10800, 'Stakeholder engagement – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-02-06', 0),
(10079, 13, 30, 35, '2026-02-10 09:00:00', '2026-02-10 15:30:00', 23400, 'Training – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-02-10', 0),
(10080, 13, 27, 35, '2026-02-12 09:30:00', '2026-02-12 12:00:00', 9000, 'Governance & reporting – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-02-12', 0),
(10081, 13, 26, 35, '2026-02-13 09:15:00', '2026-02-13 16:39:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-02-13', 0),
(10082, 13, 26, 35, '2026-02-17 09:15:00', '2026-02-17 13:15:00', 14400, 'Project delivery – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-02-17', 0),
(10083, 13, 29, 35, '2026-02-18 09:15:00', '2026-02-18 12:15:00', 10800, 'Admin & BAU – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-02-18', 0),
(10084, 13, 29, 35, '2026-02-19 09:00:00', '2026-02-19 16:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-02-19', 0),
(10085, 13, 26, 35, '2026-02-20 09:30:00', '2026-02-20 16:54:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-02-20', 0),
(10086, 13, 30, 35, '2026-02-23 09:30:00', '2026-02-23 11:30:00', 7200, 'Training – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-02-23', 0),
(10087, 13, 26, 35, '2026-02-25 09:15:00', '2026-02-25 13:15:00', 14400, 'Project delivery – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-02-25', 0),
(10088, 13, 26, 35, '2026-02-27 09:15:00', '2026-02-27 15:45:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-02-27', 0),
(10089, 13, 26, 35, '2026-03-02 09:30:00', '2026-03-02 13:00:00', 12600, 'Project delivery – BAU – Economic Growth', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:28', '2026-03-02', 0),
(10090, 13, 31, 35, '2026-03-03 09:15:00', '2026-03-03 11:15:00', 7200, 'Meetings – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-03-03', 0),
(10091, 13, 26, 35, '2026-03-04 09:00:00', '2026-03-04 12:00:00', 10800, 'Project delivery – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-03-04', 0),
(10092, 13, 29, 35, '2026-03-06 09:15:00', '2026-03-06 14:15:00', 18000, 'Admin & BAU – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-03-06', 0),
(10093, 13, 26, 35, '2026-03-09 09:15:00', '2026-03-09 15:15:00', 21600, 'Project delivery – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-03-09', 0),
(10094, 13, 30, 35, '2026-03-10 09:00:00', '2026-03-10 16:00:00', 25200, 'Training – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-03-10', 0),
(10095, 13, 29, 35, '2026-03-11 09:00:00', '2026-03-11 16:24:00', 26640, 'Admin & BAU – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-03-11', 0),
(10096, 13, 28, 35, '2026-03-12 09:00:00', '2026-03-12 16:00:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-03-12', 0),
(10097, 13, 26, 35, '2026-03-13 09:00:00', '2026-03-13 11:30:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-03-13', 0),
(10098, 13, 28, 35, '2026-03-16 09:30:00', '2026-03-16 16:30:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-03-16', 0),
(10099, 13, 28, 35, '2026-03-17 09:15:00', '2026-03-17 16:15:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-03-17', 0),
(10100, 13, 26, 35, '2026-03-18 09:15:00', '2026-03-18 15:15:00', 21600, 'Project delivery – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-03-18', 0),
(10101, 13, 26, 35, '2026-03-19 09:00:00', '2026-03-19 11:30:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-03-19', 0),
(10102, 13, 26, 35, '2026-03-20 09:30:00', '2026-03-20 12:00:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-03-20', 0),
(10103, 13, 29, 35, '2026-03-23 09:15:00', '2026-03-23 16:39:00', 26640, 'Admin & BAU – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-03-23', 0),
(10104, 13, 26, 35, '2026-03-24 09:15:00', '2026-03-24 12:15:00', 10800, 'Project delivery – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-03-24', 0),
(10105, 13, 29, 35, '2026-03-25 09:30:00', '2026-03-25 13:30:00', 14400, 'Admin & BAU – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-03-25', 0),
(10106, 13, 26, 35, '2026-03-26 09:30:00', '2026-03-26 14:30:00', 18000, 'Project delivery – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-03-26', 0),
(10107, 13, 26, 35, '2026-03-30 08:00:00', '2026-03-30 15:24:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-03-30', 0),
(10108, 13, 27, 35, '2026-03-31 08:15:00', '2026-03-31 11:45:00', 12600, 'Governance & reporting – BAU – Economic Growth', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:28', '2026-03-31', 0),
(10109, 13, 28, 35, '2026-04-01 08:15:00', '2026-04-01 10:45:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-04-01', 0),
(10110, 13, 26, 35, '2026-04-02 08:30:00', '2026-04-02 10:30:00', 7200, 'Project delivery – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-04-02', 0),
(10111, 13, 27, 35, '2026-04-03 08:00:00', '2026-04-03 13:00:00', 18000, 'Governance & reporting – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-04-03', 0),
(10112, 13, 26, 35, '2026-04-06 08:00:00', '2026-04-06 10:30:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-04-06', 0),
(10113, 13, 29, 35, '2026-04-07 08:30:00', '2026-04-07 15:00:00', 23400, 'Admin & BAU – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-04-07', 0),
(10114, 13, 26, 35, '2026-04-08 08:15:00', '2026-04-08 13:15:00', 18000, 'Project delivery – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-04-08', 0),
(10115, 13, 27, 35, '2026-04-09 08:30:00', '2026-04-09 15:30:00', 25200, 'Governance & reporting – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-04-09', 0),
(10116, 13, 26, 35, '2026-04-10 08:30:00', '2026-04-10 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-04-10', 0),
(10117, 13, 30, 35, '2026-04-13 08:00:00', '2026-04-13 15:24:00', 26640, 'Training – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-04-13', 0),
(10118, 13, 29, 35, '2026-04-14 08:15:00', '2026-04-14 15:39:00', 26640, 'Admin & BAU – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-04-14', 0),
(10119, 13, 26, 35, '2026-04-16 08:30:00', '2026-04-16 15:00:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-04-16', 0),
(10120, 13, 26, 35, '2026-04-20 08:15:00', '2026-04-20 13:15:00', 18000, 'Project delivery – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-04-20', 0),
(10121, 13, 28, 35, '2026-04-21 08:30:00', '2026-04-21 15:30:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-04-21', 0),
(10122, 13, 26, 35, '2026-04-22 08:30:00', '2026-04-22 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-04-22', 0),
(10123, 13, 29, 35, '2026-04-23 08:15:00', '2026-04-23 15:15:00', 25200, 'Admin & BAU – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-04-23', 0),
(10124, 13, 30, 35, '2026-04-24 08:30:00', '2026-04-24 12:30:00', 14400, 'Training – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-04-24', 0),
(10125, 13, 26, 35, '2026-05-01 08:30:00', '2026-05-01 14:30:00', 21600, 'Project delivery – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-05-01', 0),
(10126, 13, 31, 35, '2026-05-04 08:00:00', '2026-05-04 14:30:00', 23400, 'Meetings – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-05-04', 0),
(10127, 13, 28, 35, '2026-05-05 08:15:00', '2026-05-05 12:15:00', 14400, 'Stakeholder engagement – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-05-05', 0),
(10128, 13, 26, 35, '2026-05-07 08:15:00', '2026-05-07 14:45:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-05-07', 0),
(10129, 13, 28, 35, '2026-05-08 08:00:00', '2026-05-08 10:00:00', 7200, 'Stakeholder engagement – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-05-08', 0),
(10130, 13, 29, 35, '2026-05-11 08:00:00', '2026-05-11 15:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-05-11', 0),
(10131, 13, 29, 35, '2026-05-12 08:30:00', '2026-05-12 15:54:00', 26640, 'Admin & BAU – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-05-12', 0),
(10132, 13, 29, 35, '2026-05-14 08:30:00', '2026-05-14 11:00:00', 9000, 'Admin & BAU – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-05-14', 0),
(10133, 13, 30, 35, '2026-05-15 08:00:00', '2026-05-15 10:30:00', 9000, 'Training – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-05-15', 0),
(10134, 13, 26, 35, '2026-05-18 08:00:00', '2026-05-18 15:00:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-05-18', 0),
(10135, 13, 26, 35, '2026-05-19 08:15:00', '2026-05-19 11:15:00', 10800, 'Project delivery – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-05-19', 0),
(10136, 13, 28, 35, '2026-05-20 08:30:00', '2026-05-20 14:30:00', 21600, 'Stakeholder engagement – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-05-20', 0),
(10137, 13, 29, 35, '2026-05-21 08:30:00', '2026-05-21 15:30:00', 25200, 'Admin & BAU – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-05-21', 0),
(10138, 13, 26, 35, '2026-05-22 08:30:00', '2026-05-22 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-05-22', 0),
(10139, 13, 29, 35, '2026-05-25 08:00:00', '2026-05-25 13:00:00', 18000, 'Admin & BAU – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-05-25', 0),
(10140, 13, 26, 35, '2026-05-27 08:00:00', '2026-05-27 12:00:00', 14400, 'Project delivery – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-05-27', 0),
(10141, 13, 29, 35, '2026-05-28 08:30:00', '2026-05-28 15:30:00', 25200, 'Admin & BAU – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-05-28', 0),
(10142, 13, 26, 35, '2026-06-01 08:00:00', '2026-06-01 15:00:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-06-01', 0),
(10143, 13, 28, 35, '2026-06-04 08:15:00', '2026-06-04 14:15:00', 21600, 'Stakeholder engagement – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-06-04', 0),
(10144, 13, 26, 35, '2026-06-08 08:30:00', '2026-06-08 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-06-08', 0),
(10145, 13, 26, 35, '2026-06-09 08:30:00', '2026-06-09 14:30:00', 21600, 'Project delivery – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-06-09', 0),
(10146, 13, 26, 35, '2026-06-10 08:00:00', '2026-06-10 14:30:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-06-10', 0),
(10147, 13, 28, 35, '2026-06-11 08:15:00', '2026-06-11 12:15:00', 14400, 'Stakeholder engagement – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-06-11', 0),
(10148, 13, 26, 35, '2026-06-12 08:30:00', '2026-06-12 11:00:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-06-12', 0),
(10149, 13, 28, 35, '2026-06-15 08:30:00', '2026-06-15 15:00:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-06-15', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(10150, 13, 29, 35, '2026-06-16 08:30:00', '2026-06-16 15:54:00', 26640, 'Admin & BAU – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-06-16', 0),
(10151, 13, 26, 35, '2026-06-18 08:30:00', '2026-06-18 11:00:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-06-18', 0),
(10152, 13, 27, 35, '2026-06-19 08:30:00', '2026-06-19 11:00:00', 9000, 'Governance & reporting – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-06-19', 0),
(10153, 13, 26, 35, '2026-06-22 08:30:00', '2026-06-22 14:30:00', 21600, 'Project delivery – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-06-22', 0),
(10154, 13, 29, 35, '2026-06-24 08:30:00', '2026-06-24 14:30:00', 21600, 'Admin & BAU – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-06-24', 0),
(10155, 13, 26, 35, '2026-06-26 08:15:00', '2026-06-26 15:15:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-06-26', 0),
(10156, 13, 26, 35, '2026-06-30 08:30:00', '2026-06-30 15:00:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-06-30', 0),
(10157, 13, 27, 35, '2026-07-02 08:00:00', '2026-07-02 15:24:00', 26640, 'Governance & reporting – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-07-02', 0),
(10158, 13, 27, 35, '2026-07-06 08:15:00', '2026-07-06 11:45:00', 12600, 'Governance & reporting – BAU – Economic Growth', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:28', '2026-07-06', 0),
(10159, 13, 26, 35, '2026-07-07 08:00:00', '2026-07-07 14:30:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-07-07', 0),
(10160, 13, 28, 35, '2026-07-09 08:15:00', '2026-07-09 15:39:00', 26640, 'Stakeholder engagement – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-07-09', 0),
(10161, 13, 26, 35, '2026-07-10 08:15:00', '2026-07-10 10:45:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-07-10', 0),
(10162, 13, 27, 35, '2026-07-13 08:15:00', '2026-07-13 14:15:00', 21600, 'Governance & reporting – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-07-13', 0),
(10163, 13, 26, 35, '2026-07-14 08:00:00', '2026-07-14 15:24:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-07-14', 0),
(10164, 13, 26, 35, '2026-07-15 08:30:00', '2026-07-15 14:30:00', 21600, 'Project delivery – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-07-15', 0),
(10165, 13, 28, 35, '2026-07-16 08:15:00', '2026-07-16 10:15:00', 7200, 'Stakeholder engagement – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-07-16', 0),
(10166, 13, 31, 35, '2026-07-17 08:30:00', '2026-07-17 14:30:00', 21600, 'Meetings – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-07-17', 0),
(10167, 13, 31, 35, '2026-07-20 08:00:00', '2026-07-20 14:30:00', 23400, 'Meetings – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-07-20', 0),
(10168, 13, 26, 35, '2026-07-22 08:15:00', '2026-07-22 11:45:00', 12600, 'Project delivery – BAU – Economic Growth', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:28', '2026-07-22', 0),
(10169, 13, 26, 35, '2026-07-23 08:30:00', '2026-07-23 10:30:00', 7200, 'Project delivery – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-07-23', 0),
(10170, 13, 26, 35, '2026-07-27 08:30:00', '2026-07-27 14:30:00', 21600, 'Project delivery – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-07-27', 0),
(10171, 13, 30, 35, '2026-07-28 08:30:00', '2026-07-28 14:30:00', 21600, 'Training – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-07-28', 0),
(10172, 13, 26, 35, '2026-07-29 08:15:00', '2026-07-29 15:15:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-07-29', 0),
(10173, 13, 27, 35, '2026-07-30 08:15:00', '2026-07-30 14:45:00', 23400, 'Governance & reporting – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-07-30', 0),
(10174, 13, 27, 35, '2026-07-31 08:15:00', '2026-07-31 10:45:00', 9000, 'Governance & reporting – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-07-31', 0),
(10175, 13, 28, 35, '2026-08-03 08:30:00', '2026-08-03 15:00:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-08-03', 0),
(10176, 13, 27, 35, '2026-08-04 08:00:00', '2026-08-04 15:00:00', 25200, 'Governance & reporting – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-08-04', 0),
(10177, 13, 29, 35, '2026-08-05 08:15:00', '2026-08-05 11:45:00', 12600, 'Admin & BAU – BAU – Economic Growth', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:28', '2026-08-05', 0),
(10178, 13, 26, 35, '2026-08-07 08:30:00', '2026-08-07 11:00:00', 9000, 'Project delivery – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-08-07', 0),
(10179, 13, 31, 35, '2026-08-13 08:00:00', '2026-08-13 13:00:00', 18000, 'Meetings – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-08-13', 0),
(10180, 13, 29, 35, '2026-08-14 08:30:00', '2026-08-14 15:54:00', 26640, 'Admin & BAU – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-08-14', 0),
(10181, 13, 30, 35, '2026-08-17 08:15:00', '2026-08-17 15:39:00', 26640, 'Training – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-08-17', 0),
(10182, 13, 27, 35, '2026-08-18 08:15:00', '2026-08-18 10:45:00', 9000, 'Governance & reporting – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-08-18', 0),
(10183, 13, 29, 35, '2026-08-19 08:00:00', '2026-08-19 15:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-08-19', 0),
(10184, 13, 29, 35, '2026-08-21 08:00:00', '2026-08-21 15:00:00', 25200, 'Admin & BAU – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-08-21', 0),
(10185, 13, 26, 35, '2026-08-27 08:30:00', '2026-08-27 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-08-27', 0),
(10186, 13, 27, 35, '2026-08-31 08:30:00', '2026-08-31 15:30:00', 25200, 'Governance & reporting – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-08-31', 0),
(10187, 13, 31, 35, '2026-09-01 08:00:00', '2026-09-01 15:00:00', 25200, 'Meetings – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-09-01', 0),
(10188, 13, 26, 35, '2026-09-02 08:00:00', '2026-09-02 15:00:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-09-02', 0),
(10189, 13, 26, 35, '2026-09-04 08:30:00', '2026-09-04 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-09-04', 0),
(10190, 13, 26, 35, '2026-09-09 08:30:00', '2026-09-09 12:30:00', 14400, 'Project delivery – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-09-09', 0),
(10191, 13, 30, 35, '2026-09-11 08:00:00', '2026-09-11 10:00:00', 7200, 'Training – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-09-11', 0),
(10192, 13, 29, 35, '2026-09-15 08:30:00', '2026-09-15 14:30:00', 21600, 'Admin & BAU – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-09-15', 0),
(10193, 13, 26, 35, '2026-09-16 08:30:00', '2026-09-16 15:54:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-09-16', 0),
(10194, 13, 26, 35, '2026-09-17 08:15:00', '2026-09-17 11:15:00', 10800, 'Project delivery – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-09-17', 0),
(10195, 13, 26, 35, '2026-09-18 08:30:00', '2026-09-18 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-09-18', 0),
(10196, 13, 29, 35, '2026-09-23 08:00:00', '2026-09-23 10:30:00', 9000, 'Admin & BAU – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-09-23', 0),
(10197, 13, 28, 35, '2026-09-24 08:00:00', '2026-09-24 10:30:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-09-24', 0),
(10198, 13, 30, 35, '2026-09-29 08:15:00', '2026-09-29 10:15:00', 7200, 'Training – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-09-29', 0),
(10199, 13, 26, 35, '2026-09-30 08:00:00', '2026-09-30 15:24:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-09-30', 0),
(10200, 13, 27, 35, '2026-10-01 08:00:00', '2026-10-01 14:00:00', 21600, 'Governance & reporting – BAU – Economic Growth', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-10-01', 0),
(10201, 13, 28, 35, '2026-10-05 08:15:00', '2026-10-05 11:45:00', 12600, 'Stakeholder engagement – BAU – Economic Growth', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:28', '2026-10-05', 0),
(10202, 13, 28, 35, '2026-10-07 08:00:00', '2026-10-07 10:30:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-10-07', 0),
(10203, 13, 27, 35, '2026-10-08 08:30:00', '2026-10-08 15:00:00', 23400, 'Governance & reporting – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-10-08', 0),
(10204, 13, 28, 35, '2026-10-09 08:30:00', '2026-10-09 15:54:00', 26640, 'Stakeholder engagement – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-09', 0),
(10205, 13, 26, 35, '2026-10-12 08:15:00', '2026-10-12 15:15:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-10-12', 0),
(10206, 13, 27, 35, '2026-10-13 08:15:00', '2026-10-13 13:15:00', 18000, 'Governance & reporting – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-10-13', 0),
(10207, 13, 27, 35, '2026-10-15 08:00:00', '2026-10-15 15:24:00', 26640, 'Governance & reporting – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-15', 0),
(10208, 13, 28, 35, '2026-10-16 08:00:00', '2026-10-16 14:30:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-10-16', 0),
(10209, 13, 27, 35, '2026-10-19 08:30:00', '2026-10-19 15:54:00', 26640, 'Governance & reporting – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-19', 0),
(10210, 13, 28, 35, '2026-10-20 08:15:00', '2026-10-20 11:15:00', 10800, 'Stakeholder engagement – BAU – Economic Growth', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-10-20', 0),
(10211, 13, 30, 35, '2026-10-21 08:15:00', '2026-10-21 13:15:00', 18000, 'Training – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-10-21', 0),
(10212, 13, 26, 35, '2026-10-22 08:30:00', '2026-10-22 15:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-10-22', 0),
(10213, 13, 29, 35, '2026-10-26 09:15:00', '2026-10-26 15:45:00', 23400, 'Admin & BAU – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-10-26', 0),
(10214, 13, 29, 35, '2026-10-27 09:00:00', '2026-10-27 16:24:00', 26640, 'Admin & BAU – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-27', 0),
(10215, 13, 26, 35, '2026-10-28 09:00:00', '2026-10-28 16:24:00', 26640, 'Project delivery – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-10-28', 0),
(10216, 13, 26, 35, '2026-10-29 09:15:00', '2026-10-29 12:45:00', 12600, 'Project delivery – BAU – Economic Growth', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:28', '2026-10-29', 0),
(10217, 13, 26, 35, '2026-10-30 09:00:00', '2026-10-30 13:00:00', 14400, 'Project delivery – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-10-30', 0),
(10218, 13, 27, 35, '2026-11-02 09:30:00', '2026-11-02 12:00:00', 9000, 'Governance & reporting – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-11-02', 0),
(10219, 13, 28, 35, '2026-11-03 09:30:00', '2026-11-03 16:30:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-11-03', 0),
(10220, 13, 28, 35, '2026-11-04 09:15:00', '2026-11-04 15:45:00', 23400, 'Stakeholder engagement – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-11-04', 0),
(10221, 13, 26, 35, '2026-11-06 09:00:00', '2026-11-06 15:30:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-11-06', 0),
(10222, 13, 27, 35, '2026-11-09 09:30:00', '2026-11-09 16:54:00', 26640, 'Governance & reporting – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-11-09', 0),
(10223, 13, 28, 35, '2026-11-10 09:00:00', '2026-11-10 16:00:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-11-10', 0),
(10224, 13, 27, 35, '2026-11-12 09:15:00', '2026-11-12 16:39:00', 26640, 'Governance & reporting – BAU – Economic Growth', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:28', '2026-11-12', 0),
(10225, 13, 29, 35, '2026-11-13 09:15:00', '2026-11-13 11:15:00', 7200, 'Admin & BAU – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-11-13', 0),
(10226, 13, 28, 35, '2026-11-16 09:00:00', '2026-11-16 16:00:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-11-16', 0),
(10227, 13, 28, 35, '2026-11-17 09:00:00', '2026-11-17 11:30:00', 9000, 'Stakeholder engagement – BAU – Economic Growth', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:28', '2026-11-17', 0),
(10228, 13, 27, 35, '2026-11-18 09:00:00', '2026-11-18 13:00:00', 14400, 'Governance & reporting – BAU – Economic Growth', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:28', '2026-11-18', 0),
(10229, 13, 29, 35, '2026-11-19 09:15:00', '2026-11-19 14:15:00', 18000, 'Admin & BAU – BAU – Economic Growth', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-11-19', 0),
(10230, 13, 30, 35, '2026-11-23 09:00:00', '2026-11-23 11:00:00', 7200, 'Training – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-11-23', 0),
(10231, 13, 26, 35, '2026-11-24 09:30:00', '2026-11-24 16:30:00', 25200, 'Project delivery – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-11-24', 0),
(10232, 13, 28, 35, '2026-11-25 09:30:00', '2026-11-25 16:30:00', 25200, 'Stakeholder engagement – BAU – Economic Growth', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:28', '2026-11-25', 0),
(10233, 13, 26, 35, '2026-11-26 09:30:00', '2026-11-26 11:30:00', 7200, 'Project delivery – BAU – Economic Growth', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:28', '2026-11-26', 0),
(10234, 13, 26, 35, '2026-11-27 09:00:00', '2026-11-27 15:30:00', 23400, 'Project delivery – BAU – Economic Growth', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:28', '2026-11-27', 0),
(10235, 15, 26, 36, '2026-01-07 09:30:00', '2026-01-07 16:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-01-07', 0),
(10236, 15, 27, 36, '2026-01-08 09:00:00', '2026-01-08 14:00:00', 18000, 'Governance & reporting – BAU – Corporate Services', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-01-08', 0),
(10237, 15, 28, 36, '2026-01-09 09:15:00', '2026-01-09 16:39:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-01-09', 0),
(10238, 15, 30, 36, '2026-01-12 09:00:00', '2026-01-12 11:30:00', 9000, 'Training – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-01-12', 0),
(10239, 15, 26, 36, '2026-01-13 09:15:00', '2026-01-13 16:39:00', 26640, 'Project delivery – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-01-13', 0),
(10240, 15, 26, 36, '2026-01-14 09:15:00', '2026-01-14 14:15:00', 18000, 'Project delivery – BAU – Corporate Services', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-01-14', 0),
(10241, 15, 30, 36, '2026-01-15 09:00:00', '2026-01-15 16:24:00', 26640, 'Training – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-01-15', 0),
(10242, 15, 28, 36, '2026-01-19 09:00:00', '2026-01-19 16:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-01-19', 0),
(10243, 15, 26, 36, '2026-01-22 09:15:00', '2026-01-22 12:45:00', 12600, 'Project delivery – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-01-22', 0),
(10244, 15, 26, 36, '2026-01-23 09:30:00', '2026-01-23 16:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-01-23', 0),
(10245, 15, 26, 36, '2026-01-26 09:15:00', '2026-01-26 16:15:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-01-26', 0),
(10246, 15, 29, 36, '2026-01-27 09:15:00', '2026-01-27 12:15:00', 10800, 'Admin & BAU – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-01-27', 0),
(10247, 15, 26, 36, '2026-01-28 09:30:00', '2026-01-28 13:00:00', 12600, 'Project delivery – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-01-28', 0),
(10248, 15, 26, 36, '2026-01-29 09:30:00', '2026-01-29 16:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-01-29', 0),
(10249, 15, 26, 36, '2026-02-02 09:15:00', '2026-02-02 11:45:00', 9000, 'Project delivery – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-02-02', 0),
(10250, 15, 31, 36, '2026-02-03 09:15:00', '2026-02-03 16:39:00', 26640, 'Meetings – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-02-03', 0),
(10251, 15, 26, 36, '2026-02-04 09:15:00', '2026-02-04 16:15:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-02-04', 0),
(10252, 15, 28, 36, '2026-02-05 09:15:00', '2026-02-05 11:15:00', 7200, 'Stakeholder engagement – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-02-05', 0),
(10253, 15, 28, 36, '2026-02-06 09:15:00', '2026-02-06 13:15:00', 14400, 'Stakeholder engagement – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-02-06', 0),
(10254, 15, 26, 36, '2026-02-13 09:15:00', '2026-02-13 16:15:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-02-13', 0),
(10255, 15, 28, 36, '2026-02-19 09:00:00', '2026-02-19 16:24:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-02-19', 0),
(10256, 15, 26, 36, '2026-02-20 09:30:00', '2026-02-20 16:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-02-20', 0),
(10257, 15, 29, 36, '2026-02-23 09:30:00', '2026-02-23 16:54:00', 26640, 'Admin & BAU – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-02-23', 0),
(10258, 15, 27, 36, '2026-02-24 09:30:00', '2026-02-24 16:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-02-24', 0),
(10259, 15, 29, 36, '2026-03-02 09:15:00', '2026-03-02 16:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-03-02', 0),
(10260, 15, 26, 36, '2026-03-03 09:00:00', '2026-03-03 11:00:00', 7200, 'Project delivery – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-03-03', 0),
(10261, 15, 27, 36, '2026-03-04 09:15:00', '2026-03-04 16:15:00', 25200, 'Governance & reporting – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-03-04', 0),
(10262, 15, 31, 36, '2026-03-06 09:15:00', '2026-03-06 11:15:00', 7200, 'Meetings – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-03-06', 0),
(10263, 15, 28, 36, '2026-03-11 09:00:00', '2026-03-11 13:00:00', 14400, 'Stakeholder engagement – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-03-11', 0),
(10264, 15, 27, 36, '2026-03-12 09:00:00', '2026-03-12 16:24:00', 26640, 'Governance & reporting – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-03-12', 0),
(10265, 15, 29, 36, '2026-03-13 09:00:00', '2026-03-13 16:00:00', 25200, 'Admin & BAU – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-03-13', 0),
(10266, 15, 27, 36, '2026-03-16 09:00:00', '2026-03-16 15:30:00', 23400, 'Governance & reporting – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-03-16', 0),
(10267, 15, 26, 36, '2026-03-17 09:00:00', '2026-03-17 15:30:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-03-17', 0),
(10268, 15, 29, 36, '2026-03-19 09:00:00', '2026-03-19 12:30:00', 12600, 'Admin & BAU – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-03-19', 0),
(10269, 15, 29, 36, '2026-03-23 09:30:00', '2026-03-23 16:54:00', 26640, 'Admin & BAU – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-03-23', 0),
(10270, 15, 28, 36, '2026-03-24 09:30:00', '2026-03-24 13:00:00', 12600, 'Stakeholder engagement – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-03-24', 0),
(10271, 15, 26, 36, '2026-03-25 09:30:00', '2026-03-25 16:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-03-25', 0),
(10272, 15, 28, 36, '2026-03-26 09:00:00', '2026-03-26 16:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-03-26', 0),
(10273, 15, 26, 36, '2026-03-27 09:30:00', '2026-03-27 16:00:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-03-27', 0),
(10274, 15, 26, 36, '2026-03-30 08:30:00', '2026-03-30 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-03-30', 0),
(10275, 15, 27, 36, '2026-04-01 08:15:00', '2026-04-01 11:45:00', 12600, 'Governance & reporting – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-04-01', 0),
(10276, 15, 27, 36, '2026-04-02 08:15:00', '2026-04-02 14:45:00', 23400, 'Governance & reporting – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-04-02', 0),
(10277, 15, 31, 36, '2026-04-03 08:30:00', '2026-04-03 15:54:00', 26640, 'Meetings – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-04-03', 0),
(10278, 15, 30, 36, '2026-04-06 08:00:00', '2026-04-06 15:00:00', 25200, 'Training – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-04-06', 0),
(10279, 15, 29, 36, '2026-04-08 08:30:00', '2026-04-08 15:00:00', 23400, 'Admin & BAU – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-04-08', 0),
(10280, 15, 29, 36, '2026-04-09 08:15:00', '2026-04-09 15:39:00', 26640, 'Admin & BAU – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-04-09', 0),
(10281, 15, 26, 36, '2026-04-10 08:30:00', '2026-04-10 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-04-10', 0),
(10282, 15, 26, 36, '2026-04-13 08:30:00', '2026-04-13 11:30:00', 10800, 'Project delivery – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-04-13', 0),
(10283, 15, 28, 36, '2026-04-14 08:30:00', '2026-04-14 15:00:00', 23400, 'Stakeholder engagement – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-04-14', 0),
(10284, 15, 26, 36, '2026-04-15 08:30:00', '2026-04-15 12:30:00', 14400, 'Project delivery – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-04-15', 0),
(10285, 15, 30, 36, '2026-04-16 08:15:00', '2026-04-16 14:45:00', 23400, 'Training – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-04-16', 0),
(10286, 15, 28, 36, '2026-04-17 08:30:00', '2026-04-17 15:00:00', 23400, 'Stakeholder engagement – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-04-17', 0),
(10287, 15, 27, 36, '2026-04-20 08:30:00', '2026-04-20 12:00:00', 12600, 'Governance & reporting – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-04-20', 0),
(10288, 15, 28, 36, '2026-04-27 08:00:00', '2026-04-27 15:24:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-04-27', 0),
(10289, 15, 29, 36, '2026-04-28 08:15:00', '2026-04-28 11:45:00', 12600, 'Admin & BAU – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-04-28', 0),
(10290, 15, 29, 36, '2026-04-29 08:30:00', '2026-04-29 15:30:00', 25200, 'Admin & BAU – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-04-29', 0),
(10291, 15, 26, 36, '2026-04-30 08:30:00', '2026-04-30 15:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-04-30', 0),
(10292, 15, 26, 36, '2026-05-01 08:15:00', '2026-05-01 11:45:00', 12600, 'Project delivery – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-05-01', 0),
(10293, 15, 27, 36, '2026-05-05 08:30:00', '2026-05-05 15:00:00', 23400, 'Governance & reporting – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-05-05', 0),
(10294, 15, 28, 36, '2026-05-06 08:15:00', '2026-05-06 11:45:00', 12600, 'Stakeholder engagement – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-05-06', 0),
(10295, 15, 26, 36, '2026-05-07 08:15:00', '2026-05-07 15:15:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-05-07', 0),
(10296, 15, 31, 36, '2026-05-08 08:00:00', '2026-05-08 10:30:00', 9000, 'Meetings – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-05-08', 0),
(10297, 15, 27, 36, '2026-05-11 08:30:00', '2026-05-11 15:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-05-11', 0),
(10298, 15, 26, 36, '2026-05-12 08:30:00', '2026-05-12 15:00:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-05-12', 0),
(10299, 15, 28, 36, '2026-05-13 08:00:00', '2026-05-13 12:00:00', 14400, 'Stakeholder engagement – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-05-13', 0),
(10300, 15, 29, 36, '2026-05-14 08:00:00', '2026-05-14 14:30:00', 23400, 'Admin & BAU – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-05-14', 0),
(10301, 15, 26, 36, '2026-05-18 08:30:00', '2026-05-18 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-05-18', 0),
(10302, 15, 29, 36, '2026-05-19 08:00:00', '2026-05-19 12:00:00', 14400, 'Admin & BAU – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-05-19', 0),
(10303, 15, 27, 36, '2026-05-21 08:30:00', '2026-05-21 11:00:00', 9000, 'Governance & reporting – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-05-21', 0),
(10304, 15, 27, 36, '2026-05-26 08:15:00', '2026-05-26 11:15:00', 10800, 'Governance & reporting – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-05-26', 0),
(10305, 15, 26, 36, '2026-05-27 08:15:00', '2026-05-27 10:45:00', 9000, 'Project delivery – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-05-27', 0),
(10306, 15, 27, 36, '2026-05-28 08:15:00', '2026-05-28 15:15:00', 25200, 'Governance & reporting – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-05-28', 0),
(10307, 15, 26, 36, '2026-05-29 08:30:00', '2026-05-29 15:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-05-29', 0),
(10308, 15, 29, 36, '2026-06-01 08:30:00', '2026-06-01 14:30:00', 21600, 'Admin & BAU – BAU – Corporate Services', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:28', '2026-06-01', 0),
(10309, 15, 29, 36, '2026-06-02 08:15:00', '2026-06-02 15:39:00', 26640, 'Admin & BAU – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-06-02', 0),
(10310, 15, 28, 36, '2026-06-03 08:00:00', '2026-06-03 15:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-06-03', 0),
(10311, 15, 27, 36, '2026-06-04 08:00:00', '2026-06-04 10:00:00', 7200, 'Governance & reporting – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-06-04', 0),
(10312, 15, 26, 36, '2026-06-08 08:00:00', '2026-06-08 13:00:00', 18000, 'Project delivery – BAU – Corporate Services', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-06-08', 0),
(10313, 15, 29, 36, '2026-06-09 08:00:00', '2026-06-09 15:00:00', 25200, 'Admin & BAU – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-06-09', 0),
(10314, 15, 26, 36, '2026-06-10 08:30:00', '2026-06-10 11:00:00', 9000, 'Project delivery – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-06-10', 0),
(10315, 15, 28, 36, '2026-06-11 08:15:00', '2026-06-11 15:15:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-06-11', 0),
(10316, 15, 29, 36, '2026-06-15 08:15:00', '2026-06-15 11:45:00', 12600, 'Admin & BAU – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-06-15', 0),
(10317, 15, 26, 36, '2026-06-16 08:15:00', '2026-06-16 10:15:00', 7200, 'Project delivery – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-06-16', 0),
(10318, 15, 28, 36, '2026-06-17 08:00:00', '2026-06-17 10:30:00', 9000, 'Stakeholder engagement – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-06-17', 0),
(10319, 15, 26, 36, '2026-06-18 08:00:00', '2026-06-18 12:00:00', 14400, 'Project delivery – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-06-18', 0),
(10320, 15, 31, 36, '2026-06-19 08:00:00', '2026-06-19 14:30:00', 23400, 'Meetings – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-06-19', 0),
(10321, 15, 26, 36, '2026-06-22 08:30:00', '2026-06-22 11:30:00', 10800, 'Project delivery – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-06-22', 0),
(10322, 15, 26, 36, '2026-06-23 08:15:00', '2026-06-23 11:15:00', 10800, 'Project delivery – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-06-23', 0),
(10323, 15, 27, 36, '2026-06-24 08:00:00', '2026-06-24 11:30:00', 12600, 'Governance & reporting – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-06-24', 0),
(10324, 15, 29, 36, '2026-06-25 08:30:00', '2026-06-25 11:30:00', 10800, 'Admin & BAU – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-06-25', 0),
(10325, 15, 26, 36, '2026-06-29 08:30:00', '2026-06-29 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-06-29', 0),
(10326, 15, 30, 36, '2026-06-30 08:30:00', '2026-06-30 12:00:00', 12600, 'Training – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-06-30', 0),
(10327, 15, 26, 36, '2026-07-01 08:30:00', '2026-07-01 15:00:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-07-01', 0),
(10328, 15, 26, 36, '2026-07-02 08:15:00', '2026-07-02 12:15:00', 14400, 'Project delivery – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-07-02', 0),
(10329, 15, 26, 36, '2026-07-03 08:00:00', '2026-07-03 14:30:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-07-03', 0),
(10330, 15, 29, 36, '2026-07-06 08:00:00', '2026-07-06 10:30:00', 9000, 'Admin & BAU – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-07-06', 0),
(10331, 15, 28, 36, '2026-07-07 08:30:00', '2026-07-07 12:00:00', 12600, 'Stakeholder engagement – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-07-07', 0),
(10332, 15, 28, 36, '2026-07-08 08:15:00', '2026-07-08 14:15:00', 21600, 'Stakeholder engagement – BAU – Corporate Services', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:28', '2026-07-08', 0),
(10333, 15, 26, 36, '2026-07-09 08:15:00', '2026-07-09 13:15:00', 18000, 'Project delivery – BAU – Corporate Services', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-07-09', 0),
(10334, 15, 26, 36, '2026-07-10 08:30:00', '2026-07-10 11:00:00', 9000, 'Project delivery – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-07-10', 0),
(10335, 15, 28, 36, '2026-07-13 08:30:00', '2026-07-13 15:00:00', 23400, 'Stakeholder engagement – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-07-13', 0),
(10336, 15, 28, 36, '2026-07-14 08:00:00', '2026-07-14 12:00:00', 14400, 'Stakeholder engagement – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-07-14', 0),
(10337, 15, 26, 36, '2026-07-15 08:30:00', '2026-07-15 15:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-07-15', 0),
(10338, 15, 29, 36, '2026-07-17 08:30:00', '2026-07-17 10:30:00', 7200, 'Admin & BAU – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-07-17', 0),
(10339, 15, 26, 36, '2026-07-20 08:30:00', '2026-07-20 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-07-20', 0),
(10340, 15, 29, 36, '2026-07-23 08:15:00', '2026-07-23 14:45:00', 23400, 'Admin & BAU – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-07-23', 0),
(10341, 15, 28, 36, '2026-07-28 08:00:00', '2026-07-28 11:00:00', 10800, 'Stakeholder engagement – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-07-28', 0),
(10342, 15, 26, 36, '2026-07-30 08:15:00', '2026-07-30 14:45:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-07-30', 0),
(10343, 15, 26, 36, '2026-08-04 08:15:00', '2026-08-04 11:15:00', 10800, 'Project delivery – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-08-04', 0),
(10344, 15, 27, 36, '2026-08-05 08:15:00', '2026-08-05 15:15:00', 25200, 'Governance & reporting – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-08-05', 0),
(10345, 15, 28, 36, '2026-08-06 08:00:00', '2026-08-06 15:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-08-06', 0),
(10346, 15, 28, 36, '2026-08-07 08:15:00', '2026-08-07 15:15:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-08-07', 0),
(10347, 15, 26, 36, '2026-08-10 08:00:00', '2026-08-10 14:30:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-08-10', 0),
(10348, 15, 26, 36, '2026-08-11 08:30:00', '2026-08-11 15:30:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-08-11', 0),
(10349, 15, 27, 36, '2026-08-14 08:15:00', '2026-08-14 15:15:00', 25200, 'Governance & reporting – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-08-14', 0),
(10350, 15, 26, 36, '2026-08-18 08:30:00', '2026-08-18 12:00:00', 12600, 'Project delivery – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-08-18', 0),
(10351, 15, 26, 36, '2026-08-19 08:00:00', '2026-08-19 14:00:00', 21600, 'Project delivery – BAU – Corporate Services', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:28', '2026-08-19', 0),
(10352, 15, 28, 36, '2026-08-20 08:00:00', '2026-08-20 15:24:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-08-20', 0),
(10353, 15, 29, 36, '2026-08-21 08:15:00', '2026-08-21 15:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-08-21', 0),
(10354, 15, 27, 36, '2026-08-24 08:00:00', '2026-08-24 15:24:00', 26640, 'Governance & reporting – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-08-24', 0),
(10355, 15, 26, 36, '2026-08-25 08:15:00', '2026-08-25 15:15:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-08-25', 0),
(10356, 15, 30, 36, '2026-08-26 08:15:00', '2026-08-26 11:45:00', 12600, 'Training – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-08-26', 0),
(10357, 15, 29, 36, '2026-08-28 08:30:00', '2026-08-28 12:00:00', 12600, 'Admin & BAU – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-08-28', 0),
(10358, 15, 29, 36, '2026-08-31 08:00:00', '2026-08-31 11:30:00', 12600, 'Admin & BAU – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-08-31', 0),
(10359, 15, 28, 36, '2026-09-01 08:00:00', '2026-09-01 14:30:00', 23400, 'Stakeholder engagement – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-09-01', 0),
(10360, 15, 26, 36, '2026-09-02 08:30:00', '2026-09-02 12:00:00', 12600, 'Project delivery – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-09-02', 0),
(10361, 15, 29, 36, '2026-09-03 08:00:00', '2026-09-03 10:00:00', 7200, 'Admin & BAU – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-09-03', 0),
(10362, 15, 26, 36, '2026-09-04 08:15:00', '2026-09-04 12:15:00', 14400, 'Project delivery – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-09-04', 0),
(10363, 15, 31, 36, '2026-09-07 08:15:00', '2026-09-07 15:15:00', 25200, 'Meetings – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-09-07', 0),
(10364, 15, 26, 36, '2026-09-09 08:15:00', '2026-09-09 12:15:00', 14400, 'Project delivery – BAU – Corporate Services', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:28', '2026-09-09', 0),
(10365, 15, 31, 36, '2026-09-11 08:00:00', '2026-09-11 14:30:00', 23400, 'Meetings – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-09-11', 0),
(10366, 15, 28, 36, '2026-09-14 08:00:00', '2026-09-14 15:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-09-14', 0),
(10367, 15, 26, 36, '2026-09-15 08:00:00', '2026-09-15 10:30:00', 9000, 'Project delivery – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-09-15', 0),
(10368, 15, 30, 36, '2026-09-16 08:15:00', '2026-09-16 10:45:00', 9000, 'Training – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-09-16', 0),
(10369, 15, 26, 36, '2026-09-17 08:00:00', '2026-09-17 11:30:00', 12600, 'Project delivery – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-09-17', 0),
(10370, 15, 28, 36, '2026-09-21 08:00:00', '2026-09-21 11:00:00', 10800, 'Stakeholder engagement – BAU – Corporate Services', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:28', '2026-09-21', 0),
(10371, 15, 26, 36, '2026-09-22 08:00:00', '2026-09-22 13:00:00', 18000, 'Project delivery – BAU – Corporate Services', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-09-22', 0),
(10372, 15, 28, 36, '2026-09-23 08:15:00', '2026-09-23 13:15:00', 18000, 'Stakeholder engagement – BAU – Corporate Services', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-09-23', 0),
(10373, 15, 26, 36, '2026-09-25 08:00:00', '2026-09-25 10:30:00', 9000, 'Project delivery – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-09-25', 0),
(10374, 15, 28, 36, '2026-09-28 08:30:00', '2026-09-28 14:30:00', 21600, 'Stakeholder engagement – BAU – Corporate Services', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:28', '2026-09-28', 0),
(10375, 15, 29, 36, '2026-09-29 08:15:00', '2026-09-29 15:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-09-29', 0),
(10376, 15, 28, 36, '2026-09-30 08:15:00', '2026-09-30 10:15:00', 7200, 'Stakeholder engagement – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-09-30', 0),
(10377, 15, 26, 36, '2026-10-01 08:30:00', '2026-10-01 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-10-01', 0),
(10378, 15, 26, 36, '2026-10-06 08:30:00', '2026-10-06 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-10-06', 0),
(10379, 15, 29, 36, '2026-10-07 08:30:00', '2026-10-07 12:00:00', 12600, 'Admin & BAU – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-10-07', 0),
(10380, 15, 29, 36, '2026-10-08 08:30:00', '2026-10-08 11:00:00', 9000, 'Admin & BAU – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-10-08', 0),
(10381, 15, 26, 36, '2026-10-09 08:30:00', '2026-10-09 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-10-09', 0),
(10382, 15, 26, 36, '2026-10-13 08:00:00', '2026-10-13 15:24:00', 26640, 'Project delivery – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-10-13', 0),
(10383, 15, 30, 36, '2026-10-14 08:30:00', '2026-10-14 13:30:00', 18000, 'Training – BAU – Corporate Services', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-10-14', 0),
(10384, 15, 26, 36, '2026-10-15 08:30:00', '2026-10-15 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-10-15', 0),
(10385, 15, 26, 36, '2026-10-16 08:15:00', '2026-10-16 10:45:00', 9000, 'Project delivery – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-10-16', 0),
(10386, 15, 28, 36, '2026-10-20 08:30:00', '2026-10-20 15:00:00', 23400, 'Stakeholder engagement – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-10-20', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(10387, 15, 28, 36, '2026-10-21 08:15:00', '2026-10-21 14:15:00', 21600, 'Stakeholder engagement – BAU – Corporate Services', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:28', '2026-10-21', 0),
(10388, 15, 27, 36, '2026-10-22 08:30:00', '2026-10-22 11:00:00', 9000, 'Governance & reporting – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-10-22', 0),
(10389, 15, 26, 36, '2026-10-23 08:00:00', '2026-10-23 13:00:00', 18000, 'Project delivery – BAU – Corporate Services', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-10-23', 0),
(10390, 15, 29, 36, '2026-10-26 09:30:00', '2026-10-26 11:30:00', 7200, 'Admin & BAU – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-10-26', 0),
(10391, 15, 31, 36, '2026-10-28 09:00:00', '2026-10-28 15:30:00', 23400, 'Meetings – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-10-28', 0),
(10392, 15, 31, 36, '2026-10-29 09:30:00', '2026-10-29 11:30:00', 7200, 'Meetings – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-10-29', 0),
(10393, 15, 26, 36, '2026-11-02 09:00:00', '2026-11-02 15:30:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-11-02', 0),
(10394, 15, 26, 36, '2026-11-03 09:00:00', '2026-11-03 15:30:00', 23400, 'Project delivery – BAU – Corporate Services', 182, NULL, 28, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:28', '2026-11-03', 0),
(10395, 15, 26, 36, '2026-11-04 09:00:00', '2026-11-04 16:24:00', 26640, 'Project delivery – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-11-04', 0),
(10396, 15, 26, 36, '2026-11-05 09:30:00', '2026-11-05 15:30:00', 21600, 'Project delivery – BAU – Corporate Services', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:28', '2026-11-05', 0),
(10397, 15, 28, 36, '2026-11-06 09:00:00', '2026-11-06 16:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-11-06', 0),
(10398, 15, 26, 36, '2026-11-09 09:00:00', '2026-11-09 11:00:00', 7200, 'Project delivery – BAU – Corporate Services', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:28', '2026-11-09', 0),
(10399, 15, 27, 36, '2026-11-10 09:15:00', '2026-11-10 16:39:00', 26640, 'Governance & reporting – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-11-10', 0),
(10400, 15, 29, 36, '2026-11-12 09:30:00', '2026-11-12 16:30:00', 25200, 'Admin & BAU – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-11-12', 0),
(10401, 15, 29, 36, '2026-11-13 09:15:00', '2026-11-13 16:39:00', 26640, 'Admin & BAU – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-11-13', 0),
(10402, 15, 28, 36, '2026-11-16 09:30:00', '2026-11-16 13:00:00', 12600, 'Stakeholder engagement – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-11-16', 0),
(10403, 15, 29, 36, '2026-11-17 09:15:00', '2026-11-17 12:45:00', 12600, 'Admin & BAU – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-11-17', 0),
(10404, 15, 29, 36, '2026-11-18 09:15:00', '2026-11-18 11:45:00', 9000, 'Admin & BAU – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-11-18', 0),
(10405, 15, 26, 36, '2026-11-19 09:00:00', '2026-11-19 16:00:00', 25200, 'Project delivery – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-11-19', 0),
(10406, 15, 28, 36, '2026-11-24 09:00:00', '2026-11-24 16:24:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 207.2, NULL, 28, 0, 'Europe/London', 177.6, 1, 'work', '2026-11-28 10:30:28', '2026-11-24', 0),
(10407, 15, 29, 36, '2026-11-25 09:00:00', '2026-11-25 11:30:00', 9000, 'Admin & BAU – BAU – Corporate Services', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:28', '2026-11-25', 0),
(10408, 15, 27, 36, '2026-11-26 09:15:00', '2026-11-26 12:45:00', 12600, 'Governance & reporting – BAU – Corporate Services', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:28', '2026-11-26', 0),
(10409, 15, 29, 36, '2026-11-27 09:15:00', '2026-11-27 16:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:28', '2026-11-27', 0),
(10410, 8, 26, 36, '2026-01-06 09:00:00', '2026-01-06 16:24:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-01-06', 0),
(10411, 8, 27, 36, '2026-01-07 09:15:00', '2026-01-07 16:15:00', 25200, 'Governance & reporting – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-01-07', 0),
(10412, 8, 27, 36, '2026-01-09 09:00:00', '2026-01-09 15:30:00', 23400, 'Governance & reporting – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-01-09', 0),
(10413, 8, 26, 36, '2026-01-12 09:15:00', '2026-01-12 16:39:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-01-12', 0),
(10414, 8, 27, 36, '2026-01-13 09:15:00', '2026-01-13 11:45:00', 9000, 'Governance & reporting – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-01-13', 0),
(10415, 8, 30, 36, '2026-01-14 09:00:00', '2026-01-14 12:30:00', 12600, 'Training – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-01-14', 0),
(10416, 8, 26, 36, '2026-01-15 09:00:00', '2026-01-15 12:30:00', 12600, 'Project delivery – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-01-15', 0),
(10417, 8, 26, 36, '2026-01-19 09:15:00', '2026-01-19 15:45:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-01-19', 0),
(10418, 8, 26, 36, '2026-01-20 09:15:00', '2026-01-20 16:15:00', 25200, 'Project delivery – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-01-20', 0),
(10419, 8, 26, 36, '2026-01-22 09:15:00', '2026-01-22 16:39:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-01-22', 0),
(10420, 8, 26, 36, '2026-01-23 09:30:00', '2026-01-23 16:00:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-01-23', 0),
(10421, 8, 27, 36, '2026-01-28 09:00:00', '2026-01-28 11:30:00', 9000, 'Governance & reporting – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-01-28', 0),
(10422, 8, 29, 36, '2026-02-06 09:30:00', '2026-02-06 12:30:00', 10800, 'Admin & BAU – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-02-06', 0),
(10423, 8, 28, 36, '2026-02-09 09:00:00', '2026-02-09 16:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-02-09', 0),
(10424, 8, 26, 36, '2026-02-10 09:00:00', '2026-02-10 14:00:00', 18000, 'Project delivery – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-02-10', 0),
(10425, 8, 27, 36, '2026-02-11 09:30:00', '2026-02-11 12:30:00', 10800, 'Governance & reporting – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-02-11', 0),
(10426, 8, 26, 36, '2026-02-12 09:30:00', '2026-02-12 13:00:00', 12600, 'Project delivery – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-02-12', 0),
(10427, 8, 27, 36, '2026-02-13 09:15:00', '2026-02-13 14:15:00', 18000, 'Governance & reporting – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-02-13', 0),
(10428, 8, 29, 36, '2026-02-17 09:00:00', '2026-02-17 12:00:00', 10800, 'Admin & BAU – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-02-17', 0),
(10429, 8, 26, 36, '2026-02-18 09:15:00', '2026-02-18 12:15:00', 10800, 'Project delivery – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-02-18', 0),
(10430, 8, 29, 36, '2026-02-19 09:15:00', '2026-02-19 16:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-02-19', 0),
(10431, 8, 31, 36, '2026-02-20 09:00:00', '2026-02-20 16:00:00', 25200, 'Meetings – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-02-20', 0),
(10432, 8, 30, 36, '2026-02-24 09:30:00', '2026-02-24 16:30:00', 25200, 'Training – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-02-24', 0),
(10433, 8, 26, 36, '2026-02-26 09:15:00', '2026-02-26 12:45:00', 12600, 'Project delivery – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-02-26', 0),
(10434, 8, 28, 36, '2026-03-02 09:30:00', '2026-03-02 13:00:00', 12600, 'Stakeholder engagement – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-03-02', 0),
(10435, 8, 29, 36, '2026-03-04 09:30:00', '2026-03-04 12:30:00', 10800, 'Admin & BAU – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-03-04', 0),
(10436, 8, 27, 36, '2026-03-06 09:30:00', '2026-03-06 16:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-03-06', 0),
(10437, 8, 27, 36, '2026-03-10 09:15:00', '2026-03-10 12:45:00', 12600, 'Governance & reporting – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-03-10', 0),
(10438, 8, 27, 36, '2026-03-16 09:00:00', '2026-03-16 12:30:00', 12600, 'Governance & reporting – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-03-16', 0),
(10439, 8, 28, 36, '2026-03-17 09:30:00', '2026-03-17 16:30:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-03-17', 0),
(10440, 8, 28, 36, '2026-03-18 09:15:00', '2026-03-18 15:15:00', 21600, 'Stakeholder engagement – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-03-18', 0),
(10441, 8, 26, 36, '2026-03-19 09:30:00', '2026-03-19 14:30:00', 18000, 'Project delivery – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-03-19', 0),
(10442, 8, 26, 36, '2026-03-20 09:00:00', '2026-03-20 15:30:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-03-20', 0),
(10443, 8, 26, 36, '2026-03-23 09:30:00', '2026-03-23 12:00:00', 9000, 'Project delivery – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-03-23', 0),
(10444, 8, 27, 36, '2026-03-25 09:15:00', '2026-03-25 11:45:00', 9000, 'Governance & reporting – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-03-25', 0),
(10445, 8, 29, 36, '2026-03-26 09:00:00', '2026-03-26 11:30:00', 9000, 'Admin & BAU – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-03-26', 0),
(10446, 8, 26, 36, '2026-03-27 09:00:00', '2026-03-27 11:30:00', 9000, 'Project delivery – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-03-27', 0),
(10447, 8, 26, 36, '2026-03-30 08:15:00', '2026-03-30 11:15:00', 10800, 'Project delivery – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-03-30', 0),
(10448, 8, 26, 36, '2026-03-31 08:15:00', '2026-03-31 13:15:00', 18000, 'Project delivery – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-03-31', 0),
(10449, 8, 28, 36, '2026-04-01 08:00:00', '2026-04-01 10:30:00', 9000, 'Stakeholder engagement – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-04-01', 0),
(10450, 8, 27, 36, '2026-04-03 08:00:00', '2026-04-03 15:00:00', 25200, 'Governance & reporting – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-04-03', 0),
(10451, 8, 27, 36, '2026-04-08 08:00:00', '2026-04-08 11:30:00', 12600, 'Governance & reporting – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-04-08', 0),
(10452, 8, 27, 36, '2026-04-09 08:00:00', '2026-04-09 14:30:00', 23400, 'Governance & reporting – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-04-09', 0),
(10453, 8, 28, 36, '2026-04-10 08:15:00', '2026-04-10 12:15:00', 14400, 'Stakeholder engagement – BAU – Corporate Services', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:28', '2026-04-10', 0),
(10454, 8, 27, 36, '2026-04-13 08:15:00', '2026-04-13 10:45:00', 9000, 'Governance & reporting – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-04-13', 0),
(10455, 8, 26, 36, '2026-04-14 08:00:00', '2026-04-14 15:00:00', 25200, 'Project delivery – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-04-14', 0),
(10456, 8, 29, 36, '2026-04-15 08:30:00', '2026-04-15 11:30:00', 10800, 'Admin & BAU – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-04-15', 0),
(10457, 8, 27, 36, '2026-04-17 08:15:00', '2026-04-17 15:15:00', 25200, 'Governance & reporting – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-04-17', 0),
(10458, 8, 27, 36, '2026-04-20 08:30:00', '2026-04-20 13:30:00', 18000, 'Governance & reporting – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-04-20', 0),
(10459, 8, 26, 36, '2026-04-21 08:15:00', '2026-04-21 15:15:00', 25200, 'Project delivery – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-04-21', 0),
(10460, 8, 27, 36, '2026-04-23 08:15:00', '2026-04-23 10:15:00', 7200, 'Governance & reporting – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-04-23', 0),
(10461, 8, 26, 36, '2026-04-24 08:15:00', '2026-04-24 15:39:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-04-24', 0),
(10462, 8, 30, 36, '2026-04-27 08:30:00', '2026-04-27 12:00:00', 12600, 'Training – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-04-27', 0),
(10463, 8, 26, 36, '2026-04-28 08:15:00', '2026-04-28 11:15:00', 10800, 'Project delivery – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-04-28', 0),
(10464, 8, 31, 36, '2026-04-29 08:30:00', '2026-04-29 14:30:00', 21600, 'Meetings – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-04-29', 0),
(10465, 8, 26, 36, '2026-04-30 08:30:00', '2026-04-30 15:30:00', 25200, 'Project delivery – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-04-30', 0),
(10466, 8, 30, 36, '2026-05-01 08:15:00', '2026-05-01 10:15:00', 7200, 'Training – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-05-01', 0),
(10467, 8, 30, 36, '2026-05-04 08:15:00', '2026-05-04 15:39:00', 26640, 'Training – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-05-04', 0),
(10468, 8, 29, 36, '2026-05-07 08:00:00', '2026-05-07 10:00:00', 7200, 'Admin & BAU – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-05-07', 0),
(10469, 8, 26, 36, '2026-05-08 08:00:00', '2026-05-08 14:00:00', 21600, 'Project delivery – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-05-08', 0),
(10470, 8, 27, 36, '2026-05-11 08:30:00', '2026-05-11 11:00:00', 9000, 'Governance & reporting – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-05-11', 0),
(10471, 8, 26, 36, '2026-05-12 08:15:00', '2026-05-12 14:15:00', 21600, 'Project delivery – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-05-12', 0),
(10472, 8, 26, 36, '2026-05-13 08:15:00', '2026-05-13 11:15:00', 10800, 'Project delivery – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-05-13', 0),
(10473, 8, 26, 36, '2026-05-14 08:00:00', '2026-05-14 11:00:00', 10800, 'Project delivery – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-05-14', 0),
(10474, 8, 26, 36, '2026-05-15 08:00:00', '2026-05-15 13:00:00', 18000, 'Project delivery – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-05-15', 0),
(10475, 8, 27, 36, '2026-05-18 08:30:00', '2026-05-18 15:00:00', 23400, 'Governance & reporting – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-05-18', 0),
(10476, 8, 27, 36, '2026-05-19 08:00:00', '2026-05-19 11:00:00', 10800, 'Governance & reporting – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-05-19', 0),
(10477, 8, 26, 36, '2026-05-20 08:30:00', '2026-05-20 15:00:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-05-20', 0),
(10478, 8, 26, 36, '2026-05-22 08:15:00', '2026-05-22 14:45:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-05-22', 0),
(10479, 8, 26, 36, '2026-05-26 08:15:00', '2026-05-26 15:15:00', 25200, 'Project delivery – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-05-26', 0),
(10480, 8, 29, 36, '2026-05-28 08:15:00', '2026-05-28 11:15:00', 10800, 'Admin & BAU – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-05-28', 0),
(10481, 8, 26, 36, '2026-06-02 08:30:00', '2026-06-02 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-06-02', 0),
(10482, 8, 27, 36, '2026-06-03 08:00:00', '2026-06-03 10:30:00', 9000, 'Governance & reporting – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-06-03', 0),
(10483, 8, 29, 36, '2026-06-04 08:15:00', '2026-06-04 14:15:00', 21600, 'Admin & BAU – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-06-04', 0),
(10484, 8, 29, 36, '2026-06-08 08:15:00', '2026-06-08 10:45:00', 9000, 'Admin & BAU – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-06-08', 0),
(10485, 8, 29, 36, '2026-06-10 08:15:00', '2026-06-10 10:15:00', 7200, 'Admin & BAU – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-06-10', 0),
(10486, 8, 26, 36, '2026-06-12 08:30:00', '2026-06-12 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-06-12', 0),
(10487, 8, 27, 36, '2026-06-15 08:30:00', '2026-06-15 11:30:00', 10800, 'Governance & reporting – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-06-15', 0),
(10488, 8, 29, 36, '2026-06-16 08:15:00', '2026-06-16 13:15:00', 18000, 'Admin & BAU – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-06-16', 0),
(10489, 8, 26, 36, '2026-06-17 08:15:00', '2026-06-17 15:39:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-06-17', 0),
(10490, 8, 28, 36, '2026-06-19 08:30:00', '2026-06-19 15:54:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-06-19', 0),
(10491, 8, 28, 36, '2026-06-22 08:30:00', '2026-06-22 15:54:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-06-22', 0),
(10492, 8, 29, 36, '2026-06-24 08:30:00', '2026-06-24 13:30:00', 18000, 'Admin & BAU – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-06-24', 0),
(10493, 8, 26, 36, '2026-06-25 08:00:00', '2026-06-25 12:00:00', 14400, 'Project delivery – BAU – Corporate Services', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:28', '2026-06-25', 0),
(10494, 8, 28, 36, '2026-06-29 08:30:00', '2026-06-29 13:30:00', 18000, 'Stakeholder engagement – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-06-29', 0),
(10495, 8, 27, 36, '2026-06-30 08:30:00', '2026-06-30 15:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-06-30', 0),
(10496, 8, 26, 36, '2026-07-03 08:15:00', '2026-07-03 10:15:00', 7200, 'Project delivery – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-07-03', 0),
(10497, 8, 26, 36, '2026-07-07 08:30:00', '2026-07-07 14:30:00', 21600, 'Project delivery – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-07-07', 0),
(10498, 8, 26, 36, '2026-07-09 08:00:00', '2026-07-09 15:24:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-07-09', 0),
(10499, 8, 26, 36, '2026-07-10 08:30:00', '2026-07-10 15:00:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-07-10', 0),
(10500, 8, 26, 36, '2026-07-14 08:30:00', '2026-07-14 12:00:00', 12600, 'Project delivery – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-07-14', 0),
(10501, 8, 30, 36, '2026-07-20 08:30:00', '2026-07-20 15:54:00', 26640, 'Training – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-07-20', 0),
(10502, 8, 29, 36, '2026-07-21 08:00:00', '2026-07-21 10:00:00', 7200, 'Admin & BAU – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-07-21', 0),
(10503, 8, 26, 36, '2026-07-22 08:00:00', '2026-07-22 10:30:00', 9000, 'Project delivery – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-07-22', 0),
(10504, 8, 27, 36, '2026-07-23 08:00:00', '2026-07-23 15:24:00', 26640, 'Governance & reporting – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-07-23', 0),
(10505, 8, 26, 36, '2026-07-24 08:15:00', '2026-07-24 14:45:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-07-24', 0),
(10506, 8, 28, 36, '2026-07-27 08:15:00', '2026-07-27 10:15:00', 7200, 'Stakeholder engagement – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-07-27', 0),
(10507, 8, 29, 36, '2026-07-28 08:15:00', '2026-07-28 11:45:00', 12600, 'Admin & BAU – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-07-28', 0),
(10508, 8, 29, 36, '2026-07-30 08:00:00', '2026-07-30 10:00:00', 7200, 'Admin & BAU – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-07-30', 0),
(10509, 8, 26, 36, '2026-07-31 08:30:00', '2026-07-31 12:00:00', 12600, 'Project delivery – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-07-31', 0),
(10510, 8, 26, 36, '2026-08-04 08:00:00', '2026-08-04 15:00:00', 25200, 'Project delivery – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-08-04', 0),
(10511, 8, 27, 36, '2026-08-05 08:30:00', '2026-08-05 15:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-08-05', 0),
(10512, 8, 28, 36, '2026-08-06 08:00:00', '2026-08-06 14:30:00', 23400, 'Stakeholder engagement – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-08-06', 0),
(10513, 8, 26, 36, '2026-08-10 08:15:00', '2026-08-10 14:45:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-08-10', 0),
(10514, 8, 26, 36, '2026-08-11 08:15:00', '2026-08-11 14:45:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-08-11', 0),
(10515, 8, 27, 36, '2026-08-13 08:00:00', '2026-08-13 15:24:00', 26640, 'Governance & reporting – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-08-13', 0),
(10516, 8, 29, 36, '2026-08-14 08:30:00', '2026-08-14 12:30:00', 14400, 'Admin & BAU – BAU – Corporate Services', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:28', '2026-08-14', 0),
(10517, 8, 27, 36, '2026-08-18 08:15:00', '2026-08-18 15:15:00', 25200, 'Governance & reporting – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-08-18', 0),
(10518, 8, 27, 36, '2026-08-19 08:15:00', '2026-08-19 15:39:00', 26640, 'Governance & reporting – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-08-19', 0),
(10519, 8, 29, 36, '2026-08-20 08:15:00', '2026-08-20 11:45:00', 12600, 'Admin & BAU – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-08-20', 0),
(10520, 8, 29, 36, '2026-08-24 08:15:00', '2026-08-24 10:45:00', 9000, 'Admin & BAU – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-08-24', 0),
(10521, 8, 27, 36, '2026-08-25 08:15:00', '2026-08-25 13:15:00', 18000, 'Governance & reporting – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-08-25', 0),
(10522, 8, 26, 36, '2026-08-28 08:15:00', '2026-08-28 10:15:00', 7200, 'Project delivery – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-08-28', 0),
(10523, 8, 28, 36, '2026-08-31 08:30:00', '2026-08-31 15:54:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-08-31', 0),
(10524, 8, 26, 36, '2026-09-01 08:15:00', '2026-09-01 15:39:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-09-01', 0),
(10525, 8, 27, 36, '2026-09-03 08:15:00', '2026-09-03 11:15:00', 10800, 'Governance & reporting – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-09-03', 0),
(10526, 8, 29, 36, '2026-09-04 08:15:00', '2026-09-04 14:45:00', 23400, 'Admin & BAU – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-09-04', 0),
(10527, 8, 26, 36, '2026-09-08 08:30:00', '2026-09-08 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-09-08', 0),
(10528, 8, 26, 36, '2026-09-09 08:30:00', '2026-09-09 15:00:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-09-09', 0),
(10529, 8, 28, 36, '2026-09-10 08:00:00', '2026-09-10 14:30:00', 23400, 'Stakeholder engagement – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-09-10', 0),
(10530, 8, 26, 36, '2026-09-11 08:30:00', '2026-09-11 15:30:00', 25200, 'Project delivery – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-09-11', 0),
(10531, 8, 26, 36, '2026-09-14 08:30:00', '2026-09-14 15:00:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-09-14', 0),
(10532, 8, 26, 36, '2026-09-15 08:00:00', '2026-09-15 11:00:00', 10800, 'Project delivery – BAU – Corporate Services', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:28', '2026-09-15', 0),
(10533, 8, 26, 36, '2026-09-17 08:15:00', '2026-09-17 11:45:00', 12600, 'Project delivery – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-09-17', 0),
(10534, 8, 27, 36, '2026-09-18 08:30:00', '2026-09-18 15:00:00', 23400, 'Governance & reporting – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-09-18', 0),
(10535, 8, 26, 36, '2026-09-21 08:30:00', '2026-09-21 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-09-21', 0),
(10536, 8, 26, 36, '2026-09-23 08:30:00', '2026-09-23 13:30:00', 18000, 'Project delivery – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-09-23', 0),
(10537, 8, 28, 36, '2026-09-28 08:30:00', '2026-09-28 12:00:00', 12600, 'Stakeholder engagement – BAU – Corporate Services', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:28', '2026-09-28', 0),
(10538, 8, 26, 36, '2026-09-30 08:30:00', '2026-09-30 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-09-30', 0),
(10539, 8, 29, 36, '2026-10-01 08:30:00', '2026-10-01 15:00:00', 23400, 'Admin & BAU – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-10-01', 0),
(10540, 8, 26, 36, '2026-10-02 08:30:00', '2026-10-02 14:30:00', 21600, 'Project delivery – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-10-02', 0),
(10541, 8, 29, 36, '2026-10-06 08:00:00', '2026-10-06 13:00:00', 18000, 'Admin & BAU – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-10-06', 0),
(10542, 8, 26, 36, '2026-10-07 08:00:00', '2026-10-07 15:24:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-10-07', 0),
(10543, 8, 26, 36, '2026-10-08 08:15:00', '2026-10-08 13:15:00', 18000, 'Project delivery – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-10-08', 0),
(10544, 8, 26, 36, '2026-10-12 08:30:00', '2026-10-12 14:30:00', 21600, 'Project delivery – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-10-12', 0),
(10545, 8, 30, 36, '2026-10-13 08:00:00', '2026-10-13 15:00:00', 25200, 'Training – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-10-13', 0),
(10546, 8, 27, 36, '2026-10-14 08:30:00', '2026-10-14 15:00:00', 23400, 'Governance & reporting – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-10-14', 0),
(10547, 8, 27, 36, '2026-10-15 08:00:00', '2026-10-15 12:00:00', 14400, 'Governance & reporting – BAU – Corporate Services', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:28', '2026-10-15', 0),
(10548, 8, 31, 36, '2026-10-16 08:00:00', '2026-10-16 15:24:00', 26640, 'Meetings – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-10-16', 0),
(10549, 8, 27, 36, '2026-10-19 08:15:00', '2026-10-19 13:15:00', 18000, 'Governance & reporting – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-10-19', 0),
(10550, 8, 29, 36, '2026-10-20 08:15:00', '2026-10-20 15:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-10-20', 0),
(10551, 8, 27, 36, '2026-10-21 08:30:00', '2026-10-21 14:30:00', 21600, 'Governance & reporting – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-10-21', 0),
(10552, 8, 26, 36, '2026-10-23 08:30:00', '2026-10-23 15:00:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-10-23', 0),
(10553, 8, 27, 36, '2026-10-26 09:30:00', '2026-10-26 13:30:00', 14400, 'Governance & reporting – BAU – Corporate Services', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:28', '2026-10-26', 0),
(10554, 8, 26, 36, '2026-10-27 09:30:00', '2026-10-27 12:00:00', 9000, 'Project delivery – BAU – Corporate Services', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:28', '2026-10-27', 0),
(10555, 8, 27, 36, '2026-10-29 09:15:00', '2026-10-29 16:39:00', 26640, 'Governance & reporting – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-10-29', 0),
(10556, 8, 26, 36, '2026-11-02 09:30:00', '2026-11-02 13:30:00', 14400, 'Project delivery – BAU – Corporate Services', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:28', '2026-11-02', 0),
(10557, 8, 27, 36, '2026-11-04 09:00:00', '2026-11-04 16:24:00', 26640, 'Governance & reporting – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-11-04', 0),
(10558, 8, 30, 36, '2026-11-05 09:15:00', '2026-11-05 16:15:00', 25200, 'Training – BAU – Corporate Services', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:28', '2026-11-05', 0),
(10559, 8, 27, 36, '2026-11-06 09:15:00', '2026-11-06 16:39:00', 26640, 'Governance & reporting – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-11-06', 0),
(10560, 8, 26, 36, '2026-11-10 09:15:00', '2026-11-10 16:39:00', 26640, 'Project delivery – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-11-10', 0),
(10561, 8, 30, 36, '2026-11-11 09:15:00', '2026-11-11 15:45:00', 23400, 'Training – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-11-11', 0),
(10562, 8, 28, 36, '2026-11-16 09:30:00', '2026-11-16 16:54:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 355.2, NULL, 48, 0, 'Europe/London', 296, 1, 'work', '2026-11-28 10:30:28', '2026-11-16', 0),
(10563, 8, 26, 36, '2026-11-17 09:30:00', '2026-11-17 16:00:00', 23400, 'Project delivery – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-11-17', 0),
(10564, 8, 26, 36, '2026-11-18 09:00:00', '2026-11-18 11:00:00', 7200, 'Project delivery – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-11-18', 0),
(10565, 8, 29, 36, '2026-11-20 09:15:00', '2026-11-20 11:15:00', 7200, 'Admin & BAU – BAU – Corporate Services', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:28', '2026-11-20', 0),
(10566, 8, 29, 36, '2026-11-23 09:15:00', '2026-11-23 14:15:00', 18000, 'Admin & BAU – BAU – Corporate Services', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:28', '2026-11-23', 0),
(10567, 8, 29, 36, '2026-11-26 09:30:00', '2026-11-26 16:00:00', 23400, 'Admin & BAU – BAU – Corporate Services', 312, NULL, 48, 0, 'Europe/London', 260, 1, 'work', '2026-11-28 10:30:28', '2026-11-26', 0),
(10568, 8, 26, 36, '2026-11-27 09:30:00', '2026-11-27 15:30:00', 21600, 'Project delivery – BAU – Corporate Services', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:28', '2026-11-27', 0),
(10569, 7, 29, 36, '2026-01-07 09:30:00', '2026-01-07 16:54:00', 26640, 'Admin & BAU – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:28', '2026-01-07', 0),
(10570, 7, 26, 36, '2026-01-08 09:15:00', '2026-01-08 16:15:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-01-08', 0),
(10571, 7, 26, 36, '2026-01-09 09:15:00', '2026-01-09 15:45:00', 23400, 'Project delivery – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:28', '2026-01-09', 0),
(10572, 7, 27, 36, '2026-01-12 09:30:00', '2026-01-12 16:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-01-12', 0),
(10573, 7, 26, 36, '2026-01-13 09:00:00', '2026-01-13 15:30:00', 23400, 'Project delivery – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:28', '2026-01-13', 0),
(10574, 7, 30, 36, '2026-01-14 09:30:00', '2026-01-14 15:30:00', 21600, 'Training – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:28', '2026-01-14', 0),
(10575, 7, 31, 36, '2026-01-16 09:00:00', '2026-01-16 16:00:00', 25200, 'Meetings – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-01-16', 0),
(10576, 7, 26, 36, '2026-01-21 09:30:00', '2026-01-21 11:30:00', 7200, 'Project delivery – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:28', '2026-01-21', 0),
(10577, 7, 28, 36, '2026-01-22 09:00:00', '2026-01-22 13:00:00', 14400, 'Stakeholder engagement – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:28', '2026-01-22', 0),
(10578, 7, 26, 36, '2026-01-23 09:30:00', '2026-01-23 12:30:00', 10800, 'Project delivery – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:28', '2026-01-23', 0),
(10579, 7, 27, 36, '2026-01-27 09:15:00', '2026-01-27 12:15:00', 10800, 'Governance & reporting – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:28', '2026-01-27', 0),
(10580, 7, 28, 36, '2026-01-28 09:15:00', '2026-01-28 11:45:00', 9000, 'Stakeholder engagement – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:28', '2026-01-28', 0),
(10581, 7, 28, 36, '2026-01-29 09:00:00', '2026-01-29 16:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-01-29', 0),
(10582, 7, 26, 36, '2026-01-30 09:00:00', '2026-01-30 16:00:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-01-30', 0),
(10583, 7, 29, 36, '2026-02-02 09:30:00', '2026-02-02 14:30:00', 18000, 'Admin & BAU – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:28', '2026-02-02', 0),
(10584, 7, 27, 36, '2026-02-03 09:00:00', '2026-02-03 16:24:00', 26640, 'Governance & reporting – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:28', '2026-02-03', 0),
(10585, 7, 29, 36, '2026-02-06 09:15:00', '2026-02-06 14:15:00', 18000, 'Admin & BAU – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:28', '2026-02-06', 0),
(10586, 7, 26, 36, '2026-02-10 09:00:00', '2026-02-10 11:00:00', 7200, 'Project delivery – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:28', '2026-02-10', 0),
(10587, 7, 26, 36, '2026-02-11 09:15:00', '2026-02-11 15:45:00', 23400, 'Project delivery – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:28', '2026-02-11', 0),
(10588, 7, 29, 36, '2026-02-13 09:30:00', '2026-02-13 13:00:00', 12600, 'Admin & BAU – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:28', '2026-02-13', 0),
(10589, 7, 26, 36, '2026-02-23 09:15:00', '2026-02-23 11:45:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:28', '2026-02-23', 0),
(10590, 7, 26, 36, '2026-02-24 09:30:00', '2026-02-24 15:30:00', 21600, 'Project delivery – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:28', '2026-02-24', 0),
(10591, 7, 27, 36, '2026-02-25 09:15:00', '2026-02-25 15:45:00', 23400, 'Governance & reporting – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:28', '2026-02-25', 0),
(10592, 7, 26, 36, '2026-02-26 09:30:00', '2026-02-26 16:30:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-02-26', 0),
(10593, 7, 27, 36, '2026-02-27 09:15:00', '2026-02-27 14:15:00', 18000, 'Governance & reporting – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:28', '2026-02-27', 0),
(10594, 7, 30, 36, '2026-03-02 09:00:00', '2026-03-02 15:00:00', 21600, 'Training – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:28', '2026-03-02', 0),
(10595, 7, 29, 36, '2026-03-04 09:15:00', '2026-03-04 15:15:00', 21600, 'Admin & BAU – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:28', '2026-03-04', 0),
(10596, 7, 29, 36, '2026-03-05 09:30:00', '2026-03-05 16:30:00', 25200, 'Admin & BAU – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-03-05', 0),
(10597, 7, 26, 36, '2026-03-06 09:30:00', '2026-03-06 12:00:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:28', '2026-03-06', 0),
(10598, 7, 27, 36, '2026-03-09 09:15:00', '2026-03-09 16:39:00', 26640, 'Governance & reporting – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:28', '2026-03-09', 0),
(10599, 7, 28, 36, '2026-03-10 09:15:00', '2026-03-10 16:39:00', 26640, 'Stakeholder engagement – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:28', '2026-03-10', 0),
(10600, 7, 28, 36, '2026-03-11 09:15:00', '2026-03-11 16:15:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-03-11', 0),
(10601, 7, 26, 36, '2026-03-12 09:15:00', '2026-03-12 16:39:00', 26640, 'Project delivery – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:28', '2026-03-12', 0),
(10602, 7, 28, 36, '2026-03-13 09:30:00', '2026-03-13 16:30:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-03-13', 0),
(10603, 7, 26, 36, '2026-03-16 09:00:00', '2026-03-16 14:00:00', 18000, 'Project delivery – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:28', '2026-03-16', 0),
(10604, 7, 26, 36, '2026-03-17 09:30:00', '2026-03-17 15:30:00', 21600, 'Project delivery – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:28', '2026-03-17', 0),
(10605, 7, 29, 36, '2026-03-19 09:30:00', '2026-03-19 16:00:00', 23400, 'Admin & BAU – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:28', '2026-03-19', 0),
(10606, 7, 26, 36, '2026-03-20 09:30:00', '2026-03-20 16:30:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:28', '2026-03-20', 0),
(10607, 7, 26, 36, '2026-03-24 09:15:00', '2026-03-24 13:15:00', 14400, 'Project delivery – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:28', '2026-03-24', 0),
(10608, 7, 26, 36, '2026-03-25 09:00:00', '2026-03-25 15:00:00', 21600, 'Project delivery – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:28', '2026-03-25', 0),
(10609, 7, 28, 36, '2026-03-27 09:00:00', '2026-03-27 15:00:00', 21600, 'Stakeholder engagement – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:28', '2026-03-27', 0),
(10610, 7, 27, 36, '2026-03-30 08:30:00', '2026-03-30 12:00:00', 12600, 'Governance & reporting – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:28', '2026-03-30', 0),
(10611, 7, 26, 36, '2026-03-31 08:00:00', '2026-03-31 11:00:00', 10800, 'Project delivery – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:28', '2026-03-31', 0),
(10612, 7, 29, 36, '2026-04-01 08:15:00', '2026-04-01 15:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-04-01', 0),
(10613, 7, 30, 36, '2026-04-02 08:30:00', '2026-04-02 11:30:00', 10800, 'Training – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-04-02', 0),
(10614, 7, 28, 36, '2026-04-06 08:00:00', '2026-04-06 11:00:00', 10800, 'Stakeholder engagement – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-04-06', 0),
(10615, 7, 28, 36, '2026-04-07 08:15:00', '2026-04-07 10:45:00', 9000, 'Stakeholder engagement – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-07', 0),
(10616, 7, 26, 36, '2026-04-08 08:00:00', '2026-04-08 11:30:00', 12600, 'Project delivery – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-08', 0),
(10617, 7, 26, 36, '2026-04-09 08:30:00', '2026-04-09 15:00:00', 23400, 'Project delivery – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-09', 0),
(10618, 7, 29, 36, '2026-04-10 08:00:00', '2026-04-10 12:00:00', 14400, 'Admin & BAU – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-04-10', 0),
(10619, 7, 26, 36, '2026-04-14 08:30:00', '2026-04-14 12:30:00', 14400, 'Project delivery – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-04-14', 0),
(10620, 7, 31, 36, '2026-04-15 08:15:00', '2026-04-15 11:15:00', 10800, 'Meetings – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-04-15', 0),
(10621, 7, 31, 36, '2026-04-20 08:15:00', '2026-04-20 14:15:00', 21600, 'Meetings – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-04-20', 0),
(10622, 7, 29, 36, '2026-04-21 08:00:00', '2026-04-21 15:24:00', 26640, 'Admin & BAU – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-04-21', 0),
(10623, 7, 27, 36, '2026-04-22 08:15:00', '2026-04-22 15:39:00', 26640, 'Governance & reporting – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-04-22', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(10624, 7, 31, 36, '2026-04-23 08:15:00', '2026-04-23 14:45:00', 23400, 'Meetings – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-23', 0),
(10625, 7, 29, 36, '2026-04-24 08:30:00', '2026-04-24 12:00:00', 12600, 'Admin & BAU – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-24', 0),
(10626, 7, 29, 36, '2026-04-27 08:15:00', '2026-04-27 15:39:00', 26640, 'Admin & BAU – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-04-27', 0),
(10627, 7, 29, 36, '2026-04-28 08:00:00', '2026-04-28 14:30:00', 23400, 'Admin & BAU – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-28', 0),
(10628, 7, 29, 36, '2026-04-29 08:30:00', '2026-04-29 15:30:00', 25200, 'Admin & BAU – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-04-29', 0),
(10629, 7, 29, 36, '2026-04-30 08:00:00', '2026-04-30 14:30:00', 23400, 'Admin & BAU – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-30', 0),
(10630, 7, 30, 36, '2026-05-01 08:15:00', '2026-05-01 15:39:00', 26640, 'Training – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-05-01', 0),
(10631, 7, 29, 36, '2026-05-06 08:30:00', '2026-05-06 12:00:00', 12600, 'Admin & BAU – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-06', 0),
(10632, 7, 26, 36, '2026-05-07 08:00:00', '2026-05-07 10:30:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-07', 0),
(10633, 7, 26, 36, '2026-05-08 08:30:00', '2026-05-08 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-05-08', 0),
(10634, 7, 27, 36, '2026-05-11 08:15:00', '2026-05-11 15:15:00', 25200, 'Governance & reporting – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-05-11', 0),
(10635, 7, 29, 36, '2026-05-12 08:15:00', '2026-05-12 15:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-05-12', 0),
(10636, 7, 26, 36, '2026-05-13 08:30:00', '2026-05-13 12:30:00', 14400, 'Project delivery – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-05-13', 0),
(10637, 7, 27, 36, '2026-05-14 08:30:00', '2026-05-14 12:30:00', 14400, 'Governance & reporting – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-05-14', 0),
(10638, 7, 26, 36, '2026-05-15 08:15:00', '2026-05-15 12:15:00', 14400, 'Project delivery – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-05-15', 0),
(10639, 7, 26, 36, '2026-05-18 08:00:00', '2026-05-18 10:30:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-18', 0),
(10640, 7, 26, 36, '2026-05-20 08:00:00', '2026-05-20 11:00:00', 10800, 'Project delivery – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-05-20', 0),
(10641, 7, 31, 36, '2026-05-21 08:15:00', '2026-05-21 15:15:00', 25200, 'Meetings – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-05-21', 0),
(10642, 7, 28, 36, '2026-05-22 08:30:00', '2026-05-22 12:00:00', 12600, 'Stakeholder engagement – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-22', 0),
(10643, 7, 29, 36, '2026-05-25 08:15:00', '2026-05-25 15:15:00', 25200, 'Admin & BAU – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-05-25', 0),
(10644, 7, 29, 36, '2026-05-28 08:00:00', '2026-05-28 10:30:00', 9000, 'Admin & BAU – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-28', 0),
(10645, 7, 29, 36, '2026-05-29 08:30:00', '2026-05-29 13:30:00', 18000, 'Admin & BAU – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-05-29', 0),
(10646, 7, 28, 36, '2026-06-01 08:00:00', '2026-06-01 10:30:00', 9000, 'Stakeholder engagement – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-06-01', 0),
(10647, 7, 27, 36, '2026-06-02 08:30:00', '2026-06-02 13:30:00', 18000, 'Governance & reporting – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-06-02', 0),
(10648, 7, 29, 36, '2026-06-03 08:00:00', '2026-06-03 14:00:00', 21600, 'Admin & BAU – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-06-03', 0),
(10649, 7, 26, 36, '2026-06-08 08:15:00', '2026-06-08 12:15:00', 14400, 'Project delivery – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-06-08', 0),
(10650, 7, 26, 36, '2026-06-09 08:15:00', '2026-06-09 15:15:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-06-09', 0),
(10651, 7, 27, 36, '2026-06-10 08:00:00', '2026-06-10 10:00:00', 7200, 'Governance & reporting – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-06-10', 0),
(10652, 7, 27, 36, '2026-06-11 08:30:00', '2026-06-11 11:30:00', 10800, 'Governance & reporting – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-06-11', 0),
(10653, 7, 26, 36, '2026-06-12 08:00:00', '2026-06-12 15:24:00', 26640, 'Project delivery – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-06-12', 0),
(10654, 7, 29, 36, '2026-06-15 08:15:00', '2026-06-15 10:15:00', 7200, 'Admin & BAU – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-06-15', 0),
(10655, 7, 27, 36, '2026-06-16 08:15:00', '2026-06-16 15:39:00', 26640, 'Governance & reporting – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-06-16', 0),
(10656, 7, 26, 36, '2026-06-18 08:30:00', '2026-06-18 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-06-18', 0),
(10657, 7, 26, 36, '2026-06-23 08:30:00', '2026-06-23 12:30:00', 14400, 'Project delivery – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-06-23', 0),
(10658, 7, 26, 36, '2026-06-24 08:00:00', '2026-06-24 15:24:00', 26640, 'Project delivery – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-06-24', 0),
(10659, 7, 28, 36, '2026-06-25 08:15:00', '2026-06-25 15:15:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-06-25', 0),
(10660, 7, 27, 36, '2026-06-26 08:00:00', '2026-06-26 12:00:00', 14400, 'Governance & reporting – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-06-26', 0),
(10661, 7, 26, 36, '2026-06-30 08:30:00', '2026-06-30 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-06-30', 0),
(10662, 7, 31, 36, '2026-07-01 08:15:00', '2026-07-01 13:15:00', 18000, 'Meetings – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-07-01', 0),
(10663, 7, 27, 36, '2026-07-02 08:30:00', '2026-07-02 15:54:00', 26640, 'Governance & reporting – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-07-02', 0),
(10664, 7, 26, 36, '2026-07-03 08:30:00', '2026-07-03 12:00:00', 12600, 'Project delivery – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-03', 0),
(10665, 7, 29, 36, '2026-07-06 08:30:00', '2026-07-06 11:30:00', 10800, 'Admin & BAU – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-07-06', 0),
(10666, 7, 31, 36, '2026-07-07 08:00:00', '2026-07-07 10:00:00', 7200, 'Meetings – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-07-07', 0),
(10667, 7, 29, 36, '2026-07-08 08:30:00', '2026-07-08 15:30:00', 25200, 'Admin & BAU – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-07-08', 0),
(10668, 7, 26, 36, '2026-07-09 08:15:00', '2026-07-09 10:45:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-09', 0),
(10669, 7, 26, 36, '2026-07-10 08:30:00', '2026-07-10 10:30:00', 7200, 'Project delivery – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-07-10', 0),
(10670, 7, 26, 36, '2026-07-13 08:30:00', '2026-07-13 11:00:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-13', 0),
(10671, 7, 28, 36, '2026-07-14 08:00:00', '2026-07-14 15:00:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-07-14', 0),
(10672, 7, 29, 36, '2026-07-15 08:15:00', '2026-07-15 10:45:00', 9000, 'Admin & BAU – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-15', 0),
(10673, 7, 26, 36, '2026-07-16 08:00:00', '2026-07-16 14:30:00', 23400, 'Project delivery – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-16', 0),
(10674, 7, 28, 36, '2026-07-17 08:15:00', '2026-07-17 11:45:00', 12600, 'Stakeholder engagement – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-17', 0),
(10675, 7, 27, 36, '2026-07-20 08:30:00', '2026-07-20 15:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-07-20', 0),
(10676, 7, 26, 36, '2026-07-22 08:15:00', '2026-07-22 14:45:00', 23400, 'Project delivery – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-22', 0),
(10677, 7, 26, 36, '2026-07-23 08:00:00', '2026-07-23 13:00:00', 18000, 'Project delivery – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-07-23', 0),
(10678, 7, 28, 36, '2026-07-28 08:00:00', '2026-07-28 12:00:00', 14400, 'Stakeholder engagement – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-07-28', 0),
(10679, 7, 26, 36, '2026-07-29 08:30:00', '2026-07-29 15:30:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-07-29', 0),
(10680, 7, 27, 36, '2026-07-31 08:15:00', '2026-07-31 11:45:00', 12600, 'Governance & reporting – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-31', 0),
(10681, 7, 28, 36, '2026-08-06 08:15:00', '2026-08-06 15:15:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-08-06', 0),
(10682, 7, 26, 36, '2026-08-07 08:30:00', '2026-08-07 15:54:00', 26640, 'Project delivery – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-08-07', 0),
(10683, 7, 31, 36, '2026-08-10 08:15:00', '2026-08-10 15:15:00', 25200, 'Meetings – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-08-10', 0),
(10684, 7, 28, 36, '2026-08-12 08:00:00', '2026-08-12 10:00:00', 7200, 'Stakeholder engagement – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-08-12', 0),
(10685, 7, 26, 36, '2026-08-13 08:15:00', '2026-08-13 15:15:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-08-13', 0),
(10686, 7, 26, 36, '2026-08-14 08:00:00', '2026-08-14 13:00:00', 18000, 'Project delivery – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-08-14', 0),
(10687, 7, 27, 36, '2026-08-19 08:00:00', '2026-08-19 12:00:00', 14400, 'Governance & reporting – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-08-19', 0),
(10688, 7, 26, 36, '2026-08-20 08:15:00', '2026-08-20 11:15:00', 10800, 'Project delivery – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-08-20', 0),
(10689, 7, 27, 36, '2026-08-21 08:30:00', '2026-08-21 10:30:00', 7200, 'Governance & reporting – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-08-21', 0),
(10690, 7, 29, 36, '2026-08-24 08:00:00', '2026-08-24 15:24:00', 26640, 'Admin & BAU – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-08-24', 0),
(10691, 7, 26, 36, '2026-08-25 08:15:00', '2026-08-25 12:15:00', 14400, 'Project delivery – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-08-25', 0),
(10692, 7, 28, 36, '2026-08-26 08:15:00', '2026-08-26 10:45:00', 9000, 'Stakeholder engagement – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-08-26', 0),
(10693, 7, 26, 36, '2026-08-28 08:15:00', '2026-08-28 13:15:00', 18000, 'Project delivery – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-08-28', 0),
(10694, 7, 27, 36, '2026-09-01 08:15:00', '2026-09-01 14:15:00', 21600, 'Governance & reporting – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-09-01', 0),
(10695, 7, 27, 36, '2026-09-02 08:30:00', '2026-09-02 13:30:00', 18000, 'Governance & reporting – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-09-02', 0),
(10696, 7, 26, 36, '2026-09-07 08:15:00', '2026-09-07 14:45:00', 23400, 'Project delivery – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-07', 0),
(10697, 7, 26, 36, '2026-09-08 08:15:00', '2026-09-08 13:15:00', 18000, 'Project delivery – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-09-08', 0),
(10698, 7, 29, 36, '2026-09-09 08:15:00', '2026-09-09 13:15:00', 18000, 'Admin & BAU – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-09-09', 0),
(10699, 7, 29, 36, '2026-09-10 08:30:00', '2026-09-10 15:30:00', 25200, 'Admin & BAU – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-09-10', 0),
(10700, 7, 26, 36, '2026-09-15 08:15:00', '2026-09-15 15:39:00', 26640, 'Project delivery – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-09-15', 0),
(10701, 7, 27, 36, '2026-09-16 08:30:00', '2026-09-16 15:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-09-16', 0),
(10702, 7, 26, 36, '2026-09-17 08:15:00', '2026-09-17 10:45:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-17', 0),
(10703, 7, 27, 36, '2026-09-22 08:15:00', '2026-09-22 14:15:00', 21600, 'Governance & reporting – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-09-22', 0),
(10704, 7, 29, 36, '2026-09-23 08:30:00', '2026-09-23 15:54:00', 26640, 'Admin & BAU – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-09-23', 0),
(10705, 7, 26, 36, '2026-09-25 08:30:00', '2026-09-25 13:30:00', 18000, 'Project delivery – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-09-25', 0),
(10706, 7, 30, 36, '2026-09-29 08:30:00', '2026-09-29 15:00:00', 23400, 'Training – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-29', 0),
(10707, 7, 29, 36, '2026-10-02 08:00:00', '2026-10-02 15:00:00', 25200, 'Admin & BAU – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-02', 0),
(10708, 7, 30, 36, '2026-10-05 08:15:00', '2026-10-05 15:15:00', 25200, 'Training – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-05', 0),
(10709, 7, 26, 36, '2026-10-06 08:15:00', '2026-10-06 11:15:00', 10800, 'Project delivery – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-10-06', 0),
(10710, 7, 26, 36, '2026-10-07 08:30:00', '2026-10-07 11:00:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-07', 0),
(10711, 7, 29, 36, '2026-10-08 08:30:00', '2026-10-08 15:00:00', 23400, 'Admin & BAU – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-08', 0),
(10712, 7, 29, 36, '2026-10-12 08:00:00', '2026-10-12 12:00:00', 14400, 'Admin & BAU – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-10-12', 0),
(10713, 7, 27, 36, '2026-10-13 08:30:00', '2026-10-13 15:30:00', 25200, 'Governance & reporting – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-13', 0),
(10714, 7, 26, 36, '2026-10-15 08:30:00', '2026-10-15 15:30:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-15', 0),
(10715, 7, 26, 36, '2026-10-16 08:00:00', '2026-10-16 15:00:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-16', 0),
(10716, 7, 31, 36, '2026-10-19 08:15:00', '2026-10-19 15:15:00', 25200, 'Meetings – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-19', 0),
(10717, 7, 26, 36, '2026-10-20 08:15:00', '2026-10-20 14:45:00', 23400, 'Project delivery – BAU – Corporate Services', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-20', 0),
(10718, 7, 31, 36, '2026-10-21 08:15:00', '2026-10-21 14:15:00', 21600, 'Meetings – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-10-21', 0),
(10719, 7, 26, 36, '2026-10-22 08:00:00', '2026-10-22 15:00:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-22', 0),
(10720, 7, 27, 36, '2026-10-26 09:30:00', '2026-10-26 13:00:00', 12600, 'Governance & reporting – BAU – Corporate Services', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-26', 0),
(10721, 7, 26, 36, '2026-10-27 09:30:00', '2026-10-27 16:30:00', 25200, 'Project delivery – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-27', 0),
(10722, 7, 26, 36, '2026-10-28 09:30:00', '2026-10-28 12:00:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-28', 0),
(10723, 7, 30, 36, '2026-10-29 09:00:00', '2026-10-29 15:00:00', 21600, 'Training – BAU – Corporate Services', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-10-29', 0),
(10724, 7, 26, 36, '2026-11-02 09:30:00', '2026-11-02 14:30:00', 18000, 'Project delivery – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-11-02', 0),
(10725, 7, 26, 36, '2026-11-03 09:00:00', '2026-11-03 11:30:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-11-03', 0),
(10726, 7, 26, 36, '2026-11-10 09:30:00', '2026-11-10 12:30:00', 10800, 'Project delivery – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-11-10', 0),
(10727, 7, 28, 36, '2026-11-11 09:15:00', '2026-11-11 16:15:00', 25200, 'Stakeholder engagement – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-11-11', 0),
(10728, 7, 28, 36, '2026-11-12 09:00:00', '2026-11-12 13:00:00', 14400, 'Stakeholder engagement – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-11-12', 0),
(10729, 7, 26, 36, '2026-11-13 09:30:00', '2026-11-13 12:00:00', 9000, 'Project delivery – BAU – Corporate Services', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-11-13', 0),
(10730, 7, 31, 36, '2026-11-16 09:15:00', '2026-11-16 16:39:00', 26640, 'Meetings – BAU – Corporate Services', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-11-16', 0),
(10731, 7, 31, 36, '2026-11-17 09:00:00', '2026-11-17 16:00:00', 25200, 'Meetings – BAU – Corporate Services', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-11-17', 0),
(10732, 7, 26, 36, '2026-11-19 09:30:00', '2026-11-19 14:30:00', 18000, 'Project delivery – BAU – Corporate Services', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-11-19', 0),
(10733, 7, 26, 36, '2026-11-20 09:15:00', '2026-11-20 13:15:00', 14400, 'Project delivery – BAU – Corporate Services', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-11-20', 0),
(10734, 7, 29, 36, '2026-11-23 09:15:00', '2026-11-23 11:15:00', 7200, 'Admin & BAU – BAU – Corporate Services', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-11-23', 0),
(10735, 7, 26, 36, '2026-11-27 09:30:00', '2026-11-27 12:30:00', 10800, 'Project delivery – BAU – Corporate Services', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-11-27', 0),
(10736, 14, 26, 37, '2026-01-06 09:15:00', '2026-01-06 14:15:00', 18000, 'Project delivery – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-01-06', 0),
(10737, 14, 26, 37, '2026-01-12 09:00:00', '2026-01-12 16:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-01-12', 0),
(10738, 14, 27, 37, '2026-01-14 09:15:00', '2026-01-14 16:15:00', 25200, 'Governance & reporting – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-01-14', 0),
(10739, 14, 26, 37, '2026-01-15 09:30:00', '2026-01-15 11:30:00', 7200, 'Project delivery – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-01-15', 0),
(10740, 14, 26, 37, '2026-01-16 09:00:00', '2026-01-16 16:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-01-16', 0),
(10741, 14, 31, 37, '2026-01-19 09:15:00', '2026-01-19 13:15:00', 14400, 'Meetings – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-01-19', 0),
(10742, 14, 26, 37, '2026-01-21 09:15:00', '2026-01-21 16:39:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-01-21', 0),
(10743, 14, 26, 37, '2026-01-22 09:30:00', '2026-01-22 16:54:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-01-22', 0),
(10744, 14, 29, 37, '2026-01-26 09:30:00', '2026-01-26 16:54:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-01-26', 0),
(10745, 14, 29, 37, '2026-01-27 09:00:00', '2026-01-27 16:24:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-01-27', 0),
(10746, 14, 29, 37, '2026-01-28 09:00:00', '2026-01-28 13:00:00', 14400, 'Admin & BAU – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-01-28', 0),
(10747, 14, 29, 37, '2026-01-29 09:15:00', '2026-01-29 15:15:00', 21600, 'Admin & BAU – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-01-29', 0),
(10748, 14, 28, 37, '2026-02-03 09:30:00', '2026-02-03 16:00:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-02-03', 0),
(10749, 14, 29, 37, '2026-02-04 09:30:00', '2026-02-04 12:30:00', 10800, 'Admin & BAU – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-02-04', 0),
(10750, 14, 30, 37, '2026-02-11 09:15:00', '2026-02-11 15:45:00', 23400, 'Training – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-02-11', 0),
(10751, 14, 26, 37, '2026-02-12 09:00:00', '2026-02-12 16:24:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-02-12', 0),
(10752, 14, 31, 37, '2026-02-13 09:30:00', '2026-02-13 14:30:00', 18000, 'Meetings – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-02-13', 0),
(10753, 14, 31, 37, '2026-02-16 09:30:00', '2026-02-16 12:30:00', 10800, 'Meetings – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-02-16', 0),
(10754, 14, 26, 37, '2026-02-17 09:15:00', '2026-02-17 12:15:00', 10800, 'Project delivery – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-02-17', 0),
(10755, 14, 26, 37, '2026-02-19 09:15:00', '2026-02-19 14:15:00', 18000, 'Project delivery – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-02-19', 0),
(10756, 14, 31, 37, '2026-02-20 09:30:00', '2026-02-20 16:30:00', 25200, 'Meetings – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-02-20', 0),
(10757, 14, 27, 37, '2026-02-23 09:15:00', '2026-02-23 15:45:00', 23400, 'Governance & reporting – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-02-23', 0),
(10758, 14, 31, 37, '2026-02-24 09:30:00', '2026-02-24 13:30:00', 14400, 'Meetings – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-02-24', 0),
(10759, 14, 29, 37, '2026-02-25 09:15:00', '2026-02-25 12:45:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-02-25', 0),
(10760, 14, 26, 37, '2026-02-27 09:15:00', '2026-02-27 16:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-02-27', 0),
(10761, 14, 29, 37, '2026-03-02 09:00:00', '2026-03-02 15:00:00', 21600, 'Admin & BAU – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-03-02', 0),
(10762, 14, 31, 37, '2026-03-03 09:00:00', '2026-03-03 16:24:00', 26640, 'Meetings – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-03-03', 0),
(10763, 14, 26, 37, '2026-03-04 09:15:00', '2026-03-04 15:15:00', 21600, 'Project delivery – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-03-04', 0),
(10764, 14, 28, 37, '2026-03-05 09:15:00', '2026-03-05 14:15:00', 18000, 'Stakeholder engagement – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-03-05', 0),
(10765, 14, 26, 37, '2026-03-10 09:00:00', '2026-03-10 11:00:00', 7200, 'Project delivery – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-03-10', 0),
(10766, 14, 29, 37, '2026-03-11 09:00:00', '2026-03-11 12:30:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-03-11', 0),
(10767, 14, 29, 37, '2026-03-13 09:00:00', '2026-03-13 15:00:00', 21600, 'Admin & BAU – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-03-13', 0),
(10768, 14, 26, 37, '2026-03-17 09:15:00', '2026-03-17 11:15:00', 7200, 'Project delivery – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-03-17', 0),
(10769, 14, 27, 37, '2026-03-18 09:30:00', '2026-03-18 16:00:00', 23400, 'Governance & reporting – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-03-18', 0),
(10770, 14, 27, 37, '2026-03-20 09:30:00', '2026-03-20 12:30:00', 10800, 'Governance & reporting – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-03-20', 0),
(10771, 14, 26, 37, '2026-03-23 09:15:00', '2026-03-23 14:15:00', 18000, 'Project delivery – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-03-23', 0),
(10772, 14, 28, 37, '2026-03-24 09:00:00', '2026-03-24 12:30:00', 12600, 'Stakeholder engagement – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-03-24', 0),
(10773, 14, 28, 37, '2026-03-25 09:30:00', '2026-03-25 12:00:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:29', '2026-03-25', 0),
(10774, 14, 26, 37, '2026-03-26 09:00:00', '2026-03-26 16:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-03-26', 0),
(10775, 14, 29, 37, '2026-03-27 09:30:00', '2026-03-27 16:30:00', 25200, 'Admin & BAU – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-03-27', 0),
(10776, 14, 26, 37, '2026-03-30 08:00:00', '2026-03-30 14:00:00', 21600, 'Project delivery – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-03-30', 0),
(10777, 14, 28, 37, '2026-03-31 08:00:00', '2026-03-31 15:24:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-03-31', 0),
(10778, 14, 27, 37, '2026-04-01 08:00:00', '2026-04-01 13:00:00', 18000, 'Governance & reporting – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-04-01', 0),
(10779, 14, 26, 37, '2026-04-02 08:00:00', '2026-04-02 15:24:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-04-02', 0),
(10780, 14, 28, 37, '2026-04-03 08:30:00', '2026-04-03 15:54:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-04-03', 0),
(10781, 14, 29, 37, '2026-04-06 08:30:00', '2026-04-06 11:30:00', 10800, 'Admin & BAU – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-04-06', 0),
(10782, 14, 28, 37, '2026-04-08 08:00:00', '2026-04-08 10:00:00', 7200, 'Stakeholder engagement – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-04-08', 0),
(10783, 14, 26, 37, '2026-04-09 08:00:00', '2026-04-09 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-04-09', 0),
(10784, 14, 28, 37, '2026-04-10 08:00:00', '2026-04-10 14:30:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-04-10', 0),
(10785, 14, 30, 37, '2026-04-13 08:15:00', '2026-04-13 14:45:00', 23400, 'Training – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-04-13', 0),
(10786, 14, 30, 37, '2026-04-14 08:15:00', '2026-04-14 15:15:00', 25200, 'Training – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-04-14', 0),
(10787, 14, 28, 37, '2026-04-15 08:30:00', '2026-04-15 15:54:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-04-15', 0),
(10788, 14, 29, 37, '2026-04-16 08:30:00', '2026-04-16 10:30:00', 7200, 'Admin & BAU – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-04-16', 0),
(10789, 14, 27, 37, '2026-04-17 08:15:00', '2026-04-17 12:15:00', 14400, 'Governance & reporting – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-04-17', 0),
(10790, 14, 26, 37, '2026-04-20 08:15:00', '2026-04-20 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-04-20', 0),
(10791, 14, 29, 37, '2026-04-21 08:15:00', '2026-04-21 10:45:00', 9000, 'Admin & BAU – BAU – Policy & Strategy', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:29', '2026-04-21', 0),
(10792, 14, 26, 37, '2026-04-22 08:00:00', '2026-04-22 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-04-22', 0),
(10793, 14, 26, 37, '2026-04-24 08:30:00', '2026-04-24 12:30:00', 14400, 'Project delivery – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-04-24', 0),
(10794, 14, 26, 37, '2026-04-28 08:15:00', '2026-04-28 14:45:00', 23400, 'Project delivery – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-04-28', 0),
(10795, 14, 26, 37, '2026-04-30 08:00:00', '2026-04-30 11:30:00', 12600, 'Project delivery – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-04-30', 0),
(10796, 14, 28, 37, '2026-05-01 08:15:00', '2026-05-01 10:45:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:29', '2026-05-01', 0),
(10797, 14, 28, 37, '2026-05-04 08:30:00', '2026-05-04 13:30:00', 18000, 'Stakeholder engagement – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-05-04', 0),
(10798, 14, 28, 37, '2026-05-08 08:30:00', '2026-05-08 14:30:00', 21600, 'Stakeholder engagement – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-05-08', 0),
(10799, 14, 29, 37, '2026-05-11 08:30:00', '2026-05-11 10:30:00', 7200, 'Admin & BAU – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-05-11', 0),
(10800, 14, 27, 37, '2026-05-12 08:30:00', '2026-05-12 15:30:00', 25200, 'Governance & reporting – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-05-12', 0),
(10801, 14, 28, 37, '2026-05-14 08:00:00', '2026-05-14 15:00:00', 25200, 'Stakeholder engagement – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-05-14', 0),
(10802, 14, 26, 37, '2026-05-18 08:30:00', '2026-05-18 15:30:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-05-18', 0),
(10803, 14, 26, 37, '2026-05-20 08:15:00', '2026-05-20 11:45:00', 12600, 'Project delivery – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-05-20', 0),
(10804, 14, 26, 37, '2026-05-21 08:30:00', '2026-05-21 15:54:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-05-21', 0),
(10805, 14, 28, 37, '2026-05-22 08:30:00', '2026-05-22 15:00:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-05-22', 0),
(10806, 14, 31, 37, '2026-05-25 08:15:00', '2026-05-25 12:15:00', 14400, 'Meetings – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-05-25', 0),
(10807, 14, 28, 37, '2026-05-26 08:15:00', '2026-05-26 15:15:00', 25200, 'Stakeholder engagement – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-05-26', 0),
(10808, 14, 28, 37, '2026-05-27 08:30:00', '2026-05-27 15:00:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-05-27', 0),
(10809, 14, 28, 37, '2026-05-28 08:15:00', '2026-05-28 14:45:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-05-28', 0),
(10810, 14, 26, 37, '2026-05-29 08:30:00', '2026-05-29 12:00:00', 12600, 'Project delivery – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-05-29', 0),
(10811, 14, 26, 37, '2026-06-01 08:00:00', '2026-06-01 12:00:00', 14400, 'Project delivery – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-06-01', 0),
(10812, 14, 26, 37, '2026-06-02 08:15:00', '2026-06-02 11:15:00', 10800, 'Project delivery – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-06-02', 0),
(10813, 14, 29, 37, '2026-06-03 08:15:00', '2026-06-03 15:15:00', 25200, 'Admin & BAU – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-06-03', 0),
(10814, 14, 26, 37, '2026-06-04 08:15:00', '2026-06-04 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-06-04', 0),
(10815, 14, 28, 37, '2026-06-05 08:30:00', '2026-06-05 15:00:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-06-05', 0),
(10816, 14, 30, 37, '2026-06-08 08:30:00', '2026-06-08 15:54:00', 26640, 'Training – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-06-08', 0),
(10817, 14, 26, 37, '2026-06-10 08:00:00', '2026-06-10 12:00:00', 14400, 'Project delivery – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-06-10', 0),
(10818, 14, 28, 37, '2026-06-11 08:30:00', '2026-06-11 12:30:00', 14400, 'Stakeholder engagement – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-06-11', 0),
(10819, 14, 27, 37, '2026-06-12 08:30:00', '2026-06-12 11:30:00', 10800, 'Governance & reporting – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-06-12', 0),
(10820, 14, 26, 37, '2026-06-15 08:15:00', '2026-06-15 12:15:00', 14400, 'Project delivery – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-06-15', 0),
(10821, 14, 29, 37, '2026-06-16 08:00:00', '2026-06-16 11:00:00', 10800, 'Admin & BAU – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-06-16', 0),
(10822, 14, 26, 37, '2026-06-17 08:00:00', '2026-06-17 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-06-17', 0),
(10823, 14, 26, 37, '2026-06-18 08:00:00', '2026-06-18 13:00:00', 18000, 'Project delivery – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-06-18', 0),
(10824, 14, 28, 37, '2026-06-19 08:15:00', '2026-06-19 11:15:00', 10800, 'Stakeholder engagement – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-06-19', 0),
(10825, 14, 26, 37, '2026-06-22 08:00:00', '2026-06-22 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-06-22', 0),
(10826, 14, 27, 37, '2026-06-23 08:15:00', '2026-06-23 15:15:00', 25200, 'Governance & reporting – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-06-23', 0),
(10827, 14, 26, 37, '2026-06-24 08:30:00', '2026-06-24 10:30:00', 7200, 'Project delivery – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-06-24', 0),
(10828, 14, 26, 37, '2026-06-29 08:30:00', '2026-06-29 15:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-06-29', 0),
(10829, 14, 27, 37, '2026-06-30 08:30:00', '2026-06-30 14:30:00', 21600, 'Governance & reporting – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-06-30', 0),
(10830, 14, 26, 37, '2026-07-02 08:30:00', '2026-07-02 15:30:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-07-02', 0),
(10831, 14, 28, 37, '2026-07-03 08:30:00', '2026-07-03 11:00:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:29', '2026-07-03', 0),
(10832, 14, 26, 37, '2026-07-06 08:00:00', '2026-07-06 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-07-06', 0),
(10833, 14, 26, 37, '2026-07-07 08:30:00', '2026-07-07 11:30:00', 10800, 'Project delivery – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-07-07', 0),
(10834, 14, 31, 37, '2026-07-10 08:30:00', '2026-07-10 15:54:00', 26640, 'Meetings – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-07-10', 0),
(10835, 14, 26, 37, '2026-07-13 08:15:00', '2026-07-13 12:15:00', 14400, 'Project delivery – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-07-13', 0),
(10836, 14, 26, 37, '2026-07-15 08:00:00', '2026-07-15 14:00:00', 21600, 'Project delivery – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-07-15', 0),
(10837, 14, 27, 37, '2026-07-20 08:15:00', '2026-07-20 13:15:00', 18000, 'Governance & reporting – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-07-20', 0),
(10838, 14, 27, 37, '2026-07-21 08:00:00', '2026-07-21 15:24:00', 26640, 'Governance & reporting – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-07-21', 0),
(10839, 14, 28, 37, '2026-07-22 08:30:00', '2026-07-22 15:30:00', 25200, 'Stakeholder engagement – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-07-22', 0),
(10840, 14, 28, 37, '2026-07-27 08:00:00', '2026-07-27 10:30:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:29', '2026-07-27', 0),
(10841, 14, 29, 37, '2026-07-28 08:15:00', '2026-07-28 15:15:00', 25200, 'Admin & BAU – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-07-28', 0),
(10842, 14, 27, 37, '2026-07-29 08:00:00', '2026-07-29 11:00:00', 10800, 'Governance & reporting – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-07-29', 0),
(10843, 14, 29, 37, '2026-08-03 08:15:00', '2026-08-03 12:15:00', 14400, 'Admin & BAU – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-08-03', 0),
(10844, 14, 26, 37, '2026-08-05 08:15:00', '2026-08-05 14:15:00', 21600, 'Project delivery – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-08-05', 0),
(10845, 14, 26, 37, '2026-08-06 08:00:00', '2026-08-06 15:24:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-08-06', 0),
(10846, 14, 29, 37, '2026-08-07 08:00:00', '2026-08-07 15:00:00', 25200, 'Admin & BAU – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-08-07', 0),
(10847, 14, 28, 37, '2026-08-10 08:15:00', '2026-08-10 15:15:00', 25200, 'Stakeholder engagement – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-08-10', 0),
(10848, 14, 26, 37, '2026-08-13 08:15:00', '2026-08-13 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-08-13', 0),
(10849, 14, 27, 37, '2026-08-17 08:15:00', '2026-08-17 14:45:00', 23400, 'Governance & reporting – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-08-17', 0),
(10850, 14, 26, 37, '2026-08-18 08:15:00', '2026-08-18 11:45:00', 12600, 'Project delivery – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-08-18', 0),
(10851, 14, 26, 37, '2026-08-19 08:00:00', '2026-08-19 13:00:00', 18000, 'Project delivery – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-08-19', 0),
(10852, 14, 28, 37, '2026-08-20 08:00:00', '2026-08-20 15:00:00', 25200, 'Stakeholder engagement – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-08-20', 0),
(10853, 14, 26, 37, '2026-08-24 08:00:00', '2026-08-24 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-08-24', 0),
(10854, 14, 29, 37, '2026-08-25 08:30:00', '2026-08-25 10:30:00', 7200, 'Admin & BAU – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-08-25', 0),
(10855, 14, 26, 37, '2026-08-26 08:00:00', '2026-08-26 14:00:00', 21600, 'Project delivery – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-08-26', 0),
(10856, 14, 26, 37, '2026-08-27 08:30:00', '2026-08-27 12:00:00', 12600, 'Project delivery – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-08-27', 0),
(10857, 14, 26, 37, '2026-08-28 08:30:00', '2026-08-28 12:00:00', 12600, 'Project delivery – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-08-28', 0),
(10858, 14, 27, 37, '2026-08-31 08:30:00', '2026-08-31 12:30:00', 14400, 'Governance & reporting – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-08-31', 0),
(10859, 14, 30, 37, '2026-09-01 08:00:00', '2026-09-01 15:00:00', 25200, 'Training – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-09-01', 0),
(10860, 14, 26, 37, '2026-09-07 08:30:00', '2026-09-07 15:54:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-09-07', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(10861, 14, 26, 37, '2026-09-08 08:30:00', '2026-09-08 12:30:00', 14400, 'Project delivery – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-09-08', 0),
(10862, 14, 28, 37, '2026-09-11 08:30:00', '2026-09-11 15:54:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-09-11', 0),
(10863, 14, 29, 37, '2026-09-14 08:15:00', '2026-09-14 11:45:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-09-14', 0),
(10864, 14, 26, 37, '2026-09-16 08:15:00', '2026-09-16 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-09-16', 0),
(10865, 14, 27, 37, '2026-09-18 08:00:00', '2026-09-18 12:00:00', 14400, 'Governance & reporting – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-09-18', 0),
(10866, 14, 26, 37, '2026-09-21 08:30:00', '2026-09-21 10:30:00', 7200, 'Project delivery – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-09-21', 0),
(10867, 14, 28, 37, '2026-09-22 08:15:00', '2026-09-22 11:45:00', 12600, 'Stakeholder engagement – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-09-22', 0),
(10868, 14, 26, 37, '2026-09-23 08:30:00', '2026-09-23 15:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-09-23', 0),
(10869, 14, 26, 37, '2026-09-24 08:30:00', '2026-09-24 14:30:00', 21600, 'Project delivery – BAU – Policy & Strategy', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-09-24', 0),
(10870, 14, 31, 37, '2026-09-25 08:30:00', '2026-09-25 11:30:00', 10800, 'Meetings – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-09-25', 0),
(10871, 14, 29, 37, '2026-09-28 08:30:00', '2026-09-28 10:30:00', 7200, 'Admin & BAU – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-09-28', 0),
(10872, 14, 29, 37, '2026-09-29 08:30:00', '2026-09-29 10:30:00', 7200, 'Admin & BAU – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-09-29', 0),
(10873, 14, 26, 37, '2026-10-01 08:30:00', '2026-10-01 15:54:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-10-01', 0),
(10874, 14, 27, 37, '2026-10-02 08:15:00', '2026-10-02 15:39:00', 26640, 'Governance & reporting – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-10-02', 0),
(10875, 14, 26, 37, '2026-10-05 08:15:00', '2026-10-05 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-10-05', 0),
(10876, 14, 28, 37, '2026-10-06 08:00:00', '2026-10-06 10:00:00', 7200, 'Stakeholder engagement – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-10-06', 0),
(10877, 14, 26, 37, '2026-10-08 08:00:00', '2026-10-08 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-10-08', 0),
(10878, 14, 26, 37, '2026-10-09 08:15:00', '2026-10-09 13:15:00', 18000, 'Project delivery – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-10-09', 0),
(10879, 14, 27, 37, '2026-10-13 08:00:00', '2026-10-13 11:30:00', 12600, 'Governance & reporting – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-10-13', 0),
(10880, 14, 26, 37, '2026-10-14 08:15:00', '2026-10-14 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-10-14', 0),
(10881, 14, 27, 37, '2026-10-15 08:00:00', '2026-10-15 13:00:00', 18000, 'Governance & reporting – BAU – Policy & Strategy', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:29', '2026-10-15', 0),
(10882, 14, 28, 37, '2026-10-16 08:15:00', '2026-10-16 11:45:00', 12600, 'Stakeholder engagement – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-10-16', 0),
(10883, 14, 29, 37, '2026-10-19 08:15:00', '2026-10-19 11:45:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-10-19', 0),
(10884, 14, 29, 37, '2026-10-20 08:30:00', '2026-10-20 15:54:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-10-20', 0),
(10885, 14, 26, 37, '2026-10-21 08:00:00', '2026-10-21 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-10-21', 0),
(10886, 14, 26, 37, '2026-10-23 08:30:00', '2026-10-23 15:54:00', 26640, 'Project delivery – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-10-23', 0),
(10887, 14, 26, 37, '2026-10-29 09:30:00', '2026-10-29 16:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-10-29', 0),
(10888, 14, 29, 37, '2026-10-30 09:00:00', '2026-10-30 15:30:00', 23400, 'Admin & BAU – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-10-30', 0),
(10889, 14, 26, 37, '2026-11-02 09:00:00', '2026-11-02 12:00:00', 10800, 'Project delivery – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-11-02', 0),
(10890, 14, 27, 37, '2026-11-03 09:30:00', '2026-11-03 11:30:00', 7200, 'Governance & reporting – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-11-03', 0),
(10891, 14, 28, 37, '2026-11-04 09:15:00', '2026-11-04 13:15:00', 14400, 'Stakeholder engagement – BAU – Policy & Strategy', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:29', '2026-11-04', 0),
(10892, 14, 28, 37, '2026-11-05 09:30:00', '2026-11-05 12:00:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:29', '2026-11-05', 0),
(10893, 14, 29, 37, '2026-11-06 09:30:00', '2026-11-06 13:00:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:29', '2026-11-06', 0),
(10894, 14, 29, 37, '2026-11-09 09:00:00', '2026-11-09 12:00:00', 10800, 'Admin & BAU – BAU – Policy & Strategy', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-11-09', 0),
(10895, 14, 29, 37, '2026-11-10 09:30:00', '2026-11-10 11:30:00', 7200, 'Admin & BAU – BAU – Policy & Strategy', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:29', '2026-11-10', 0),
(10896, 14, 30, 37, '2026-11-17 09:15:00', '2026-11-17 16:39:00', 26640, 'Training – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-11-17', 0),
(10897, 14, 29, 37, '2026-11-19 09:15:00', '2026-11-19 11:45:00', 9000, 'Admin & BAU – BAU – Policy & Strategy', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:29', '2026-11-19', 0),
(10898, 14, 27, 37, '2026-11-23 09:00:00', '2026-11-23 16:24:00', 26640, 'Governance & reporting – BAU – Policy & Strategy', 251.6, NULL, 34, 0, 'Europe/London', 222, 1, 'work', '2026-11-28 10:30:29', '2026-11-23', 0),
(10899, 14, 26, 37, '2026-11-24 09:30:00', '2026-11-24 16:30:00', 25200, 'Project delivery – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-11-24', 0),
(10900, 14, 29, 37, '2026-11-25 09:30:00', '2026-11-25 16:30:00', 25200, 'Admin & BAU – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-11-25', 0),
(10901, 14, 29, 37, '2026-11-26 09:30:00', '2026-11-26 16:30:00', 25200, 'Admin & BAU – BAU – Policy & Strategy', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:29', '2026-11-26', 0),
(10902, 14, 26, 37, '2026-11-27 09:30:00', '2026-11-27 16:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 221, NULL, 34, 0, 'Europe/London', 195, 1, 'work', '2026-11-28 10:30:29', '2026-11-27', 0),
(10903, 7, 26, 37, '2026-01-06 09:00:00', '2026-01-06 11:30:00', 9000, 'Project delivery – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-01-06', 0),
(10904, 7, 26, 37, '2026-01-09 09:15:00', '2026-01-09 16:39:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-01-09', 0),
(10905, 7, 28, 37, '2026-01-12 09:30:00', '2026-01-12 12:30:00', 10800, 'Stakeholder engagement – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-01-12', 0),
(10906, 7, 29, 37, '2026-01-14 09:15:00', '2026-01-14 16:39:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-01-14', 0),
(10907, 7, 29, 37, '2026-01-15 09:15:00', '2026-01-15 16:15:00', 25200, 'Admin & BAU – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-01-15', 0),
(10908, 7, 29, 37, '2026-01-16 09:30:00', '2026-01-16 16:30:00', 25200, 'Admin & BAU – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-01-16', 0),
(10909, 7, 28, 37, '2026-01-19 09:30:00', '2026-01-19 16:54:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-01-19', 0),
(10910, 7, 26, 37, '2026-01-21 09:00:00', '2026-01-21 11:00:00', 7200, 'Project delivery – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-01-21', 0),
(10911, 7, 26, 37, '2026-01-23 09:15:00', '2026-01-23 16:39:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-01-23', 0),
(10912, 7, 26, 37, '2026-01-27 09:00:00', '2026-01-27 16:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-01-27', 0),
(10913, 7, 29, 37, '2026-01-28 09:15:00', '2026-01-28 13:15:00', 14400, 'Admin & BAU – BAU – Policy & Strategy', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-01-28', 0),
(10914, 7, 29, 37, '2026-01-29 09:00:00', '2026-01-29 15:00:00', 21600, 'Admin & BAU – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-01-29', 0),
(10915, 7, 29, 37, '2026-02-02 09:00:00', '2026-02-02 13:00:00', 14400, 'Admin & BAU – BAU – Policy & Strategy', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-02-02', 0),
(10916, 7, 29, 37, '2026-02-03 09:00:00', '2026-02-03 15:30:00', 23400, 'Admin & BAU – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-02-03', 0),
(10917, 7, 29, 37, '2026-02-04 09:15:00', '2026-02-04 12:45:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-02-04', 0),
(10918, 7, 26, 37, '2026-02-06 09:00:00', '2026-02-06 14:00:00', 18000, 'Project delivery – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-02-06', 0),
(10919, 7, 29, 37, '2026-02-10 09:30:00', '2026-02-10 12:30:00', 10800, 'Admin & BAU – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-02-10', 0),
(10920, 7, 28, 37, '2026-02-11 09:30:00', '2026-02-11 16:30:00', 25200, 'Stakeholder engagement – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-02-11', 0),
(10921, 7, 31, 37, '2026-02-16 09:30:00', '2026-02-16 14:30:00', 18000, 'Meetings – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-02-16', 0),
(10922, 7, 30, 37, '2026-02-17 09:15:00', '2026-02-17 16:15:00', 25200, 'Training – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-02-17', 0),
(10923, 7, 26, 37, '2026-02-18 09:00:00', '2026-02-18 15:00:00', 21600, 'Project delivery – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-02-18', 0),
(10924, 7, 26, 37, '2026-02-19 09:00:00', '2026-02-19 16:24:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-02-19', 0),
(10925, 7, 26, 37, '2026-02-20 09:00:00', '2026-02-20 16:24:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-02-20', 0),
(10926, 7, 30, 37, '2026-02-23 09:30:00', '2026-02-23 16:54:00', 26640, 'Training – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-02-23', 0),
(10927, 7, 26, 37, '2026-02-25 09:30:00', '2026-02-25 16:54:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-02-25', 0),
(10928, 7, 27, 37, '2026-02-26 09:00:00', '2026-02-26 11:00:00', 7200, 'Governance & reporting – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-02-26', 0),
(10929, 7, 26, 37, '2026-02-27 09:30:00', '2026-02-27 12:30:00', 10800, 'Project delivery – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-02-27', 0),
(10930, 7, 29, 37, '2026-03-05 09:30:00', '2026-03-05 16:54:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-03-05', 0),
(10931, 7, 27, 37, '2026-03-06 09:00:00', '2026-03-06 16:00:00', 25200, 'Governance & reporting – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-03-06', 0),
(10932, 7, 26, 37, '2026-03-10 09:30:00', '2026-03-10 16:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-03-10', 0),
(10933, 7, 26, 37, '2026-03-11 09:30:00', '2026-03-11 16:30:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-03-11', 0),
(10934, 7, 26, 37, '2026-03-12 09:15:00', '2026-03-12 16:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-03-12', 0),
(10935, 7, 28, 37, '2026-03-13 09:00:00', '2026-03-13 15:30:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-03-13', 0),
(10936, 7, 29, 37, '2026-03-17 09:15:00', '2026-03-17 11:15:00', 7200, 'Admin & BAU – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-03-17', 0),
(10937, 7, 30, 37, '2026-03-19 09:00:00', '2026-03-19 16:24:00', 26640, 'Training – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-03-19', 0),
(10938, 7, 26, 37, '2026-03-20 09:15:00', '2026-03-20 15:15:00', 21600, 'Project delivery – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-03-20', 0),
(10939, 7, 27, 37, '2026-03-23 09:15:00', '2026-03-23 16:39:00', 26640, 'Governance & reporting – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-03-23', 0),
(10940, 7, 29, 37, '2026-03-24 09:15:00', '2026-03-24 16:39:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-03-24', 0),
(10941, 7, 27, 37, '2026-03-25 09:15:00', '2026-03-25 16:39:00', 26640, 'Governance & reporting – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-03-25', 0),
(10942, 7, 28, 37, '2026-03-27 09:30:00', '2026-03-27 16:54:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-03-27', 0),
(10943, 7, 29, 37, '2026-03-30 08:00:00', '2026-03-30 10:00:00', 7200, 'Admin & BAU – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-03-30', 0),
(10944, 7, 29, 37, '2026-03-31 08:00:00', '2026-03-31 12:00:00', 14400, 'Admin & BAU – BAU – Policy & Strategy', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-03-31', 0),
(10945, 7, 26, 37, '2026-04-02 08:00:00', '2026-04-02 11:00:00', 10800, 'Project delivery – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-04-02', 0),
(10946, 7, 29, 37, '2026-04-06 08:15:00', '2026-04-06 15:39:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-04-06', 0),
(10947, 7, 26, 37, '2026-04-07 08:30:00', '2026-04-07 15:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-07', 0),
(10948, 7, 26, 37, '2026-04-10 08:15:00', '2026-04-10 10:15:00', 7200, 'Project delivery – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-04-10', 0),
(10949, 7, 26, 37, '2026-04-13 08:30:00', '2026-04-13 11:30:00', 10800, 'Project delivery – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-04-13', 0),
(10950, 7, 26, 37, '2026-04-14 08:30:00', '2026-04-14 15:30:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-04-14', 0),
(10951, 7, 28, 37, '2026-04-16 08:30:00', '2026-04-16 15:00:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-16', 0),
(10952, 7, 26, 37, '2026-04-17 08:30:00', '2026-04-17 15:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-17', 0),
(10953, 7, 27, 37, '2026-04-20 08:15:00', '2026-04-20 15:15:00', 25200, 'Governance & reporting – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-04-20', 0),
(10954, 7, 28, 37, '2026-04-21 08:30:00', '2026-04-21 15:00:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-04-21', 0),
(10955, 7, 28, 37, '2026-04-30 08:00:00', '2026-04-30 14:00:00', 21600, 'Stakeholder engagement – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-04-30', 0),
(10956, 7, 26, 37, '2026-05-01 08:15:00', '2026-05-01 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-05-01', 0),
(10957, 7, 26, 37, '2026-05-05 08:15:00', '2026-05-05 15:39:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-05-05', 0),
(10958, 7, 27, 37, '2026-05-06 08:00:00', '2026-05-06 15:00:00', 25200, 'Governance & reporting – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-05-06', 0),
(10959, 7, 29, 37, '2026-05-07 08:00:00', '2026-05-07 15:24:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-05-07', 0),
(10960, 7, 26, 37, '2026-05-08 08:30:00', '2026-05-08 12:30:00', 14400, 'Project delivery – BAU – Policy & Strategy', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-05-08', 0),
(10961, 7, 26, 37, '2026-05-11 08:30:00', '2026-05-11 15:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-11', 0),
(10962, 7, 26, 37, '2026-05-12 08:15:00', '2026-05-12 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-05-12', 0),
(10963, 7, 26, 37, '2026-05-13 08:15:00', '2026-05-13 11:15:00', 10800, 'Project delivery – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-05-13', 0),
(10964, 7, 26, 37, '2026-05-15 08:00:00', '2026-05-15 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-05-15', 0),
(10965, 7, 28, 37, '2026-05-18 08:15:00', '2026-05-18 10:45:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-18', 0),
(10966, 7, 26, 37, '2026-05-20 08:00:00', '2026-05-20 10:00:00', 7200, 'Project delivery – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-05-20', 0),
(10967, 7, 28, 37, '2026-05-21 08:15:00', '2026-05-21 10:15:00', 7200, 'Stakeholder engagement – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-05-21', 0),
(10968, 7, 29, 37, '2026-05-22 08:30:00', '2026-05-22 14:30:00', 21600, 'Admin & BAU – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-05-22', 0),
(10969, 7, 26, 37, '2026-05-25 08:00:00', '2026-05-25 10:30:00', 9000, 'Project delivery – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-25', 0),
(10970, 7, 27, 37, '2026-05-26 08:15:00', '2026-05-26 15:39:00', 26640, 'Governance & reporting – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-05-26', 0),
(10971, 7, 27, 37, '2026-05-27 08:00:00', '2026-05-27 10:00:00', 7200, 'Governance & reporting – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-05-27', 0),
(10972, 7, 27, 37, '2026-05-28 08:15:00', '2026-05-28 14:45:00', 23400, 'Governance & reporting – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-05-28', 0),
(10973, 7, 26, 37, '2026-06-01 08:15:00', '2026-06-01 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-06-01', 0),
(10974, 7, 30, 37, '2026-06-02 08:15:00', '2026-06-02 11:45:00', 12600, 'Training – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-06-02', 0),
(10975, 7, 26, 37, '2026-06-03 08:30:00', '2026-06-03 10:30:00', 7200, 'Project delivery – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-06-03', 0),
(10976, 7, 30, 37, '2026-06-05 08:30:00', '2026-06-05 15:30:00', 25200, 'Training – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-06-05', 0),
(10977, 7, 26, 37, '2026-06-08 08:00:00', '2026-06-08 15:24:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-06-08', 0),
(10978, 7, 28, 37, '2026-06-09 08:00:00', '2026-06-09 11:00:00', 10800, 'Stakeholder engagement – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-06-09', 0),
(10979, 7, 29, 37, '2026-06-10 08:30:00', '2026-06-10 15:54:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-06-10', 0),
(10980, 7, 26, 37, '2026-06-11 08:30:00', '2026-06-11 14:30:00', 21600, 'Project delivery – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-06-11', 0),
(10981, 7, 27, 37, '2026-06-16 08:30:00', '2026-06-16 15:00:00', 23400, 'Governance & reporting – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-06-16', 0),
(10982, 7, 28, 37, '2026-06-18 08:30:00', '2026-06-18 15:00:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-06-18', 0),
(10983, 7, 27, 37, '2026-06-19 08:15:00', '2026-06-19 15:39:00', 26640, 'Governance & reporting – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-06-19', 0),
(10984, 7, 26, 37, '2026-06-22 08:15:00', '2026-06-22 15:15:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-06-22', 0),
(10985, 7, 31, 37, '2026-06-24 08:15:00', '2026-06-24 13:15:00', 18000, 'Meetings – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-06-24', 0),
(10986, 7, 26, 37, '2026-06-25 08:15:00', '2026-06-25 13:15:00', 18000, 'Project delivery – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-06-25', 0),
(10987, 7, 28, 37, '2026-06-26 08:00:00', '2026-06-26 15:24:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-06-26', 0),
(10988, 7, 29, 37, '2026-06-30 08:30:00', '2026-06-30 12:00:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-06-30', 0),
(10989, 7, 27, 37, '2026-07-01 08:00:00', '2026-07-01 14:00:00', 21600, 'Governance & reporting – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-07-01', 0),
(10990, 7, 26, 37, '2026-07-02 08:15:00', '2026-07-02 10:15:00', 7200, 'Project delivery – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-07-02', 0),
(10991, 7, 28, 37, '2026-07-06 08:00:00', '2026-07-06 12:00:00', 14400, 'Stakeholder engagement – BAU – Policy & Strategy', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-07-06', 0),
(10992, 7, 28, 37, '2026-07-09 08:30:00', '2026-07-09 15:30:00', 25200, 'Stakeholder engagement – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-07-09', 0),
(10993, 7, 26, 37, '2026-07-13 08:15:00', '2026-07-13 14:45:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-13', 0),
(10994, 7, 31, 37, '2026-07-14 08:30:00', '2026-07-14 15:54:00', 26640, 'Meetings – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-07-14', 0),
(10995, 7, 29, 37, '2026-07-16 08:00:00', '2026-07-16 14:30:00', 23400, 'Admin & BAU – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-16', 0),
(10996, 7, 30, 37, '2026-07-17 08:30:00', '2026-07-17 11:00:00', 9000, 'Training – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-17', 0),
(10997, 7, 27, 37, '2026-07-21 08:15:00', '2026-07-21 10:15:00', 7200, 'Governance & reporting – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-07-21', 0),
(10998, 7, 26, 37, '2026-07-23 08:30:00', '2026-07-23 13:30:00', 18000, 'Project delivery – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-07-23', 0),
(10999, 7, 26, 37, '2026-07-24 08:00:00', '2026-07-24 14:00:00', 21600, 'Project delivery – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-07-24', 0),
(11000, 7, 29, 37, '2026-07-27 08:00:00', '2026-07-27 11:00:00', 10800, 'Admin & BAU – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-07-27', 0),
(11001, 7, 29, 37, '2026-07-28 08:30:00', '2026-07-28 12:00:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-28', 0),
(11002, 7, 26, 37, '2026-07-29 08:30:00', '2026-07-29 15:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-29', 0),
(11003, 7, 28, 37, '2026-07-30 08:00:00', '2026-07-30 15:00:00', 25200, 'Stakeholder engagement – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-07-30', 0),
(11004, 7, 27, 37, '2026-07-31 08:15:00', '2026-07-31 10:45:00', 9000, 'Governance & reporting – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-07-31', 0),
(11005, 7, 27, 37, '2026-08-03 08:30:00', '2026-08-03 15:30:00', 25200, 'Governance & reporting – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-08-03', 0),
(11006, 7, 28, 37, '2026-08-04 08:00:00', '2026-08-04 15:24:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-08-04', 0),
(11007, 7, 27, 37, '2026-08-05 08:15:00', '2026-08-05 15:39:00', 26640, 'Governance & reporting – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-08-05', 0),
(11008, 7, 26, 37, '2026-08-06 08:00:00', '2026-08-06 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-08-06', 0),
(11009, 7, 26, 37, '2026-08-11 08:00:00', '2026-08-11 14:30:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-08-11', 0),
(11010, 7, 31, 37, '2026-08-12 08:00:00', '2026-08-12 11:00:00', 10800, 'Meetings – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-08-12', 0),
(11011, 7, 27, 37, '2026-08-17 08:15:00', '2026-08-17 13:15:00', 18000, 'Governance & reporting – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-08-17', 0),
(11012, 7, 29, 37, '2026-08-18 08:15:00', '2026-08-18 11:15:00', 10800, 'Admin & BAU – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-08-18', 0),
(11013, 7, 27, 37, '2026-08-20 08:00:00', '2026-08-20 15:00:00', 25200, 'Governance & reporting – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-08-20', 0),
(11014, 7, 27, 37, '2026-08-21 08:30:00', '2026-08-21 13:30:00', 18000, 'Governance & reporting – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-08-21', 0),
(11015, 7, 26, 37, '2026-08-24 08:00:00', '2026-08-24 14:30:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-08-24', 0),
(11016, 7, 28, 37, '2026-08-25 08:30:00', '2026-08-25 11:00:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-08-25', 0),
(11017, 7, 28, 37, '2026-08-26 08:15:00', '2026-08-26 10:45:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-08-26', 0),
(11018, 7, 26, 37, '2026-08-27 08:15:00', '2026-08-27 10:45:00', 9000, 'Project delivery – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-08-27', 0),
(11019, 7, 26, 37, '2026-08-28 08:15:00', '2026-08-28 15:39:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-08-28', 0),
(11020, 7, 26, 37, '2026-08-31 08:15:00', '2026-08-31 15:39:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-08-31', 0),
(11021, 7, 27, 37, '2026-09-01 08:00:00', '2026-09-01 12:00:00', 14400, 'Governance & reporting – BAU – Policy & Strategy', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-09-01', 0),
(11022, 7, 29, 37, '2026-09-02 08:00:00', '2026-09-02 12:00:00', 14400, 'Admin & BAU – BAU – Policy & Strategy', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-09-02', 0),
(11023, 7, 26, 37, '2026-09-03 08:15:00', '2026-09-03 10:45:00', 9000, 'Project delivery – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-03', 0),
(11024, 7, 27, 37, '2026-09-07 08:15:00', '2026-09-07 14:45:00', 23400, 'Governance & reporting – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-07', 0),
(11025, 7, 26, 37, '2026-09-08 08:30:00', '2026-09-08 15:54:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-09-08', 0),
(11026, 7, 26, 37, '2026-09-10 08:30:00', '2026-09-10 14:30:00', 21600, 'Project delivery – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-09-10', 0),
(11027, 7, 29, 37, '2026-09-11 08:15:00', '2026-09-11 10:45:00', 9000, 'Admin & BAU – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-11', 0),
(11028, 7, 26, 37, '2026-09-14 08:15:00', '2026-09-14 11:15:00', 10800, 'Project delivery – BAU – Policy & Strategy', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:29', '2026-09-14', 0),
(11029, 7, 29, 37, '2026-09-15 08:15:00', '2026-09-15 15:39:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-09-15', 0),
(11030, 7, 26, 37, '2026-09-16 08:30:00', '2026-09-16 12:30:00', 14400, 'Project delivery – BAU – Policy & Strategy', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:29', '2026-09-16', 0),
(11031, 7, 28, 37, '2026-09-18 08:00:00', '2026-09-18 10:30:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-18', 0),
(11032, 7, 28, 37, '2026-09-21 08:15:00', '2026-09-21 15:39:00', 26640, 'Stakeholder engagement – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-09-21', 0),
(11033, 7, 27, 37, '2026-09-22 08:15:00', '2026-09-22 10:15:00', 7200, 'Governance & reporting – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-09-22', 0),
(11034, 7, 29, 37, '2026-09-23 08:15:00', '2026-09-23 14:15:00', 21600, 'Admin & BAU – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-09-23', 0),
(11035, 7, 29, 37, '2026-09-25 08:30:00', '2026-09-25 15:00:00', 23400, 'Admin & BAU – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-25', 0),
(11036, 7, 28, 37, '2026-09-28 08:00:00', '2026-09-28 11:30:00', 12600, 'Stakeholder engagement – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-09-28', 0),
(11037, 7, 26, 37, '2026-09-30 08:15:00', '2026-09-30 14:15:00', 21600, 'Project delivery – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-09-30', 0),
(11038, 7, 27, 37, '2026-10-01 08:15:00', '2026-10-01 14:15:00', 21600, 'Governance & reporting – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-10-01', 0),
(11039, 7, 26, 37, '2026-10-02 08:15:00', '2026-10-02 11:45:00', 12600, 'Project delivery – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-02', 0),
(11040, 7, 26, 37, '2026-10-05 08:00:00', '2026-10-05 15:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-10-05', 0),
(11041, 7, 29, 37, '2026-10-06 08:15:00', '2026-10-06 10:45:00', 9000, 'Admin & BAU – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-06', 0),
(11042, 7, 29, 37, '2026-10-07 08:15:00', '2026-10-07 13:15:00', 18000, 'Admin & BAU – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-10-07', 0),
(11043, 7, 28, 37, '2026-10-09 08:30:00', '2026-10-09 11:00:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-09', 0),
(11044, 7, 29, 37, '2026-10-12 08:15:00', '2026-10-12 11:45:00', 12600, 'Admin & BAU – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-12', 0),
(11045, 7, 28, 37, '2026-10-13 08:00:00', '2026-10-13 14:30:00', 23400, 'Stakeholder engagement – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-13', 0),
(11046, 7, 28, 37, '2026-10-14 08:15:00', '2026-10-14 10:45:00', 9000, 'Stakeholder engagement – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-14', 0),
(11047, 7, 29, 37, '2026-10-16 08:15:00', '2026-10-16 14:15:00', 21600, 'Admin & BAU – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-10-16', 0),
(11048, 7, 29, 37, '2026-10-19 08:30:00', '2026-10-19 15:00:00', 23400, 'Admin & BAU – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-19', 0),
(11049, 7, 26, 37, '2026-10-20 08:00:00', '2026-10-20 10:00:00', 7200, 'Project delivery – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-10-20', 0),
(11050, 7, 26, 37, '2026-10-21 08:30:00', '2026-10-21 12:00:00', 12600, 'Project delivery – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-21', 0),
(11051, 7, 30, 37, '2026-10-22 08:15:00', '2026-10-22 10:15:00', 7200, 'Training – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-10-22', 0),
(11052, 7, 26, 37, '2026-10-23 08:15:00', '2026-10-23 13:15:00', 18000, 'Project delivery – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-10-23', 0),
(11053, 7, 26, 37, '2026-10-26 09:15:00', '2026-10-26 11:15:00', 7200, 'Project delivery – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-10-26', 0),
(11054, 7, 26, 37, '2026-10-27 09:15:00', '2026-10-27 16:39:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-10-27', 0),
(11055, 7, 30, 37, '2026-10-29 09:15:00', '2026-10-29 15:15:00', 21600, 'Training – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-10-29', 0),
(11056, 7, 26, 37, '2026-10-30 09:00:00', '2026-10-30 15:30:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-10-30', 0),
(11057, 7, 26, 37, '2026-11-02 09:30:00', '2026-11-02 16:30:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-11-02', 0),
(11058, 7, 26, 37, '2026-11-03 09:00:00', '2026-11-03 16:00:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-11-03', 0),
(11059, 7, 26, 37, '2026-11-04 09:15:00', '2026-11-04 11:15:00', 7200, 'Project delivery – BAU – Policy & Strategy', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:29', '2026-11-04', 0),
(11060, 7, 26, 37, '2026-11-06 09:30:00', '2026-11-06 16:00:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-11-06', 0),
(11061, 7, 30, 37, '2026-11-09 09:00:00', '2026-11-09 16:00:00', 25200, 'Training – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-11-09', 0),
(11062, 7, 27, 37, '2026-11-10 09:00:00', '2026-11-10 12:30:00', 12600, 'Governance & reporting – BAU – Policy & Strategy', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:29', '2026-11-10', 0),
(11063, 7, 29, 37, '2026-11-12 09:15:00', '2026-11-12 15:45:00', 23400, 'Admin & BAU – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-11-12', 0),
(11064, 7, 26, 37, '2026-11-13 09:00:00', '2026-11-13 11:30:00', 9000, 'Project delivery – BAU – Policy & Strategy', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:29', '2026-11-13', 0),
(11065, 7, 26, 37, '2026-11-16 09:00:00', '2026-11-16 15:30:00', 23400, 'Project delivery – BAU – Policy & Strategy', 357.5, NULL, 55, 0, 'Europe/London', 292.5, 1, 'work', '2026-11-28 10:30:29', '2026-11-16', 0),
(11066, 7, 26, 37, '2026-11-17 09:15:00', '2026-11-17 15:15:00', 21600, 'Project delivery – BAU – Policy & Strategy', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:29', '2026-11-17', 0),
(11067, 7, 26, 37, '2026-11-18 09:30:00', '2026-11-18 16:30:00', 25200, 'Project delivery – BAU – Policy & Strategy', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:29', '2026-11-18', 0),
(11068, 7, 27, 37, '2026-11-19 09:30:00', '2026-11-19 14:30:00', 18000, 'Governance & reporting – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-11-19', 0),
(11069, 7, 29, 37, '2026-11-20 09:00:00', '2026-11-20 16:24:00', 26640, 'Admin & BAU – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-11-20', 0),
(11070, 7, 26, 37, '2026-11-23 09:30:00', '2026-11-23 16:54:00', 26640, 'Project delivery – BAU – Policy & Strategy', 407, NULL, 55, 0, 'Europe/London', 333, 1, 'work', '2026-11-28 10:30:29', '2026-11-23', 0),
(11071, 7, 29, 37, '2026-11-24 09:15:00', '2026-11-24 14:15:00', 18000, 'Admin & BAU – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-11-24', 0),
(11072, 7, 29, 37, '2026-11-27 09:30:00', '2026-11-27 14:30:00', 18000, 'Admin & BAU – BAU – Policy & Strategy', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:29', '2026-11-27', 0),
(11073, 16, 26, 38, '2026-01-07 09:00:00', '2026-01-07 14:00:00', 18000, 'Project delivery – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-01-07', 0),
(11074, 16, 26, 38, '2026-01-09 09:30:00', '2026-01-09 13:00:00', 12600, 'Project delivery – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:29', '2026-01-09', 0),
(11075, 16, 31, 38, '2026-01-12 09:00:00', '2026-01-12 14:00:00', 18000, 'Meetings – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-01-12', 0),
(11076, 16, 26, 38, '2026-01-14 09:00:00', '2026-01-14 15:30:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-01-14', 0),
(11077, 16, 27, 38, '2026-01-15 09:15:00', '2026-01-15 16:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-01-15', 0),
(11078, 16, 28, 38, '2026-01-16 09:30:00', '2026-01-16 12:00:00', 9000, 'Stakeholder engagement – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-01-16', 0),
(11079, 16, 26, 38, '2026-01-19 09:00:00', '2026-01-19 11:30:00', 9000, 'Project delivery – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-01-19', 0),
(11080, 16, 30, 38, '2026-01-20 09:30:00', '2026-01-20 12:00:00', 9000, 'Training – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-01-20', 0),
(11081, 16, 26, 38, '2026-01-21 09:15:00', '2026-01-21 16:15:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-01-21', 0),
(11082, 16, 28, 38, '2026-01-26 09:15:00', '2026-01-26 11:45:00', 9000, 'Stakeholder engagement – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-01-26', 0),
(11083, 16, 31, 38, '2026-01-27 09:30:00', '2026-01-27 16:30:00', 25200, 'Meetings – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-01-27', 0),
(11084, 16, 29, 38, '2026-01-28 09:15:00', '2026-01-28 16:39:00', 26640, 'Admin & BAU – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-01-28', 0),
(11085, 16, 26, 38, '2026-01-30 09:15:00', '2026-01-30 12:15:00', 10800, 'Project delivery – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-01-30', 0),
(11086, 16, 26, 38, '2026-02-03 09:15:00', '2026-02-03 16:15:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-02-03', 0),
(11087, 16, 28, 38, '2026-02-04 09:00:00', '2026-02-04 12:30:00', 12600, 'Stakeholder engagement – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:29', '2026-02-04', 0),
(11088, 16, 26, 38, '2026-02-05 09:15:00', '2026-02-05 14:15:00', 18000, 'Project delivery – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-02-05', 0),
(11089, 16, 28, 38, '2026-02-06 09:15:00', '2026-02-06 15:45:00', 23400, 'Stakeholder engagement – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-02-06', 0),
(11090, 16, 27, 38, '2026-02-09 09:15:00', '2026-02-09 16:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-02-09', 0),
(11091, 16, 27, 38, '2026-02-10 09:30:00', '2026-02-10 13:00:00', 12600, 'Governance & reporting – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:29', '2026-02-10', 0),
(11092, 16, 31, 38, '2026-02-11 09:30:00', '2026-02-11 12:30:00', 10800, 'Meetings – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-02-11', 0),
(11093, 16, 29, 38, '2026-02-12 09:00:00', '2026-02-12 16:24:00', 26640, 'Admin & BAU – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-02-12', 0),
(11094, 16, 29, 38, '2026-02-13 09:00:00', '2026-02-13 11:30:00', 9000, 'Admin & BAU – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-02-13', 0),
(11095, 16, 27, 38, '2026-02-16 09:30:00', '2026-02-16 14:30:00', 18000, 'Governance & reporting – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-02-16', 0),
(11096, 16, 26, 38, '2026-02-19 09:30:00', '2026-02-19 16:54:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-02-19', 0),
(11097, 16, 29, 38, '2026-02-23 09:15:00', '2026-02-23 16:15:00', 25200, 'Admin & BAU – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-02-23', 0),
(11098, 16, 26, 38, '2026-02-24 09:15:00', '2026-02-24 11:15:00', 7200, 'Project delivery – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-02-24', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(11099, 16, 28, 38, '2026-02-25 09:30:00', '2026-02-25 12:30:00', 10800, 'Stakeholder engagement – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-02-25', 0),
(11100, 16, 29, 38, '2026-02-26 09:30:00', '2026-02-26 16:00:00', 23400, 'Admin & BAU – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-02-26', 0),
(11101, 16, 26, 38, '2026-03-02 09:15:00', '2026-03-02 16:39:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-03-02', 0),
(11102, 16, 28, 38, '2026-03-03 09:00:00', '2026-03-03 16:00:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-03-03', 0),
(11103, 16, 28, 38, '2026-03-04 09:30:00', '2026-03-04 13:30:00', 14400, 'Stakeholder engagement – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-03-04', 0),
(11104, 16, 28, 38, '2026-03-06 09:30:00', '2026-03-06 14:30:00', 18000, 'Stakeholder engagement – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-03-06', 0),
(11105, 16, 28, 38, '2026-03-09 09:15:00', '2026-03-09 16:39:00', 26640, 'Stakeholder engagement – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-03-09', 0),
(11106, 16, 26, 38, '2026-03-10 09:00:00', '2026-03-10 16:00:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-03-10', 0),
(11107, 16, 26, 38, '2026-03-16 09:15:00', '2026-03-16 16:39:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-03-16', 0),
(11108, 16, 26, 38, '2026-03-17 09:30:00', '2026-03-17 12:30:00', 10800, 'Project delivery – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-03-17', 0),
(11109, 16, 29, 38, '2026-03-19 09:30:00', '2026-03-19 16:30:00', 25200, 'Admin & BAU – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-03-19', 0),
(11110, 16, 29, 38, '2026-03-23 09:30:00', '2026-03-23 16:00:00', 23400, 'Admin & BAU – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-03-23', 0),
(11111, 16, 29, 38, '2026-03-25 09:15:00', '2026-03-25 11:45:00', 9000, 'Admin & BAU – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-03-25', 0),
(11112, 16, 31, 38, '2026-03-26 09:30:00', '2026-03-26 16:30:00', 25200, 'Meetings – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-03-26', 0),
(11113, 16, 26, 38, '2026-03-27 09:15:00', '2026-03-27 13:15:00', 14400, 'Project delivery – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-03-27', 0),
(11114, 16, 31, 38, '2026-03-30 08:00:00', '2026-03-30 11:00:00', 10800, 'Meetings – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-03-30', 0),
(11115, 16, 26, 38, '2026-04-01 08:15:00', '2026-04-01 14:45:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-04-01', 0),
(11116, 16, 26, 38, '2026-04-02 08:30:00', '2026-04-02 14:30:00', 21600, 'Project delivery – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-04-02', 0),
(11117, 16, 30, 38, '2026-04-03 08:15:00', '2026-04-03 11:45:00', 12600, 'Training – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:29', '2026-04-03', 0),
(11118, 16, 29, 38, '2026-04-06 08:30:00', '2026-04-06 15:00:00', 23400, 'Admin & BAU – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-04-06', 0),
(11119, 16, 26, 38, '2026-04-07 08:30:00', '2026-04-07 15:00:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-04-07', 0),
(11120, 16, 26, 38, '2026-04-08 08:15:00', '2026-04-08 10:15:00', 7200, 'Project delivery – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-04-08', 0),
(11121, 16, 31, 38, '2026-04-10 08:00:00', '2026-04-10 14:00:00', 21600, 'Meetings – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-04-10', 0),
(11122, 16, 27, 38, '2026-04-15 08:00:00', '2026-04-15 15:24:00', 26640, 'Governance & reporting – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-04-15', 0),
(11123, 16, 26, 38, '2026-04-21 08:15:00', '2026-04-21 14:15:00', 21600, 'Project delivery – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-04-21', 0),
(11124, 16, 26, 38, '2026-04-22 08:15:00', '2026-04-22 12:15:00', 14400, 'Project delivery – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-04-22', 0),
(11125, 16, 26, 38, '2026-04-24 08:00:00', '2026-04-24 12:00:00', 14400, 'Project delivery – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-04-24', 0),
(11126, 16, 29, 38, '2026-04-27 08:30:00', '2026-04-27 15:54:00', 26640, 'Admin & BAU – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-04-27', 0),
(11127, 16, 26, 38, '2026-04-28 08:15:00', '2026-04-28 13:15:00', 18000, 'Project delivery – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-04-28', 0),
(11128, 16, 26, 38, '2026-04-29 08:30:00', '2026-04-29 13:30:00', 18000, 'Project delivery – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-04-29', 0),
(11129, 16, 29, 38, '2026-04-30 08:30:00', '2026-04-30 15:00:00', 23400, 'Admin & BAU – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-04-30', 0),
(11130, 16, 26, 38, '2026-05-01 08:30:00', '2026-05-01 15:54:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-05-01', 0),
(11131, 16, 29, 38, '2026-05-04 08:00:00', '2026-05-04 13:00:00', 18000, 'Admin & BAU – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-05-04', 0),
(11132, 16, 30, 38, '2026-05-11 08:15:00', '2026-05-11 15:39:00', 26640, 'Training – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-05-11', 0),
(11133, 16, 27, 38, '2026-05-12 08:30:00', '2026-05-12 13:30:00', 18000, 'Governance & reporting – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-05-12', 0),
(11134, 16, 26, 38, '2026-05-13 08:00:00', '2026-05-13 10:00:00', 7200, 'Project delivery – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-05-13', 0),
(11135, 16, 30, 38, '2026-05-14 08:00:00', '2026-05-14 14:30:00', 23400, 'Training – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-05-14', 0),
(11136, 16, 26, 38, '2026-05-15 08:00:00', '2026-05-15 14:00:00', 21600, 'Project delivery – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-05-15', 0),
(11137, 16, 29, 38, '2026-05-18 08:15:00', '2026-05-18 12:15:00', 14400, 'Admin & BAU – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-05-18', 0),
(11138, 16, 26, 38, '2026-05-19 08:30:00', '2026-05-19 15:30:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-05-19', 0),
(11139, 16, 27, 38, '2026-05-20 08:15:00', '2026-05-20 15:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-05-20', 0),
(11140, 16, 26, 38, '2026-05-25 08:15:00', '2026-05-25 14:15:00', 21600, 'Project delivery – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-05-25', 0),
(11141, 16, 26, 38, '2026-05-26 08:30:00', '2026-05-26 15:00:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-05-26', 0),
(11142, 16, 31, 38, '2026-05-28 08:15:00', '2026-05-28 15:39:00', 26640, 'Meetings – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-05-28', 0),
(11143, 16, 27, 38, '2026-06-01 08:15:00', '2026-06-01 15:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-06-01', 0),
(11144, 16, 27, 38, '2026-06-03 08:00:00', '2026-06-03 10:00:00', 7200, 'Governance & reporting – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-06-03', 0),
(11145, 16, 29, 38, '2026-06-04 08:15:00', '2026-06-04 14:15:00', 21600, 'Admin & BAU – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-06-04', 0),
(11146, 16, 26, 38, '2026-06-05 08:15:00', '2026-06-05 14:15:00', 21600, 'Project delivery – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-06-05', 0),
(11147, 16, 26, 38, '2026-06-08 08:30:00', '2026-06-08 10:30:00', 7200, 'Project delivery – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-06-08', 0),
(11148, 16, 26, 38, '2026-06-09 08:30:00', '2026-06-09 15:30:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-06-09', 0),
(11149, 16, 29, 38, '2026-06-10 08:00:00', '2026-06-10 15:00:00', 25200, 'Admin & BAU – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-06-10', 0),
(11150, 16, 26, 38, '2026-06-12 08:30:00', '2026-06-12 15:54:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-06-12', 0),
(11151, 16, 29, 38, '2026-06-15 08:00:00', '2026-06-15 14:00:00', 21600, 'Admin & BAU – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-06-15', 0),
(11152, 16, 26, 38, '2026-06-16 08:00:00', '2026-06-16 10:00:00', 7200, 'Project delivery – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-06-16', 0),
(11153, 16, 29, 38, '2026-06-17 08:00:00', '2026-06-17 12:00:00', 14400, 'Admin & BAU – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-06-17', 0),
(11154, 16, 30, 38, '2026-06-18 08:15:00', '2026-06-18 13:15:00', 18000, 'Training – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-06-18', 0),
(11155, 16, 26, 38, '2026-06-22 08:30:00', '2026-06-22 15:30:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-06-22', 0),
(11156, 16, 29, 38, '2026-06-24 08:15:00', '2026-06-24 10:45:00', 9000, 'Admin & BAU – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-06-24', 0),
(11157, 16, 26, 38, '2026-06-25 08:00:00', '2026-06-25 10:00:00', 7200, 'Project delivery – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-06-25', 0),
(11158, 16, 31, 38, '2026-06-29 08:30:00', '2026-06-29 14:30:00', 21600, 'Meetings – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-06-29', 0),
(11159, 16, 27, 38, '2026-06-30 08:00:00', '2026-06-30 13:00:00', 18000, 'Governance & reporting – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-06-30', 0),
(11160, 16, 26, 38, '2026-07-02 08:30:00', '2026-07-02 15:54:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-07-02', 0),
(11161, 16, 29, 38, '2026-07-03 08:00:00', '2026-07-03 11:30:00', 12600, 'Admin & BAU – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:29', '2026-07-03', 0),
(11162, 16, 28, 38, '2026-07-07 08:30:00', '2026-07-07 13:30:00', 18000, 'Stakeholder engagement – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-07-07', 0),
(11163, 16, 26, 38, '2026-07-08 08:30:00', '2026-07-08 14:30:00', 21600, 'Project delivery – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-07-08', 0),
(11164, 16, 29, 38, '2026-07-09 08:30:00', '2026-07-09 15:30:00', 25200, 'Admin & BAU – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-07-09', 0),
(11165, 16, 26, 38, '2026-07-10 08:15:00', '2026-07-10 10:45:00', 9000, 'Project delivery – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-07-10', 0),
(11166, 16, 27, 38, '2026-07-14 08:00:00', '2026-07-14 15:00:00', 25200, 'Governance & reporting – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-07-14', 0),
(11167, 16, 29, 38, '2026-07-15 08:00:00', '2026-07-15 14:30:00', 23400, 'Admin & BAU – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-07-15', 0),
(11168, 16, 26, 38, '2026-07-16 08:15:00', '2026-07-16 15:39:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-07-16', 0),
(11169, 16, 28, 38, '2026-07-17 08:30:00', '2026-07-17 11:30:00', 10800, 'Stakeholder engagement – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-07-17', 0),
(11170, 16, 29, 38, '2026-07-20 08:00:00', '2026-07-20 15:00:00', 25200, 'Admin & BAU – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-07-20', 0),
(11171, 16, 26, 38, '2026-07-23 08:00:00', '2026-07-23 14:30:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-07-23', 0),
(11172, 16, 26, 38, '2026-07-24 08:00:00', '2026-07-24 14:30:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-07-24', 0),
(11173, 16, 28, 38, '2026-07-27 08:00:00', '2026-07-27 11:00:00', 10800, 'Stakeholder engagement – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-07-27', 0),
(11174, 16, 26, 38, '2026-07-29 08:30:00', '2026-07-29 11:00:00', 9000, 'Project delivery – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-07-29', 0),
(11175, 16, 26, 38, '2026-07-30 08:15:00', '2026-07-30 11:15:00', 10800, 'Project delivery – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-07-30', 0),
(11176, 16, 26, 38, '2026-07-31 08:30:00', '2026-07-31 15:54:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-07-31', 0),
(11177, 16, 26, 38, '2026-08-03 08:30:00', '2026-08-03 11:00:00', 9000, 'Project delivery – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-08-03', 0),
(11178, 16, 29, 38, '2026-08-05 08:00:00', '2026-08-05 15:24:00', 26640, 'Admin & BAU – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-08-05', 0),
(11179, 16, 26, 38, '2026-08-10 08:00:00', '2026-08-10 14:00:00', 21600, 'Project delivery – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-08-10', 0),
(11180, 16, 29, 38, '2026-08-11 08:00:00', '2026-08-11 15:24:00', 26640, 'Admin & BAU – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-08-11', 0),
(11181, 16, 31, 38, '2026-08-14 08:00:00', '2026-08-14 15:24:00', 26640, 'Meetings – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-08-14', 0),
(11182, 16, 31, 38, '2026-08-17 08:00:00', '2026-08-17 13:00:00', 18000, 'Meetings – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-08-17', 0),
(11183, 16, 27, 38, '2026-08-18 08:30:00', '2026-08-18 14:30:00', 21600, 'Governance & reporting – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-08-18', 0),
(11184, 16, 26, 38, '2026-08-19 08:00:00', '2026-08-19 14:30:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-08-19', 0),
(11185, 16, 26, 38, '2026-08-20 08:15:00', '2026-08-20 15:15:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-08-20', 0),
(11186, 16, 26, 38, '2026-08-21 08:15:00', '2026-08-21 15:15:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-08-21', 0),
(11187, 16, 26, 38, '2026-08-25 08:15:00', '2026-08-25 11:45:00', 12600, 'Project delivery – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:29', '2026-08-25', 0),
(11188, 16, 29, 38, '2026-08-26 08:30:00', '2026-08-26 15:00:00', 23400, 'Admin & BAU – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-08-26', 0),
(11189, 16, 27, 38, '2026-08-27 08:30:00', '2026-08-27 11:00:00', 9000, 'Governance & reporting – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-08-27', 0),
(11190, 16, 29, 38, '2026-08-28 08:00:00', '2026-08-28 13:00:00', 18000, 'Admin & BAU – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-08-28', 0),
(11191, 16, 26, 38, '2026-09-01 08:15:00', '2026-09-01 15:15:00', 25200, 'Project delivery – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:29', '2026-09-01', 0),
(11192, 16, 28, 38, '2026-09-02 08:00:00', '2026-09-02 15:24:00', 26640, 'Stakeholder engagement – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-09-02', 0),
(11193, 16, 30, 38, '2026-09-03 08:00:00', '2026-09-03 10:00:00', 7200, 'Training – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-09-03', 0),
(11194, 16, 28, 38, '2026-09-07 08:00:00', '2026-09-07 14:00:00', 21600, 'Stakeholder engagement – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-09-07', 0),
(11195, 16, 27, 38, '2026-09-08 08:00:00', '2026-09-08 15:24:00', 26640, 'Governance & reporting – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:29', '2026-09-08', 0),
(11196, 16, 31, 38, '2026-09-11 08:15:00', '2026-09-11 12:15:00', 14400, 'Meetings – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-09-11', 0),
(11197, 16, 29, 38, '2026-09-14 08:00:00', '2026-09-14 14:30:00', 23400, 'Admin & BAU – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-09-14', 0),
(11198, 16, 26, 38, '2026-09-15 08:30:00', '2026-09-15 12:30:00', 14400, 'Project delivery – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-09-15', 0),
(11199, 16, 31, 38, '2026-09-16 08:15:00', '2026-09-16 10:15:00', 7200, 'Meetings – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-09-16', 0),
(11200, 16, 28, 38, '2026-09-18 08:00:00', '2026-09-18 12:00:00', 14400, 'Stakeholder engagement – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:29', '2026-09-18', 0),
(11201, 16, 30, 38, '2026-09-21 08:30:00', '2026-09-21 10:30:00', 7200, 'Training – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-09-21', 0),
(11202, 16, 28, 38, '2026-09-22 08:30:00', '2026-09-22 10:30:00', 7200, 'Stakeholder engagement – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-09-22', 0),
(11203, 16, 26, 38, '2026-09-23 08:30:00', '2026-09-23 12:00:00', 12600, 'Project delivery – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:29', '2026-09-23', 0),
(11204, 16, 29, 38, '2026-09-25 08:30:00', '2026-09-25 10:30:00', 7200, 'Admin & BAU – BAU – Place & Housing', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:29', '2026-09-25', 0),
(11205, 16, 27, 38, '2026-09-30 08:30:00', '2026-09-30 13:30:00', 18000, 'Governance & reporting – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-09-30', 0),
(11206, 16, 28, 38, '2026-10-02 08:15:00', '2026-10-02 10:45:00', 9000, 'Stakeholder engagement – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-10-02', 0),
(11207, 16, 29, 38, '2026-10-05 08:00:00', '2026-10-05 14:00:00', 21600, 'Admin & BAU – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:29', '2026-10-05', 0),
(11208, 16, 26, 38, '2026-10-08 08:15:00', '2026-10-08 13:15:00', 18000, 'Project delivery – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:29', '2026-10-08', 0),
(11209, 16, 26, 38, '2026-10-12 08:15:00', '2026-10-12 14:45:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:29', '2026-10-12', 0),
(11210, 16, 29, 38, '2026-10-13 08:00:00', '2026-10-13 10:30:00', 9000, 'Admin & BAU – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:29', '2026-10-13', 0),
(11211, 16, 28, 38, '2026-10-14 08:15:00', '2026-10-14 11:15:00', 10800, 'Stakeholder engagement – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:29', '2026-10-14', 0),
(11212, 16, 26, 38, '2026-10-16 08:30:00', '2026-10-16 12:00:00', 12600, 'Project delivery – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-10-16', 0),
(11213, 16, 28, 38, '2026-10-21 08:30:00', '2026-10-21 15:30:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-10-21', 0),
(11214, 16, 29, 38, '2026-10-22 08:15:00', '2026-10-22 10:45:00', 9000, 'Admin & BAU – BAU – Place & Housing', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-10-22', 0),
(11215, 16, 29, 38, '2026-10-26 09:30:00', '2026-10-26 12:30:00', 10800, 'Admin & BAU – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-10-26', 0),
(11216, 16, 26, 38, '2026-10-27 09:30:00', '2026-10-27 15:30:00', 21600, 'Project delivery – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-10-27', 0),
(11217, 16, 26, 38, '2026-10-28 09:00:00', '2026-10-28 16:24:00', 26640, 'Project delivery – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:30', '2026-10-28', 0),
(11218, 16, 27, 38, '2026-10-30 09:15:00', '2026-10-30 16:39:00', 26640, 'Governance & reporting – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:30', '2026-10-30', 0),
(11219, 16, 29, 38, '2026-11-02 09:15:00', '2026-11-02 12:15:00', 10800, 'Admin & BAU – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-11-02', 0),
(11220, 16, 26, 38, '2026-11-03 09:30:00', '2026-11-03 13:00:00', 12600, 'Project delivery – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-11-03', 0),
(11221, 16, 30, 38, '2026-11-04 09:00:00', '2026-11-04 15:00:00', 21600, 'Training – BAU – Place & Housing', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-11-04', 0),
(11222, 16, 26, 38, '2026-11-06 09:30:00', '2026-11-06 13:00:00', 12600, 'Project delivery – BAU – Place & Housing', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-11-06', 0),
(11223, 16, 29, 38, '2026-11-10 09:15:00', '2026-11-10 13:15:00', 14400, 'Admin & BAU – BAU – Place & Housing', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-11-10', 0),
(11224, 16, 29, 38, '2026-11-13 09:00:00', '2026-11-13 15:30:00', 23400, 'Admin & BAU – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-11-13', 0),
(11225, 16, 26, 38, '2026-11-16 09:00:00', '2026-11-16 14:00:00', 18000, 'Project delivery – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-11-16', 0),
(11226, 16, 28, 38, '2026-11-18 09:15:00', '2026-11-18 16:39:00', 26640, 'Stakeholder engagement – BAU – Place & Housing', 236.8, NULL, 32, 0, 'Europe/London', 207.2, 1, 'work', '2026-11-28 10:30:30', '2026-11-18', 0),
(11227, 16, 29, 38, '2026-11-19 09:15:00', '2026-11-19 16:15:00', 25200, 'Admin & BAU – BAU – Place & Housing', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-11-19', 0),
(11228, 16, 26, 38, '2026-11-20 09:00:00', '2026-11-20 14:00:00', 18000, 'Project delivery – BAU – Place & Housing', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-11-20', 0),
(11229, 16, 26, 38, '2026-11-23 09:15:00', '2026-11-23 12:15:00', 10800, 'Project delivery – BAU – Place & Housing', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-11-23', 0),
(11230, 16, 27, 38, '2026-11-24 09:00:00', '2026-11-24 15:30:00', 23400, 'Governance & reporting – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-11-24', 0),
(11231, 16, 26, 38, '2026-11-25 09:00:00', '2026-11-25 15:30:00', 23400, 'Project delivery – BAU – Place & Housing', 208, NULL, 32, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-11-25', 0),
(11232, 10, 29, 38, '2026-01-06 09:30:00', '2026-01-06 15:30:00', 21600, 'Admin & BAU – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-01-06', 0),
(11233, 10, 27, 38, '2026-01-07 09:15:00', '2026-01-07 16:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-01-07', 0),
(11234, 10, 26, 38, '2026-01-08 09:00:00', '2026-01-08 15:00:00', 21600, 'Project delivery – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-01-08', 0),
(11235, 10, 28, 38, '2026-01-09 09:00:00', '2026-01-09 13:00:00', 14400, 'Stakeholder engagement – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-01-09', 0),
(11236, 10, 26, 38, '2026-01-12 09:30:00', '2026-01-12 14:30:00', 18000, 'Project delivery – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-01-12', 0),
(11237, 10, 29, 38, '2026-01-13 09:30:00', '2026-01-13 12:00:00', 9000, 'Admin & BAU – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-01-13', 0),
(11238, 10, 29, 38, '2026-01-14 09:15:00', '2026-01-14 16:15:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-01-14', 0),
(11239, 10, 27, 38, '2026-01-19 09:00:00', '2026-01-19 16:00:00', 25200, 'Governance & reporting – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-01-19', 0),
(11240, 10, 30, 38, '2026-01-21 09:30:00', '2026-01-21 16:30:00', 25200, 'Training – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-01-21', 0),
(11241, 10, 26, 38, '2026-01-22 09:00:00', '2026-01-22 15:30:00', 23400, 'Project delivery – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-01-22', 0),
(11242, 10, 29, 38, '2026-01-23 09:15:00', '2026-01-23 16:15:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-01-23', 0),
(11243, 10, 27, 38, '2026-01-26 09:30:00', '2026-01-26 12:30:00', 10800, 'Governance & reporting – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-01-26', 0),
(11244, 10, 29, 38, '2026-01-27 09:30:00', '2026-01-27 16:30:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-01-27', 0),
(11245, 10, 28, 38, '2026-01-29 09:30:00', '2026-01-29 16:54:00', 26640, 'Stakeholder engagement – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-01-29', 0),
(11246, 10, 27, 38, '2026-01-30 09:30:00', '2026-01-30 16:54:00', 26640, 'Governance & reporting – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-01-30', 0),
(11247, 10, 31, 38, '2026-02-02 09:30:00', '2026-02-02 12:00:00', 9000, 'Meetings – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-02-02', 0),
(11248, 10, 30, 38, '2026-02-03 09:00:00', '2026-02-03 16:00:00', 25200, 'Training – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-02-03', 0),
(11249, 10, 28, 38, '2026-02-04 09:00:00', '2026-02-04 13:00:00', 14400, 'Stakeholder engagement – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-02-04', 0),
(11250, 10, 29, 38, '2026-02-05 09:00:00', '2026-02-05 11:00:00', 7200, 'Admin & BAU – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-02-05', 0),
(11251, 10, 28, 38, '2026-02-06 09:00:00', '2026-02-06 11:00:00', 7200, 'Stakeholder engagement – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-02-06', 0),
(11252, 10, 27, 38, '2026-02-09 09:15:00', '2026-02-09 16:39:00', 26640, 'Governance & reporting – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-02-09', 0),
(11253, 10, 27, 38, '2026-02-11 09:00:00', '2026-02-11 15:00:00', 21600, 'Governance & reporting – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-02-11', 0),
(11254, 10, 27, 38, '2026-02-12 09:15:00', '2026-02-12 11:15:00', 7200, 'Governance & reporting – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-02-12', 0),
(11255, 10, 26, 38, '2026-02-17 09:15:00', '2026-02-17 16:39:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-02-17', 0),
(11256, 10, 26, 38, '2026-02-18 09:30:00', '2026-02-18 11:30:00', 7200, 'Project delivery – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-02-18', 0),
(11257, 10, 26, 38, '2026-02-23 09:00:00', '2026-02-23 13:00:00', 14400, 'Project delivery – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-02-23', 0),
(11258, 10, 29, 38, '2026-02-24 09:15:00', '2026-02-24 16:15:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-02-24', 0),
(11259, 10, 28, 38, '2026-02-25 09:00:00', '2026-02-25 16:00:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-02-25', 0),
(11260, 10, 29, 38, '2026-02-26 09:30:00', '2026-02-26 16:30:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-02-26', 0),
(11261, 10, 26, 38, '2026-02-27 09:15:00', '2026-02-27 15:15:00', 21600, 'Project delivery – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-02-27', 0),
(11262, 10, 29, 38, '2026-03-02 09:15:00', '2026-03-02 12:15:00', 10800, 'Admin & BAU – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-03-02', 0),
(11263, 10, 26, 38, '2026-03-04 09:30:00', '2026-03-04 16:00:00', 23400, 'Project delivery – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-03-04', 0),
(11264, 10, 27, 38, '2026-03-05 09:00:00', '2026-03-05 14:00:00', 18000, 'Governance & reporting – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-03-05', 0),
(11265, 10, 29, 38, '2026-03-09 09:00:00', '2026-03-09 11:00:00', 7200, 'Admin & BAU – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-03-09', 0),
(11266, 10, 26, 38, '2026-03-10 09:30:00', '2026-03-10 13:30:00', 14400, 'Project delivery – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-03-10', 0),
(11267, 10, 28, 38, '2026-03-11 09:15:00', '2026-03-11 16:39:00', 26640, 'Stakeholder engagement – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-03-11', 0),
(11268, 10, 26, 38, '2026-03-13 09:30:00', '2026-03-13 16:54:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-03-13', 0),
(11269, 10, 27, 38, '2026-03-16 09:15:00', '2026-03-16 15:15:00', 21600, 'Governance & reporting – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-03-16', 0),
(11270, 10, 26, 38, '2026-03-17 09:15:00', '2026-03-17 16:15:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-03-17', 0),
(11271, 10, 26, 38, '2026-03-19 09:00:00', '2026-03-19 16:00:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-03-19', 0),
(11272, 10, 29, 38, '2026-03-20 09:30:00', '2026-03-20 15:30:00', 21600, 'Admin & BAU – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-03-20', 0),
(11273, 10, 28, 38, '2026-03-24 09:15:00', '2026-03-24 14:15:00', 18000, 'Stakeholder engagement – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-03-24', 0),
(11274, 10, 28, 38, '2026-03-25 09:30:00', '2026-03-25 11:30:00', 7200, 'Stakeholder engagement – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-03-25', 0),
(11275, 10, 26, 38, '2026-03-26 09:00:00', '2026-03-26 12:30:00', 12600, 'Project delivery – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-03-26', 0),
(11276, 10, 29, 38, '2026-03-27 09:15:00', '2026-03-27 12:15:00', 10800, 'Admin & BAU – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-03-27', 0),
(11277, 10, 26, 38, '2026-04-02 08:30:00', '2026-04-02 13:30:00', 18000, 'Project delivery – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-04-02', 0),
(11278, 10, 30, 38, '2026-04-03 08:30:00', '2026-04-03 11:00:00', 9000, 'Training – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-04-03', 0),
(11279, 10, 27, 38, '2026-04-06 08:15:00', '2026-04-06 15:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-06', 0),
(11280, 10, 26, 38, '2026-04-09 08:30:00', '2026-04-09 15:30:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-09', 0),
(11281, 10, 26, 38, '2026-04-10 08:00:00', '2026-04-10 15:24:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-04-10', 0),
(11282, 10, 29, 38, '2026-04-13 08:00:00', '2026-04-13 15:00:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-13', 0),
(11283, 10, 28, 38, '2026-04-16 08:00:00', '2026-04-16 15:00:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-16', 0),
(11284, 10, 29, 38, '2026-04-17 08:00:00', '2026-04-17 15:00:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-17', 0),
(11285, 10, 28, 38, '2026-04-20 08:15:00', '2026-04-20 13:15:00', 18000, 'Stakeholder engagement – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-04-20', 0),
(11286, 10, 27, 38, '2026-04-21 08:15:00', '2026-04-21 15:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-21', 0),
(11287, 10, 26, 38, '2026-04-22 08:15:00', '2026-04-22 11:45:00', 12600, 'Project delivery – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-04-22', 0),
(11288, 10, 26, 38, '2026-04-23 08:15:00', '2026-04-23 11:45:00', 12600, 'Project delivery – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-04-23', 0),
(11289, 10, 31, 38, '2026-04-24 08:30:00', '2026-04-24 15:30:00', 25200, 'Meetings – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-24', 0),
(11290, 10, 31, 38, '2026-04-27 08:30:00', '2026-04-27 15:00:00', 23400, 'Meetings – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-04-27', 0),
(11291, 10, 27, 38, '2026-04-28 08:00:00', '2026-04-28 15:24:00', 26640, 'Governance & reporting – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-04-28', 0),
(11292, 10, 28, 38, '2026-04-29 08:15:00', '2026-04-29 15:15:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-29', 0),
(11293, 10, 26, 38, '2026-05-04 08:30:00', '2026-05-04 12:00:00', 12600, 'Project delivery – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-05-04', 0),
(11294, 10, 27, 38, '2026-05-05 08:30:00', '2026-05-05 14:30:00', 21600, 'Governance & reporting – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-05-05', 0),
(11295, 10, 28, 38, '2026-05-06 08:15:00', '2026-05-06 15:15:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-05-06', 0),
(11296, 10, 26, 38, '2026-05-07 08:15:00', '2026-05-07 11:15:00', 10800, 'Project delivery – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-05-07', 0),
(11297, 10, 27, 38, '2026-05-14 08:30:00', '2026-05-14 12:30:00', 14400, 'Governance & reporting – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-05-14', 0),
(11298, 10, 27, 38, '2026-05-15 08:15:00', '2026-05-15 15:39:00', 26640, 'Governance & reporting – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-05-15', 0),
(11299, 10, 27, 38, '2026-05-18 08:15:00', '2026-05-18 15:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-05-18', 0),
(11300, 10, 29, 38, '2026-05-19 08:30:00', '2026-05-19 15:54:00', 26640, 'Admin & BAU – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-05-19', 0),
(11301, 10, 29, 38, '2026-05-21 08:00:00', '2026-05-21 15:24:00', 26640, 'Admin & BAU – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-05-21', 0),
(11302, 10, 27, 38, '2026-05-25 08:00:00', '2026-05-25 11:30:00', 12600, 'Governance & reporting – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-05-25', 0),
(11303, 10, 27, 38, '2026-05-26 08:00:00', '2026-05-26 12:00:00', 14400, 'Governance & reporting – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-05-26', 0),
(11304, 10, 29, 38, '2026-05-27 08:30:00', '2026-05-27 15:30:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-05-27', 0),
(11305, 10, 28, 38, '2026-05-28 08:15:00', '2026-05-28 15:15:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-05-28', 0),
(11306, 10, 26, 38, '2026-05-29 08:15:00', '2026-05-29 11:15:00', 10800, 'Project delivery – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-05-29', 0),
(11307, 10, 26, 38, '2026-06-01 08:00:00', '2026-06-01 11:00:00', 10800, 'Project delivery – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-06-01', 0),
(11308, 10, 28, 38, '2026-06-02 08:15:00', '2026-06-02 11:45:00', 12600, 'Stakeholder engagement – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-06-02', 0),
(11309, 10, 28, 38, '2026-06-03 08:30:00', '2026-06-03 11:30:00', 10800, 'Stakeholder engagement – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-06-03', 0),
(11310, 10, 27, 38, '2026-06-05 08:15:00', '2026-06-05 15:15:00', 25200, 'Governance & reporting – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-06-05', 0),
(11311, 10, 29, 38, '2026-06-08 08:30:00', '2026-06-08 11:00:00', 9000, 'Admin & BAU – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-06-08', 0),
(11312, 10, 26, 38, '2026-06-10 08:30:00', '2026-06-10 15:54:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-06-10', 0),
(11313, 10, 29, 38, '2026-06-11 08:00:00', '2026-06-11 10:00:00', 7200, 'Admin & BAU – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-06-11', 0),
(11314, 10, 30, 38, '2026-06-12 08:00:00', '2026-06-12 14:30:00', 23400, 'Training – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-06-12', 0),
(11315, 10, 27, 38, '2026-06-17 08:30:00', '2026-06-17 14:30:00', 21600, 'Governance & reporting – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-06-17', 0),
(11316, 10, 26, 38, '2026-06-19 08:30:00', '2026-06-19 15:00:00', 23400, 'Project delivery – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-06-19', 0),
(11317, 10, 26, 38, '2026-06-23 08:30:00', '2026-06-23 12:30:00', 14400, 'Project delivery – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-06-23', 0),
(11318, 10, 28, 38, '2026-06-24 08:00:00', '2026-06-24 15:00:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-06-24', 0),
(11319, 10, 28, 38, '2026-06-25 08:15:00', '2026-06-25 15:39:00', 26640, 'Stakeholder engagement – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-06-25', 0),
(11320, 10, 27, 38, '2026-06-26 08:15:00', '2026-06-26 12:15:00', 14400, 'Governance & reporting – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-06-26', 0),
(11321, 10, 26, 38, '2026-06-29 08:30:00', '2026-06-29 15:54:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-06-29', 0),
(11322, 10, 26, 38, '2026-07-01 08:30:00', '2026-07-01 12:00:00', 12600, 'Project delivery – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-07-01', 0),
(11323, 10, 27, 38, '2026-07-03 08:30:00', '2026-07-03 12:30:00', 14400, 'Governance & reporting – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-07-03', 0),
(11324, 10, 26, 38, '2026-07-07 08:15:00', '2026-07-07 10:45:00', 9000, 'Project delivery – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-07-07', 0),
(11325, 10, 29, 38, '2026-07-08 08:00:00', '2026-07-08 14:00:00', 21600, 'Admin & BAU – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-07-08', 0),
(11326, 10, 26, 38, '2026-07-09 08:30:00', '2026-07-09 11:30:00', 10800, 'Project delivery – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-07-09', 0),
(11327, 10, 28, 38, '2026-07-10 08:00:00', '2026-07-10 10:30:00', 9000, 'Stakeholder engagement – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-07-10', 0),
(11328, 10, 26, 38, '2026-07-14 08:15:00', '2026-07-14 15:15:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-07-14', 0),
(11329, 10, 29, 38, '2026-07-15 08:30:00', '2026-07-15 15:30:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-07-15', 0),
(11330, 10, 29, 38, '2026-07-20 08:30:00', '2026-07-20 11:30:00', 10800, 'Admin & BAU – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-07-20', 0),
(11331, 10, 27, 38, '2026-07-21 08:00:00', '2026-07-21 14:30:00', 23400, 'Governance & reporting – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-07-21', 0),
(11332, 10, 26, 38, '2026-07-22 08:15:00', '2026-07-22 12:15:00', 14400, 'Project delivery – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-07-22', 0),
(11333, 10, 26, 38, '2026-07-23 08:30:00', '2026-07-23 12:00:00', 12600, 'Project delivery – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-07-23', 0),
(11334, 10, 28, 38, '2026-07-27 08:15:00', '2026-07-27 10:45:00', 9000, 'Stakeholder engagement – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-07-27', 0),
(11335, 10, 26, 38, '2026-07-28 08:00:00', '2026-07-28 14:30:00', 23400, 'Project delivery – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-07-28', 0),
(11336, 10, 27, 38, '2026-07-30 08:30:00', '2026-07-30 12:00:00', 12600, 'Governance & reporting – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-07-30', 0),
(11337, 10, 27, 38, '2026-07-31 08:00:00', '2026-07-31 11:00:00', 10800, 'Governance & reporting – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-07-31', 0),
(11338, 10, 27, 38, '2026-08-03 08:00:00', '2026-08-03 15:24:00', 26640, 'Governance & reporting – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-08-03', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(11339, 10, 29, 38, '2026-08-04 08:30:00', '2026-08-04 10:30:00', 7200, 'Admin & BAU – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-08-04', 0),
(11340, 10, 27, 38, '2026-08-07 08:15:00', '2026-08-07 10:45:00', 9000, 'Governance & reporting – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-08-07', 0),
(11341, 10, 26, 38, '2026-08-10 08:30:00', '2026-08-10 12:00:00', 12600, 'Project delivery – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-08-10', 0),
(11342, 10, 28, 38, '2026-08-11 08:30:00', '2026-08-11 12:00:00', 12600, 'Stakeholder engagement – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-08-11', 0),
(11343, 10, 28, 38, '2026-08-12 08:00:00', '2026-08-12 10:00:00', 7200, 'Stakeholder engagement – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-08-12', 0),
(11344, 10, 26, 38, '2026-08-13 08:30:00', '2026-08-13 14:30:00', 21600, 'Project delivery – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-08-13', 0),
(11345, 10, 26, 38, '2026-08-14 08:00:00', '2026-08-14 13:00:00', 18000, 'Project delivery – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-08-14', 0),
(11346, 10, 28, 38, '2026-08-18 08:00:00', '2026-08-18 10:00:00', 7200, 'Stakeholder engagement – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-08-18', 0),
(11347, 10, 29, 38, '2026-08-19 08:15:00', '2026-08-19 14:45:00', 23400, 'Admin & BAU – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-08-19', 0),
(11348, 10, 26, 38, '2026-08-20 08:00:00', '2026-08-20 15:24:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-08-20', 0),
(11349, 10, 29, 38, '2026-08-26 08:30:00', '2026-08-26 12:30:00', 14400, 'Admin & BAU – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-08-26', 0),
(11350, 10, 26, 38, '2026-08-27 08:15:00', '2026-08-27 14:45:00', 23400, 'Project delivery – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-08-27', 0),
(11351, 10, 29, 38, '2026-08-28 08:00:00', '2026-08-28 14:30:00', 23400, 'Admin & BAU – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-08-28', 0),
(11352, 10, 29, 38, '2026-08-31 08:30:00', '2026-08-31 14:30:00', 21600, 'Admin & BAU – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-08-31', 0),
(11353, 10, 27, 38, '2026-09-04 08:30:00', '2026-09-04 13:30:00', 18000, 'Governance & reporting – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-09-04', 0),
(11354, 10, 29, 38, '2026-09-07 08:00:00', '2026-09-07 10:00:00', 7200, 'Admin & BAU – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-09-07', 0),
(11355, 10, 26, 38, '2026-09-08 08:30:00', '2026-09-08 12:00:00', 12600, 'Project delivery – BAU – Place & Housing', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-09-08', 0),
(11356, 10, 26, 38, '2026-09-10 08:15:00', '2026-09-10 15:15:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-09-10', 0),
(11357, 10, 29, 38, '2026-09-11 08:00:00', '2026-09-11 14:30:00', 23400, 'Admin & BAU – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-09-11', 0),
(11358, 10, 26, 38, '2026-09-15 08:30:00', '2026-09-15 15:54:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-09-15', 0),
(11359, 10, 29, 38, '2026-09-17 08:30:00', '2026-09-17 15:00:00', 23400, 'Admin & BAU – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-09-17', 0),
(11360, 10, 27, 38, '2026-09-18 08:15:00', '2026-09-18 12:15:00', 14400, 'Governance & reporting – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-09-18', 0),
(11361, 10, 26, 38, '2026-09-23 08:15:00', '2026-09-23 15:15:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-09-23', 0),
(11362, 10, 26, 38, '2026-09-24 08:15:00', '2026-09-24 15:15:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-09-24', 0),
(11363, 10, 28, 38, '2026-09-25 08:00:00', '2026-09-25 11:00:00', 10800, 'Stakeholder engagement – BAU – Place & Housing', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-09-25', 0),
(11364, 10, 31, 38, '2026-09-28 08:00:00', '2026-09-28 13:00:00', 18000, 'Meetings – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-09-28', 0),
(11365, 10, 26, 38, '2026-09-29 08:15:00', '2026-09-29 14:45:00', 23400, 'Project delivery – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-09-29', 0),
(11366, 10, 26, 38, '2026-09-30 08:30:00', '2026-09-30 15:30:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-09-30', 0),
(11367, 10, 31, 38, '2026-10-06 08:15:00', '2026-10-06 14:45:00', 23400, 'Meetings – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-10-06', 0),
(11368, 10, 28, 38, '2026-10-07 08:15:00', '2026-10-07 15:15:00', 25200, 'Stakeholder engagement – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-10-07', 0),
(11369, 10, 27, 38, '2026-10-08 08:30:00', '2026-10-08 15:00:00', 23400, 'Governance & reporting – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-10-08', 0),
(11370, 10, 26, 38, '2026-10-09 08:00:00', '2026-10-09 13:00:00', 18000, 'Project delivery – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-10-09', 0),
(11371, 10, 31, 38, '2026-10-14 08:15:00', '2026-10-14 15:39:00', 26640, 'Meetings – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-10-14', 0),
(11372, 10, 26, 38, '2026-10-15 08:30:00', '2026-10-15 10:30:00', 7200, 'Project delivery – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-10-15', 0),
(11373, 10, 26, 38, '2026-10-21 08:15:00', '2026-10-21 15:15:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-10-21', 0),
(11374, 10, 26, 38, '2026-10-23 08:30:00', '2026-10-23 15:54:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-10-23', 0),
(11375, 10, 26, 38, '2026-10-26 09:15:00', '2026-10-26 15:15:00', 21600, 'Project delivery – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-10-26', 0),
(11376, 10, 29, 38, '2026-10-27 09:15:00', '2026-10-27 16:15:00', 25200, 'Admin & BAU – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-10-27', 0),
(11377, 10, 26, 38, '2026-10-28 09:15:00', '2026-10-28 15:45:00', 23400, 'Project delivery – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-10-28', 0),
(11378, 10, 26, 38, '2026-10-29 09:15:00', '2026-10-29 13:15:00', 14400, 'Project delivery – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-10-29', 0),
(11379, 10, 26, 38, '2026-10-30 09:30:00', '2026-10-30 13:30:00', 14400, 'Project delivery – BAU – Place & Housing', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-10-30', 0),
(11380, 10, 28, 38, '2026-11-02 09:15:00', '2026-11-02 14:15:00', 18000, 'Stakeholder engagement – BAU – Place & Housing', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-11-02', 0),
(11381, 10, 26, 38, '2026-11-04 09:30:00', '2026-11-04 16:30:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-11-04', 0),
(11382, 10, 26, 38, '2026-11-10 09:15:00', '2026-11-10 15:45:00', 23400, 'Project delivery – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-11-10', 0),
(11383, 10, 26, 38, '2026-11-11 09:00:00', '2026-11-11 16:00:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-11-11', 0),
(11384, 10, 27, 38, '2026-11-12 09:00:00', '2026-11-12 15:30:00', 23400, 'Governance & reporting – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-11-12', 0),
(11385, 10, 29, 38, '2026-11-13 09:30:00', '2026-11-13 16:54:00', 26640, 'Admin & BAU – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-11-13', 0),
(11386, 10, 27, 38, '2026-11-16 09:30:00', '2026-11-16 11:30:00', 7200, 'Governance & reporting – BAU – Place & Housing', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-11-16', 0),
(11387, 10, 26, 38, '2026-11-17 09:00:00', '2026-11-17 16:00:00', 25200, 'Project delivery – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-11-17', 0),
(11388, 10, 26, 38, '2026-11-20 09:00:00', '2026-11-20 11:30:00', 9000, 'Project delivery – BAU – Place & Housing', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-11-20', 0),
(11389, 10, 26, 38, '2026-11-23 09:00:00', '2026-11-23 16:24:00', 26640, 'Project delivery – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-11-23', 0),
(11390, 10, 26, 38, '2026-11-24 09:15:00', '2026-11-24 15:15:00', 21600, 'Project delivery – BAU – Place & Housing', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-11-24', 0),
(11391, 10, 27, 38, '2026-11-25 09:15:00', '2026-11-25 16:39:00', 26640, 'Governance & reporting – BAU – Place & Housing', 310.8, NULL, 42, 0, 'Europe/London', 281.2, 1, 'work', '2026-11-28 10:30:30', '2026-11-25', 0),
(11392, 10, 27, 38, '2026-11-26 09:00:00', '2026-11-26 16:00:00', 25200, 'Governance & reporting – BAU – Place & Housing', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-11-26', 0),
(11393, 10, 29, 38, '2026-11-27 09:00:00', '2026-11-27 15:30:00', 23400, 'Admin & BAU – BAU – Place & Housing', 273, NULL, 42, 0, 'Europe/London', 247, 1, 'work', '2026-11-28 10:30:30', '2026-11-27', 0),
(11394, 9, 29, 39, '2026-02-02 09:15:00', '2026-02-02 14:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-02-02', 0),
(11395, 9, 26, 39, '2026-02-04 09:30:00', '2026-02-04 13:00:00', 12600, 'Project delivery – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-02-04', 0),
(11396, 9, 26, 39, '2026-02-05 09:00:00', '2026-02-05 16:00:00', 25200, 'Project delivery – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-02-05', 0),
(11397, 9, 26, 39, '2026-02-06 09:00:00', '2026-02-06 13:00:00', 14400, 'Project delivery – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-02-06', 0),
(11398, 9, 26, 39, '2026-02-09 09:00:00', '2026-02-09 11:30:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-02-09', 0),
(11399, 9, 27, 39, '2026-02-11 09:00:00', '2026-02-11 15:00:00', 21600, 'Governance & reporting – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-02-11', 0),
(11400, 9, 29, 39, '2026-02-12 09:00:00', '2026-02-12 11:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-02-12', 0),
(11401, 9, 27, 39, '2026-02-13 09:00:00', '2026-02-13 13:00:00', 14400, 'Governance & reporting – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-02-13', 0),
(11402, 9, 31, 39, '2026-02-18 09:30:00', '2026-02-18 11:30:00', 7200, 'Meetings – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-02-18', 0),
(11403, 9, 31, 39, '2026-02-19 09:00:00', '2026-02-19 16:00:00', 25200, 'Meetings – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-02-19', 0),
(11404, 9, 29, 39, '2026-02-25 09:00:00', '2026-02-25 12:00:00', 10800, 'Admin & BAU – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-02-25', 0),
(11405, 9, 26, 39, '2026-02-26 09:00:00', '2026-02-26 11:00:00', 7200, 'Project delivery – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-02-26', 0),
(11406, 9, 31, 39, '2026-03-02 09:00:00', '2026-03-02 12:00:00', 10800, 'Meetings – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-03-02', 0),
(11407, 9, 26, 39, '2026-03-03 09:15:00', '2026-03-03 11:45:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-03-03', 0),
(11408, 9, 29, 39, '2026-03-04 09:30:00', '2026-03-04 13:30:00', 14400, 'Admin & BAU – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-03-04', 0),
(11409, 9, 26, 39, '2026-03-06 09:30:00', '2026-03-06 11:30:00', 7200, 'Project delivery – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-03-06', 0),
(11410, 9, 31, 39, '2026-03-10 09:15:00', '2026-03-10 12:15:00', 10800, 'Meetings – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-03-10', 0),
(11411, 9, 27, 39, '2026-03-12 09:15:00', '2026-03-12 15:15:00', 21600, 'Governance & reporting – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-03-12', 0),
(11412, 9, 26, 39, '2026-03-13 09:15:00', '2026-03-13 11:45:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-03-13', 0),
(11413, 9, 28, 39, '2026-03-17 09:30:00', '2026-03-17 11:30:00', 7200, 'Stakeholder engagement – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-03-17', 0),
(11414, 9, 26, 39, '2026-03-23 09:30:00', '2026-03-23 14:30:00', 18000, 'Project delivery – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-03-23', 0),
(11415, 9, 29, 39, '2026-03-25 09:15:00', '2026-03-25 12:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-03-25', 0),
(11416, 9, 28, 39, '2026-03-26 09:00:00', '2026-03-26 12:00:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-03-26', 0),
(11417, 9, 26, 39, '2026-03-31 08:30:00', '2026-03-31 14:30:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-03-31', 0),
(11418, 9, 26, 39, '2026-04-01 08:30:00', '2026-04-01 12:30:00', 14400, 'Project delivery – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-04-01', 0),
(11419, 9, 26, 39, '2026-04-02 08:30:00', '2026-04-02 11:00:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-04-02', 0),
(11420, 9, 29, 39, '2026-04-03 08:00:00', '2026-04-03 10:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-04-03', 0),
(11421, 9, 28, 39, '2026-04-08 08:00:00', '2026-04-08 15:00:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-08', 0),
(11422, 9, 26, 39, '2026-04-09 08:30:00', '2026-04-09 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-04-09', 0),
(11423, 9, 28, 39, '2026-04-13 08:30:00', '2026-04-13 10:30:00', 7200, 'Stakeholder engagement – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-04-13', 0),
(11424, 9, 26, 39, '2026-04-14 08:00:00', '2026-04-14 10:30:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-04-14', 0),
(11425, 9, 27, 39, '2026-04-16 08:15:00', '2026-04-16 10:15:00', 7200, 'Governance & reporting – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-04-16', 0),
(11426, 9, 31, 39, '2026-04-17 08:30:00', '2026-04-17 13:30:00', 18000, 'Meetings – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-04-17', 0),
(11427, 9, 26, 39, '2026-04-20 08:00:00', '2026-04-20 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-04-20', 0),
(11428, 9, 26, 39, '2026-04-23 08:30:00', '2026-04-23 11:30:00', 10800, 'Project delivery – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-04-23', 0),
(11429, 9, 26, 39, '2026-04-24 08:00:00', '2026-04-24 12:00:00', 14400, 'Project delivery – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-04-24', 0),
(11430, 9, 26, 39, '2026-04-28 08:30:00', '2026-04-28 12:00:00', 12600, 'Project delivery – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-04-28', 0),
(11431, 9, 29, 39, '2026-04-29 08:15:00', '2026-04-29 13:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-04-29', 0),
(11432, 9, 29, 39, '2026-04-30 08:00:00', '2026-04-30 13:00:00', 18000, 'Admin & BAU – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-04-30', 0),
(11433, 9, 27, 39, '2026-05-01 08:15:00', '2026-05-01 12:15:00', 14400, 'Governance & reporting – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-05-01', 0),
(11434, 9, 26, 39, '2026-05-04 08:30:00', '2026-05-04 12:30:00', 14400, 'Project delivery – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-05-04', 0),
(11435, 9, 27, 39, '2026-05-05 08:00:00', '2026-05-05 13:00:00', 18000, 'Governance & reporting – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-05-05', 0),
(11436, 9, 27, 39, '2026-05-07 08:00:00', '2026-05-07 10:30:00', 9000, 'Governance & reporting – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-05-07', 0),
(11437, 9, 30, 39, '2026-05-08 08:15:00', '2026-05-08 14:15:00', 21600, 'Training – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-05-08', 0),
(11438, 9, 29, 39, '2026-05-11 08:00:00', '2026-05-11 12:00:00', 14400, 'Admin & BAU – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-05-11', 0),
(11439, 9, 29, 39, '2026-05-13 08:30:00', '2026-05-13 12:00:00', 12600, 'Admin & BAU – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-05-13', 0),
(11440, 9, 26, 39, '2026-05-15 08:15:00', '2026-05-15 10:45:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-05-15', 0),
(11441, 9, 31, 39, '2026-05-19 08:00:00', '2026-05-19 10:00:00', 7200, 'Meetings – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-05-19', 0),
(11442, 9, 31, 39, '2026-05-20 08:30:00', '2026-05-20 13:30:00', 18000, 'Meetings – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-05-20', 0),
(11443, 9, 28, 39, '2026-05-21 08:00:00', '2026-05-21 15:00:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-05-21', 0),
(11444, 9, 27, 39, '2026-05-22 08:15:00', '2026-05-22 12:15:00', 14400, 'Governance & reporting – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-05-22', 0),
(11445, 9, 26, 39, '2026-05-25 08:00:00', '2026-05-25 11:00:00', 10800, 'Project delivery – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-05-25', 0),
(11446, 9, 27, 39, '2026-05-27 08:30:00', '2026-05-27 13:30:00', 18000, 'Governance & reporting – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-05-27', 0),
(11447, 9, 30, 39, '2026-05-28 08:15:00', '2026-05-28 15:15:00', 25200, 'Training – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-05-28', 0),
(11448, 9, 27, 39, '2026-05-29 08:00:00', '2026-05-29 14:00:00', 21600, 'Governance & reporting – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-05-29', 0),
(11449, 9, 29, 39, '2026-06-01 08:00:00', '2026-06-01 10:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-06-01', 0),
(11450, 9, 26, 39, '2026-06-03 08:15:00', '2026-06-03 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-06-03', 0),
(11451, 9, 26, 39, '2026-06-04 08:15:00', '2026-06-04 10:45:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-06-04', 0),
(11452, 9, 28, 39, '2026-06-05 08:30:00', '2026-06-05 15:30:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-06-05', 0),
(11453, 9, 29, 39, '2026-06-08 08:15:00', '2026-06-08 13:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-06-08', 0),
(11454, 9, 29, 39, '2026-06-09 08:30:00', '2026-06-09 11:00:00', 9000, 'Admin & BAU – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-06-09', 0),
(11455, 9, 29, 39, '2026-06-11 08:00:00', '2026-06-11 10:00:00', 7200, 'Admin & BAU – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-06-11', 0),
(11456, 9, 29, 39, '2026-06-12 08:15:00', '2026-06-12 12:15:00', 14400, 'Admin & BAU – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-06-12', 0),
(11457, 9, 28, 39, '2026-06-15 08:00:00', '2026-06-15 12:00:00', 14400, 'Stakeholder engagement – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-06-15', 0),
(11458, 9, 26, 39, '2026-06-16 08:00:00', '2026-06-16 12:00:00', 14400, 'Project delivery – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-06-16', 0),
(11459, 9, 26, 39, '2026-06-17 08:15:00', '2026-06-17 10:45:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-06-17', 0),
(11460, 9, 29, 39, '2026-06-18 08:00:00', '2026-06-18 11:00:00', 10800, 'Admin & BAU – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-06-18', 0),
(11461, 9, 28, 39, '2026-06-19 08:30:00', '2026-06-19 11:30:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-06-19', 0),
(11462, 9, 26, 39, '2026-06-23 08:30:00', '2026-06-23 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-06-23', 0),
(11463, 9, 28, 39, '2026-06-24 08:30:00', '2026-06-24 11:30:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-06-24', 0),
(11464, 9, 29, 39, '2026-06-25 08:15:00', '2026-06-25 11:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-06-25', 0),
(11465, 9, 29, 39, '2026-06-26 08:15:00', '2026-06-26 10:45:00', 9000, 'Admin & BAU – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-06-26', 0),
(11466, 9, 27, 39, '2026-06-29 08:15:00', '2026-06-29 15:15:00', 25200, 'Governance & reporting – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-06-29', 0),
(11467, 9, 29, 39, '2026-06-30 08:00:00', '2026-06-30 10:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-06-30', 0),
(11468, 9, 30, 39, '2026-07-01 08:00:00', '2026-07-01 12:00:00', 14400, 'Training – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-07-01', 0),
(11469, 9, 26, 39, '2026-07-02 08:00:00', '2026-07-02 13:00:00', 18000, 'Project delivery – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-07-02', 0),
(11470, 9, 26, 39, '2026-07-03 08:15:00', '2026-07-03 14:15:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-07-03', 0),
(11471, 9, 30, 39, '2026-07-06 08:30:00', '2026-07-06 13:30:00', 18000, 'Training – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-07-06', 0),
(11472, 9, 26, 39, '2026-07-07 08:30:00', '2026-07-07 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-07-07', 0),
(11473, 9, 28, 39, '2026-07-08 08:30:00', '2026-07-08 12:00:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-07-08', 0),
(11474, 9, 29, 39, '2026-07-09 08:30:00', '2026-07-09 12:00:00', 12600, 'Admin & BAU – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-07-09', 0),
(11475, 9, 29, 39, '2026-07-10 08:30:00', '2026-07-10 10:30:00', 7200, 'Admin & BAU – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-07-10', 0),
(11476, 9, 29, 39, '2026-07-14 08:15:00', '2026-07-14 15:15:00', 25200, 'Admin & BAU – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-07-14', 0),
(11477, 9, 31, 39, '2026-07-16 08:15:00', '2026-07-16 11:45:00', 12600, 'Meetings – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-07-16', 0),
(11478, 9, 26, 39, '2026-07-17 08:15:00', '2026-07-17 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-07-17', 0),
(11479, 9, 27, 39, '2026-07-20 08:15:00', '2026-07-20 11:15:00', 10800, 'Governance & reporting – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-07-20', 0),
(11480, 9, 26, 39, '2026-07-22 08:00:00', '2026-07-22 11:30:00', 12600, 'Project delivery – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-07-22', 0),
(11481, 9, 27, 39, '2026-07-23 08:00:00', '2026-07-23 14:00:00', 21600, 'Governance & reporting – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-07-23', 0),
(11482, 9, 29, 39, '2026-07-24 08:30:00', '2026-07-24 12:30:00', 14400, 'Admin & BAU – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-07-24', 0),
(11483, 9, 26, 39, '2026-07-27 08:15:00', '2026-07-27 15:15:00', 25200, 'Project delivery – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-07-27', 0),
(11484, 9, 29, 39, '2026-07-28 08:15:00', '2026-07-28 10:15:00', 7200, 'Admin & BAU – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-07-28', 0),
(11485, 9, 26, 39, '2026-07-29 08:15:00', '2026-07-29 14:15:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-07-29', 0),
(11486, 9, 29, 39, '2026-07-31 08:30:00', '2026-07-31 12:30:00', 14400, 'Admin & BAU – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-07-31', 0),
(11487, 9, 28, 39, '2026-08-03 08:00:00', '2026-08-03 10:30:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-08-03', 0),
(11488, 9, 27, 39, '2026-08-04 08:00:00', '2026-08-04 11:30:00', 12600, 'Governance & reporting – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-08-04', 0),
(11489, 9, 26, 39, '2026-08-06 08:30:00', '2026-08-06 12:30:00', 14400, 'Project delivery – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-08-06', 0),
(11490, 9, 27, 39, '2026-08-07 08:15:00', '2026-08-07 15:15:00', 25200, 'Governance & reporting – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-08-07', 0),
(11491, 9, 26, 39, '2026-08-10 08:15:00', '2026-08-10 12:15:00', 14400, 'Project delivery – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-08-10', 0),
(11492, 9, 27, 39, '2026-08-11 08:15:00', '2026-08-11 10:45:00', 9000, 'Governance & reporting – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-08-11', 0),
(11493, 9, 26, 39, '2026-08-12 08:30:00', '2026-08-12 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-08-12', 0),
(11494, 9, 26, 39, '2026-08-13 08:15:00', '2026-08-13 11:45:00', 12600, 'Project delivery – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-08-13', 0),
(11495, 9, 26, 39, '2026-08-17 08:15:00', '2026-08-17 10:15:00', 7200, 'Project delivery – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-08-17', 0),
(11496, 9, 29, 39, '2026-08-18 08:15:00', '2026-08-18 13:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-08-18', 0),
(11497, 9, 26, 39, '2026-08-19 08:15:00', '2026-08-19 13:15:00', 18000, 'Project delivery – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-08-19', 0),
(11498, 9, 31, 39, '2026-08-20 08:30:00', '2026-08-20 15:30:00', 25200, 'Meetings – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-08-20', 0),
(11499, 9, 26, 39, '2026-08-21 08:15:00', '2026-08-21 10:45:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-08-21', 0),
(11500, 9, 26, 39, '2026-08-24 08:00:00', '2026-08-24 10:00:00', 7200, 'Project delivery – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-08-24', 0),
(11501, 9, 26, 39, '2026-08-25 08:30:00', '2026-08-25 11:30:00', 10800, 'Project delivery – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-08-25', 0),
(11502, 9, 28, 39, '2026-08-26 08:15:00', '2026-08-26 13:15:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-08-26', 0),
(11503, 9, 26, 39, '2026-08-28 08:00:00', '2026-08-28 11:00:00', 10800, 'Project delivery – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-08-28', 0),
(11504, 9, 26, 39, '2026-08-31 08:30:00', '2026-08-31 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-08-31', 0),
(11505, 9, 26, 39, '2026-09-03 08:15:00', '2026-09-03 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-09-03', 0),
(11506, 9, 26, 39, '2026-09-07 08:00:00', '2026-09-07 10:30:00', 9000, 'Project delivery – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-09-07', 0),
(11507, 9, 27, 39, '2026-09-08 08:30:00', '2026-09-08 15:30:00', 25200, 'Governance & reporting – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-09-08', 0),
(11508, 9, 26, 39, '2026-09-09 08:00:00', '2026-09-09 14:00:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-09-09', 0),
(11509, 9, 26, 39, '2026-09-10 08:15:00', '2026-09-10 10:15:00', 7200, 'Project delivery – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-09-10', 0),
(11510, 9, 28, 39, '2026-09-11 08:00:00', '2026-09-11 11:00:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-09-11', 0),
(11511, 9, 27, 39, '2026-09-14 08:00:00', '2026-09-14 10:30:00', 9000, 'Governance & reporting – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-09-14', 0),
(11512, 9, 29, 39, '2026-09-15 08:30:00', '2026-09-15 11:30:00', 10800, 'Admin & BAU – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-09-15', 0),
(11513, 9, 29, 39, '2026-09-16 08:00:00', '2026-09-16 15:00:00', 25200, 'Admin & BAU – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-09-16', 0),
(11514, 9, 26, 39, '2026-09-22 08:30:00', '2026-09-22 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-09-22', 0),
(11515, 9, 29, 39, '2026-09-23 08:15:00', '2026-09-23 12:15:00', 14400, 'Admin & BAU – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-09-23', 0),
(11516, 9, 26, 39, '2026-09-24 08:15:00', '2026-09-24 14:15:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-09-24', 0),
(11517, 9, 27, 39, '2026-09-28 08:30:00', '2026-09-28 11:30:00', 10800, 'Governance & reporting – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-09-28', 0),
(11518, 9, 27, 39, '2026-09-29 08:00:00', '2026-09-29 15:00:00', 25200, 'Governance & reporting – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-09-29', 0),
(11519, 9, 28, 39, '2026-09-30 08:15:00', '2026-09-30 14:15:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-09-30', 0),
(11520, 9, 29, 39, '2026-10-01 08:15:00', '2026-10-01 12:15:00', 14400, 'Admin & BAU – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-10-01', 0),
(11521, 9, 27, 39, '2026-10-02 08:30:00', '2026-10-02 11:00:00', 9000, 'Governance & reporting – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-10-02', 0),
(11522, 9, 30, 39, '2026-10-05 08:15:00', '2026-10-05 11:15:00', 10800, 'Training – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-10-05', 0),
(11523, 9, 27, 39, '2026-10-06 08:30:00', '2026-10-06 14:30:00', 21600, 'Governance & reporting – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-10-06', 0),
(11524, 9, 29, 39, '2026-10-09 08:00:00', '2026-10-09 11:30:00', 12600, 'Admin & BAU – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-10-09', 0),
(11525, 9, 31, 39, '2026-10-12 08:30:00', '2026-10-12 11:00:00', 9000, 'Meetings – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-10-12', 0),
(11526, 9, 28, 39, '2026-10-13 08:15:00', '2026-10-13 10:45:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:30', '2026-10-13', 0),
(11527, 9, 28, 39, '2026-10-14 08:30:00', '2026-10-14 10:30:00', 7200, 'Stakeholder engagement – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-10-14', 0),
(11528, 9, 30, 39, '2026-10-15 08:30:00', '2026-10-15 15:30:00', 25200, 'Training – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-10-15', 0),
(11529, 9, 31, 39, '2026-10-16 08:15:00', '2026-10-16 10:15:00', 7200, 'Meetings – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-10-16', 0),
(11530, 9, 30, 39, '2026-10-19 08:15:00', '2026-10-19 13:15:00', 18000, 'Training – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-10-19', 0),
(11531, 9, 26, 39, '2026-10-20 08:00:00', '2026-10-20 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-10-20', 0),
(11532, 9, 26, 39, '2026-10-21 08:30:00', '2026-10-21 12:00:00', 12600, 'Project delivery – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-10-21', 0),
(11533, 9, 27, 39, '2026-10-22 08:00:00', '2026-10-22 12:00:00', 14400, 'Governance & reporting – Mass Transit Programme', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:30', '2026-10-22', 0),
(11534, 9, 30, 39, '2026-10-23 08:00:00', '2026-10-23 11:00:00', 10800, 'Training – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-10-23', 0),
(11535, 9, 26, 39, '2026-10-26 09:30:00', '2026-10-26 12:30:00', 10800, 'Project delivery – Mass Transit Programme', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:30', '2026-10-26', 0),
(11536, 9, 29, 39, '2026-10-30 09:00:00', '2026-10-30 12:30:00', 12600, 'Admin & BAU – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-10-30', 0),
(11537, 9, 26, 39, '2026-11-02 09:30:00', '2026-11-02 14:30:00', 18000, 'Project delivery – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-11-02', 0),
(11538, 9, 26, 39, '2026-11-04 09:00:00', '2026-11-04 15:00:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-11-04', 0),
(11539, 9, 26, 39, '2026-11-05 09:00:00', '2026-11-05 15:00:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-11-05', 0),
(11540, 9, 26, 39, '2026-11-06 09:15:00', '2026-11-06 15:15:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-11-06', 0),
(11541, 9, 29, 39, '2026-11-11 09:15:00', '2026-11-11 15:15:00', 21600, 'Admin & BAU – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-11-11', 0),
(11542, 9, 30, 39, '2026-11-12 09:30:00', '2026-11-12 16:30:00', 25200, 'Training – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-11-12', 0),
(11543, 9, 29, 39, '2026-11-16 09:15:00', '2026-11-16 14:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:30', '2026-11-16', 0),
(11544, 9, 26, 39, '2026-11-17 09:30:00', '2026-11-17 15:30:00', 21600, 'Project delivery – Mass Transit Programme', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:30', '2026-11-17', 0),
(11545, 9, 28, 39, '2026-11-18 09:15:00', '2026-11-18 16:15:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-11-18', 0),
(11546, 9, 27, 39, '2026-11-23 09:15:00', '2026-11-23 11:15:00', 7200, 'Governance & reporting – Mass Transit Programme', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:30', '2026-11-23', 0),
(11547, 9, 27, 39, '2026-11-24 09:15:00', '2026-11-24 12:45:00', 12600, 'Governance & reporting – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-11-24', 0),
(11548, 9, 26, 39, '2026-11-26 09:30:00', '2026-11-26 13:00:00', 12600, 'Project delivery – Mass Transit Programme', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:30', '2026-11-26', 0),
(11549, 9, 26, 39, '2026-11-27 09:15:00', '2026-11-27 16:15:00', 25200, 'Project delivery – Mass Transit Programme', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:30', '2026-11-27', 0),
(11550, 11, 26, 39, '2026-02-02 09:00:00', '2026-02-02 15:00:00', 21600, 'Project delivery – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-02-02', 0),
(11551, 11, 26, 39, '2026-02-03 09:00:00', '2026-02-03 14:00:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-02-03', 0),
(11552, 11, 27, 39, '2026-02-04 09:00:00', '2026-02-04 13:00:00', 14400, 'Governance & reporting – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-02-04', 0),
(11553, 11, 26, 39, '2026-02-05 09:30:00', '2026-02-05 11:30:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-02-05', 0),
(11554, 11, 30, 39, '2026-02-06 09:30:00', '2026-02-06 13:00:00', 12600, 'Training – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-02-06', 0),
(11555, 11, 29, 39, '2026-02-09 09:30:00', '2026-02-09 14:30:00', 18000, 'Admin & BAU – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-02-09', 0),
(11556, 11, 26, 39, '2026-02-10 09:30:00', '2026-02-10 13:30:00', 14400, 'Project delivery – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-02-10', 0),
(11557, 11, 29, 39, '2026-02-11 09:30:00', '2026-02-11 12:30:00', 10800, 'Admin & BAU – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-02-11', 0),
(11558, 11, 26, 39, '2026-02-12 09:15:00', '2026-02-12 12:15:00', 10800, 'Project delivery – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-02-12', 0),
(11559, 11, 26, 39, '2026-02-13 09:15:00', '2026-02-13 16:15:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-02-13', 0),
(11560, 11, 28, 39, '2026-02-16 09:15:00', '2026-02-16 12:15:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-02-16', 0),
(11561, 11, 28, 39, '2026-02-17 09:15:00', '2026-02-17 14:15:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-02-17', 0),
(11562, 11, 30, 39, '2026-02-18 09:30:00', '2026-02-18 13:30:00', 14400, 'Training – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-02-18', 0),
(11563, 11, 28, 39, '2026-02-19 09:00:00', '2026-02-19 12:00:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-02-19', 0),
(11564, 11, 27, 39, '2026-02-23 09:15:00', '2026-02-23 11:45:00', 9000, 'Governance & reporting – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-02-23', 0),
(11565, 11, 29, 39, '2026-02-24 09:30:00', '2026-02-24 13:30:00', 14400, 'Admin & BAU – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-02-24', 0),
(11566, 11, 27, 39, '2026-02-26 09:00:00', '2026-02-26 11:00:00', 7200, 'Governance & reporting – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-02-26', 0),
(11567, 11, 27, 39, '2026-03-03 09:00:00', '2026-03-03 11:00:00', 7200, 'Governance & reporting – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-03-03', 0),
(11568, 11, 27, 39, '2026-03-05 09:00:00', '2026-03-05 12:00:00', 10800, 'Governance & reporting – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-03-05', 0),
(11569, 11, 28, 39, '2026-03-06 09:00:00', '2026-03-06 12:30:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-03-06', 0),
(11570, 11, 26, 39, '2026-03-10 09:30:00', '2026-03-10 14:30:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-03-10', 0),
(11571, 11, 26, 39, '2026-03-11 09:30:00', '2026-03-11 12:00:00', 9000, 'Project delivery – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-03-11', 0),
(11572, 11, 27, 39, '2026-03-12 09:00:00', '2026-03-12 14:00:00', 18000, 'Governance & reporting – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-03-12', 0),
(11573, 11, 26, 39, '2026-03-13 09:00:00', '2026-03-13 12:30:00', 12600, 'Project delivery – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-03-13', 0),
(11574, 11, 26, 39, '2026-03-16 09:30:00', '2026-03-16 11:30:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-03-16', 0),
(11575, 11, 28, 39, '2026-03-17 09:15:00', '2026-03-17 12:15:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-03-17', 0),
(11576, 11, 27, 39, '2026-03-18 09:15:00', '2026-03-18 13:15:00', 14400, 'Governance & reporting – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-03-18', 0),
(11577, 11, 29, 39, '2026-03-19 09:00:00', '2026-03-19 15:00:00', 21600, 'Admin & BAU – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-03-19', 0),
(11578, 11, 28, 39, '2026-03-20 09:15:00', '2026-03-20 12:45:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-03-20', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(11579, 11, 26, 39, '2026-03-23 09:00:00', '2026-03-23 14:00:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-03-23', 0),
(11580, 11, 29, 39, '2026-03-24 09:00:00', '2026-03-24 15:00:00', 21600, 'Admin & BAU – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-03-24', 0),
(11581, 11, 27, 39, '2026-03-26 09:00:00', '2026-03-26 12:00:00', 10800, 'Governance & reporting – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-03-26', 0),
(11582, 11, 26, 39, '2026-03-31 08:15:00', '2026-03-31 15:15:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-03-31', 0),
(11583, 11, 27, 39, '2026-04-02 08:15:00', '2026-04-02 10:45:00', 9000, 'Governance & reporting – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-04-02', 0),
(11584, 11, 26, 39, '2026-04-03 08:30:00', '2026-04-03 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-04-03', 0),
(11585, 11, 26, 39, '2026-04-07 08:30:00', '2026-04-07 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-04-07', 0),
(11586, 11, 29, 39, '2026-04-08 08:15:00', '2026-04-08 11:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-04-08', 0),
(11587, 11, 27, 39, '2026-04-09 08:15:00', '2026-04-09 14:15:00', 21600, 'Governance & reporting – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-04-09', 0),
(11588, 11, 26, 39, '2026-04-13 08:15:00', '2026-04-13 15:15:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-04-13', 0),
(11589, 11, 29, 39, '2026-04-14 08:15:00', '2026-04-14 13:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-04-14', 0),
(11590, 11, 29, 39, '2026-04-16 08:30:00', '2026-04-16 14:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-04-16', 0),
(11591, 11, 26, 39, '2026-04-17 08:00:00', '2026-04-17 11:00:00', 10800, 'Project delivery – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-04-17', 0),
(11592, 11, 27, 39, '2026-04-20 08:15:00', '2026-04-20 11:15:00', 10800, 'Governance & reporting – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-04-20', 0),
(11593, 11, 29, 39, '2026-04-21 08:15:00', '2026-04-21 11:15:00', 10800, 'Admin & BAU – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-04-21', 0),
(11594, 11, 29, 39, '2026-04-22 08:00:00', '2026-04-22 11:00:00', 10800, 'Admin & BAU – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-04-22', 0),
(11595, 11, 26, 39, '2026-04-23 08:15:00', '2026-04-23 13:15:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-04-23', 0),
(11596, 11, 26, 39, '2026-04-27 08:30:00', '2026-04-27 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-04-27', 0),
(11597, 11, 29, 39, '2026-04-28 08:00:00', '2026-04-28 13:00:00', 18000, 'Admin & BAU – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-04-28', 0),
(11598, 11, 28, 39, '2026-04-29 08:00:00', '2026-04-29 15:00:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-04-29', 0),
(11599, 11, 29, 39, '2026-04-30 08:30:00', '2026-04-30 14:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-04-30', 0),
(11600, 11, 26, 39, '2026-05-01 08:15:00', '2026-05-01 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-05-01', 0),
(11601, 11, 26, 39, '2026-05-05 08:30:00', '2026-05-05 11:00:00', 9000, 'Project delivery – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-05-05', 0),
(11602, 11, 28, 39, '2026-05-06 08:00:00', '2026-05-06 15:00:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-05-06', 0),
(11603, 11, 27, 39, '2026-05-07 08:15:00', '2026-05-07 11:45:00', 12600, 'Governance & reporting – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-05-07', 0),
(11604, 11, 27, 39, '2026-05-08 08:00:00', '2026-05-08 13:00:00', 18000, 'Governance & reporting – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-05-08', 0),
(11605, 11, 29, 39, '2026-05-11 08:00:00', '2026-05-11 12:00:00', 14400, 'Admin & BAU – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-05-11', 0),
(11606, 11, 26, 39, '2026-05-12 08:15:00', '2026-05-12 15:15:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-05-12', 0),
(11607, 11, 26, 39, '2026-05-13 08:30:00', '2026-05-13 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-05-13', 0),
(11608, 11, 29, 39, '2026-05-14 08:15:00', '2026-05-14 11:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-05-14', 0),
(11609, 11, 29, 39, '2026-05-18 08:15:00', '2026-05-18 11:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-05-18', 0),
(11610, 11, 26, 39, '2026-05-20 08:15:00', '2026-05-20 11:45:00', 12600, 'Project delivery – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-05-20', 0),
(11611, 11, 26, 39, '2026-05-25 08:00:00', '2026-05-25 14:00:00', 21600, 'Project delivery – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-05-25', 0),
(11612, 11, 26, 39, '2026-05-26 08:15:00', '2026-05-26 11:45:00', 12600, 'Project delivery – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-05-26', 0),
(11613, 11, 26, 39, '2026-05-28 08:30:00', '2026-05-28 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-05-28', 0),
(11614, 11, 29, 39, '2026-06-02 08:30:00', '2026-06-02 13:30:00', 18000, 'Admin & BAU – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-06-02', 0),
(11615, 11, 28, 39, '2026-06-04 08:00:00', '2026-06-04 11:00:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-06-04', 0),
(11616, 11, 26, 39, '2026-06-05 08:30:00', '2026-06-05 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-06-05', 0),
(11617, 11, 31, 39, '2026-06-09 08:30:00', '2026-06-09 11:00:00', 9000, 'Meetings – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-06-09', 0),
(11618, 11, 28, 39, '2026-06-10 08:30:00', '2026-06-10 11:00:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-06-10', 0),
(11619, 11, 26, 39, '2026-06-12 08:15:00', '2026-06-12 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-06-12', 0),
(11620, 11, 27, 39, '2026-06-15 08:30:00', '2026-06-15 12:30:00', 14400, 'Governance & reporting – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-06-15', 0),
(11621, 11, 27, 39, '2026-06-16 08:00:00', '2026-06-16 10:30:00', 9000, 'Governance & reporting – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-06-16', 0),
(11622, 11, 27, 39, '2026-06-17 08:15:00', '2026-06-17 11:45:00', 12600, 'Governance & reporting – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-06-17', 0),
(11623, 11, 29, 39, '2026-06-19 08:15:00', '2026-06-19 11:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-06-19', 0),
(11624, 11, 26, 39, '2026-06-22 08:30:00', '2026-06-22 11:30:00', 10800, 'Project delivery – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-06-22', 0),
(11625, 11, 26, 39, '2026-06-25 08:30:00', '2026-06-25 12:00:00', 12600, 'Project delivery – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-06-25', 0),
(11626, 11, 30, 39, '2026-06-26 08:15:00', '2026-06-26 11:15:00', 10800, 'Training – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-06-26', 0),
(11627, 11, 26, 39, '2026-06-30 08:30:00', '2026-06-30 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-06-30', 0),
(11628, 11, 26, 39, '2026-07-01 08:00:00', '2026-07-01 10:00:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-07-01', 0),
(11629, 11, 29, 39, '2026-07-03 08:00:00', '2026-07-03 10:00:00', 7200, 'Admin & BAU – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-07-03', 0),
(11630, 11, 29, 39, '2026-07-07 08:00:00', '2026-07-07 10:00:00', 7200, 'Admin & BAU – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-07-07', 0),
(11631, 11, 30, 39, '2026-07-09 08:30:00', '2026-07-09 11:00:00', 9000, 'Training – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-07-09', 0),
(11632, 11, 27, 39, '2026-07-13 08:30:00', '2026-07-13 14:30:00', 21600, 'Governance & reporting – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-07-13', 0),
(11633, 11, 27, 39, '2026-07-14 08:00:00', '2026-07-14 15:00:00', 25200, 'Governance & reporting – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-07-14', 0),
(11634, 11, 29, 39, '2026-07-15 08:30:00', '2026-07-15 10:30:00', 7200, 'Admin & BAU – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-07-15', 0),
(11635, 11, 27, 39, '2026-07-17 08:00:00', '2026-07-17 12:00:00', 14400, 'Governance & reporting – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-07-17', 0),
(11636, 11, 26, 39, '2026-07-20 08:30:00', '2026-07-20 14:30:00', 21600, 'Project delivery – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-07-20', 0),
(11637, 11, 29, 39, '2026-07-21 08:30:00', '2026-07-21 14:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-07-21', 0),
(11638, 11, 31, 39, '2026-07-22 08:00:00', '2026-07-22 11:30:00', 12600, 'Meetings – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-07-22', 0),
(11639, 11, 26, 39, '2026-07-23 08:00:00', '2026-07-23 11:00:00', 10800, 'Project delivery – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-07-23', 0),
(11640, 11, 28, 39, '2026-07-27 08:15:00', '2026-07-27 15:15:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-07-27', 0),
(11641, 11, 26, 39, '2026-07-29 08:00:00', '2026-07-29 11:30:00', 12600, 'Project delivery – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-07-29', 0),
(11642, 11, 28, 39, '2026-07-30 08:15:00', '2026-07-30 13:15:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-07-30', 0),
(11643, 11, 26, 39, '2026-08-03 08:30:00', '2026-08-03 11:00:00', 9000, 'Project delivery – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-08-03', 0),
(11644, 11, 26, 39, '2026-08-05 08:00:00', '2026-08-05 10:00:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-08-05', 0),
(11645, 11, 29, 39, '2026-08-06 08:15:00', '2026-08-06 13:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-08-06', 0),
(11646, 11, 26, 39, '2026-08-11 08:15:00', '2026-08-11 11:45:00', 12600, 'Project delivery – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-08-11', 0),
(11647, 11, 28, 39, '2026-08-12 08:15:00', '2026-08-12 14:15:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-08-12', 0),
(11648, 11, 26, 39, '2026-08-14 08:30:00', '2026-08-14 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-08-14', 0),
(11649, 11, 26, 39, '2026-08-17 08:30:00', '2026-08-17 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-08-17', 0),
(11650, 11, 26, 39, '2026-08-18 08:30:00', '2026-08-18 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-08-18', 0),
(11651, 11, 26, 39, '2026-08-20 08:15:00', '2026-08-20 10:15:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-08-20', 0),
(11652, 11, 29, 39, '2026-08-21 08:00:00', '2026-08-21 13:00:00', 18000, 'Admin & BAU – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-08-21', 0),
(11653, 11, 30, 39, '2026-08-24 08:15:00', '2026-08-24 15:15:00', 25200, 'Training – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-08-24', 0),
(11654, 11, 26, 39, '2026-08-25 08:30:00', '2026-08-25 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-08-25', 0),
(11655, 11, 26, 39, '2026-08-26 08:30:00', '2026-08-26 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-08-26', 0),
(11656, 11, 30, 39, '2026-08-27 08:00:00', '2026-08-27 13:00:00', 18000, 'Training – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-08-27', 0),
(11657, 11, 29, 39, '2026-08-28 08:30:00', '2026-08-28 11:00:00', 9000, 'Admin & BAU – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-08-28', 0),
(11658, 11, 27, 39, '2026-09-01 08:00:00', '2026-09-01 13:00:00', 18000, 'Governance & reporting – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-09-01', 0),
(11659, 11, 27, 39, '2026-09-02 08:15:00', '2026-09-02 15:15:00', 25200, 'Governance & reporting – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-09-02', 0),
(11660, 11, 26, 39, '2026-09-03 08:30:00', '2026-09-03 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-09-03', 0),
(11661, 11, 28, 39, '2026-09-04 08:30:00', '2026-09-04 13:30:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-09-04', 0),
(11662, 11, 26, 39, '2026-09-08 08:00:00', '2026-09-08 11:30:00', 12600, 'Project delivery – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-09-08', 0),
(11663, 11, 26, 39, '2026-09-10 08:00:00', '2026-09-10 10:30:00', 9000, 'Project delivery – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-09-10', 0),
(11664, 11, 28, 39, '2026-09-11 08:30:00', '2026-09-11 11:30:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-09-11', 0),
(11665, 11, 26, 39, '2026-09-16 08:15:00', '2026-09-16 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-09-16', 0),
(11666, 11, 28, 39, '2026-09-18 08:30:00', '2026-09-18 15:30:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-09-18', 0),
(11667, 11, 27, 39, '2026-09-22 08:00:00', '2026-09-22 10:30:00', 9000, 'Governance & reporting – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-09-22', 0),
(11668, 11, 26, 39, '2026-09-24 08:15:00', '2026-09-24 13:15:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-09-24', 0),
(11669, 11, 29, 39, '2026-09-25 08:30:00', '2026-09-25 12:00:00', 12600, 'Admin & BAU – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-09-25', 0),
(11670, 11, 29, 39, '2026-09-29 08:15:00', '2026-09-29 12:15:00', 14400, 'Admin & BAU – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-09-29', 0),
(11671, 11, 29, 39, '2026-09-30 08:30:00', '2026-09-30 14:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-09-30', 0),
(11672, 11, 28, 39, '2026-10-01 08:00:00', '2026-10-01 14:00:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-10-01', 0),
(11673, 11, 26, 39, '2026-10-06 08:15:00', '2026-10-06 13:15:00', 18000, 'Project delivery – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-10-06', 0),
(11674, 11, 28, 39, '2026-10-07 08:00:00', '2026-10-07 13:00:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-10-07', 0),
(11675, 11, 26, 39, '2026-10-09 08:30:00', '2026-10-09 14:30:00', 21600, 'Project delivery – Mass Transit Programme', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:30', '2026-10-09', 0),
(11676, 11, 28, 39, '2026-10-13 08:15:00', '2026-10-13 11:15:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-10-13', 0),
(11677, 11, 29, 39, '2026-10-15 08:30:00', '2026-10-15 11:00:00', 9000, 'Admin & BAU – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-10-15', 0),
(11678, 11, 27, 39, '2026-10-16 08:30:00', '2026-10-16 15:30:00', 25200, 'Governance & reporting – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-10-16', 0),
(11679, 11, 29, 39, '2026-10-19 08:30:00', '2026-10-19 12:00:00', 12600, 'Admin & BAU – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-10-19', 0),
(11680, 11, 27, 39, '2026-10-21 08:15:00', '2026-10-21 12:15:00', 14400, 'Governance & reporting – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-10-21', 0),
(11681, 11, 28, 39, '2026-10-22 08:15:00', '2026-10-22 11:45:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-10-22', 0),
(11682, 11, 29, 39, '2026-10-23 08:15:00', '2026-10-23 15:15:00', 25200, 'Admin & BAU – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-10-23', 0),
(11683, 11, 29, 39, '2026-10-26 09:00:00', '2026-10-26 16:00:00', 25200, 'Admin & BAU – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-10-26', 0),
(11684, 11, 26, 39, '2026-10-28 09:00:00', '2026-10-28 13:00:00', 14400, 'Project delivery – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-10-28', 0),
(11685, 11, 29, 39, '2026-10-29 09:00:00', '2026-10-29 14:00:00', 18000, 'Admin & BAU – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-10-29', 0),
(11686, 11, 29, 39, '2026-10-30 09:30:00', '2026-10-30 16:30:00', 25200, 'Admin & BAU – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-10-30', 0),
(11687, 11, 26, 39, '2026-11-02 09:30:00', '2026-11-02 13:30:00', 14400, 'Project delivery – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-11-02', 0),
(11688, 11, 26, 39, '2026-11-03 09:00:00', '2026-11-03 16:00:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-11-03', 0),
(11689, 11, 31, 39, '2026-11-05 09:30:00', '2026-11-05 12:00:00', 9000, 'Meetings – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-11-05', 0),
(11690, 11, 26, 39, '2026-11-06 09:00:00', '2026-11-06 11:00:00', 7200, 'Project delivery – Mass Transit Programme', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:30', '2026-11-06', 0),
(11691, 11, 26, 39, '2026-11-09 09:00:00', '2026-11-09 13:00:00', 14400, 'Project delivery – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-11-09', 0),
(11692, 11, 28, 39, '2026-11-12 09:30:00', '2026-11-12 12:00:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-11-12', 0),
(11693, 11, 26, 39, '2026-11-13 09:15:00', '2026-11-13 12:15:00', 10800, 'Project delivery – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-11-13', 0),
(11694, 11, 29, 39, '2026-11-18 09:00:00', '2026-11-18 11:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:30', '2026-11-18', 0),
(11695, 11, 28, 39, '2026-11-19 09:30:00', '2026-11-19 14:30:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:30', '2026-11-19', 0),
(11696, 11, 26, 39, '2026-11-23 09:00:00', '2026-11-23 13:00:00', 14400, 'Project delivery – Mass Transit Programme', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:30', '2026-11-23', 0),
(11697, 11, 26, 39, '2026-11-24 09:30:00', '2026-11-24 13:00:00', 12600, 'Project delivery – Mass Transit Programme', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:30', '2026-11-24', 0),
(11698, 11, 31, 39, '2026-11-26 09:15:00', '2026-11-26 12:15:00', 10800, 'Meetings – Mass Transit Programme', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:30', '2026-11-26', 0),
(11699, 11, 26, 39, '2026-11-27 09:00:00', '2026-11-27 16:00:00', 25200, 'Project delivery – Mass Transit Programme', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:30', '2026-11-27', 0),
(11700, 12, 27, 39, '2026-02-02 09:30:00', '2026-02-02 12:30:00', 10800, 'Governance & reporting – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-02-02', 0),
(11701, 12, 26, 39, '2026-02-03 09:30:00', '2026-02-03 12:30:00', 10800, 'Project delivery – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-02-03', 0),
(11702, 12, 26, 39, '2026-02-04 09:30:00', '2026-02-04 12:00:00', 9000, 'Project delivery – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-02-04', 0),
(11703, 12, 27, 39, '2026-02-05 09:00:00', '2026-02-05 15:00:00', 21600, 'Governance & reporting – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-02-05', 0),
(11704, 12, 29, 39, '2026-02-06 09:30:00', '2026-02-06 16:30:00', 25200, 'Admin & BAU – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-02-06', 0),
(11705, 12, 28, 39, '2026-02-11 09:30:00', '2026-02-11 14:30:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:30', '2026-02-11', 0),
(11706, 12, 29, 39, '2026-02-12 09:15:00', '2026-02-12 16:15:00', 25200, 'Admin & BAU – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-02-12', 0),
(11707, 12, 26, 39, '2026-02-13 09:30:00', '2026-02-13 16:30:00', 25200, 'Project delivery – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-02-13', 0),
(11708, 12, 28, 39, '2026-02-16 09:00:00', '2026-02-16 12:30:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-02-16', 0),
(11709, 12, 27, 39, '2026-02-18 09:00:00', '2026-02-18 11:00:00', 7200, 'Governance & reporting – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:30', '2026-02-18', 0),
(11710, 12, 28, 39, '2026-02-20 09:30:00', '2026-02-20 13:00:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-02-20', 0),
(11711, 12, 27, 39, '2026-02-24 09:00:00', '2026-02-24 12:00:00', 10800, 'Governance & reporting – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-02-24', 0),
(11712, 12, 31, 39, '2026-02-25 09:00:00', '2026-02-25 11:30:00', 9000, 'Meetings – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-02-25', 0),
(11713, 12, 29, 39, '2026-02-26 09:00:00', '2026-02-26 15:00:00', 21600, 'Admin & BAU – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-02-26', 0),
(11714, 12, 29, 39, '2026-02-27 09:30:00', '2026-02-27 12:30:00', 10800, 'Admin & BAU – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-02-27', 0),
(11715, 12, 28, 39, '2026-03-02 09:00:00', '2026-03-02 12:00:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-03-02', 0),
(11716, 12, 26, 39, '2026-03-03 09:30:00', '2026-03-03 12:30:00', 10800, 'Project delivery – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-03-03', 0),
(11717, 12, 28, 39, '2026-03-04 09:15:00', '2026-03-04 13:15:00', 14400, 'Stakeholder engagement – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-03-04', 0),
(11718, 12, 26, 39, '2026-03-05 09:30:00', '2026-03-05 14:30:00', 18000, 'Project delivery – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:30', '2026-03-05', 0),
(11719, 12, 27, 39, '2026-03-06 09:30:00', '2026-03-06 15:30:00', 21600, 'Governance & reporting – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-03-06', 0),
(11720, 12, 26, 39, '2026-03-09 09:30:00', '2026-03-09 15:30:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-03-09', 0),
(11721, 12, 26, 39, '2026-03-10 09:30:00', '2026-03-10 15:30:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-03-10', 0),
(11722, 12, 27, 39, '2026-03-11 09:00:00', '2026-03-11 15:00:00', 21600, 'Governance & reporting – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-03-11', 0),
(11723, 12, 26, 39, '2026-03-12 09:15:00', '2026-03-12 13:15:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-03-12', 0),
(11724, 12, 26, 39, '2026-03-13 09:15:00', '2026-03-13 13:15:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-03-13', 0),
(11725, 12, 29, 39, '2026-03-16 09:30:00', '2026-03-16 15:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-03-16', 0),
(11726, 12, 28, 39, '2026-03-17 09:30:00', '2026-03-17 12:00:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-03-17', 0),
(11727, 12, 27, 39, '2026-03-19 09:00:00', '2026-03-19 11:30:00', 9000, 'Governance & reporting – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-03-19', 0),
(11728, 12, 28, 39, '2026-03-24 09:15:00', '2026-03-24 13:15:00', 14400, 'Stakeholder engagement – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-03-24', 0),
(11729, 12, 26, 39, '2026-03-25 09:30:00', '2026-03-25 12:00:00', 9000, 'Project delivery – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-03-25', 0),
(11730, 12, 27, 39, '2026-03-26 09:30:00', '2026-03-26 15:30:00', 21600, 'Governance & reporting – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-03-26', 0),
(11731, 12, 26, 39, '2026-03-30 08:15:00', '2026-03-30 14:15:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-03-30', 0),
(11732, 12, 26, 39, '2026-03-31 08:15:00', '2026-03-31 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-03-31', 0),
(11733, 12, 28, 39, '2026-04-03 08:30:00', '2026-04-03 14:30:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-04-03', 0),
(11734, 12, 26, 39, '2026-04-07 08:00:00', '2026-04-07 14:00:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-04-07', 0),
(11735, 12, 26, 39, '2026-04-08 08:15:00', '2026-04-08 13:15:00', 18000, 'Project delivery – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:30', '2026-04-08', 0),
(11736, 12, 28, 39, '2026-04-09 08:00:00', '2026-04-09 11:00:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-04-09', 0),
(11737, 12, 28, 39, '2026-04-10 08:30:00', '2026-04-10 11:00:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-04-10', 0),
(11738, 12, 26, 39, '2026-04-14 08:30:00', '2026-04-14 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-04-14', 0),
(11739, 12, 26, 39, '2026-04-15 08:00:00', '2026-04-15 12:00:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-04-15', 0),
(11740, 12, 26, 39, '2026-04-16 08:15:00', '2026-04-16 12:15:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-04-16', 0),
(11741, 12, 27, 39, '2026-04-17 08:30:00', '2026-04-17 12:30:00', 14400, 'Governance & reporting – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-04-17', 0),
(11742, 12, 27, 39, '2026-04-21 08:00:00', '2026-04-21 14:00:00', 21600, 'Governance & reporting – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-04-21', 0),
(11743, 12, 27, 39, '2026-04-23 08:30:00', '2026-04-23 14:30:00', 21600, 'Governance & reporting – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-04-23', 0),
(11744, 12, 26, 39, '2026-04-28 08:00:00', '2026-04-28 14:00:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-04-28', 0),
(11745, 12, 29, 39, '2026-04-29 08:15:00', '2026-04-29 15:15:00', 25200, 'Admin & BAU – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-04-29', 0),
(11746, 12, 26, 39, '2026-05-01 08:15:00', '2026-05-01 15:15:00', 25200, 'Project delivery – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-05-01', 0),
(11747, 12, 26, 39, '2026-05-04 08:15:00', '2026-05-04 14:15:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-05-04', 0),
(11748, 12, 26, 39, '2026-05-05 08:30:00', '2026-05-05 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-05-05', 0),
(11749, 12, 31, 39, '2026-05-07 08:15:00', '2026-05-07 15:15:00', 25200, 'Meetings – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-05-07', 0),
(11750, 12, 26, 39, '2026-05-08 08:00:00', '2026-05-08 13:00:00', 18000, 'Project delivery – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:30', '2026-05-08', 0),
(11751, 12, 27, 39, '2026-05-11 08:00:00', '2026-05-11 12:00:00', 14400, 'Governance & reporting – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-05-11', 0),
(11752, 12, 27, 39, '2026-05-13 08:00:00', '2026-05-13 14:00:00', 21600, 'Governance & reporting – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-05-13', 0),
(11753, 12, 26, 39, '2026-05-14 08:00:00', '2026-05-14 10:30:00', 9000, 'Project delivery – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-05-14', 0),
(11754, 12, 27, 39, '2026-05-15 08:15:00', '2026-05-15 11:45:00', 12600, 'Governance & reporting – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-05-15', 0),
(11755, 12, 26, 39, '2026-05-20 08:15:00', '2026-05-20 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-05-20', 0),
(11756, 12, 26, 39, '2026-05-26 08:15:00', '2026-05-26 11:45:00', 12600, 'Project delivery – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-05-26', 0),
(11757, 12, 26, 39, '2026-05-28 08:30:00', '2026-05-28 12:30:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-05-28', 0),
(11758, 12, 29, 39, '2026-05-29 08:15:00', '2026-05-29 10:15:00', 7200, 'Admin & BAU – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:30', '2026-05-29', 0),
(11759, 12, 26, 39, '2026-06-01 08:00:00', '2026-06-01 14:00:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-06-01', 0),
(11760, 12, 27, 39, '2026-06-02 08:30:00', '2026-06-02 15:30:00', 25200, 'Governance & reporting – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-06-02', 0),
(11761, 12, 26, 39, '2026-06-05 08:15:00', '2026-06-05 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-06-05', 0),
(11762, 12, 28, 39, '2026-06-08 08:30:00', '2026-06-08 14:30:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-06-08', 0),
(11763, 12, 29, 39, '2026-06-09 08:15:00', '2026-06-09 15:15:00', 25200, 'Admin & BAU – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-06-09', 0),
(11764, 12, 29, 39, '2026-06-11 08:15:00', '2026-06-11 10:45:00', 9000, 'Admin & BAU – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-06-11', 0),
(11765, 12, 27, 39, '2026-06-16 08:30:00', '2026-06-16 10:30:00', 7200, 'Governance & reporting – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:30', '2026-06-16', 0),
(11766, 12, 28, 39, '2026-06-17 08:30:00', '2026-06-17 12:00:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-06-17', 0),
(11767, 12, 26, 39, '2026-06-18 08:30:00', '2026-06-18 11:30:00', 10800, 'Project delivery – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-06-18', 0),
(11768, 12, 29, 39, '2026-06-19 08:30:00', '2026-06-19 15:30:00', 25200, 'Admin & BAU – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-06-19', 0),
(11769, 12, 26, 39, '2026-06-22 08:30:00', '2026-06-22 12:00:00', 12600, 'Project delivery – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-06-22', 0),
(11770, 12, 26, 39, '2026-06-23 08:00:00', '2026-06-23 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-06-23', 0),
(11771, 12, 26, 39, '2026-06-24 08:15:00', '2026-06-24 14:15:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-06-24', 0),
(11772, 12, 31, 39, '2026-06-26 08:30:00', '2026-06-26 12:30:00', 14400, 'Meetings – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-06-26', 0),
(11773, 12, 26, 39, '2026-07-01 08:15:00', '2026-07-01 10:15:00', 7200, 'Project delivery – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:30', '2026-07-01', 0),
(11774, 12, 26, 39, '2026-07-02 08:00:00', '2026-07-02 11:30:00', 12600, 'Project delivery – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-07-02', 0),
(11775, 12, 26, 39, '2026-07-03 08:15:00', '2026-07-03 13:15:00', 18000, 'Project delivery – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:30', '2026-07-03', 0),
(11776, 12, 29, 39, '2026-07-06 08:30:00', '2026-07-06 11:00:00', 9000, 'Admin & BAU – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-07-06', 0),
(11777, 12, 27, 39, '2026-07-07 08:15:00', '2026-07-07 11:45:00', 12600, 'Governance & reporting – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-07-07', 0),
(11778, 12, 26, 39, '2026-07-09 08:30:00', '2026-07-09 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:30', '2026-07-09', 0),
(11779, 12, 27, 39, '2026-07-13 08:30:00', '2026-07-13 12:00:00', 12600, 'Governance & reporting – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-07-13', 0),
(11780, 12, 29, 39, '2026-07-15 08:15:00', '2026-07-15 12:15:00', 14400, 'Admin & BAU – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-07-15', 0),
(11781, 12, 27, 39, '2026-07-16 08:30:00', '2026-07-16 12:30:00', 14400, 'Governance & reporting – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-07-16', 0),
(11782, 12, 27, 39, '2026-07-17 08:00:00', '2026-07-17 15:00:00', 25200, 'Governance & reporting – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-07-17', 0),
(11783, 12, 26, 39, '2026-07-20 08:00:00', '2026-07-20 10:30:00', 9000, 'Project delivery – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-07-20', 0),
(11784, 12, 26, 39, '2026-07-21 08:00:00', '2026-07-21 12:00:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-07-21', 0),
(11785, 12, 27, 39, '2026-07-22 08:00:00', '2026-07-22 15:00:00', 25200, 'Governance & reporting – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-07-22', 0),
(11786, 12, 26, 39, '2026-07-24 08:15:00', '2026-07-24 11:45:00', 12600, 'Project delivery – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-07-24', 0),
(11787, 12, 29, 39, '2026-07-29 08:30:00', '2026-07-29 12:30:00', 14400, 'Admin & BAU – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-07-29', 0),
(11788, 12, 28, 39, '2026-07-30 08:30:00', '2026-07-30 14:30:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-07-30', 0),
(11789, 12, 26, 39, '2026-07-31 08:00:00', '2026-07-31 13:00:00', 18000, 'Project delivery – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:30', '2026-07-31', 0),
(11790, 12, 26, 39, '2026-08-03 08:00:00', '2026-08-03 10:30:00', 9000, 'Project delivery – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-08-03', 0),
(11791, 12, 26, 39, '2026-08-04 08:15:00', '2026-08-04 12:15:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-08-04', 0),
(11792, 12, 26, 39, '2026-08-06 08:15:00', '2026-08-06 14:15:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-08-06', 0),
(11793, 12, 26, 39, '2026-08-07 08:30:00', '2026-08-07 11:30:00', 10800, 'Project delivery – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-08-07', 0),
(11794, 12, 26, 39, '2026-08-11 08:15:00', '2026-08-11 10:45:00', 9000, 'Project delivery – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-08-11', 0),
(11795, 12, 26, 39, '2026-08-12 08:30:00', '2026-08-12 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-08-12', 0),
(11796, 12, 26, 39, '2026-08-13 08:00:00', '2026-08-13 14:00:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-08-13', 0),
(11797, 12, 29, 39, '2026-08-14 08:15:00', '2026-08-14 14:15:00', 21600, 'Admin & BAU – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-08-14', 0),
(11798, 12, 28, 39, '2026-08-17 08:00:00', '2026-08-17 11:00:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-08-17', 0),
(11799, 12, 26, 39, '2026-08-18 08:30:00', '2026-08-18 11:30:00', 10800, 'Project delivery – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-08-18', 0),
(11800, 12, 26, 39, '2026-08-19 08:00:00', '2026-08-19 11:30:00', 12600, 'Project delivery – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-08-19', 0),
(11801, 12, 27, 39, '2026-08-21 08:30:00', '2026-08-21 11:30:00', 10800, 'Governance & reporting – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:30', '2026-08-21', 0),
(11802, 12, 29, 39, '2026-08-24 08:00:00', '2026-08-24 10:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-08-24', 0),
(11803, 12, 31, 39, '2026-08-25 08:30:00', '2026-08-25 13:30:00', 18000, 'Meetings – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:30', '2026-08-25', 0),
(11804, 12, 27, 39, '2026-08-26 08:00:00', '2026-08-26 11:30:00', 12600, 'Governance & reporting – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-08-26', 0),
(11805, 12, 26, 39, '2026-08-27 08:30:00', '2026-08-27 11:00:00', 9000, 'Project delivery – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-08-27', 0),
(11806, 12, 29, 39, '2026-08-28 08:00:00', '2026-08-28 10:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:30', '2026-08-28', 0),
(11807, 12, 31, 39, '2026-08-31 08:00:00', '2026-08-31 14:00:00', 21600, 'Meetings – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:30', '2026-08-31', 0),
(11808, 12, 31, 39, '2026-09-01 08:15:00', '2026-09-01 12:15:00', 14400, 'Meetings – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-09-01', 0),
(11809, 12, 27, 39, '2026-09-02 08:00:00', '2026-09-02 11:30:00', 12600, 'Governance & reporting – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:30', '2026-09-02', 0),
(11810, 12, 29, 39, '2026-09-03 08:30:00', '2026-09-03 15:30:00', 25200, 'Admin & BAU – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:30', '2026-09-03', 0),
(11811, 12, 26, 39, '2026-09-04 08:00:00', '2026-09-04 12:00:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:30', '2026-09-04', 0),
(11812, 12, 26, 39, '2026-09-07 08:00:00', '2026-09-07 14:00:00', 21600, 'Project delivery – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:31', '2026-09-07', 0),
(11813, 12, 31, 39, '2026-09-08 08:30:00', '2026-09-08 10:30:00', 7200, 'Meetings – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-09-08', 0),
(11814, 12, 29, 39, '2026-09-10 08:00:00', '2026-09-10 11:30:00', 12600, 'Admin & BAU – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:31', '2026-09-10', 0),
(11815, 12, 26, 39, '2026-09-11 08:15:00', '2026-09-11 12:15:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:31', '2026-09-11', 0),
(11816, 12, 27, 39, '2026-09-14 08:15:00', '2026-09-14 10:45:00', 9000, 'Governance & reporting – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:31', '2026-09-14', 0),
(11817, 12, 28, 39, '2026-09-17 08:15:00', '2026-09-17 11:45:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:31', '2026-09-17', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(11818, 12, 27, 39, '2026-09-21 08:15:00', '2026-09-21 10:15:00', 7200, 'Governance & reporting – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-09-21', 0),
(11819, 12, 26, 39, '2026-09-22 08:30:00', '2026-09-22 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-09-22', 0),
(11820, 12, 26, 39, '2026-09-24 08:15:00', '2026-09-24 12:15:00', 14400, 'Project delivery – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:31', '2026-09-24', 0),
(11821, 12, 27, 39, '2026-09-25 08:15:00', '2026-09-25 10:15:00', 7200, 'Governance & reporting – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-09-25', 0),
(11822, 12, 26, 39, '2026-09-28 08:00:00', '2026-09-28 10:00:00', 7200, 'Project delivery – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-09-28', 0),
(11823, 12, 29, 39, '2026-09-30 08:00:00', '2026-09-30 13:00:00', 18000, 'Admin & BAU – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:31', '2026-09-30', 0),
(11824, 12, 29, 39, '2026-10-01 08:00:00', '2026-10-01 12:00:00', 14400, 'Admin & BAU – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:31', '2026-10-01', 0),
(11825, 12, 27, 39, '2026-10-02 08:00:00', '2026-10-02 11:30:00', 12600, 'Governance & reporting – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:31', '2026-10-02', 0),
(11826, 12, 29, 39, '2026-10-05 08:00:00', '2026-10-05 14:00:00', 21600, 'Admin & BAU – Mass Transit Programme', 180, NULL, 30, 0, 'Europe/London', 156, 1, 'work', '2026-11-28 10:30:31', '2026-10-05', 0),
(11827, 12, 30, 39, '2026-10-06 08:00:00', '2026-10-06 12:00:00', 14400, 'Training – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:31', '2026-10-06', 0),
(11828, 12, 29, 39, '2026-10-07 08:30:00', '2026-10-07 11:00:00', 9000, 'Admin & BAU – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:31', '2026-10-07', 0),
(11829, 12, 27, 39, '2026-10-13 08:00:00', '2026-10-13 15:00:00', 25200, 'Governance & reporting – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:31', '2026-10-13', 0),
(11830, 12, 26, 39, '2026-10-14 08:30:00', '2026-10-14 12:00:00', 12600, 'Project delivery – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:31', '2026-10-14', 0),
(11831, 12, 29, 39, '2026-10-15 08:15:00', '2026-10-15 10:15:00', 7200, 'Admin & BAU – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-10-15', 0),
(11832, 12, 29, 39, '2026-10-16 08:00:00', '2026-10-16 10:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:31', '2026-10-16', 0),
(11833, 12, 26, 39, '2026-10-19 08:00:00', '2026-10-19 11:30:00', 12600, 'Project delivery – Mass Transit Programme', 105, NULL, 30, 0, 'Europe/London', 91, 1, 'work', '2026-11-28 10:30:31', '2026-10-19', 0),
(11834, 12, 26, 39, '2026-10-20 08:15:00', '2026-10-20 15:15:00', 25200, 'Project delivery – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:31', '2026-10-20', 0),
(11835, 12, 30, 39, '2026-10-22 08:15:00', '2026-10-22 10:45:00', 9000, 'Training – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:31', '2026-10-22', 0),
(11836, 12, 28, 39, '2026-10-23 08:00:00', '2026-10-23 15:00:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:31', '2026-10-23', 0),
(11837, 12, 27, 39, '2026-10-26 09:00:00', '2026-10-26 11:00:00', 7200, 'Governance & reporting – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-10-26', 0),
(11838, 12, 29, 39, '2026-10-27 09:00:00', '2026-10-27 11:00:00', 7200, 'Admin & BAU – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-10-27', 0),
(11839, 12, 26, 39, '2026-10-28 09:15:00', '2026-10-28 11:45:00', 9000, 'Project delivery – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:31', '2026-10-28', 0),
(11840, 12, 26, 39, '2026-10-29 09:30:00', '2026-10-29 11:30:00', 7200, 'Project delivery – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-10-29', 0),
(11841, 12, 30, 39, '2026-11-02 09:00:00', '2026-11-02 14:00:00', 18000, 'Training – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:31', '2026-11-02', 0),
(11842, 12, 26, 39, '2026-11-03 09:30:00', '2026-11-03 14:30:00', 18000, 'Project delivery – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:31', '2026-11-03', 0),
(11843, 12, 27, 39, '2026-11-05 09:15:00', '2026-11-05 11:45:00', 9000, 'Governance & reporting – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:31', '2026-11-05', 0),
(11844, 12, 29, 39, '2026-11-09 09:00:00', '2026-11-09 12:00:00', 10800, 'Admin & BAU – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:31', '2026-11-09', 0),
(11845, 12, 27, 39, '2026-11-11 09:15:00', '2026-11-11 13:15:00', 14400, 'Governance & reporting – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:31', '2026-11-11', 0),
(11846, 12, 28, 39, '2026-11-12 09:00:00', '2026-11-12 11:30:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:31', '2026-11-12', 0),
(11847, 12, 27, 39, '2026-11-13 09:00:00', '2026-11-13 14:00:00', 18000, 'Governance & reporting – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:31', '2026-11-13', 0),
(11848, 12, 28, 39, '2026-11-16 09:15:00', '2026-11-16 16:15:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:31', '2026-11-16', 0),
(11849, 12, 30, 39, '2026-11-17 09:00:00', '2026-11-17 16:00:00', 25200, 'Training – Mass Transit Programme', 210, NULL, 30, 0, 'Europe/London', 182, 1, 'work', '2026-11-28 10:30:31', '2026-11-17', 0),
(11850, 12, 31, 39, '2026-11-20 09:30:00', '2026-11-20 12:30:00', 10800, 'Meetings – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:31', '2026-11-20', 0),
(11851, 12, 29, 39, '2026-11-23 09:30:00', '2026-11-23 12:00:00', 9000, 'Admin & BAU – Mass Transit Programme', 75, NULL, 30, 0, 'Europe/London', 65, 1, 'work', '2026-11-28 10:30:31', '2026-11-23', 0),
(11852, 12, 29, 39, '2026-11-24 09:15:00', '2026-11-24 11:15:00', 7200, 'Admin & BAU – Mass Transit Programme', 60, NULL, 30, 0, 'Europe/London', 52, 1, 'work', '2026-11-28 10:30:31', '2026-11-24', 0),
(11853, 12, 27, 39, '2026-11-25 09:30:00', '2026-11-25 12:30:00', 10800, 'Governance & reporting – Mass Transit Programme', 90, NULL, 30, 0, 'Europe/London', 78, 1, 'work', '2026-11-28 10:30:31', '2026-11-25', 0),
(11854, 12, 28, 39, '2026-11-26 09:00:00', '2026-11-26 13:00:00', 14400, 'Stakeholder engagement – Mass Transit Programme', 120, NULL, 30, 0, 'Europe/London', 104, 1, 'work', '2026-11-28 10:30:31', '2026-11-26', 0),
(11855, 12, 29, 39, '2026-11-27 09:00:00', '2026-11-27 14:00:00', 18000, 'Admin & BAU – Mass Transit Programme', 150, NULL, 30, 0, 'Europe/London', 130, 1, 'work', '2026-11-28 10:30:31', '2026-11-27', 0),
(11856, 8, 26, 39, '2026-02-03 09:30:00', '2026-02-03 12:30:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-02-03', 0),
(11857, 8, 28, 39, '2026-02-04 09:30:00', '2026-02-04 14:30:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-02-04', 0),
(11858, 8, 26, 39, '2026-02-05 09:15:00', '2026-02-05 12:15:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-02-05', 0),
(11859, 8, 29, 39, '2026-02-06 09:30:00', '2026-02-06 15:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-02-06', 0),
(11860, 8, 28, 39, '2026-02-11 09:30:00', '2026-02-11 12:00:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-02-11', 0),
(11861, 8, 26, 39, '2026-02-13 09:00:00', '2026-02-13 15:00:00', 21600, 'Project delivery – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-02-13', 0),
(11862, 8, 28, 39, '2026-02-19 09:30:00', '2026-02-19 14:30:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-02-19', 0),
(11863, 8, 26, 39, '2026-02-20 09:15:00', '2026-02-20 11:45:00', 9000, 'Project delivery – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-02-20', 0),
(11864, 8, 29, 39, '2026-02-25 09:15:00', '2026-02-25 12:15:00', 10800, 'Admin & BAU – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-02-25', 0),
(11865, 8, 29, 39, '2026-02-27 09:30:00', '2026-02-27 15:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-02-27', 0),
(11866, 8, 28, 39, '2026-03-02 09:30:00', '2026-03-02 12:30:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-03-02', 0),
(11867, 8, 27, 39, '2026-03-04 09:00:00', '2026-03-04 13:00:00', 14400, 'Governance & reporting – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-03-04', 0),
(11868, 8, 26, 39, '2026-03-05 09:30:00', '2026-03-05 11:30:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-03-05', 0),
(11869, 8, 26, 39, '2026-03-06 09:15:00', '2026-03-06 13:15:00', 14400, 'Project delivery – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-03-06', 0),
(11870, 8, 27, 39, '2026-03-10 09:30:00', '2026-03-10 11:30:00', 7200, 'Governance & reporting – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-03-10', 0),
(11871, 8, 28, 39, '2026-03-12 09:00:00', '2026-03-12 11:00:00', 7200, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-03-12', 0),
(11872, 8, 27, 39, '2026-03-13 09:15:00', '2026-03-13 12:15:00', 10800, 'Governance & reporting – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-03-13', 0),
(11873, 8, 26, 39, '2026-03-16 09:00:00', '2026-03-16 11:30:00', 9000, 'Project delivery – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-03-16', 0),
(11874, 8, 29, 39, '2026-03-17 09:15:00', '2026-03-17 14:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-03-17', 0),
(11875, 8, 29, 39, '2026-03-18 09:30:00', '2026-03-18 15:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-03-18', 0),
(11876, 8, 28, 39, '2026-03-19 09:30:00', '2026-03-19 12:30:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-03-19', 0),
(11877, 8, 27, 39, '2026-03-20 09:00:00', '2026-03-20 16:00:00', 25200, 'Governance & reporting – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-03-20', 0),
(11878, 8, 26, 39, '2026-03-23 09:00:00', '2026-03-23 12:00:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-03-23', 0),
(11879, 8, 27, 39, '2026-03-24 09:30:00', '2026-03-24 12:00:00', 9000, 'Governance & reporting – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-03-24', 0),
(11880, 8, 26, 39, '2026-03-25 09:30:00', '2026-03-25 15:30:00', 21600, 'Project delivery – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-03-25', 0),
(11881, 8, 28, 39, '2026-03-26 09:00:00', '2026-03-26 12:30:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-03-26', 0),
(11882, 8, 26, 39, '2026-03-27 09:00:00', '2026-03-27 14:00:00', 18000, 'Project delivery – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-03-27', 0),
(11883, 8, 29, 39, '2026-03-30 08:30:00', '2026-03-30 13:30:00', 18000, 'Admin & BAU – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-03-30', 0),
(11884, 8, 26, 39, '2026-04-02 08:30:00', '2026-04-02 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-04-02', 0),
(11885, 8, 31, 39, '2026-04-03 08:30:00', '2026-04-03 15:30:00', 25200, 'Meetings – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-04-03', 0),
(11886, 8, 26, 39, '2026-04-06 08:30:00', '2026-04-06 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-04-06', 0),
(11887, 8, 26, 39, '2026-04-07 08:15:00', '2026-04-07 10:15:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-04-07', 0),
(11888, 8, 31, 39, '2026-04-08 08:30:00', '2026-04-08 12:30:00', 14400, 'Meetings – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-04-08', 0),
(11889, 8, 29, 39, '2026-04-09 08:30:00', '2026-04-09 10:30:00', 7200, 'Admin & BAU – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-04-09', 0),
(11890, 8, 30, 39, '2026-04-10 08:30:00', '2026-04-10 11:30:00', 10800, 'Training – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-04-10', 0),
(11891, 8, 29, 39, '2026-04-14 08:30:00', '2026-04-14 15:30:00', 25200, 'Admin & BAU – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-04-14', 0),
(11892, 8, 26, 39, '2026-04-15 08:00:00', '2026-04-15 11:30:00', 12600, 'Project delivery – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-04-15', 0),
(11893, 8, 26, 39, '2026-04-16 08:30:00', '2026-04-16 13:30:00', 18000, 'Project delivery – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-04-16', 0),
(11894, 8, 29, 39, '2026-04-17 08:30:00', '2026-04-17 13:30:00', 18000, 'Admin & BAU – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-04-17', 0),
(11895, 8, 30, 39, '2026-04-20 08:30:00', '2026-04-20 13:30:00', 18000, 'Training – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-04-20', 0),
(11896, 8, 26, 39, '2026-04-23 08:30:00', '2026-04-23 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-04-23', 0),
(11897, 8, 29, 39, '2026-04-27 08:00:00', '2026-04-27 10:30:00', 9000, 'Admin & BAU – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-04-27', 0),
(11898, 8, 30, 39, '2026-04-28 08:00:00', '2026-04-28 13:00:00', 18000, 'Training – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-04-28', 0),
(11899, 8, 26, 39, '2026-04-29 08:15:00', '2026-04-29 11:45:00', 12600, 'Project delivery – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-04-29', 0),
(11900, 8, 26, 39, '2026-04-30 08:30:00', '2026-04-30 11:30:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-04-30', 0),
(11901, 8, 26, 39, '2026-05-01 08:30:00', '2026-05-01 12:30:00', 14400, 'Project delivery – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-05-01', 0),
(11902, 8, 26, 39, '2026-05-04 08:00:00', '2026-05-04 13:00:00', 18000, 'Project delivery – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-05-04', 0),
(11903, 8, 26, 39, '2026-05-05 08:00:00', '2026-05-05 11:00:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-05-05', 0),
(11904, 8, 27, 39, '2026-05-06 08:30:00', '2026-05-06 12:30:00', 14400, 'Governance & reporting – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-05-06', 0),
(11905, 8, 28, 39, '2026-05-07 08:15:00', '2026-05-07 12:15:00', 14400, 'Stakeholder engagement – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-05-07', 0),
(11906, 8, 31, 39, '2026-05-08 08:15:00', '2026-05-08 13:15:00', 18000, 'Meetings – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-05-08', 0),
(11907, 8, 31, 39, '2026-05-11 08:30:00', '2026-05-11 10:30:00', 7200, 'Meetings – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-05-11', 0),
(11908, 8, 29, 39, '2026-05-12 08:30:00', '2026-05-12 12:00:00', 12600, 'Admin & BAU – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-05-12', 0),
(11909, 8, 26, 39, '2026-05-13 08:00:00', '2026-05-13 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-05-13', 0),
(11910, 8, 29, 39, '2026-05-14 08:00:00', '2026-05-14 11:00:00', 10800, 'Admin & BAU – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-05-14', 0),
(11911, 8, 26, 39, '2026-05-15 08:30:00', '2026-05-15 15:30:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-05-15', 0),
(11912, 8, 26, 39, '2026-05-18 08:00:00', '2026-05-18 10:00:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-05-18', 0),
(11913, 8, 30, 39, '2026-05-19 08:15:00', '2026-05-19 11:45:00', 12600, 'Training – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-05-19', 0),
(11914, 8, 31, 39, '2026-05-20 08:00:00', '2026-05-20 11:00:00', 10800, 'Meetings – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-05-20', 0),
(11915, 8, 28, 39, '2026-05-22 08:15:00', '2026-05-22 15:15:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-05-22', 0),
(11916, 8, 31, 39, '2026-05-26 08:15:00', '2026-05-26 14:15:00', 21600, 'Meetings – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-05-26', 0),
(11917, 8, 27, 39, '2026-05-27 08:30:00', '2026-05-27 10:30:00', 7200, 'Governance & reporting – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-05-27', 0),
(11918, 8, 30, 39, '2026-05-28 08:00:00', '2026-05-28 15:00:00', 25200, 'Training – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-05-28', 0),
(11919, 8, 29, 39, '2026-05-29 08:15:00', '2026-05-29 11:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-05-29', 0),
(11920, 8, 29, 39, '2026-06-02 08:30:00', '2026-06-02 11:30:00', 10800, 'Admin & BAU – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-06-02', 0),
(11921, 8, 26, 39, '2026-06-05 08:15:00', '2026-06-05 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-06-05', 0),
(11922, 8, 28, 39, '2026-06-09 08:15:00', '2026-06-09 10:45:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-06-09', 0),
(11923, 8, 26, 39, '2026-06-12 08:00:00', '2026-06-12 13:00:00', 18000, 'Project delivery – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-06-12', 0),
(11924, 8, 27, 39, '2026-06-16 08:00:00', '2026-06-16 10:00:00', 7200, 'Governance & reporting – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-06-16', 0),
(11925, 8, 27, 39, '2026-06-17 08:30:00', '2026-06-17 13:30:00', 18000, 'Governance & reporting – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-06-17', 0),
(11926, 8, 28, 39, '2026-06-18 08:30:00', '2026-06-18 12:00:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-06-18', 0),
(11927, 8, 26, 39, '2026-06-19 08:00:00', '2026-06-19 10:00:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-06-19', 0),
(11928, 8, 29, 39, '2026-06-22 08:15:00', '2026-06-22 11:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-06-22', 0),
(11929, 8, 28, 39, '2026-06-23 08:00:00', '2026-06-23 11:30:00', 12600, 'Stakeholder engagement – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-06-23', 0),
(11930, 8, 29, 39, '2026-06-24 08:15:00', '2026-06-24 14:15:00', 21600, 'Admin & BAU – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-06-24', 0),
(11931, 8, 29, 39, '2026-06-25 08:15:00', '2026-06-25 10:45:00', 9000, 'Admin & BAU – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-06-25', 0),
(11932, 8, 26, 39, '2026-06-26 08:30:00', '2026-06-26 10:30:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-06-26', 0),
(11933, 8, 27, 39, '2026-07-01 08:15:00', '2026-07-01 15:15:00', 25200, 'Governance & reporting – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-07-01', 0),
(11934, 8, 26, 39, '2026-07-02 08:15:00', '2026-07-02 10:15:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-07-02', 0),
(11935, 8, 26, 39, '2026-07-14 08:00:00', '2026-07-14 12:00:00', 14400, 'Project delivery – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-07-14', 0),
(11936, 8, 29, 39, '2026-07-15 08:00:00', '2026-07-15 14:00:00', 21600, 'Admin & BAU – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-07-15', 0),
(11937, 8, 29, 39, '2026-07-16 08:30:00', '2026-07-16 11:00:00', 9000, 'Admin & BAU – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-07-16', 0),
(11938, 8, 27, 39, '2026-07-20 08:30:00', '2026-07-20 11:00:00', 9000, 'Governance & reporting – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-07-20', 0),
(11939, 8, 29, 39, '2026-07-21 08:15:00', '2026-07-21 13:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-07-21', 0),
(11940, 8, 28, 39, '2026-07-23 08:30:00', '2026-07-23 14:30:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-07-23', 0),
(11941, 8, 29, 39, '2026-07-24 08:00:00', '2026-07-24 13:00:00', 18000, 'Admin & BAU – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-07-24', 0),
(11942, 8, 26, 39, '2026-07-27 08:15:00', '2026-07-27 10:15:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-07-27', 0),
(11943, 8, 26, 39, '2026-07-28 08:00:00', '2026-07-28 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-07-28', 0),
(11944, 8, 29, 39, '2026-07-29 08:15:00', '2026-07-29 11:15:00', 10800, 'Admin & BAU – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-07-29', 0),
(11945, 8, 29, 39, '2026-07-30 08:30:00', '2026-07-30 11:00:00', 9000, 'Admin & BAU – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-07-30', 0),
(11946, 8, 29, 39, '2026-07-31 08:15:00', '2026-07-31 13:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-07-31', 0),
(11947, 8, 26, 39, '2026-08-03 08:00:00', '2026-08-03 10:00:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-08-03', 0),
(11948, 8, 26, 39, '2026-08-04 08:00:00', '2026-08-04 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-08-04', 0),
(11949, 8, 26, 39, '2026-08-05 08:15:00', '2026-08-05 15:15:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-08-05', 0),
(11950, 8, 27, 39, '2026-08-06 08:00:00', '2026-08-06 12:00:00', 14400, 'Governance & reporting – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-08-06', 0),
(11951, 8, 31, 39, '2026-08-07 08:30:00', '2026-08-07 11:00:00', 9000, 'Meetings – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-08-07', 0),
(11952, 8, 27, 39, '2026-08-11 08:00:00', '2026-08-11 13:00:00', 18000, 'Governance & reporting – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-08-11', 0),
(11953, 8, 27, 39, '2026-08-17 08:30:00', '2026-08-17 10:30:00', 7200, 'Governance & reporting – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-08-17', 0),
(11954, 8, 29, 39, '2026-08-18 08:30:00', '2026-08-18 10:30:00', 7200, 'Admin & BAU – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-08-18', 0),
(11955, 8, 29, 39, '2026-08-20 08:00:00', '2026-08-20 11:30:00', 12600, 'Admin & BAU – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-08-20', 0),
(11956, 8, 26, 39, '2026-08-21 08:00:00', '2026-08-21 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-08-21', 0),
(11957, 8, 28, 39, '2026-08-26 08:15:00', '2026-08-26 11:15:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-08-26', 0),
(11958, 8, 29, 39, '2026-08-27 08:15:00', '2026-08-27 12:15:00', 14400, 'Admin & BAU – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-08-27', 0),
(11959, 8, 26, 39, '2026-08-31 08:00:00', '2026-08-31 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-08-31', 0),
(11960, 8, 29, 39, '2026-09-01 08:15:00', '2026-09-01 10:15:00', 7200, 'Admin & BAU – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-09-01', 0),
(11961, 8, 29, 39, '2026-09-02 08:15:00', '2026-09-02 14:15:00', 21600, 'Admin & BAU – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-09-02', 0),
(11962, 8, 27, 39, '2026-09-03 08:30:00', '2026-09-03 14:30:00', 21600, 'Governance & reporting – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-09-03', 0),
(11963, 8, 29, 39, '2026-09-04 08:00:00', '2026-09-04 15:00:00', 25200, 'Admin & BAU – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-09-04', 0),
(11964, 8, 28, 39, '2026-09-07 08:15:00', '2026-09-07 15:15:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-09-07', 0),
(11965, 8, 31, 39, '2026-09-08 08:30:00', '2026-09-08 14:30:00', 21600, 'Meetings – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-09-08', 0),
(11966, 8, 28, 39, '2026-09-10 08:30:00', '2026-09-10 11:00:00', 9000, 'Stakeholder engagement – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-09-10', 0),
(11967, 8, 27, 39, '2026-09-14 08:30:00', '2026-09-14 11:00:00', 9000, 'Governance & reporting – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-09-14', 0),
(11968, 8, 29, 39, '2026-09-15 08:30:00', '2026-09-15 15:30:00', 25200, 'Admin & BAU – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-09-15', 0),
(11969, 8, 26, 39, '2026-09-16 08:30:00', '2026-09-16 14:30:00', 21600, 'Project delivery – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-09-16', 0),
(11970, 8, 29, 39, '2026-09-18 08:15:00', '2026-09-18 11:45:00', 12600, 'Admin & BAU – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-09-18', 0),
(11971, 8, 29, 39, '2026-09-21 08:30:00', '2026-09-21 14:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-09-21', 0),
(11972, 8, 26, 39, '2026-09-22 08:00:00', '2026-09-22 13:00:00', 18000, 'Project delivery – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-09-22', 0),
(11973, 8, 27, 39, '2026-09-23 08:30:00', '2026-09-23 11:00:00', 9000, 'Governance & reporting – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-09-23', 0),
(11974, 8, 28, 39, '2026-09-25 08:15:00', '2026-09-25 14:15:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-09-25', 0),
(11975, 8, 26, 39, '2026-09-28 08:00:00', '2026-09-28 13:00:00', 18000, 'Project delivery – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-09-28', 0),
(11976, 8, 26, 39, '2026-10-01 08:30:00', '2026-10-01 11:00:00', 9000, 'Project delivery – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-10-01', 0),
(11977, 8, 26, 39, '2026-10-02 08:00:00', '2026-10-02 14:00:00', 21600, 'Project delivery – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-10-02', 0),
(11978, 8, 27, 39, '2026-10-05 08:30:00', '2026-10-05 10:30:00', 7200, 'Governance & reporting – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-10-05', 0),
(11979, 8, 26, 39, '2026-10-06 08:15:00', '2026-10-06 11:15:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-10-06', 0),
(11980, 8, 29, 39, '2026-10-08 08:15:00', '2026-10-08 13:15:00', 18000, 'Admin & BAU – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-10-08', 0),
(11981, 8, 30, 39, '2026-10-09 08:00:00', '2026-10-09 10:00:00', 7200, 'Training – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-10-09', 0),
(11982, 8, 27, 39, '2026-10-12 08:00:00', '2026-10-12 13:00:00', 18000, 'Governance & reporting – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-10-12', 0),
(11983, 8, 26, 39, '2026-10-13 08:15:00', '2026-10-13 15:15:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-10-13', 0),
(11984, 8, 26, 39, '2026-10-14 08:30:00', '2026-10-14 12:30:00', 14400, 'Project delivery – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-10-14', 0),
(11985, 8, 28, 39, '2026-10-15 08:15:00', '2026-10-15 14:15:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-10-15', 0),
(11986, 8, 26, 39, '2026-10-16 08:00:00', '2026-10-16 15:00:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-10-16', 0),
(11987, 8, 26, 39, '2026-10-19 08:00:00', '2026-10-19 13:00:00', 18000, 'Project delivery – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-10-19', 0),
(11988, 8, 29, 39, '2026-10-20 08:30:00', '2026-10-20 12:00:00', 12600, 'Admin & BAU – Mass Transit Programme', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-10-20', 0),
(11989, 8, 26, 39, '2026-10-21 08:00:00', '2026-10-21 10:00:00', 7200, 'Project delivery – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-10-21', 0),
(11990, 8, 29, 39, '2026-10-22 08:30:00', '2026-10-22 15:30:00', 25200, 'Admin & BAU – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-10-22', 0),
(11991, 8, 27, 39, '2026-10-23 08:30:00', '2026-10-23 12:30:00', 14400, 'Governance & reporting – Mass Transit Programme', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:31', '2026-10-23', 0),
(11992, 8, 28, 39, '2026-10-26 09:00:00', '2026-10-26 11:00:00', 7200, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-10-26', 0),
(11993, 8, 29, 39, '2026-10-27 09:30:00', '2026-10-27 16:30:00', 25200, 'Admin & BAU – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-10-27', 0),
(11994, 8, 28, 39, '2026-10-28 09:15:00', '2026-10-28 16:15:00', 25200, 'Stakeholder engagement – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-10-28', 0),
(11995, 8, 29, 39, '2026-10-30 09:15:00', '2026-10-30 11:15:00', 7200, 'Admin & BAU – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-10-30', 0),
(11996, 8, 29, 39, '2026-11-02 09:30:00', '2026-11-02 11:30:00', 7200, 'Admin & BAU – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-11-02', 0),
(11997, 8, 27, 39, '2026-11-05 09:15:00', '2026-11-05 11:45:00', 9000, 'Governance & reporting – Mass Transit Programme', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:31', '2026-11-05', 0),
(11998, 8, 28, 39, '2026-11-09 09:30:00', '2026-11-09 14:30:00', 18000, 'Stakeholder engagement – Mass Transit Programme', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:31', '2026-11-09', 0),
(11999, 8, 26, 39, '2026-11-10 09:30:00', '2026-11-10 12:30:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-11-10', 0),
(12000, 8, 26, 39, '2026-11-11 09:30:00', '2026-11-11 12:30:00', 10800, 'Project delivery – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-11-11', 0),
(12001, 8, 28, 39, '2026-11-12 09:15:00', '2026-11-12 15:15:00', 21600, 'Stakeholder engagement – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-11-12', 0),
(12002, 8, 26, 39, '2026-11-17 09:00:00', '2026-11-17 16:00:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-11-17', 0),
(12003, 8, 28, 39, '2026-11-18 09:15:00', '2026-11-18 12:15:00', 10800, 'Stakeholder engagement – Mass Transit Programme', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:31', '2026-11-18', 0),
(12004, 8, 26, 39, '2026-11-19 09:00:00', '2026-11-19 16:00:00', 25200, 'Project delivery – Mass Transit Programme', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:31', '2026-11-19', 0),
(12005, 8, 28, 39, '2026-11-20 09:30:00', '2026-11-20 11:30:00', 7200, 'Stakeholder engagement – Mass Transit Programme', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:31', '2026-11-20', 0),
(12006, 8, 29, 39, '2026-11-24 09:30:00', '2026-11-24 15:30:00', 21600, 'Admin & BAU – Mass Transit Programme', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:31', '2026-11-24', 0),
(12007, 16, 26, 40, '2026-03-02 09:00:00', '2026-03-02 14:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-03-02', 0),
(12008, 16, 26, 40, '2026-03-03 09:15:00', '2026-03-03 16:15:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-03-03', 0),
(12009, 16, 29, 40, '2026-03-04 09:00:00', '2026-03-04 12:00:00', 10800, 'Admin & BAU – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-03-04', 0),
(12010, 16, 26, 40, '2026-03-05 09:00:00', '2026-03-05 11:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-03-05', 0),
(12011, 16, 26, 40, '2026-03-06 09:00:00', '2026-03-06 11:30:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-03-06', 0),
(12012, 16, 28, 40, '2026-03-09 09:15:00', '2026-03-09 15:15:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-03-09', 0),
(12013, 16, 27, 40, '2026-03-10 09:30:00', '2026-03-10 11:30:00', 7200, 'Governance & reporting – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-03-10', 0),
(12014, 16, 26, 40, '2026-03-11 09:15:00', '2026-03-11 16:15:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-03-11', 0),
(12015, 16, 29, 40, '2026-03-13 09:30:00', '2026-03-13 11:30:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-03-13', 0),
(12016, 16, 31, 40, '2026-03-16 09:30:00', '2026-03-16 13:00:00', 12600, 'Meetings – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-03-16', 0),
(12017, 16, 29, 40, '2026-03-19 09:15:00', '2026-03-19 13:15:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-03-19', 0),
(12018, 16, 27, 40, '2026-03-23 09:15:00', '2026-03-23 12:15:00', 10800, 'Governance & reporting – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-03-23', 0),
(12019, 16, 29, 40, '2026-03-26 09:00:00', '2026-03-26 11:30:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-03-26', 0),
(12020, 16, 26, 40, '2026-03-30 08:30:00', '2026-03-30 10:30:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-03-30', 0),
(12021, 16, 26, 40, '2026-03-31 08:15:00', '2026-03-31 11:45:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-03-31', 0),
(12022, 16, 26, 40, '2026-04-01 08:15:00', '2026-04-01 14:15:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-04-01', 0),
(12023, 16, 27, 40, '2026-04-02 08:30:00', '2026-04-02 12:30:00', 14400, 'Governance & reporting – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-04-02', 0),
(12024, 16, 26, 40, '2026-04-03 08:00:00', '2026-04-03 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-04-03', 0),
(12025, 16, 28, 40, '2026-04-06 08:30:00', '2026-04-06 11:30:00', 10800, 'Stakeholder engagement – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-04-06', 0),
(12026, 16, 26, 40, '2026-04-08 08:30:00', '2026-04-08 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-04-08', 0),
(12027, 16, 26, 40, '2026-04-09 08:30:00', '2026-04-09 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-04-09', 0),
(12028, 16, 30, 40, '2026-04-10 08:30:00', '2026-04-10 14:30:00', 21600, 'Training – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-04-10', 0),
(12029, 16, 26, 40, '2026-04-15 08:15:00', '2026-04-15 13:15:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-04-15', 0),
(12030, 16, 26, 40, '2026-04-16 08:30:00', '2026-04-16 12:30:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-04-16', 0),
(12031, 16, 26, 40, '2026-04-17 08:15:00', '2026-04-17 14:15:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-04-17', 0),
(12032, 16, 28, 40, '2026-04-20 08:15:00', '2026-04-20 12:15:00', 14400, 'Stakeholder engagement – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-04-20', 0),
(12033, 16, 26, 40, '2026-04-22 08:15:00', '2026-04-22 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-04-22', 0),
(12034, 16, 29, 40, '2026-04-24 08:00:00', '2026-04-24 12:00:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-04-24', 0),
(12035, 16, 26, 40, '2026-04-28 08:30:00', '2026-04-28 13:30:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-04-28', 0),
(12036, 16, 26, 40, '2026-05-01 08:00:00', '2026-05-01 15:00:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-05-01', 0),
(12037, 16, 31, 40, '2026-05-05 08:00:00', '2026-05-05 14:00:00', 21600, 'Meetings – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-05-05', 0),
(12038, 16, 26, 40, '2026-05-06 08:00:00', '2026-05-06 13:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-05-06', 0),
(12039, 16, 26, 40, '2026-05-07 08:15:00', '2026-05-07 12:15:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-05-07', 0),
(12040, 16, 26, 40, '2026-05-08 08:30:00', '2026-05-08 12:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-05-08', 0),
(12041, 16, 29, 40, '2026-05-11 08:15:00', '2026-05-11 12:15:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-05-11', 0),
(12042, 16, 26, 40, '2026-05-12 08:30:00', '2026-05-12 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-05-12', 0),
(12043, 16, 26, 40, '2026-05-18 08:00:00', '2026-05-18 13:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-05-18', 0),
(12044, 16, 26, 40, '2026-05-19 08:30:00', '2026-05-19 14:30:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-05-19', 0),
(12045, 16, 26, 40, '2026-05-20 08:30:00', '2026-05-20 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-05-20', 0),
(12046, 16, 29, 40, '2026-05-21 08:00:00', '2026-05-21 12:00:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-05-21', 0),
(12047, 16, 28, 40, '2026-05-22 08:15:00', '2026-05-22 11:45:00', 12600, 'Stakeholder engagement – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-05-22', 0),
(12048, 16, 26, 40, '2026-05-25 08:30:00', '2026-05-25 11:00:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-05-25', 0),
(12049, 16, 28, 40, '2026-05-26 08:00:00', '2026-05-26 14:00:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-05-26', 0),
(12050, 16, 28, 40, '2026-05-27 08:00:00', '2026-05-27 11:30:00', 12600, 'Stakeholder engagement – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-05-27', 0),
(12051, 16, 26, 40, '2026-05-29 08:00:00', '2026-05-29 12:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-05-29', 0),
(12052, 16, 26, 40, '2026-06-02 08:00:00', '2026-06-02 12:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-06-02', 0),
(12053, 16, 26, 40, '2026-06-03 08:00:00', '2026-06-03 11:30:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-06-03', 0),
(12054, 16, 26, 40, '2026-06-09 08:15:00', '2026-06-09 12:15:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-06-09', 0),
(12055, 16, 27, 40, '2026-06-10 08:30:00', '2026-06-10 11:00:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-06-10', 0),
(12056, 16, 26, 40, '2026-06-11 08:00:00', '2026-06-11 10:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-06-11', 0),
(12057, 16, 29, 40, '2026-06-12 08:00:00', '2026-06-12 15:00:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-06-12', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(12058, 16, 29, 40, '2026-06-15 08:00:00', '2026-06-15 11:30:00', 12600, 'Admin & BAU – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-06-15', 0),
(12059, 16, 28, 40, '2026-06-18 08:00:00', '2026-06-18 14:00:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-06-18', 0),
(12060, 16, 26, 40, '2026-06-23 08:15:00', '2026-06-23 13:15:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-06-23', 0),
(12061, 16, 26, 40, '2026-06-25 08:30:00', '2026-06-25 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-06-25', 0),
(12062, 16, 26, 40, '2026-06-26 08:15:00', '2026-06-26 14:15:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-06-26', 0),
(12063, 16, 28, 40, '2026-07-01 08:30:00', '2026-07-01 12:30:00', 14400, 'Stakeholder engagement – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-07-01', 0),
(12064, 16, 29, 40, '2026-07-02 08:15:00', '2026-07-02 11:15:00', 10800, 'Admin & BAU – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-07-02', 0),
(12065, 16, 26, 40, '2026-07-03 08:15:00', '2026-07-03 11:45:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-07-03', 0),
(12066, 16, 27, 40, '2026-07-06 08:30:00', '2026-07-06 14:30:00', 21600, 'Governance & reporting – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-06', 0),
(12067, 16, 29, 40, '2026-07-08 08:30:00', '2026-07-08 12:30:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-07-08', 0),
(12068, 16, 26, 40, '2026-07-09 08:30:00', '2026-07-09 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-07-09', 0),
(12069, 16, 26, 40, '2026-07-14 08:15:00', '2026-07-14 11:15:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-07-14', 0),
(12070, 16, 29, 40, '2026-07-15 08:00:00', '2026-07-15 14:00:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-15', 0),
(12071, 16, 29, 40, '2026-07-16 08:15:00', '2026-07-16 12:15:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-07-16', 0),
(12072, 16, 28, 40, '2026-07-17 08:30:00', '2026-07-17 15:30:00', 25200, 'Stakeholder engagement – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-07-17', 0),
(12073, 16, 28, 40, '2026-07-20 08:30:00', '2026-07-20 14:30:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-20', 0),
(12074, 16, 31, 40, '2026-07-21 08:15:00', '2026-07-21 14:15:00', 21600, 'Meetings – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-21', 0),
(12075, 16, 28, 40, '2026-07-23 08:00:00', '2026-07-23 14:00:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-23', 0),
(12076, 16, 26, 40, '2026-07-24 08:00:00', '2026-07-24 14:00:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-24', 0),
(12077, 16, 26, 40, '2026-07-27 08:00:00', '2026-07-27 11:30:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-07-27', 0),
(12078, 16, 29, 40, '2026-07-30 08:00:00', '2026-07-30 11:00:00', 10800, 'Admin & BAU – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-07-30', 0),
(12079, 16, 29, 40, '2026-08-03 08:15:00', '2026-08-03 10:15:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-08-03', 0),
(12080, 16, 30, 40, '2026-08-05 08:30:00', '2026-08-05 11:30:00', 10800, 'Training – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-08-05', 0),
(12081, 16, 28, 40, '2026-08-06 08:30:00', '2026-08-06 10:30:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-08-06', 0),
(12082, 16, 27, 40, '2026-08-07 08:15:00', '2026-08-07 12:15:00', 14400, 'Governance & reporting – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-08-07', 0),
(12083, 16, 26, 40, '2026-08-14 08:15:00', '2026-08-14 11:45:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-08-14', 0),
(12084, 16, 28, 40, '2026-08-17 08:00:00', '2026-08-17 12:00:00', 14400, 'Stakeholder engagement – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-08-17', 0),
(12085, 16, 30, 40, '2026-08-18 08:00:00', '2026-08-18 14:00:00', 21600, 'Training – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-08-18', 0),
(12086, 16, 27, 40, '2026-08-20 08:15:00', '2026-08-20 14:15:00', 21600, 'Governance & reporting – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-08-20', 0),
(12087, 16, 30, 40, '2026-08-24 08:30:00', '2026-08-24 15:30:00', 25200, 'Training – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-08-24', 0),
(12088, 16, 29, 40, '2026-08-26 08:30:00', '2026-08-26 14:30:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-08-26', 0),
(12089, 16, 26, 40, '2026-08-27 08:15:00', '2026-08-27 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-08-27', 0),
(12090, 16, 26, 40, '2026-08-31 08:15:00', '2026-08-31 13:15:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-08-31', 0),
(12091, 16, 26, 40, '2026-09-02 08:00:00', '2026-09-02 12:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-09-02', 0),
(12092, 16, 27, 40, '2026-09-03 08:30:00', '2026-09-03 12:30:00', 14400, 'Governance & reporting – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-09-03', 0),
(12093, 16, 26, 40, '2026-09-04 08:00:00', '2026-09-04 15:00:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-09-04', 0),
(12094, 16, 29, 40, '2026-09-07 08:30:00', '2026-09-07 13:30:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-09-07', 0),
(12095, 16, 28, 40, '2026-09-08 08:00:00', '2026-09-08 10:30:00', 9000, 'Stakeholder engagement – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-09-08', 0),
(12096, 16, 29, 40, '2026-09-09 08:30:00', '2026-09-09 13:30:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-09-09', 0),
(12097, 16, 27, 40, '2026-09-14 08:15:00', '2026-09-14 13:15:00', 18000, 'Governance & reporting – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-09-14', 0),
(12098, 16, 27, 40, '2026-09-15 08:00:00', '2026-09-15 14:00:00', 21600, 'Governance & reporting – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-09-15', 0),
(12099, 16, 26, 40, '2026-09-16 08:15:00', '2026-09-16 13:15:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-09-16', 0),
(12100, 16, 29, 40, '2026-09-18 08:00:00', '2026-09-18 13:00:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-09-18', 0),
(12101, 16, 30, 40, '2026-09-22 08:15:00', '2026-09-22 11:45:00', 12600, 'Training – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-09-22', 0),
(12102, 16, 26, 40, '2026-09-23 08:00:00', '2026-09-23 10:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-09-23', 0),
(12103, 16, 26, 40, '2026-09-24 08:00:00', '2026-09-24 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-09-24', 0),
(12104, 16, 27, 40, '2026-09-25 08:00:00', '2026-09-25 10:30:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-09-25', 0),
(12105, 16, 26, 40, '2026-09-29 08:30:00', '2026-09-29 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-09-29', 0),
(12106, 16, 31, 40, '2026-09-30 08:30:00', '2026-09-30 10:30:00', 7200, 'Meetings – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-09-30', 0),
(12107, 16, 28, 40, '2026-10-01 08:00:00', '2026-10-01 12:00:00', 14400, 'Stakeholder engagement – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-10-01', 0),
(12108, 16, 28, 40, '2026-10-02 08:00:00', '2026-10-02 11:00:00', 10800, 'Stakeholder engagement – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-10-02', 0),
(12109, 16, 26, 40, '2026-10-05 08:30:00', '2026-10-05 12:30:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-10-05', 0),
(12110, 16, 27, 40, '2026-10-06 08:00:00', '2026-10-06 10:30:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-10-06', 0),
(12111, 16, 27, 40, '2026-10-07 08:00:00', '2026-10-07 10:30:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-10-07', 0),
(12112, 16, 28, 40, '2026-10-08 08:15:00', '2026-10-08 12:15:00', 14400, 'Stakeholder engagement – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-10-08', 0),
(12113, 16, 28, 40, '2026-10-09 08:30:00', '2026-10-09 10:30:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-10-09', 0),
(12114, 16, 26, 40, '2026-10-13 08:15:00', '2026-10-13 15:15:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-10-13', 0),
(12115, 16, 29, 40, '2026-10-14 08:30:00', '2026-10-14 13:30:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-10-14', 0),
(12116, 16, 26, 40, '2026-10-15 08:30:00', '2026-10-15 12:30:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-10-15', 0),
(12117, 16, 26, 40, '2026-10-16 08:15:00', '2026-10-16 11:45:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-10-16', 0),
(12118, 16, 27, 40, '2026-10-19 08:00:00', '2026-10-19 11:30:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-10-19', 0),
(12119, 16, 31, 40, '2026-10-20 08:30:00', '2026-10-20 12:30:00', 14400, 'Meetings – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-10-20', 0),
(12120, 16, 28, 40, '2026-10-22 08:00:00', '2026-10-22 12:00:00', 14400, 'Stakeholder engagement – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-10-22', 0),
(12121, 16, 27, 40, '2026-10-23 08:15:00', '2026-10-23 10:15:00', 7200, 'Governance & reporting – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-10-23', 0),
(12122, 16, 31, 40, '2026-10-26 09:00:00', '2026-10-26 14:00:00', 18000, 'Meetings – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-10-26', 0),
(12123, 16, 26, 40, '2026-10-27 09:30:00', '2026-10-27 13:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-10-27', 0),
(12124, 16, 29, 40, '2026-10-29 09:00:00', '2026-10-29 14:00:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-10-29', 0),
(12125, 16, 26, 40, '2026-10-30 09:00:00', '2026-10-30 11:30:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-10-30', 0),
(12126, 16, 26, 40, '2026-11-02 09:15:00', '2026-11-02 15:15:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-11-02', 0),
(12127, 16, 31, 40, '2026-11-03 09:15:00', '2026-11-03 15:15:00', 21600, 'Meetings – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-11-03', 0),
(12128, 16, 26, 40, '2026-11-04 09:00:00', '2026-11-04 13:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-11-04', 0),
(12129, 16, 30, 40, '2026-11-09 09:00:00', '2026-11-09 15:00:00', 21600, 'Training – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-11-09', 0),
(12130, 16, 30, 40, '2026-11-11 09:30:00', '2026-11-11 12:00:00', 9000, 'Training – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-11-11', 0),
(12131, 16, 28, 40, '2026-11-12 09:15:00', '2026-11-12 11:15:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-11-12', 0),
(12132, 16, 26, 40, '2026-11-13 09:00:00', '2026-11-13 16:00:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-11-13', 0),
(12133, 16, 31, 40, '2026-11-17 09:30:00', '2026-11-17 15:30:00', 21600, 'Meetings – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-11-17', 0),
(12134, 16, 28, 40, '2026-11-18 09:00:00', '2026-11-18 14:00:00', 18000, 'Stakeholder engagement – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-11-18', 0),
(12135, 16, 26, 40, '2026-11-19 09:15:00', '2026-11-19 12:15:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-11-19', 0),
(12136, 16, 28, 40, '2026-11-20 09:15:00', '2026-11-20 14:15:00', 18000, 'Stakeholder engagement – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-11-20', 0),
(12137, 16, 26, 40, '2026-11-23 09:15:00', '2026-11-23 14:15:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-11-23', 0),
(12138, 16, 29, 40, '2026-11-25 09:15:00', '2026-11-25 11:15:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-11-25', 0),
(12139, 16, 28, 40, '2026-11-26 09:00:00', '2026-11-26 11:00:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-11-26', 0),
(12140, 16, 28, 40, '2026-11-27 09:15:00', '2026-11-27 15:15:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-11-27', 0),
(12141, 13, 29, 40, '2026-03-02 09:15:00', '2026-03-02 13:15:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-03-02', 0),
(12142, 13, 27, 40, '2026-03-03 09:15:00', '2026-03-03 12:15:00', 10800, 'Governance & reporting – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-03-03', 0),
(12143, 13, 28, 40, '2026-03-05 09:15:00', '2026-03-05 11:45:00', 9000, 'Stakeholder engagement – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-03-05', 0),
(12144, 13, 26, 40, '2026-03-06 09:30:00', '2026-03-06 13:30:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-03-06', 0),
(12145, 13, 31, 40, '2026-03-09 09:00:00', '2026-03-09 11:30:00', 9000, 'Meetings – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-03-09', 0),
(12146, 13, 26, 40, '2026-03-10 09:15:00', '2026-03-10 16:15:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-03-10', 0),
(12147, 13, 26, 40, '2026-03-11 09:00:00', '2026-03-11 12:30:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-03-11', 0),
(12148, 13, 26, 40, '2026-03-13 09:30:00', '2026-03-13 16:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-03-13', 0),
(12149, 13, 26, 40, '2026-03-16 09:15:00', '2026-03-16 12:15:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-03-16', 0),
(12150, 13, 27, 40, '2026-03-17 09:15:00', '2026-03-17 13:15:00', 14400, 'Governance & reporting – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-03-17', 0),
(12151, 13, 26, 40, '2026-03-18 09:00:00', '2026-03-18 12:30:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-03-18', 0),
(12152, 13, 27, 40, '2026-03-19 09:00:00', '2026-03-19 15:00:00', 21600, 'Governance & reporting – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-03-19', 0),
(12153, 13, 26, 40, '2026-03-20 09:30:00', '2026-03-20 16:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-03-20', 0),
(12154, 13, 26, 40, '2026-03-24 09:15:00', '2026-03-24 11:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-03-24', 0),
(12155, 13, 28, 40, '2026-03-25 09:30:00', '2026-03-25 11:30:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-03-25', 0),
(12156, 13, 29, 40, '2026-03-27 09:00:00', '2026-03-27 12:00:00', 10800, 'Admin & BAU – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-03-27', 0),
(12157, 13, 31, 40, '2026-03-31 08:15:00', '2026-03-31 10:45:00', 9000, 'Meetings – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-03-31', 0),
(12158, 13, 26, 40, '2026-04-01 08:30:00', '2026-04-01 12:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-04-01', 0),
(12159, 13, 28, 40, '2026-04-02 08:30:00', '2026-04-02 10:30:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-04-02', 0),
(12160, 13, 26, 40, '2026-04-03 08:00:00', '2026-04-03 10:30:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-04-03', 0),
(12161, 13, 29, 40, '2026-04-06 08:00:00', '2026-04-06 11:30:00', 12600, 'Admin & BAU – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-04-06', 0),
(12162, 13, 26, 40, '2026-04-07 08:15:00', '2026-04-07 15:15:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-04-07', 0),
(12163, 13, 27, 40, '2026-04-08 08:00:00', '2026-04-08 13:00:00', 18000, 'Governance & reporting – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-04-08', 0),
(12164, 13, 29, 40, '2026-04-09 08:00:00', '2026-04-09 11:30:00', 12600, 'Admin & BAU – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-04-09', 0),
(12165, 13, 26, 40, '2026-04-10 08:00:00', '2026-04-10 14:00:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-04-10', 0),
(12166, 13, 26, 40, '2026-04-14 08:30:00', '2026-04-14 12:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-04-14', 0),
(12167, 13, 29, 40, '2026-04-17 08:30:00', '2026-04-17 15:30:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-04-17', 0),
(12168, 13, 26, 40, '2026-04-21 08:30:00', '2026-04-21 12:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-04-21', 0),
(12169, 13, 26, 40, '2026-04-22 08:15:00', '2026-04-22 12:15:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-04-22', 0),
(12170, 13, 27, 40, '2026-04-23 08:00:00', '2026-04-23 10:00:00', 7200, 'Governance & reporting – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-04-23', 0),
(12171, 13, 26, 40, '2026-04-29 08:30:00', '2026-04-29 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-04-29', 0),
(12172, 13, 30, 40, '2026-05-01 08:00:00', '2026-05-01 10:00:00', 7200, 'Training – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-05-01', 0),
(12173, 13, 26, 40, '2026-05-05 08:00:00', '2026-05-05 12:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-05-05', 0),
(12174, 13, 31, 40, '2026-05-07 08:15:00', '2026-05-07 13:15:00', 18000, 'Meetings – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-05-07', 0),
(12175, 13, 26, 40, '2026-05-08 08:30:00', '2026-05-08 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-05-08', 0),
(12176, 13, 26, 40, '2026-05-13 08:15:00', '2026-05-13 10:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-05-13', 0),
(12177, 13, 28, 40, '2026-05-15 08:30:00', '2026-05-15 14:30:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-05-15', 0),
(12178, 13, 29, 40, '2026-05-19 08:15:00', '2026-05-19 14:15:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-05-19', 0),
(12179, 13, 26, 40, '2026-05-21 08:15:00', '2026-05-21 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-05-21', 0),
(12180, 13, 28, 40, '2026-05-25 08:15:00', '2026-05-25 10:15:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-05-25', 0),
(12181, 13, 26, 40, '2026-05-26 08:00:00', '2026-05-26 15:00:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-05-26', 0),
(12182, 13, 26, 40, '2026-05-27 08:30:00', '2026-05-27 14:30:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-05-27', 0),
(12183, 13, 29, 40, '2026-05-28 08:15:00', '2026-05-28 10:15:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-05-28', 0),
(12184, 13, 29, 40, '2026-05-29 08:30:00', '2026-05-29 11:00:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-05-29', 0),
(12185, 13, 26, 40, '2026-06-01 08:00:00', '2026-06-01 11:30:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-06-01', 0),
(12186, 13, 26, 40, '2026-06-03 08:15:00', '2026-06-03 11:15:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-06-03', 0),
(12187, 13, 27, 40, '2026-06-04 08:00:00', '2026-06-04 14:00:00', 21600, 'Governance & reporting – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-06-04', 0),
(12188, 13, 28, 40, '2026-06-05 08:00:00', '2026-06-05 10:00:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-06-05', 0),
(12189, 13, 26, 40, '2026-06-08 08:15:00', '2026-06-08 11:45:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-06-08', 0),
(12190, 13, 26, 40, '2026-06-12 08:30:00', '2026-06-12 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-06-12', 0),
(12191, 13, 29, 40, '2026-06-15 08:15:00', '2026-06-15 10:45:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-06-15', 0),
(12192, 13, 29, 40, '2026-06-16 08:00:00', '2026-06-16 10:00:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-06-16', 0),
(12193, 13, 26, 40, '2026-06-17 08:15:00', '2026-06-17 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-06-17', 0),
(12194, 13, 30, 40, '2026-06-18 08:30:00', '2026-06-18 10:30:00', 7200, 'Training – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-06-18', 0),
(12195, 13, 28, 40, '2026-06-19 08:30:00', '2026-06-19 15:30:00', 25200, 'Stakeholder engagement – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-06-19', 0),
(12196, 13, 29, 40, '2026-06-22 08:30:00', '2026-06-22 11:30:00', 10800, 'Admin & BAU – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-06-22', 0),
(12197, 13, 29, 40, '2026-06-23 08:15:00', '2026-06-23 14:15:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-06-23', 0),
(12198, 13, 26, 40, '2026-06-24 08:00:00', '2026-06-24 10:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-06-24', 0),
(12199, 13, 26, 40, '2026-06-26 08:30:00', '2026-06-26 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-06-26', 0),
(12200, 13, 26, 40, '2026-06-29 08:00:00', '2026-06-29 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-06-29', 0),
(12201, 13, 27, 40, '2026-07-01 08:30:00', '2026-07-01 11:00:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-07-01', 0),
(12202, 13, 28, 40, '2026-07-02 08:15:00', '2026-07-02 11:15:00', 10800, 'Stakeholder engagement – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-07-02', 0),
(12203, 13, 31, 40, '2026-07-03 08:15:00', '2026-07-03 11:15:00', 10800, 'Meetings – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-07-03', 0),
(12204, 13, 26, 40, '2026-07-06 08:30:00', '2026-07-06 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-07-06', 0),
(12205, 13, 26, 40, '2026-07-07 08:00:00', '2026-07-07 10:30:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-07-07', 0),
(12206, 13, 29, 40, '2026-07-10 08:15:00', '2026-07-10 10:15:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-07-10', 0),
(12207, 13, 26, 40, '2026-07-15 08:00:00', '2026-07-15 10:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-07-15', 0),
(12208, 13, 28, 40, '2026-07-16 08:00:00', '2026-07-16 10:30:00', 9000, 'Stakeholder engagement – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-07-16', 0),
(12209, 13, 29, 40, '2026-07-17 08:00:00', '2026-07-17 15:00:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-07-17', 0),
(12210, 13, 30, 40, '2026-07-20 08:15:00', '2026-07-20 10:45:00', 9000, 'Training – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-07-20', 0),
(12211, 13, 26, 40, '2026-07-21 08:15:00', '2026-07-21 10:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-07-21', 0),
(12212, 13, 29, 40, '2026-07-22 08:30:00', '2026-07-22 14:30:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-22', 0),
(12213, 13, 27, 40, '2026-07-23 08:15:00', '2026-07-23 11:45:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-07-23', 0),
(12214, 13, 26, 40, '2026-07-24 08:30:00', '2026-07-24 11:00:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-07-24', 0),
(12215, 13, 31, 40, '2026-07-28 08:15:00', '2026-07-28 14:15:00', 21600, 'Meetings – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-28', 0),
(12216, 13, 27, 40, '2026-07-29 08:30:00', '2026-07-29 13:30:00', 18000, 'Governance & reporting – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-07-29', 0),
(12217, 13, 26, 40, '2026-07-30 08:15:00', '2026-07-30 12:15:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-07-30', 0),
(12218, 13, 26, 40, '2026-07-31 08:30:00', '2026-07-31 14:30:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-07-31', 0),
(12219, 13, 28, 40, '2026-08-03 08:00:00', '2026-08-03 15:00:00', 25200, 'Stakeholder engagement – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-08-03', 0),
(12220, 13, 26, 40, '2026-08-04 08:30:00', '2026-08-04 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-08-04', 0),
(12221, 13, 29, 40, '2026-08-05 08:30:00', '2026-08-05 14:30:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-08-05', 0),
(12222, 13, 26, 40, '2026-08-06 08:00:00', '2026-08-06 10:30:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-08-06', 0),
(12223, 13, 26, 40, '2026-08-07 08:00:00', '2026-08-07 14:00:00', 21600, 'Project delivery – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-08-07', 0),
(12224, 13, 26, 40, '2026-08-11 08:00:00', '2026-08-11 12:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-08-11', 0),
(12225, 13, 26, 40, '2026-08-12 08:15:00', '2026-08-12 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-08-12', 0),
(12226, 13, 26, 40, '2026-08-14 08:30:00', '2026-08-14 13:30:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-08-14', 0),
(12227, 13, 27, 40, '2026-08-17 08:15:00', '2026-08-17 11:45:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-08-17', 0),
(12228, 13, 26, 40, '2026-08-18 08:15:00', '2026-08-18 11:45:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-08-18', 0),
(12229, 13, 26, 40, '2026-08-19 08:15:00', '2026-08-19 10:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-08-19', 0),
(12230, 13, 28, 40, '2026-08-21 08:00:00', '2026-08-21 11:30:00', 12600, 'Stakeholder engagement – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-08-21', 0),
(12231, 13, 26, 40, '2026-08-24 08:30:00', '2026-08-24 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-08-24', 0),
(12232, 13, 26, 40, '2026-08-25 08:30:00', '2026-08-25 12:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-08-25', 0),
(12233, 13, 28, 40, '2026-08-26 08:00:00', '2026-08-26 14:00:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-08-26', 0),
(12234, 13, 29, 40, '2026-08-27 08:30:00', '2026-08-27 11:00:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-08-27', 0),
(12235, 13, 29, 40, '2026-08-28 08:00:00', '2026-08-28 10:00:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-08-28', 0),
(12236, 13, 26, 40, '2026-09-01 08:00:00', '2026-09-01 10:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-09-01', 0),
(12237, 13, 27, 40, '2026-09-02 08:30:00', '2026-09-02 12:00:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-09-02', 0),
(12238, 13, 31, 40, '2026-09-03 08:15:00', '2026-09-03 11:45:00', 12600, 'Meetings – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-09-03', 0),
(12239, 13, 26, 40, '2026-09-04 08:00:00', '2026-09-04 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-09-04', 0),
(12240, 13, 26, 40, '2026-09-07 08:30:00', '2026-09-07 13:30:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-09-07', 0),
(12241, 13, 28, 40, '2026-09-08 08:30:00', '2026-09-08 12:00:00', 12600, 'Stakeholder engagement – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-09-08', 0),
(12242, 13, 26, 40, '2026-09-09 08:15:00', '2026-09-09 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-09-09', 0),
(12243, 13, 29, 40, '2026-09-10 08:00:00', '2026-09-10 12:00:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-09-10', 0),
(12244, 13, 26, 40, '2026-09-11 08:00:00', '2026-09-11 11:30:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-09-11', 0),
(12245, 13, 26, 40, '2026-09-14 08:30:00', '2026-09-14 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-09-14', 0),
(12246, 13, 26, 40, '2026-09-15 08:30:00', '2026-09-15 11:00:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-09-15', 0),
(12247, 13, 26, 40, '2026-09-17 08:30:00', '2026-09-17 12:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-09-17', 0),
(12248, 13, 26, 40, '2026-09-21 08:15:00', '2026-09-21 10:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-09-21', 0),
(12249, 13, 26, 40, '2026-09-23 08:00:00', '2026-09-23 10:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-09-23', 0),
(12250, 13, 27, 40, '2026-09-25 08:00:00', '2026-09-25 10:00:00', 7200, 'Governance & reporting – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-09-25', 0),
(12251, 13, 26, 40, '2026-09-28 08:00:00', '2026-09-28 10:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-09-28', 0),
(12252, 13, 26, 40, '2026-09-30 08:00:00', '2026-09-30 11:30:00', 12600, 'Project delivery – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-09-30', 0),
(12253, 13, 26, 40, '2026-10-01 08:15:00', '2026-10-01 10:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-10-01', 0),
(12254, 13, 31, 40, '2026-10-02 08:30:00', '2026-10-02 12:00:00', 12600, 'Meetings – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-10-02', 0),
(12255, 13, 26, 40, '2026-10-05 08:00:00', '2026-10-05 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-10-05', 0),
(12256, 13, 26, 40, '2026-10-06 08:30:00', '2026-10-06 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-10-06', 0),
(12257, 13, 26, 40, '2026-10-07 08:00:00', '2026-10-07 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-10-07', 0),
(12258, 13, 26, 40, '2026-10-08 08:30:00', '2026-10-08 11:00:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-10-08', 0),
(12259, 13, 28, 40, '2026-10-09 08:30:00', '2026-10-09 14:30:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-10-09', 0),
(12260, 13, 30, 40, '2026-10-12 08:30:00', '2026-10-12 15:30:00', 25200, 'Training – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-10-12', 0),
(12261, 13, 28, 40, '2026-10-13 08:15:00', '2026-10-13 11:45:00', 12600, 'Stakeholder engagement – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-10-13', 0),
(12262, 13, 27, 40, '2026-10-14 08:15:00', '2026-10-14 10:45:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-10-14', 0),
(12263, 13, 27, 40, '2026-10-15 08:00:00', '2026-10-15 11:30:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:31', '2026-10-15', 0),
(12264, 13, 28, 40, '2026-10-16 08:00:00', '2026-10-16 13:00:00', 18000, 'Stakeholder engagement – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-10-16', 0),
(12265, 13, 26, 40, '2026-10-20 08:00:00', '2026-10-20 10:30:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-10-20', 0),
(12266, 13, 30, 40, '2026-10-21 08:30:00', '2026-10-21 12:30:00', 14400, 'Training – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-10-21', 0),
(12267, 13, 26, 40, '2026-10-22 08:15:00', '2026-10-22 13:15:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-10-22', 0),
(12268, 13, 29, 40, '2026-10-23 08:15:00', '2026-10-23 14:15:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-10-23', 0),
(12269, 13, 26, 40, '2026-10-26 09:00:00', '2026-10-26 16:00:00', 25200, 'Project delivery – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-10-26', 0),
(12270, 13, 27, 40, '2026-10-27 09:15:00', '2026-10-27 11:45:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-10-27', 0),
(12271, 13, 27, 40, '2026-10-28 09:30:00', '2026-10-28 15:30:00', 21600, 'Governance & reporting – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-10-28', 0),
(12272, 13, 27, 40, '2026-10-29 09:00:00', '2026-10-29 16:00:00', 25200, 'Governance & reporting – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-10-29', 0),
(12273, 13, 27, 40, '2026-11-02 09:30:00', '2026-11-02 11:30:00', 7200, 'Governance & reporting – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-11-02', 0),
(12274, 13, 28, 40, '2026-11-03 09:30:00', '2026-11-03 15:30:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:31', '2026-11-03', 0),
(12275, 13, 30, 40, '2026-11-04 09:00:00', '2026-11-04 16:00:00', 25200, 'Training – Brownfield Housing Fund', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:31', '2026-11-04', 0),
(12276, 13, 26, 40, '2026-11-05 09:30:00', '2026-11-05 11:30:00', 7200, 'Project delivery – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-11-05', 0),
(12277, 13, 28, 40, '2026-11-06 09:15:00', '2026-11-06 14:15:00', 18000, 'Stakeholder engagement – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-11-06', 0),
(12278, 13, 26, 40, '2026-11-11 09:30:00', '2026-11-11 13:30:00', 14400, 'Project delivery – Brownfield Housing Fund', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:31', '2026-11-11', 0),
(12279, 13, 27, 40, '2026-11-16 09:15:00', '2026-11-16 11:15:00', 7200, 'Governance & reporting – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-11-16', 0),
(12280, 13, 29, 40, '2026-11-17 09:30:00', '2026-11-17 12:00:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-11-17', 0),
(12281, 13, 26, 40, '2026-11-18 09:15:00', '2026-11-18 12:15:00', 10800, 'Project delivery – Brownfield Housing Fund', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:31', '2026-11-18', 0),
(12282, 13, 26, 40, '2026-11-19 09:00:00', '2026-11-19 14:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:31', '2026-11-19', 0),
(12283, 13, 27, 40, '2026-11-25 09:15:00', '2026-11-25 11:45:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-11-25', 0),
(12284, 13, 29, 40, '2026-11-26 09:00:00', '2026-11-26 11:00:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:31', '2026-11-26', 0),
(12285, 13, 26, 40, '2026-11-27 09:15:00', '2026-11-27 11:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:31', '2026-11-27', 0),
(12286, 10, 29, 40, '2026-03-02 09:30:00', '2026-03-02 11:30:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-03-02', 0),
(12287, 10, 26, 40, '2026-03-03 09:15:00', '2026-03-03 15:15:00', 21600, 'Project delivery – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-03-03', 0),
(12288, 10, 26, 40, '2026-03-04 09:00:00', '2026-03-04 12:30:00', 12600, 'Project delivery – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-03-04', 0),
(12289, 10, 29, 40, '2026-03-05 09:30:00', '2026-03-05 16:30:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-03-05', 0),
(12290, 10, 28, 40, '2026-03-11 09:15:00', '2026-03-11 12:15:00', 10800, 'Stakeholder engagement – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-03-11', 0),
(12291, 10, 28, 40, '2026-03-16 09:30:00', '2026-03-16 12:30:00', 10800, 'Stakeholder engagement – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-03-16', 0),
(12292, 10, 29, 40, '2026-03-17 09:30:00', '2026-03-17 14:30:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-03-17', 0),
(12293, 10, 26, 40, '2026-03-19 09:30:00', '2026-03-19 12:00:00', 9000, 'Project delivery – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-03-19', 0),
(12294, 10, 29, 40, '2026-03-24 09:30:00', '2026-03-24 11:30:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-03-24', 0),
(12295, 10, 29, 40, '2026-03-25 09:30:00', '2026-03-25 13:00:00', 12600, 'Admin & BAU – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-03-25', 0),
(12296, 10, 29, 40, '2026-03-31 08:30:00', '2026-03-31 13:30:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-03-31', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(12297, 10, 27, 40, '2026-04-01 08:15:00', '2026-04-01 10:45:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-04-01', 0),
(12298, 10, 29, 40, '2026-04-02 08:15:00', '2026-04-02 15:15:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-04-02', 0),
(12299, 10, 26, 40, '2026-04-06 08:00:00', '2026-04-06 13:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-04-06', 0),
(12300, 10, 26, 40, '2026-04-07 08:00:00', '2026-04-07 14:00:00', 21600, 'Project delivery – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-04-07', 0),
(12301, 10, 26, 40, '2026-04-10 08:15:00', '2026-04-10 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-04-10', 0),
(12302, 10, 26, 40, '2026-04-13 08:15:00', '2026-04-13 11:15:00', 10800, 'Project delivery – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-04-13', 0),
(12303, 10, 29, 40, '2026-04-16 08:15:00', '2026-04-16 15:15:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-04-16', 0),
(12304, 10, 28, 40, '2026-04-17 08:15:00', '2026-04-17 15:15:00', 25200, 'Stakeholder engagement – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-04-17', 0),
(12305, 10, 29, 40, '2026-04-21 08:00:00', '2026-04-21 10:00:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-04-21', 0),
(12306, 10, 26, 40, '2026-04-24 08:15:00', '2026-04-24 10:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-04-24', 0),
(12307, 10, 29, 40, '2026-04-27 08:30:00', '2026-04-27 11:00:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-04-27', 0),
(12308, 10, 30, 40, '2026-05-04 08:30:00', '2026-05-04 14:30:00', 21600, 'Training – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-05-04', 0),
(12309, 10, 27, 40, '2026-05-05 08:30:00', '2026-05-05 11:30:00', 10800, 'Governance & reporting – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-05-05', 0),
(12310, 10, 29, 40, '2026-05-06 08:00:00', '2026-05-06 14:00:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-05-06', 0),
(12311, 10, 26, 40, '2026-05-08 08:30:00', '2026-05-08 13:30:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-05-08', 0),
(12312, 10, 26, 40, '2026-05-11 08:30:00', '2026-05-11 12:30:00', 14400, 'Project delivery – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-05-11', 0),
(12313, 10, 26, 40, '2026-05-12 08:30:00', '2026-05-12 12:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-05-12', 0),
(12314, 10, 29, 40, '2026-05-14 08:00:00', '2026-05-14 12:00:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-05-14', 0),
(12315, 10, 26, 40, '2026-05-15 08:00:00', '2026-05-15 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-05-15', 0),
(12316, 10, 27, 40, '2026-05-18 08:00:00', '2026-05-18 13:00:00', 18000, 'Governance & reporting – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-05-18', 0),
(12317, 10, 26, 40, '2026-05-19 08:30:00', '2026-05-19 14:30:00', 21600, 'Project delivery – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-05-19', 0),
(12318, 10, 29, 40, '2026-05-20 08:15:00', '2026-05-20 11:15:00', 10800, 'Admin & BAU – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-05-20', 0),
(12319, 10, 26, 40, '2026-05-21 08:30:00', '2026-05-21 13:30:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-05-21', 0),
(12320, 10, 27, 40, '2026-05-22 08:00:00', '2026-05-22 11:00:00', 10800, 'Governance & reporting – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-05-22', 0),
(12321, 10, 29, 40, '2026-05-25 08:30:00', '2026-05-25 14:30:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-05-25', 0),
(12322, 10, 27, 40, '2026-05-26 08:30:00', '2026-05-26 13:30:00', 18000, 'Governance & reporting – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-05-26', 0),
(12323, 10, 26, 40, '2026-05-27 08:30:00', '2026-05-27 12:30:00', 14400, 'Project delivery – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-05-27', 0),
(12324, 10, 28, 40, '2026-05-29 08:00:00', '2026-05-29 14:00:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-05-29', 0),
(12325, 10, 26, 40, '2026-06-01 08:00:00', '2026-06-01 13:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-06-01', 0),
(12326, 10, 30, 40, '2026-06-02 08:15:00', '2026-06-02 10:15:00', 7200, 'Training – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-06-02', 0),
(12327, 10, 26, 40, '2026-06-03 08:15:00', '2026-06-03 10:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-06-03', 0),
(12328, 10, 29, 40, '2026-06-04 08:30:00', '2026-06-04 13:30:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-06-04', 0),
(12329, 10, 26, 40, '2026-06-05 08:00:00', '2026-06-05 12:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-06-05', 0),
(12330, 10, 26, 40, '2026-06-08 08:15:00', '2026-06-08 12:15:00', 14400, 'Project delivery – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-06-08', 0),
(12331, 10, 26, 40, '2026-06-09 08:15:00', '2026-06-09 10:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-06-09', 0),
(12332, 10, 26, 40, '2026-06-10 08:15:00', '2026-06-10 11:15:00', 10800, 'Project delivery – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-06-10', 0),
(12333, 10, 27, 40, '2026-06-11 08:30:00', '2026-06-11 12:00:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-06-11', 0),
(12334, 10, 27, 40, '2026-06-12 08:15:00', '2026-06-12 12:15:00', 14400, 'Governance & reporting – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-06-12', 0),
(12335, 10, 27, 40, '2026-06-15 08:00:00', '2026-06-15 11:30:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-06-15', 0),
(12336, 10, 29, 40, '2026-06-17 08:30:00', '2026-06-17 11:00:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-06-17', 0),
(12337, 10, 29, 40, '2026-06-18 08:00:00', '2026-06-18 12:00:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-06-18', 0),
(12338, 10, 26, 40, '2026-06-22 08:15:00', '2026-06-22 13:15:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-06-22', 0),
(12339, 10, 28, 40, '2026-06-24 08:00:00', '2026-06-24 11:30:00', 12600, 'Stakeholder engagement – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-06-24', 0),
(12340, 10, 27, 40, '2026-06-25 08:15:00', '2026-06-25 10:15:00', 7200, 'Governance & reporting – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-06-25', 0),
(12341, 10, 26, 40, '2026-06-29 08:00:00', '2026-06-29 10:00:00', 7200, 'Project delivery – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-06-29', 0),
(12342, 10, 26, 40, '2026-07-01 08:15:00', '2026-07-01 15:15:00', 25200, 'Project delivery – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-07-01', 0),
(12343, 10, 26, 40, '2026-07-02 08:30:00', '2026-07-02 12:00:00', 12600, 'Project delivery – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-07-02', 0),
(12344, 10, 29, 40, '2026-07-06 08:30:00', '2026-07-06 14:30:00', 21600, 'Admin & BAU – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-07-06', 0),
(12345, 10, 29, 40, '2026-07-07 08:00:00', '2026-07-07 12:00:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-07-07', 0),
(12346, 10, 26, 40, '2026-07-08 08:30:00', '2026-07-08 10:30:00', 7200, 'Project delivery – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-07-08', 0),
(12347, 10, 26, 40, '2026-07-10 08:15:00', '2026-07-10 13:15:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-07-10', 0),
(12348, 10, 26, 40, '2026-07-13 08:00:00', '2026-07-13 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-07-13', 0),
(12349, 10, 26, 40, '2026-07-14 08:15:00', '2026-07-14 11:15:00', 10800, 'Project delivery – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-07-14', 0),
(12350, 10, 31, 40, '2026-07-16 08:30:00', '2026-07-16 11:30:00', 10800, 'Meetings – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-07-16', 0),
(12351, 10, 29, 40, '2026-07-17 08:00:00', '2026-07-17 15:00:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-07-17', 0),
(12352, 10, 28, 40, '2026-07-20 08:30:00', '2026-07-20 10:30:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-07-20', 0),
(12353, 10, 29, 40, '2026-07-22 08:30:00', '2026-07-22 10:30:00', 7200, 'Admin & BAU – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-07-22', 0),
(12354, 10, 26, 40, '2026-07-24 08:00:00', '2026-07-24 12:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-07-24', 0),
(12355, 10, 29, 40, '2026-07-27 08:15:00', '2026-07-27 15:15:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-07-27', 0),
(12356, 10, 26, 40, '2026-07-28 08:00:00', '2026-07-28 10:30:00', 9000, 'Project delivery – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-07-28', 0),
(12357, 10, 26, 40, '2026-07-29 08:30:00', '2026-07-29 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-07-29', 0),
(12358, 10, 28, 40, '2026-07-30 08:00:00', '2026-07-30 12:00:00', 14400, 'Stakeholder engagement – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-07-30', 0),
(12359, 10, 28, 40, '2026-08-03 08:15:00', '2026-08-03 11:45:00', 12600, 'Stakeholder engagement – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-08-03', 0),
(12360, 10, 30, 40, '2026-08-06 08:30:00', '2026-08-06 14:30:00', 21600, 'Training – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-08-06', 0),
(12361, 10, 26, 40, '2026-08-10 08:00:00', '2026-08-10 14:00:00', 21600, 'Project delivery – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-08-10', 0),
(12362, 10, 28, 40, '2026-08-11 08:00:00', '2026-08-11 12:00:00', 14400, 'Stakeholder engagement – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-08-11', 0),
(12363, 10, 26, 40, '2026-08-12 08:00:00', '2026-08-12 11:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-08-12', 0),
(12364, 10, 29, 40, '2026-08-13 08:00:00', '2026-08-13 13:00:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-08-13', 0),
(12365, 10, 26, 40, '2026-08-18 08:15:00', '2026-08-18 11:45:00', 12600, 'Project delivery – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-08-18', 0),
(12366, 10, 31, 40, '2026-08-20 08:00:00', '2026-08-20 10:30:00', 9000, 'Meetings – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-08-20', 0),
(12367, 10, 26, 40, '2026-08-24 08:30:00', '2026-08-24 11:00:00', 9000, 'Project delivery – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-08-24', 0),
(12368, 10, 27, 40, '2026-08-26 08:15:00', '2026-08-26 11:45:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-08-26', 0),
(12369, 10, 26, 40, '2026-08-31 08:30:00', '2026-08-31 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-08-31', 0),
(12370, 10, 28, 40, '2026-09-01 08:15:00', '2026-09-01 14:15:00', 21600, 'Stakeholder engagement – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-09-01', 0),
(12371, 10, 26, 40, '2026-09-04 08:30:00', '2026-09-04 13:30:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-09-04', 0),
(12372, 10, 26, 40, '2026-09-07 08:00:00', '2026-09-07 13:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-09-07', 0),
(12373, 10, 26, 40, '2026-09-08 08:15:00', '2026-09-08 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-09-08', 0),
(12374, 10, 26, 40, '2026-09-09 08:30:00', '2026-09-09 15:30:00', 25200, 'Project delivery – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-09-09', 0),
(12375, 10, 27, 40, '2026-09-10 08:30:00', '2026-09-10 14:30:00', 21600, 'Governance & reporting – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-09-10', 0),
(12376, 10, 27, 40, '2026-09-11 08:30:00', '2026-09-11 14:30:00', 21600, 'Governance & reporting – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-09-11', 0),
(12377, 10, 26, 40, '2026-09-14 08:00:00', '2026-09-14 10:30:00', 9000, 'Project delivery – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-09-14', 0),
(12378, 10, 26, 40, '2026-09-15 08:00:00', '2026-09-15 15:00:00', 25200, 'Project delivery – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-09-15', 0),
(12379, 10, 28, 40, '2026-09-16 08:30:00', '2026-09-16 10:30:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-09-16', 0),
(12380, 10, 30, 40, '2026-09-17 08:15:00', '2026-09-17 11:15:00', 10800, 'Training – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-09-17', 0),
(12381, 10, 27, 40, '2026-09-18 08:00:00', '2026-09-18 13:00:00', 18000, 'Governance & reporting – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-09-18', 0),
(12382, 10, 28, 40, '2026-09-21 08:30:00', '2026-09-21 11:30:00', 10800, 'Stakeholder engagement – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-09-21', 0),
(12383, 10, 26, 40, '2026-09-22 08:00:00', '2026-09-22 12:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-09-22', 0),
(12384, 10, 29, 40, '2026-09-24 08:15:00', '2026-09-24 15:15:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-09-24', 0),
(12385, 10, 31, 40, '2026-09-25 08:00:00', '2026-09-25 13:00:00', 18000, 'Meetings – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-09-25', 0),
(12386, 10, 28, 40, '2026-09-28 08:15:00', '2026-09-28 10:15:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-09-28', 0),
(12387, 10, 31, 40, '2026-09-29 08:00:00', '2026-09-29 10:00:00', 7200, 'Meetings – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-09-29', 0),
(12388, 10, 26, 40, '2026-09-30 08:30:00', '2026-09-30 14:30:00', 21600, 'Project delivery – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-09-30', 0),
(12389, 10, 28, 40, '2026-10-01 08:00:00', '2026-10-01 10:00:00', 7200, 'Stakeholder engagement – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-10-01', 0),
(12390, 10, 27, 40, '2026-10-06 08:00:00', '2026-10-06 11:30:00', 12600, 'Governance & reporting – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-10-06', 0),
(12391, 10, 29, 40, '2026-10-08 08:00:00', '2026-10-08 15:00:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-10-08', 0),
(12392, 10, 26, 40, '2026-10-12 08:30:00', '2026-10-12 11:30:00', 10800, 'Project delivery – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-10-12', 0),
(12393, 10, 29, 40, '2026-10-13 08:30:00', '2026-10-13 12:30:00', 14400, 'Admin & BAU – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-10-13', 0),
(12394, 10, 28, 40, '2026-10-14 08:30:00', '2026-10-14 13:30:00', 18000, 'Stakeholder engagement – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-10-14', 0),
(12395, 10, 27, 40, '2026-10-15 08:00:00', '2026-10-15 11:00:00', 10800, 'Governance & reporting – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-10-15', 0),
(12396, 10, 31, 40, '2026-10-16 08:15:00', '2026-10-16 13:15:00', 18000, 'Meetings – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-10-16', 0),
(12397, 10, 26, 40, '2026-10-19 08:15:00', '2026-10-19 14:15:00', 21600, 'Project delivery – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-10-19', 0),
(12398, 10, 29, 40, '2026-10-21 08:00:00', '2026-10-21 15:00:00', 25200, 'Admin & BAU – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-10-21', 0),
(12399, 10, 26, 40, '2026-10-23 08:15:00', '2026-10-23 10:15:00', 7200, 'Project delivery – Brownfield Housing Fund', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:31', '2026-10-23', 0),
(12400, 10, 27, 40, '2026-10-29 09:00:00', '2026-10-29 13:00:00', 14400, 'Governance & reporting – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:31', '2026-10-29', 0),
(12401, 10, 28, 40, '2026-10-30 09:00:00', '2026-10-30 12:30:00', 12600, 'Stakeholder engagement – Brownfield Housing Fund', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:31', '2026-10-30', 0),
(12402, 10, 31, 40, '2026-11-02 09:00:00', '2026-11-02 15:00:00', 21600, 'Meetings – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:31', '2026-11-02', 0),
(12403, 10, 26, 40, '2026-11-03 09:00:00', '2026-11-03 14:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-11-03', 0),
(12404, 10, 29, 40, '2026-11-04 09:00:00', '2026-11-04 14:00:00', 18000, 'Admin & BAU – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-11-04', 0),
(12405, 10, 26, 40, '2026-11-05 09:00:00', '2026-11-05 14:00:00', 18000, 'Project delivery – Brownfield Housing Fund', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:31', '2026-11-05', 0),
(12406, 10, 29, 40, '2026-11-10 09:15:00', '2026-11-10 12:15:00', 10800, 'Admin & BAU – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-11-10', 0),
(12407, 10, 29, 40, '2026-11-11 09:00:00', '2026-11-11 11:30:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-11-11', 0),
(12408, 10, 27, 40, '2026-11-12 09:15:00', '2026-11-12 11:45:00', 9000, 'Governance & reporting – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-11-12', 0),
(12409, 10, 27, 40, '2026-11-13 09:15:00', '2026-11-13 12:15:00', 10800, 'Governance & reporting – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:31', '2026-11-13', 0),
(12410, 10, 26, 40, '2026-11-16 09:15:00', '2026-11-16 16:15:00', 25200, 'Project delivery – Brownfield Housing Fund', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:31', '2026-11-16', 0),
(12411, 10, 26, 40, '2026-11-17 09:15:00', '2026-11-17 11:45:00', 9000, 'Project delivery – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:31', '2026-11-17', 0),
(12412, 10, 29, 40, '2026-11-18 09:30:00', '2026-11-18 12:00:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-11-18', 0),
(12413, 10, 26, 40, '2026-11-20 09:00:00', '2026-11-20 12:00:00', 10800, 'Project delivery – Brownfield Housing Fund', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-11-20', 0),
(12414, 10, 26, 40, '2026-11-24 09:00:00', '2026-11-24 13:00:00', 14400, 'Project delivery – Brownfield Housing Fund', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-11-24', 0),
(12415, 10, 29, 40, '2026-11-26 09:30:00', '2026-11-26 12:00:00', 9000, 'Admin & BAU – Brownfield Housing Fund', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-11-26', 0),
(12416, 10, 26, 40, '2026-11-27 09:15:00', '2026-11-27 15:15:00', 21600, 'Project delivery – Brownfield Housing Fund', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-11-27', 0),
(12417, 13, 28, 41, '2026-04-06 08:00:00', '2026-04-06 11:30:00', 12600, 'Stakeholder engagement – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-04-06', 0),
(12418, 13, 27, 41, '2026-04-07 08:00:00', '2026-04-07 11:00:00', 10800, 'Governance & reporting – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-04-07', 0),
(12419, 13, 28, 41, '2026-04-08 08:30:00', '2026-04-08 12:30:00', 14400, 'Stakeholder engagement – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-04-08', 0),
(12420, 13, 29, 41, '2026-04-09 08:30:00', '2026-04-09 11:00:00', 9000, 'Admin & BAU – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-04-09', 0),
(12421, 13, 26, 41, '2026-04-10 08:00:00', '2026-04-10 15:00:00', 25200, 'Project delivery – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-04-10', 0),
(12422, 13, 26, 41, '2026-04-13 08:30:00', '2026-04-13 13:30:00', 18000, 'Project delivery – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-04-13', 0),
(12423, 13, 27, 41, '2026-04-14 08:30:00', '2026-04-14 11:30:00', 10800, 'Governance & reporting – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-04-14', 0),
(12424, 13, 28, 41, '2026-04-16 08:30:00', '2026-04-16 11:00:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-04-16', 0),
(12425, 13, 28, 41, '2026-04-17 08:30:00', '2026-04-17 11:30:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-04-17', 0),
(12426, 13, 26, 41, '2026-04-21 08:15:00', '2026-04-21 10:15:00', 7200, 'Project delivery – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-04-21', 0),
(12427, 13, 26, 41, '2026-04-22 08:30:00', '2026-04-22 14:30:00', 21600, 'Project delivery – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-04-22', 0),
(12428, 13, 26, 41, '2026-04-24 08:15:00', '2026-04-24 10:15:00', 7200, 'Project delivery – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-04-24', 0),
(12429, 13, 29, 41, '2026-04-27 08:00:00', '2026-04-27 10:30:00', 9000, 'Admin & BAU – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-04-27', 0),
(12430, 13, 29, 41, '2026-04-28 08:30:00', '2026-04-28 12:30:00', 14400, 'Admin & BAU – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-04-28', 0),
(12431, 13, 27, 41, '2026-04-29 08:15:00', '2026-04-29 13:15:00', 18000, 'Governance & reporting – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-04-29', 0),
(12432, 13, 26, 41, '2026-04-30 08:30:00', '2026-04-30 15:30:00', 25200, 'Project delivery – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-04-30', 0),
(12433, 13, 26, 41, '2026-05-01 08:15:00', '2026-05-01 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-05-01', 0),
(12434, 13, 29, 41, '2026-05-05 08:15:00', '2026-05-05 10:15:00', 7200, 'Admin & BAU – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-05-05', 0),
(12435, 13, 27, 41, '2026-05-06 08:15:00', '2026-05-06 15:15:00', 25200, 'Governance & reporting – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-05-06', 0),
(12436, 13, 27, 41, '2026-05-07 08:30:00', '2026-05-07 15:30:00', 25200, 'Governance & reporting – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-05-07', 0),
(12437, 13, 26, 41, '2026-05-08 08:30:00', '2026-05-08 11:00:00', 9000, 'Project delivery – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-05-08', 0),
(12438, 13, 28, 41, '2026-05-11 08:30:00', '2026-05-11 11:00:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-05-11', 0),
(12439, 13, 26, 41, '2026-05-12 08:30:00', '2026-05-12 13:30:00', 18000, 'Project delivery – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-05-12', 0),
(12440, 13, 28, 41, '2026-05-14 08:15:00', '2026-05-14 11:15:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-05-14', 0),
(12441, 13, 27, 41, '2026-05-15 08:30:00', '2026-05-15 12:30:00', 14400, 'Governance & reporting – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-05-15', 0),
(12442, 13, 31, 41, '2026-05-18 08:15:00', '2026-05-18 11:15:00', 10800, 'Meetings – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-05-18', 0),
(12443, 13, 28, 41, '2026-05-19 08:00:00', '2026-05-19 11:00:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-05-19', 0),
(12444, 13, 26, 41, '2026-05-20 08:00:00', '2026-05-20 13:00:00', 18000, 'Project delivery – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-05-20', 0),
(12445, 13, 26, 41, '2026-05-21 08:15:00', '2026-05-21 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-05-21', 0),
(12446, 13, 26, 41, '2026-05-22 08:15:00', '2026-05-22 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-05-22', 0),
(12447, 13, 26, 41, '2026-05-26 08:00:00', '2026-05-26 11:30:00', 12600, 'Project delivery – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-05-26', 0),
(12448, 13, 28, 41, '2026-05-28 08:00:00', '2026-05-28 12:00:00', 14400, 'Stakeholder engagement – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-05-28', 0),
(12449, 13, 29, 41, '2026-05-29 08:30:00', '2026-05-29 13:30:00', 18000, 'Admin & BAU – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-05-29', 0),
(12450, 13, 27, 41, '2026-06-01 08:30:00', '2026-06-01 11:00:00', 9000, 'Governance & reporting – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-06-01', 0),
(12451, 13, 26, 41, '2026-06-02 08:00:00', '2026-06-02 10:30:00', 9000, 'Project delivery – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-06-02', 0),
(12452, 13, 26, 41, '2026-06-04 08:00:00', '2026-06-04 12:00:00', 14400, 'Project delivery – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-06-04', 0),
(12453, 13, 29, 41, '2026-06-05 08:00:00', '2026-06-05 11:00:00', 10800, 'Admin & BAU – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-06-05', 0),
(12454, 13, 27, 41, '2026-06-08 08:15:00', '2026-06-08 10:45:00', 9000, 'Governance & reporting – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-06-08', 0),
(12455, 13, 26, 41, '2026-06-09 08:30:00', '2026-06-09 14:30:00', 21600, 'Project delivery – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-06-09', 0),
(12456, 13, 27, 41, '2026-06-10 08:30:00', '2026-06-10 14:30:00', 21600, 'Governance & reporting – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-06-10', 0),
(12457, 13, 29, 41, '2026-06-11 08:00:00', '2026-06-11 11:00:00', 10800, 'Admin & BAU – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-06-11', 0),
(12458, 13, 26, 41, '2026-06-12 08:30:00', '2026-06-12 11:30:00', 10800, 'Project delivery – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-06-12', 0),
(12459, 13, 28, 41, '2026-06-15 08:30:00', '2026-06-15 13:30:00', 18000, 'Stakeholder engagement – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-06-15', 0),
(12460, 13, 26, 41, '2026-06-16 08:30:00', '2026-06-16 11:00:00', 9000, 'Project delivery – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-06-16', 0),
(12461, 13, 30, 41, '2026-06-18 08:00:00', '2026-06-18 10:00:00', 7200, 'Training – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-06-18', 0),
(12462, 13, 26, 41, '2026-06-19 08:00:00', '2026-06-19 13:00:00', 18000, 'Project delivery – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-06-19', 0),
(12463, 13, 27, 41, '2026-06-22 08:15:00', '2026-06-22 14:15:00', 21600, 'Governance & reporting – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-06-22', 0),
(12464, 13, 26, 41, '2026-06-23 08:30:00', '2026-06-23 13:30:00', 18000, 'Project delivery – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-06-23', 0),
(12465, 13, 26, 41, '2026-06-24 08:30:00', '2026-06-24 11:00:00', 9000, 'Project delivery – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-06-24', 0),
(12466, 13, 28, 41, '2026-06-25 08:30:00', '2026-06-25 15:30:00', 25200, 'Stakeholder engagement – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-06-25', 0),
(12467, 13, 30, 41, '2026-06-29 08:15:00', '2026-06-29 15:15:00', 25200, 'Training – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-06-29', 0),
(12468, 13, 29, 41, '2026-06-30 08:15:00', '2026-06-30 13:15:00', 18000, 'Admin & BAU – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-06-30', 0),
(12469, 13, 26, 41, '2026-07-02 08:00:00', '2026-07-02 12:00:00', 14400, 'Project delivery – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-07-02', 0),
(12470, 13, 26, 41, '2026-07-03 08:30:00', '2026-07-03 13:30:00', 18000, 'Project delivery – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-07-03', 0),
(12471, 13, 26, 41, '2026-07-06 08:15:00', '2026-07-06 10:45:00', 9000, 'Project delivery – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-07-06', 0),
(12472, 13, 26, 41, '2026-07-07 08:30:00', '2026-07-07 14:30:00', 21600, 'Project delivery – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-07-07', 0),
(12473, 13, 27, 41, '2026-07-08 08:30:00', '2026-07-08 11:00:00', 9000, 'Governance & reporting – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-07-08', 0),
(12474, 13, 26, 41, '2026-07-09 08:30:00', '2026-07-09 11:00:00', 9000, 'Project delivery – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-07-09', 0),
(12475, 13, 27, 41, '2026-07-13 08:00:00', '2026-07-13 14:00:00', 21600, 'Governance & reporting – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-07-13', 0),
(12476, 13, 27, 41, '2026-07-14 08:00:00', '2026-07-14 11:00:00', 10800, 'Governance & reporting – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-07-14', 0),
(12477, 13, 26, 41, '2026-07-15 08:15:00', '2026-07-15 11:45:00', 12600, 'Project delivery – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-07-15', 0),
(12478, 13, 26, 41, '2026-07-17 08:15:00', '2026-07-17 15:15:00', 25200, 'Project delivery – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-07-17', 0),
(12479, 13, 26, 41, '2026-07-22 08:15:00', '2026-07-22 10:15:00', 7200, 'Project delivery – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-07-22', 0),
(12480, 13, 28, 41, '2026-07-23 08:00:00', '2026-07-23 10:00:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-07-23', 0),
(12481, 13, 29, 41, '2026-07-24 08:00:00', '2026-07-24 12:00:00', 14400, 'Admin & BAU – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-07-24', 0),
(12482, 13, 26, 41, '2026-07-27 08:00:00', '2026-07-27 15:00:00', 25200, 'Project delivery – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-07-27', 0),
(12483, 13, 31, 41, '2026-07-28 08:15:00', '2026-07-28 10:15:00', 7200, 'Meetings – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-07-28', 0),
(12484, 13, 26, 41, '2026-07-30 08:00:00', '2026-07-30 10:00:00', 7200, 'Project delivery – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-07-30', 0),
(12485, 13, 29, 41, '2026-07-31 08:30:00', '2026-07-31 11:30:00', 10800, 'Admin & BAU – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-07-31', 0),
(12486, 13, 27, 41, '2026-08-03 08:30:00', '2026-08-03 11:00:00', 9000, 'Governance & reporting – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-08-03', 0),
(12487, 13, 30, 41, '2026-08-04 08:00:00', '2026-08-04 14:00:00', 21600, 'Training – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-08-04', 0),
(12488, 13, 27, 41, '2026-08-06 08:00:00', '2026-08-06 11:00:00', 10800, 'Governance & reporting – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-08-06', 0),
(12489, 13, 27, 41, '2026-08-07 08:15:00', '2026-08-07 11:45:00', 12600, 'Governance & reporting – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-08-07', 0),
(12490, 13, 28, 41, '2026-08-10 08:30:00', '2026-08-10 10:30:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-08-10', 0),
(12491, 13, 27, 41, '2026-08-11 08:15:00', '2026-08-11 12:15:00', 14400, 'Governance & reporting – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-08-11', 0),
(12492, 13, 28, 41, '2026-08-12 08:00:00', '2026-08-12 11:30:00', 12600, 'Stakeholder engagement – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-08-12', 0),
(12493, 13, 28, 41, '2026-08-13 08:15:00', '2026-08-13 12:15:00', 14400, 'Stakeholder engagement – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-08-13', 0),
(12494, 13, 29, 41, '2026-08-14 08:15:00', '2026-08-14 10:15:00', 7200, 'Admin & BAU – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-08-14', 0),
(12495, 13, 29, 41, '2026-08-19 08:00:00', '2026-08-19 11:00:00', 10800, 'Admin & BAU – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-08-19', 0),
(12496, 13, 31, 41, '2026-08-24 08:30:00', '2026-08-24 11:00:00', 9000, 'Meetings – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-08-24', 0),
(12497, 13, 29, 41, '2026-08-26 08:30:00', '2026-08-26 12:00:00', 12600, 'Admin & BAU – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-08-26', 0),
(12498, 13, 26, 41, '2026-08-27 08:15:00', '2026-08-27 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-08-27', 0),
(12499, 13, 27, 41, '2026-08-28 08:30:00', '2026-08-28 10:30:00', 7200, 'Governance & reporting – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-08-28', 0),
(12500, 13, 27, 41, '2026-08-31 08:30:00', '2026-08-31 11:00:00', 9000, 'Governance & reporting – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-08-31', 0),
(12501, 13, 28, 41, '2026-09-03 08:30:00', '2026-09-03 10:30:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-09-03', 0),
(12502, 13, 29, 41, '2026-09-08 08:00:00', '2026-09-08 15:00:00', 25200, 'Admin & BAU – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-09-08', 0),
(12503, 13, 26, 41, '2026-09-10 08:00:00', '2026-09-10 11:00:00', 10800, 'Project delivery – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-09-10', 0),
(12504, 13, 26, 41, '2026-09-11 08:15:00', '2026-09-11 11:45:00', 12600, 'Project delivery – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-09-11', 0),
(12505, 13, 29, 41, '2026-09-16 08:15:00', '2026-09-16 11:15:00', 10800, 'Admin & BAU – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-09-16', 0),
(12506, 13, 28, 41, '2026-09-17 08:30:00', '2026-09-17 11:00:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-09-17', 0),
(12507, 13, 28, 41, '2026-09-21 08:00:00', '2026-09-21 10:00:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-09-21', 0),
(12508, 13, 27, 41, '2026-09-22 08:15:00', '2026-09-22 12:15:00', 14400, 'Governance & reporting – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-09-22', 0),
(12509, 13, 31, 41, '2026-09-23 08:30:00', '2026-09-23 12:00:00', 12600, 'Meetings – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-09-23', 0),
(12510, 13, 26, 41, '2026-09-24 08:30:00', '2026-09-24 14:30:00', 21600, 'Project delivery – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-09-24', 0),
(12511, 13, 28, 41, '2026-09-25 08:30:00', '2026-09-25 15:30:00', 25200, 'Stakeholder engagement – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-09-25', 0),
(12512, 13, 29, 41, '2026-09-29 08:15:00', '2026-09-29 13:15:00', 18000, 'Admin & BAU – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-09-29', 0),
(12513, 13, 29, 41, '2026-09-30 08:15:00', '2026-09-30 10:45:00', 9000, 'Admin & BAU – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-09-30', 0),
(12514, 13, 30, 41, '2026-10-01 08:00:00', '2026-10-01 11:00:00', 10800, 'Training – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-10-01', 0),
(12515, 13, 28, 41, '2026-10-02 08:00:00', '2026-10-02 14:00:00', 21600, 'Stakeholder engagement – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-10-02', 0),
(12516, 13, 29, 41, '2026-10-06 08:30:00', '2026-10-06 15:30:00', 25200, 'Admin & BAU – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-10-06', 0),
(12517, 13, 28, 41, '2026-10-08 08:30:00', '2026-10-08 10:30:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-10-08', 0),
(12518, 13, 27, 41, '2026-10-09 08:15:00', '2026-10-09 11:45:00', 12600, 'Governance & reporting – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-10-09', 0),
(12519, 13, 27, 41, '2026-10-12 08:15:00', '2026-10-12 13:15:00', 18000, 'Governance & reporting – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-10-12', 0),
(12520, 13, 28, 41, '2026-10-13 08:15:00', '2026-10-13 10:45:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-10-13', 0),
(12521, 13, 26, 41, '2026-10-14 08:15:00', '2026-10-14 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-10-14', 0),
(12522, 13, 29, 41, '2026-10-16 08:15:00', '2026-10-16 15:15:00', 25200, 'Admin & BAU – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-10-16', 0),
(12523, 13, 26, 41, '2026-10-19 08:00:00', '2026-10-19 10:00:00', 7200, 'Project delivery – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-10-19', 0),
(12524, 13, 27, 41, '2026-10-20 08:15:00', '2026-10-20 10:45:00', 9000, 'Governance & reporting – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-10-20', 0),
(12525, 13, 30, 41, '2026-10-22 08:30:00', '2026-10-22 10:30:00', 7200, 'Training – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-10-22', 0),
(12526, 13, 26, 41, '2026-10-23 08:15:00', '2026-10-23 12:15:00', 14400, 'Project delivery – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-10-23', 0),
(12527, 13, 28, 41, '2026-10-26 09:30:00', '2026-10-26 15:30:00', 21600, 'Stakeholder engagement – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-10-26', 0),
(12528, 13, 27, 41, '2026-10-27 09:30:00', '2026-10-27 12:00:00', 9000, 'Governance & reporting – Skills Bootcamps', 80, NULL, 32, 0, 'Europe/London', 70, 1, 'work', '2026-11-28 10:30:32', '2026-10-27', 0),
(12529, 13, 26, 41, '2026-10-29 09:30:00', '2026-10-29 12:30:00', 10800, 'Project delivery – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-10-29', 0),
(12530, 13, 29, 41, '2026-11-04 09:00:00', '2026-11-04 13:00:00', 14400, 'Admin & BAU – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-11-04', 0),
(12531, 13, 26, 41, '2026-11-05 09:15:00', '2026-11-05 12:45:00', 12600, 'Project delivery – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-11-05', 0),
(12532, 13, 31, 41, '2026-11-06 09:00:00', '2026-11-06 16:00:00', 25200, 'Meetings – Skills Bootcamps', 224, NULL, 32, 0, 'Europe/London', 196, 1, 'work', '2026-11-28 10:30:32', '2026-11-06', 0),
(12533, 13, 26, 41, '2026-11-12 09:00:00', '2026-11-12 14:00:00', 18000, 'Project delivery – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-11-12', 0),
(12534, 13, 29, 41, '2026-11-13 09:30:00', '2026-11-13 14:30:00', 18000, 'Admin & BAU – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-11-13', 0),
(12535, 13, 30, 41, '2026-11-16 09:15:00', '2026-11-16 11:15:00', 7200, 'Training – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-11-16', 0),
(12536, 13, 26, 41, '2026-11-17 09:30:00', '2026-11-17 15:30:00', 21600, 'Project delivery – Skills Bootcamps', 192, NULL, 32, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-11-17', 0),
(12537, 13, 27, 41, '2026-11-18 09:15:00', '2026-11-18 13:15:00', 14400, 'Governance & reporting – Skills Bootcamps', 128, NULL, 32, 0, 'Europe/London', 112, 1, 'work', '2026-11-28 10:30:32', '2026-11-18', 0),
(12538, 13, 28, 41, '2026-11-19 09:30:00', '2026-11-19 12:30:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-11-19', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(12539, 13, 28, 41, '2026-11-20 09:30:00', '2026-11-20 12:30:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 96, NULL, 32, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-11-20', 0),
(12540, 13, 28, 41, '2026-11-24 09:30:00', '2026-11-24 13:00:00', 12600, 'Stakeholder engagement – Skills Bootcamps', 112, NULL, 32, 0, 'Europe/London', 98, 1, 'work', '2026-11-28 10:30:32', '2026-11-24', 0),
(12541, 13, 26, 41, '2026-11-25 09:30:00', '2026-11-25 14:30:00', 18000, 'Project delivery – Skills Bootcamps', 160, NULL, 32, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-11-25', 0),
(12542, 13, 26, 41, '2026-11-26 09:30:00', '2026-11-26 11:30:00', 7200, 'Project delivery – Skills Bootcamps', 64, NULL, 32, 0, 'Europe/London', 56, 1, 'work', '2026-11-28 10:30:32', '2026-11-26', 0),
(12543, 10, 27, 41, '2026-04-07 08:00:00', '2026-04-07 15:00:00', 25200, 'Governance & reporting – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-04-07', 0),
(12544, 10, 26, 41, '2026-04-08 08:00:00', '2026-04-08 11:30:00', 12600, 'Project delivery – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-04-08', 0),
(12545, 10, 31, 41, '2026-04-09 08:30:00', '2026-04-09 10:30:00', 7200, 'Meetings – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-04-09', 0),
(12546, 10, 26, 41, '2026-04-10 08:30:00', '2026-04-10 11:00:00', 9000, 'Project delivery – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-04-10', 0),
(12547, 10, 29, 41, '2026-04-13 08:30:00', '2026-04-13 14:30:00', 21600, 'Admin & BAU – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-04-13', 0),
(12548, 10, 30, 41, '2026-04-15 08:00:00', '2026-04-15 15:00:00', 25200, 'Training – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-04-15', 0),
(12549, 10, 29, 41, '2026-04-20 08:15:00', '2026-04-20 14:15:00', 21600, 'Admin & BAU – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-04-20', 0),
(12550, 10, 27, 41, '2026-04-21 08:15:00', '2026-04-21 12:15:00', 14400, 'Governance & reporting – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-04-21', 0),
(12551, 10, 26, 41, '2026-04-22 08:15:00', '2026-04-22 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-04-22', 0),
(12552, 10, 29, 41, '2026-04-23 08:00:00', '2026-04-23 12:00:00', 14400, 'Admin & BAU – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-04-23', 0),
(12553, 10, 27, 41, '2026-04-28 08:15:00', '2026-04-28 10:45:00', 9000, 'Governance & reporting – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-04-28', 0),
(12554, 10, 29, 41, '2026-04-29 08:00:00', '2026-04-29 11:30:00', 12600, 'Admin & BAU – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-04-29', 0),
(12555, 10, 26, 41, '2026-04-30 08:00:00', '2026-04-30 11:30:00', 12600, 'Project delivery – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-04-30', 0),
(12556, 10, 29, 41, '2026-05-01 08:00:00', '2026-05-01 11:30:00', 12600, 'Admin & BAU – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-05-01', 0),
(12557, 10, 26, 41, '2026-05-04 08:00:00', '2026-05-04 14:00:00', 21600, 'Project delivery – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-05-04', 0),
(12558, 10, 26, 41, '2026-05-05 08:00:00', '2026-05-05 12:00:00', 14400, 'Project delivery – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-05-05', 0),
(12559, 10, 26, 41, '2026-05-06 08:30:00', '2026-05-06 11:30:00', 10800, 'Project delivery – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-05-06', 0),
(12560, 10, 30, 41, '2026-05-07 08:00:00', '2026-05-07 15:00:00', 25200, 'Training – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-05-07', 0),
(12561, 10, 31, 41, '2026-05-08 08:30:00', '2026-05-08 13:30:00', 18000, 'Meetings – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-05-08', 0),
(12562, 10, 30, 41, '2026-05-11 08:30:00', '2026-05-11 15:30:00', 25200, 'Training – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-05-11', 0),
(12563, 10, 27, 41, '2026-05-12 08:00:00', '2026-05-12 11:00:00', 10800, 'Governance & reporting – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-05-12', 0),
(12564, 10, 29, 41, '2026-05-13 08:30:00', '2026-05-13 15:30:00', 25200, 'Admin & BAU – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-05-13', 0),
(12565, 10, 27, 41, '2026-05-14 08:15:00', '2026-05-14 10:45:00', 9000, 'Governance & reporting – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-05-14', 0),
(12566, 10, 26, 41, '2026-05-15 08:15:00', '2026-05-15 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-05-15', 0),
(12567, 10, 27, 41, '2026-05-18 08:00:00', '2026-05-18 10:00:00', 7200, 'Governance & reporting – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-05-18', 0),
(12568, 10, 27, 41, '2026-05-19 08:30:00', '2026-05-19 11:30:00', 10800, 'Governance & reporting – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-05-19', 0),
(12569, 10, 28, 41, '2026-05-20 08:30:00', '2026-05-20 11:30:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-05-20', 0),
(12570, 10, 28, 41, '2026-05-21 08:00:00', '2026-05-21 13:00:00', 18000, 'Stakeholder engagement – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-05-21', 0),
(12571, 10, 27, 41, '2026-05-26 08:00:00', '2026-05-26 12:00:00', 14400, 'Governance & reporting – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-05-26', 0),
(12572, 10, 29, 41, '2026-05-27 08:15:00', '2026-05-27 11:45:00', 12600, 'Admin & BAU – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-05-27', 0),
(12573, 10, 30, 41, '2026-05-28 08:15:00', '2026-05-28 13:15:00', 18000, 'Training – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-05-28', 0),
(12574, 10, 27, 41, '2026-06-01 08:15:00', '2026-06-01 11:15:00', 10800, 'Governance & reporting – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-06-01', 0),
(12575, 10, 26, 41, '2026-06-03 08:00:00', '2026-06-03 15:00:00', 25200, 'Project delivery – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-06-03', 0),
(12576, 10, 26, 41, '2026-06-04 08:15:00', '2026-06-04 12:15:00', 14400, 'Project delivery – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-06-04', 0),
(12577, 10, 29, 41, '2026-06-05 08:30:00', '2026-06-05 11:00:00', 9000, 'Admin & BAU – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-06-05', 0),
(12578, 10, 26, 41, '2026-06-10 08:30:00', '2026-06-10 13:30:00', 18000, 'Project delivery – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-06-10', 0),
(12579, 10, 27, 41, '2026-06-11 08:15:00', '2026-06-11 15:15:00', 25200, 'Governance & reporting – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-06-11', 0),
(12580, 10, 29, 41, '2026-06-16 08:00:00', '2026-06-16 10:00:00', 7200, 'Admin & BAU – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-06-16', 0),
(12581, 10, 26, 41, '2026-06-18 08:15:00', '2026-06-18 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-06-18', 0),
(12582, 10, 31, 41, '2026-06-19 08:30:00', '2026-06-19 12:30:00', 14400, 'Meetings – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-06-19', 0),
(12583, 10, 31, 41, '2026-06-22 08:00:00', '2026-06-22 12:00:00', 14400, 'Meetings – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-06-22', 0),
(12584, 10, 28, 41, '2026-06-23 08:00:00', '2026-06-23 11:00:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-06-23', 0),
(12585, 10, 26, 41, '2026-06-24 08:00:00', '2026-06-24 13:00:00', 18000, 'Project delivery – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-06-24', 0),
(12586, 10, 31, 41, '2026-06-25 08:00:00', '2026-06-25 12:00:00', 14400, 'Meetings – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-06-25', 0),
(12587, 10, 26, 41, '2026-06-26 08:30:00', '2026-06-26 13:30:00', 18000, 'Project delivery – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-06-26', 0),
(12588, 10, 31, 41, '2026-06-29 08:00:00', '2026-06-29 11:30:00', 12600, 'Meetings – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-06-29', 0),
(12589, 10, 30, 41, '2026-07-01 08:15:00', '2026-07-01 14:15:00', 21600, 'Training – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-07-01', 0),
(12590, 10, 26, 41, '2026-07-06 08:15:00', '2026-07-06 14:15:00', 21600, 'Project delivery – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-07-06', 0),
(12591, 10, 30, 41, '2026-07-07 08:00:00', '2026-07-07 11:30:00', 12600, 'Training – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-07-07', 0),
(12592, 10, 27, 41, '2026-07-08 08:30:00', '2026-07-08 15:30:00', 25200, 'Governance & reporting – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-07-08', 0),
(12593, 10, 26, 41, '2026-07-09 08:00:00', '2026-07-09 11:30:00', 12600, 'Project delivery – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-07-09', 0),
(12594, 10, 29, 41, '2026-07-14 08:00:00', '2026-07-14 11:30:00', 12600, 'Admin & BAU – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-07-14', 0),
(12595, 10, 27, 41, '2026-07-15 08:15:00', '2026-07-15 10:45:00', 9000, 'Governance & reporting – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-07-15', 0),
(12596, 10, 29, 41, '2026-07-16 08:00:00', '2026-07-16 14:00:00', 21600, 'Admin & BAU – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-07-16', 0),
(12597, 10, 28, 41, '2026-07-17 08:30:00', '2026-07-17 13:30:00', 18000, 'Stakeholder engagement – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-07-17', 0),
(12598, 10, 27, 41, '2026-07-20 08:15:00', '2026-07-20 10:45:00', 9000, 'Governance & reporting – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-07-20', 0),
(12599, 10, 27, 41, '2026-07-21 08:00:00', '2026-07-21 15:00:00', 25200, 'Governance & reporting – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-07-21', 0),
(12600, 10, 29, 41, '2026-07-23 08:15:00', '2026-07-23 11:45:00', 12600, 'Admin & BAU – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-07-23', 0),
(12601, 10, 28, 41, '2026-07-24 08:15:00', '2026-07-24 10:45:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-07-24', 0),
(12602, 10, 31, 41, '2026-07-27 08:15:00', '2026-07-27 13:15:00', 18000, 'Meetings – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-07-27', 0),
(12603, 10, 26, 41, '2026-07-28 08:15:00', '2026-07-28 10:45:00', 9000, 'Project delivery – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-07-28', 0),
(12604, 10, 26, 41, '2026-07-29 08:30:00', '2026-07-29 10:30:00', 7200, 'Project delivery – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-07-29', 0),
(12605, 10, 28, 41, '2026-07-30 08:00:00', '2026-07-30 11:00:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-07-30', 0),
(12606, 10, 29, 41, '2026-08-04 08:30:00', '2026-08-04 11:00:00', 9000, 'Admin & BAU – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-08-04', 0),
(12607, 10, 29, 41, '2026-08-05 08:15:00', '2026-08-05 10:15:00', 7200, 'Admin & BAU – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-08-05', 0),
(12608, 10, 28, 41, '2026-08-06 08:15:00', '2026-08-06 15:15:00', 25200, 'Stakeholder engagement – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-08-06', 0),
(12609, 10, 29, 41, '2026-08-07 08:00:00', '2026-08-07 13:00:00', 18000, 'Admin & BAU – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-08-07', 0),
(12610, 10, 28, 41, '2026-08-10 08:15:00', '2026-08-10 10:45:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-08-10', 0),
(12611, 10, 26, 41, '2026-08-12 08:15:00', '2026-08-12 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-08-12', 0),
(12612, 10, 26, 41, '2026-08-14 08:15:00', '2026-08-14 11:45:00', 12600, 'Project delivery – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-08-14', 0),
(12613, 10, 26, 41, '2026-08-20 08:30:00', '2026-08-20 12:00:00', 12600, 'Project delivery – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-08-20', 0),
(12614, 10, 26, 41, '2026-08-21 08:00:00', '2026-08-21 14:00:00', 21600, 'Project delivery – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-08-21', 0),
(12615, 10, 29, 41, '2026-08-24 08:15:00', '2026-08-24 14:15:00', 21600, 'Admin & BAU – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-08-24', 0),
(12616, 10, 28, 41, '2026-08-25 08:30:00', '2026-08-25 11:30:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-08-25', 0),
(12617, 10, 27, 41, '2026-08-26 08:00:00', '2026-08-26 11:00:00', 10800, 'Governance & reporting – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-08-26', 0),
(12618, 10, 26, 41, '2026-08-27 08:15:00', '2026-08-27 12:15:00', 14400, 'Project delivery – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-08-27', 0),
(12619, 10, 29, 41, '2026-08-28 08:00:00', '2026-08-28 11:00:00', 10800, 'Admin & BAU – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-08-28', 0),
(12620, 10, 29, 41, '2026-09-01 08:30:00', '2026-09-01 11:30:00', 10800, 'Admin & BAU – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-09-01', 0),
(12621, 10, 30, 41, '2026-09-02 08:15:00', '2026-09-02 12:15:00', 14400, 'Training – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-09-02', 0),
(12622, 10, 28, 41, '2026-09-04 08:00:00', '2026-09-04 10:00:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-09-04', 0),
(12623, 10, 28, 41, '2026-09-07 08:15:00', '2026-09-07 10:15:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-09-07', 0),
(12624, 10, 26, 41, '2026-09-08 08:15:00', '2026-09-08 15:15:00', 25200, 'Project delivery – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-09-08', 0),
(12625, 10, 26, 41, '2026-09-11 08:30:00', '2026-09-11 12:30:00', 14400, 'Project delivery – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-09-11', 0),
(12626, 10, 27, 41, '2026-09-14 08:30:00', '2026-09-14 13:30:00', 18000, 'Governance & reporting – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-09-14', 0),
(12627, 10, 29, 41, '2026-09-15 08:15:00', '2026-09-15 12:15:00', 14400, 'Admin & BAU – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-09-15', 0),
(12628, 10, 29, 41, '2026-09-16 08:15:00', '2026-09-16 10:45:00', 9000, 'Admin & BAU – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-09-16', 0),
(12629, 10, 26, 41, '2026-09-17 08:00:00', '2026-09-17 14:00:00', 21600, 'Project delivery – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-09-17', 0),
(12630, 10, 26, 41, '2026-09-21 08:15:00', '2026-09-21 11:45:00', 12600, 'Project delivery – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-09-21', 0),
(12631, 10, 27, 41, '2026-09-22 08:15:00', '2026-09-22 11:45:00', 12600, 'Governance & reporting – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-09-22', 0),
(12632, 10, 27, 41, '2026-09-23 08:15:00', '2026-09-23 14:15:00', 21600, 'Governance & reporting – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-09-23', 0),
(12633, 10, 27, 41, '2026-09-24 08:15:00', '2026-09-24 12:15:00', 14400, 'Governance & reporting – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-09-24', 0),
(12634, 10, 27, 41, '2026-09-25 08:30:00', '2026-09-25 10:30:00', 7200, 'Governance & reporting – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-09-25', 0),
(12635, 10, 29, 41, '2026-09-30 08:00:00', '2026-09-30 15:00:00', 25200, 'Admin & BAU – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-09-30', 0),
(12636, 10, 26, 41, '2026-10-02 08:30:00', '2026-10-02 15:30:00', 25200, 'Project delivery – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-10-02', 0),
(12637, 10, 28, 41, '2026-10-05 08:30:00', '2026-10-05 11:00:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-10-05', 0),
(12638, 10, 27, 41, '2026-10-06 08:15:00', '2026-10-06 10:45:00', 9000, 'Governance & reporting – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-10-06', 0),
(12639, 10, 26, 41, '2026-10-07 08:30:00', '2026-10-07 11:00:00', 9000, 'Project delivery – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-10-07', 0),
(12640, 10, 30, 41, '2026-10-12 08:15:00', '2026-10-12 13:15:00', 18000, 'Training – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-10-12', 0),
(12641, 10, 28, 41, '2026-10-13 08:15:00', '2026-10-13 12:15:00', 14400, 'Stakeholder engagement – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-10-13', 0),
(12642, 10, 26, 41, '2026-10-14 08:00:00', '2026-10-14 15:00:00', 25200, 'Project delivery – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-10-14', 0),
(12643, 10, 31, 41, '2026-10-15 08:30:00', '2026-10-15 13:30:00', 18000, 'Meetings – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-10-15', 0),
(12644, 10, 28, 41, '2026-10-16 08:00:00', '2026-10-16 10:30:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-10-16', 0),
(12645, 10, 28, 41, '2026-10-20 08:30:00', '2026-10-20 10:30:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-10-20', 0),
(12646, 10, 31, 41, '2026-10-21 08:00:00', '2026-10-21 11:00:00', 10800, 'Meetings – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-10-21', 0),
(12647, 10, 26, 41, '2026-10-22 08:30:00', '2026-10-22 13:30:00', 18000, 'Project delivery – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-10-22', 0),
(12648, 10, 31, 41, '2026-10-23 08:15:00', '2026-10-23 10:45:00', 9000, 'Meetings – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-10-23', 0),
(12649, 10, 29, 41, '2026-10-26 09:00:00', '2026-10-26 15:00:00', 21600, 'Admin & BAU – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-10-26', 0),
(12650, 10, 26, 41, '2026-10-30 09:15:00', '2026-10-30 16:15:00', 25200, 'Project delivery – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-10-30', 0),
(12651, 10, 26, 41, '2026-11-02 09:30:00', '2026-11-02 13:30:00', 14400, 'Project delivery – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-11-02', 0),
(12652, 10, 29, 41, '2026-11-03 09:15:00', '2026-11-03 14:15:00', 18000, 'Admin & BAU – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-11-03', 0),
(12653, 10, 31, 41, '2026-11-04 09:30:00', '2026-11-04 15:30:00', 21600, 'Meetings – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-11-04', 0),
(12654, 10, 29, 41, '2026-11-06 09:00:00', '2026-11-06 13:00:00', 14400, 'Admin & BAU – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-11-06', 0),
(12655, 10, 31, 41, '2026-11-10 09:15:00', '2026-11-10 12:45:00', 12600, 'Meetings – Skills Bootcamps', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-11-10', 0),
(12656, 10, 26, 41, '2026-11-11 09:15:00', '2026-11-11 11:45:00', 9000, 'Project delivery – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-11-11', 0),
(12657, 10, 28, 41, '2026-11-12 09:30:00', '2026-11-12 14:30:00', 18000, 'Stakeholder engagement – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-11-12', 0),
(12658, 10, 30, 41, '2026-11-16 09:30:00', '2026-11-16 16:30:00', 25200, 'Training – Skills Bootcamps', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-11-16', 0),
(12659, 10, 29, 41, '2026-11-18 09:00:00', '2026-11-18 11:30:00', 9000, 'Admin & BAU – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-11-18', 0),
(12660, 10, 28, 41, '2026-11-20 09:15:00', '2026-11-20 12:15:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-11-20', 0),
(12661, 10, 27, 41, '2026-11-23 09:00:00', '2026-11-23 15:00:00', 21600, 'Governance & reporting – Skills Bootcamps', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-11-23', 0),
(12662, 10, 29, 41, '2026-11-24 09:00:00', '2026-11-24 11:30:00', 9000, 'Admin & BAU – Skills Bootcamps', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-11-24', 0),
(12663, 10, 28, 41, '2026-11-25 09:15:00', '2026-11-25 12:15:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-11-25', 0),
(12664, 10, 26, 41, '2026-11-26 09:15:00', '2026-11-26 13:15:00', 14400, 'Project delivery – Skills Bootcamps', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-11-26', 0),
(12665, 10, 29, 41, '2026-11-27 09:00:00', '2026-11-27 14:00:00', 18000, 'Admin & BAU – Skills Bootcamps', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-11-27', 0),
(12666, 14, 28, 41, '2026-04-06 08:30:00', '2026-04-06 14:30:00', 21600, 'Stakeholder engagement – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-04-06', 0),
(12667, 14, 29, 41, '2026-04-07 08:00:00', '2026-04-07 13:00:00', 18000, 'Admin & BAU – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-04-07', 0),
(12668, 14, 26, 41, '2026-04-08 08:00:00', '2026-04-08 12:00:00', 14400, 'Project delivery – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-04-08', 0),
(12669, 14, 28, 41, '2026-04-09 08:30:00', '2026-04-09 10:30:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-04-09', 0),
(12670, 14, 26, 41, '2026-04-14 08:15:00', '2026-04-14 15:15:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-04-14', 0),
(12671, 14, 26, 41, '2026-04-15 08:00:00', '2026-04-15 11:30:00', 12600, 'Project delivery – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-04-15', 0),
(12672, 14, 27, 41, '2026-04-16 08:15:00', '2026-04-16 11:45:00', 12600, 'Governance & reporting – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-04-16', 0),
(12673, 14, 26, 41, '2026-04-17 08:00:00', '2026-04-17 14:00:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-04-17', 0),
(12674, 14, 26, 41, '2026-04-20 08:00:00', '2026-04-20 10:30:00', 9000, 'Project delivery – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-04-20', 0),
(12675, 14, 29, 41, '2026-04-21 08:30:00', '2026-04-21 15:30:00', 25200, 'Admin & BAU – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-04-21', 0),
(12676, 14, 28, 41, '2026-04-22 08:30:00', '2026-04-22 11:30:00', 10800, 'Stakeholder engagement – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-04-22', 0),
(12677, 14, 29, 41, '2026-04-27 08:15:00', '2026-04-27 11:45:00', 12600, 'Admin & BAU – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-04-27', 0),
(12678, 14, 29, 41, '2026-04-30 08:15:00', '2026-04-30 12:15:00', 14400, 'Admin & BAU – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-04-30', 0),
(12679, 14, 27, 41, '2026-05-01 08:00:00', '2026-05-01 10:30:00', 9000, 'Governance & reporting – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-05-01', 0),
(12680, 14, 26, 41, '2026-05-06 08:15:00', '2026-05-06 14:15:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-05-06', 0),
(12681, 14, 27, 41, '2026-05-07 08:30:00', '2026-05-07 14:30:00', 21600, 'Governance & reporting – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-05-07', 0),
(12682, 14, 27, 41, '2026-05-08 08:00:00', '2026-05-08 10:00:00', 7200, 'Governance & reporting – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-05-08', 0),
(12683, 14, 29, 41, '2026-05-11 08:15:00', '2026-05-11 11:45:00', 12600, 'Admin & BAU – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-05-11', 0),
(12684, 14, 26, 41, '2026-05-12 08:30:00', '2026-05-12 10:30:00', 7200, 'Project delivery – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-05-12', 0),
(12685, 14, 26, 41, '2026-05-13 08:15:00', '2026-05-13 14:15:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-05-13', 0),
(12686, 14, 29, 41, '2026-05-14 08:00:00', '2026-05-14 15:00:00', 25200, 'Admin & BAU – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-05-14', 0),
(12687, 14, 26, 41, '2026-05-19 08:15:00', '2026-05-19 15:15:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-05-19', 0),
(12688, 14, 26, 41, '2026-05-20 08:00:00', '2026-05-20 10:00:00', 7200, 'Project delivery – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-05-20', 0),
(12689, 14, 26, 41, '2026-05-21 08:00:00', '2026-05-21 13:00:00', 18000, 'Project delivery – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-05-21', 0),
(12690, 14, 26, 41, '2026-05-22 08:00:00', '2026-05-22 10:00:00', 7200, 'Project delivery – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-05-22', 0),
(12691, 14, 26, 41, '2026-05-25 08:15:00', '2026-05-25 13:15:00', 18000, 'Project delivery – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-05-25', 0),
(12692, 14, 26, 41, '2026-05-26 08:00:00', '2026-05-26 15:00:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-05-26', 0),
(12693, 14, 27, 41, '2026-05-27 08:15:00', '2026-05-27 14:15:00', 21600, 'Governance & reporting – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-05-27', 0),
(12694, 14, 26, 41, '2026-05-29 08:15:00', '2026-05-29 11:45:00', 12600, 'Project delivery – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-05-29', 0),
(12695, 14, 28, 41, '2026-06-01 08:15:00', '2026-06-01 14:15:00', 21600, 'Stakeholder engagement – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-06-01', 0),
(12696, 14, 29, 41, '2026-06-02 08:15:00', '2026-06-02 11:45:00', 12600, 'Admin & BAU – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-06-02', 0),
(12697, 14, 29, 41, '2026-06-03 08:00:00', '2026-06-03 10:30:00', 9000, 'Admin & BAU – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-06-03', 0),
(12698, 14, 26, 41, '2026-06-04 08:00:00', '2026-06-04 10:30:00', 9000, 'Project delivery – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-06-04', 0),
(12699, 14, 27, 41, '2026-06-08 08:30:00', '2026-06-08 14:30:00', 21600, 'Governance & reporting – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-06-08', 0),
(12700, 14, 26, 41, '2026-06-09 08:15:00', '2026-06-09 10:15:00', 7200, 'Project delivery – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-06-09', 0),
(12701, 14, 28, 41, '2026-06-11 08:15:00', '2026-06-11 14:15:00', 21600, 'Stakeholder engagement – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-06-11', 0),
(12702, 14, 27, 41, '2026-06-15 08:00:00', '2026-06-15 14:00:00', 21600, 'Governance & reporting – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-06-15', 0),
(12703, 14, 26, 41, '2026-06-18 08:30:00', '2026-06-18 15:30:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-06-18', 0),
(12704, 14, 28, 41, '2026-06-19 08:30:00', '2026-06-19 11:00:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-06-19', 0),
(12705, 14, 26, 41, '2026-06-22 08:30:00', '2026-06-22 12:30:00', 14400, 'Project delivery – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-06-22', 0),
(12706, 14, 31, 41, '2026-06-23 08:00:00', '2026-06-23 11:30:00', 12600, 'Meetings – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-06-23', 0),
(12707, 14, 26, 41, '2026-06-25 08:30:00', '2026-06-25 14:30:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-06-25', 0),
(12708, 14, 30, 41, '2026-06-26 08:30:00', '2026-06-26 11:30:00', 10800, 'Training – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-06-26', 0),
(12709, 14, 26, 41, '2026-06-29 08:15:00', '2026-06-29 15:15:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-06-29', 0),
(12710, 14, 26, 41, '2026-06-30 08:00:00', '2026-06-30 11:00:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-06-30', 0),
(12711, 14, 26, 41, '2026-07-01 08:30:00', '2026-07-01 14:30:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-07-01', 0),
(12712, 14, 26, 41, '2026-07-02 08:30:00', '2026-07-02 10:30:00', 7200, 'Project delivery – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-07-02', 0),
(12713, 14, 28, 41, '2026-07-08 08:15:00', '2026-07-08 10:45:00', 9000, 'Stakeholder engagement – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-07-08', 0),
(12714, 14, 26, 41, '2026-07-09 08:30:00', '2026-07-09 10:30:00', 7200, 'Project delivery – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-07-09', 0),
(12715, 14, 26, 41, '2026-07-15 08:15:00', '2026-07-15 13:15:00', 18000, 'Project delivery – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-07-15', 0),
(12716, 14, 27, 41, '2026-07-16 08:30:00', '2026-07-16 11:30:00', 10800, 'Governance & reporting – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-07-16', 0),
(12717, 14, 26, 41, '2026-07-17 08:00:00', '2026-07-17 11:30:00', 12600, 'Project delivery – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-07-17', 0),
(12718, 14, 30, 41, '2026-07-20 08:15:00', '2026-07-20 11:15:00', 10800, 'Training – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-07-20', 0),
(12719, 14, 26, 41, '2026-07-22 08:00:00', '2026-07-22 11:00:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-07-22', 0),
(12720, 14, 26, 41, '2026-07-23 08:00:00', '2026-07-23 11:00:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-07-23', 0),
(12721, 14, 29, 41, '2026-07-24 08:30:00', '2026-07-24 12:00:00', 12600, 'Admin & BAU – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-07-24', 0),
(12722, 14, 26, 41, '2026-07-27 08:15:00', '2026-07-27 14:15:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-07-27', 0),
(12723, 14, 29, 41, '2026-07-28 08:15:00', '2026-07-28 10:45:00', 9000, 'Admin & BAU – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-07-28', 0),
(12724, 14, 26, 41, '2026-07-29 08:30:00', '2026-07-29 12:00:00', 12600, 'Project delivery – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-07-29', 0),
(12725, 14, 28, 41, '2026-07-30 08:30:00', '2026-07-30 15:30:00', 25200, 'Stakeholder engagement – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-07-30', 0),
(12726, 14, 31, 41, '2026-08-03 08:00:00', '2026-08-03 10:00:00', 7200, 'Meetings – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-08-03', 0),
(12727, 14, 28, 41, '2026-08-06 08:30:00', '2026-08-06 10:30:00', 7200, 'Stakeholder engagement – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-08-06', 0),
(12728, 14, 29, 41, '2026-08-07 08:15:00', '2026-08-07 10:15:00', 7200, 'Admin & BAU – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-08-07', 0),
(12729, 14, 26, 41, '2026-08-10 08:30:00', '2026-08-10 12:00:00', 12600, 'Project delivery – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-08-10', 0),
(12730, 14, 30, 41, '2026-08-12 08:30:00', '2026-08-12 12:30:00', 14400, 'Training – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-08-12', 0),
(12731, 14, 26, 41, '2026-08-17 08:15:00', '2026-08-17 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-08-17', 0),
(12732, 14, 29, 41, '2026-08-19 08:15:00', '2026-08-19 12:15:00', 14400, 'Admin & BAU – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-08-19', 0),
(12733, 14, 26, 41, '2026-08-20 08:15:00', '2026-08-20 15:15:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-08-20', 0),
(12734, 14, 27, 41, '2026-08-21 08:30:00', '2026-08-21 10:30:00', 7200, 'Governance & reporting – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-08-21', 0),
(12735, 14, 26, 41, '2026-08-31 08:00:00', '2026-08-31 15:00:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-08-31', 0),
(12736, 14, 28, 41, '2026-09-01 08:15:00', '2026-09-01 14:15:00', 21600, 'Stakeholder engagement – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-09-01', 0),
(12737, 14, 26, 41, '2026-09-02 08:30:00', '2026-09-02 10:30:00', 7200, 'Project delivery – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-09-02', 0),
(12738, 14, 26, 41, '2026-09-04 08:15:00', '2026-09-04 15:15:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-09-04', 0),
(12739, 14, 29, 41, '2026-09-08 08:15:00', '2026-09-08 12:15:00', 14400, 'Admin & BAU – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-09-08', 0),
(12740, 14, 28, 41, '2026-09-09 08:15:00', '2026-09-09 15:15:00', 25200, 'Stakeholder engagement – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-09-09', 0),
(12741, 14, 26, 41, '2026-09-10 08:30:00', '2026-09-10 12:00:00', 12600, 'Project delivery – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-09-10', 0),
(12742, 14, 26, 41, '2026-09-11 08:15:00', '2026-09-11 13:15:00', 18000, 'Project delivery – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-09-11', 0),
(12743, 14, 26, 41, '2026-09-14 08:15:00', '2026-09-14 11:45:00', 12600, 'Project delivery – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-09-14', 0),
(12744, 14, 26, 41, '2026-09-15 08:00:00', '2026-09-15 14:00:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-09-15', 0),
(12745, 14, 26, 41, '2026-09-18 08:15:00', '2026-09-18 14:15:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-09-18', 0),
(12746, 14, 27, 41, '2026-09-21 08:30:00', '2026-09-21 13:30:00', 18000, 'Governance & reporting – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-09-21', 0),
(12747, 14, 29, 41, '2026-09-23 08:15:00', '2026-09-23 12:15:00', 14400, 'Admin & BAU – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-09-23', 0),
(12748, 14, 26, 41, '2026-09-25 08:15:00', '2026-09-25 14:15:00', 21600, 'Project delivery – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-09-25', 0),
(12749, 14, 27, 41, '2026-09-28 08:15:00', '2026-09-28 12:15:00', 14400, 'Governance & reporting – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-09-28', 0),
(12750, 14, 29, 41, '2026-09-29 08:15:00', '2026-09-29 10:45:00', 9000, 'Admin & BAU – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-09-29', 0),
(12751, 14, 26, 41, '2026-09-30 08:00:00', '2026-09-30 11:00:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-09-30', 0),
(12752, 14, 28, 41, '2026-10-02 08:30:00', '2026-10-02 15:30:00', 25200, 'Stakeholder engagement – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-10-02', 0),
(12753, 14, 26, 41, '2026-10-05 08:00:00', '2026-10-05 10:30:00', 9000, 'Project delivery – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-10-05', 0),
(12754, 14, 26, 41, '2026-10-06 08:00:00', '2026-10-06 11:00:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-10-06', 0),
(12755, 14, 29, 41, '2026-10-07 08:15:00', '2026-10-07 10:15:00', 7200, 'Admin & BAU – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-10-07', 0),
(12756, 14, 27, 41, '2026-10-08 08:30:00', '2026-10-08 12:00:00', 12600, 'Governance & reporting – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-10-08', 0),
(12757, 14, 29, 41, '2026-10-12 08:15:00', '2026-10-12 13:15:00', 18000, 'Admin & BAU – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-10-12', 0),
(12758, 14, 26, 41, '2026-10-13 08:15:00', '2026-10-13 11:15:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-10-13', 0),
(12759, 14, 26, 41, '2026-10-14 08:00:00', '2026-10-14 15:00:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-10-14', 0),
(12760, 14, 26, 41, '2026-10-15 08:00:00', '2026-10-15 11:00:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-10-15', 0),
(12761, 14, 26, 41, '2026-10-16 08:00:00', '2026-10-16 11:30:00', 12600, 'Project delivery – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-10-16', 0),
(12762, 14, 27, 41, '2026-10-19 08:30:00', '2026-10-19 12:00:00', 12600, 'Governance & reporting – Skills Bootcamps', 119, NULL, 34, 0, 'Europe/London', 105, 1, 'work', '2026-11-28 10:30:32', '2026-10-19', 0),
(12763, 14, 27, 41, '2026-10-20 08:15:00', '2026-10-20 10:15:00', 7200, 'Governance & reporting – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-10-20', 0),
(12764, 14, 28, 41, '2026-10-21 08:15:00', '2026-10-21 15:15:00', 25200, 'Stakeholder engagement – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-10-21', 0),
(12765, 14, 27, 41, '2026-10-22 08:30:00', '2026-10-22 14:30:00', 21600, 'Governance & reporting – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-10-22', 0),
(12766, 14, 29, 41, '2026-10-23 08:15:00', '2026-10-23 15:15:00', 25200, 'Admin & BAU – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-10-23', 0),
(12767, 14, 27, 41, '2026-10-27 09:00:00', '2026-10-27 11:30:00', 9000, 'Governance & reporting – Skills Bootcamps', 85, NULL, 34, 0, 'Europe/London', 75, 1, 'work', '2026-11-28 10:30:32', '2026-10-27', 0),
(12768, 14, 26, 41, '2026-10-29 09:30:00', '2026-10-29 11:30:00', 7200, 'Project delivery – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-10-29', 0),
(12769, 14, 29, 41, '2026-11-02 09:30:00', '2026-11-02 14:30:00', 18000, 'Admin & BAU – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-11-02', 0),
(12770, 14, 26, 41, '2026-11-04 09:30:00', '2026-11-04 16:30:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-11-04', 0),
(12771, 14, 29, 41, '2026-11-05 09:30:00', '2026-11-05 16:30:00', 25200, 'Admin & BAU – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-11-05', 0),
(12772, 14, 31, 41, '2026-11-06 09:30:00', '2026-11-06 14:30:00', 18000, 'Meetings – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-11-06', 0),
(12773, 14, 29, 41, '2026-11-09 09:15:00', '2026-11-09 11:15:00', 7200, 'Admin & BAU – Skills Bootcamps', 68, NULL, 34, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-11-09', 0),
(12774, 14, 29, 41, '2026-11-11 09:15:00', '2026-11-11 14:15:00', 18000, 'Admin & BAU – Skills Bootcamps', 170, NULL, 34, 0, 'Europe/London', 150, 1, 'work', '2026-11-28 10:30:32', '2026-11-11', 0),
(12775, 14, 26, 41, '2026-11-13 09:00:00', '2026-11-13 16:00:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-11-13', 0),
(12776, 14, 26, 41, '2026-11-17 09:30:00', '2026-11-17 12:30:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-11-17', 0),
(12777, 14, 26, 41, '2026-11-20 09:15:00', '2026-11-20 13:15:00', 14400, 'Project delivery – Skills Bootcamps', 136, NULL, 34, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-11-20', 0),
(12778, 14, 26, 41, '2026-11-24 09:00:00', '2026-11-24 12:00:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-11-24', 0),
(12779, 14, 26, 41, '2026-11-25 09:15:00', '2026-11-25 16:15:00', 25200, 'Project delivery – Skills Bootcamps', 238, NULL, 34, 0, 'Europe/London', 210, 1, 'work', '2026-11-28 10:30:32', '2026-11-25', 0),
(12780, 14, 29, 41, '2026-11-26 09:15:00', '2026-11-26 15:15:00', 21600, 'Admin & BAU – Skills Bootcamps', 204, NULL, 34, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-11-26', 0),
(12781, 14, 26, 41, '2026-11-27 09:30:00', '2026-11-27 12:30:00', 10800, 'Project delivery – Skills Bootcamps', 102, NULL, 34, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-11-27', 0),
(12782, 7, 28, 42, '2026-09-01 08:30:00', '2026-09-01 11:00:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-09-01', 0),
(12783, 7, 26, 42, '2026-09-02 08:15:00', '2026-09-02 13:15:00', 18000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:32', '2026-09-02', 0),
(12784, 7, 27, 42, '2026-09-03 08:00:00', '2026-09-03 10:00:00', 7200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-09-03', 0);
INSERT INTO `kimai2_timesheet` (`id`, `user`, `activity_id`, `project_id`, `start_time`, `end_time`, `duration`, `description`, `rate`, `fixed_rate`, `hourly_rate`, `exported`, `timezone`, `internal_rate`, `billable`, `category`, `modified_at`, `date_tz`, `break`) VALUES
(12785, 7, 29, 42, '2026-09-04 08:00:00', '2026-09-04 10:30:00', 9000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-09-04', 0),
(12786, 7, 31, 42, '2026-09-07 08:00:00', '2026-09-07 10:00:00', 7200, 'Meetings – Future Ways of Working – Flexitime Pilot', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-09-07', 0),
(12787, 7, 27, 42, '2026-09-09 08:15:00', '2026-09-09 13:15:00', 18000, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:32', '2026-09-09', 0),
(12788, 7, 28, 42, '2026-09-10 08:15:00', '2026-09-10 13:15:00', 18000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:32', '2026-09-10', 0),
(12789, 7, 26, 42, '2026-09-11 08:00:00', '2026-09-11 10:30:00', 9000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-09-11', 0),
(12790, 7, 29, 42, '2026-09-14 08:00:00', '2026-09-14 11:00:00', 10800, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:32', '2026-09-14', 0),
(12791, 7, 28, 42, '2026-09-15 08:30:00', '2026-09-15 12:00:00', 12600, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:32', '2026-09-15', 0),
(12792, 7, 26, 42, '2026-09-16 08:00:00', '2026-09-16 10:00:00', 7200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-09-16', 0),
(12793, 7, 28, 42, '2026-09-17 08:15:00', '2026-09-17 11:15:00', 10800, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:32', '2026-09-17', 0),
(12794, 7, 27, 42, '2026-09-18 08:15:00', '2026-09-18 13:15:00', 18000, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:32', '2026-09-18', 0),
(12795, 7, 26, 42, '2026-09-23 08:00:00', '2026-09-23 10:00:00', 7200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-09-23', 0),
(12796, 7, 27, 42, '2026-09-25 08:00:00', '2026-09-25 12:00:00', 14400, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-09-25', 0),
(12797, 7, 30, 42, '2026-09-28 08:30:00', '2026-09-28 11:00:00', 9000, 'Training – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-09-28', 0),
(12798, 7, 28, 42, '2026-09-30 08:30:00', '2026-09-30 11:00:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-09-30', 0),
(12799, 7, 27, 42, '2026-10-01 08:00:00', '2026-10-01 10:30:00', 9000, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-10-01', 0),
(12800, 7, 26, 42, '2026-10-06 08:00:00', '2026-10-06 11:30:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:32', '2026-10-06', 0),
(12801, 7, 29, 42, '2026-10-08 08:30:00', '2026-10-08 12:00:00', 12600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:32', '2026-10-08', 0),
(12802, 7, 29, 42, '2026-10-09 08:15:00', '2026-10-09 10:45:00', 9000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-10-09', 0),
(12803, 7, 29, 42, '2026-10-12 08:30:00', '2026-10-12 14:30:00', 21600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:32', '2026-10-12', 0),
(12804, 7, 28, 42, '2026-10-13 08:15:00', '2026-10-13 10:45:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-10-13', 0),
(12805, 7, 29, 42, '2026-10-15 08:00:00', '2026-10-15 10:00:00', 7200, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-10-15', 0),
(12806, 7, 26, 42, '2026-10-16 08:30:00', '2026-10-16 14:30:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:32', '2026-10-16', 0),
(12807, 7, 26, 42, '2026-10-19 08:30:00', '2026-10-19 10:30:00', 7200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-10-19', 0),
(12808, 7, 29, 42, '2026-10-20 08:15:00', '2026-10-20 10:15:00', 7200, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 110, NULL, 55, 0, 'Europe/London', 90, 1, 'work', '2026-11-28 10:30:32', '2026-10-20', 0),
(12809, 7, 28, 42, '2026-10-22 08:00:00', '2026-10-22 13:00:00', 18000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:32', '2026-10-22', 0),
(12810, 7, 26, 42, '2026-10-23 08:15:00', '2026-10-23 10:45:00', 9000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-10-23', 0),
(12811, 7, 29, 42, '2026-10-26 09:15:00', '2026-10-26 13:15:00', 14400, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-10-26', 0),
(12812, 7, 26, 42, '2026-10-27 09:15:00', '2026-10-27 16:15:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:32', '2026-10-27', 0),
(12813, 7, 29, 42, '2026-10-28 09:00:00', '2026-10-28 14:00:00', 18000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:32', '2026-10-28', 0),
(12814, 7, 26, 42, '2026-11-03 09:15:00', '2026-11-03 12:45:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:32', '2026-11-03', 0),
(12815, 7, 26, 42, '2026-11-04 09:30:00', '2026-11-04 14:30:00', 18000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:32', '2026-11-04', 0),
(12816, 7, 26, 42, '2026-11-05 09:15:00', '2026-11-05 14:15:00', 18000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 275, NULL, 55, 0, 'Europe/London', 225, 1, 'work', '2026-11-28 10:30:32', '2026-11-05', 0),
(12817, 7, 26, 42, '2026-11-06 09:00:00', '2026-11-06 15:00:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:32', '2026-11-06', 0),
(12818, 7, 26, 42, '2026-11-10 09:30:00', '2026-11-10 13:00:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 192.5, NULL, 55, 0, 'Europe/London', 157.5, 1, 'work', '2026-11-28 10:30:32', '2026-11-10', 0),
(12819, 7, 28, 42, '2026-11-11 09:15:00', '2026-11-11 13:15:00', 14400, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 220, NULL, 55, 0, 'Europe/London', 180, 1, 'work', '2026-11-28 10:30:32', '2026-11-11', 0),
(12820, 7, 27, 42, '2026-11-13 09:15:00', '2026-11-13 15:15:00', 21600, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:32', '2026-11-13', 0),
(12821, 7, 29, 42, '2026-11-17 09:00:00', '2026-11-17 12:00:00', 10800, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:32', '2026-11-17', 0),
(12822, 7, 29, 42, '2026-11-18 09:30:00', '2026-11-18 15:30:00', 21600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 330, NULL, 55, 0, 'Europe/London', 270, 1, 'work', '2026-11-28 10:30:32', '2026-11-18', 0),
(12823, 7, 26, 42, '2026-11-23 09:15:00', '2026-11-23 12:15:00', 10800, 'Project delivery – Future Ways of Working – Flexitime Pilot', 165, NULL, 55, 0, 'Europe/London', 135, 1, 'work', '2026-11-28 10:30:32', '2026-11-23', 0),
(12824, 7, 26, 42, '2026-11-24 09:30:00', '2026-11-24 16:30:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:32', '2026-11-24', 0),
(12825, 7, 27, 42, '2026-11-25 09:15:00', '2026-11-25 16:15:00', 25200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 385, NULL, 55, 0, 'Europe/London', 315, 1, 'work', '2026-11-28 10:30:32', '2026-11-25', 0),
(12826, 7, 31, 42, '2026-11-26 09:30:00', '2026-11-26 12:00:00', 9000, 'Meetings – Future Ways of Working – Flexitime Pilot', 137.5, NULL, 55, 0, 'Europe/London', 112.5, 1, 'work', '2026-11-28 10:30:32', '2026-11-26', 0),
(12827, 15, 28, 42, '2026-09-01 08:15:00', '2026-09-01 12:15:00', 14400, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:32', '2026-09-01', 0),
(12828, 15, 29, 42, '2026-09-02 08:00:00', '2026-09-02 12:00:00', 14400, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:32', '2026-09-02', 0),
(12829, 15, 26, 42, '2026-09-03 08:30:00', '2026-09-03 10:30:00', 7200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:32', '2026-09-03', 0),
(12830, 15, 27, 42, '2026-09-04 08:15:00', '2026-09-04 11:15:00', 10800, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:32', '2026-09-04', 0),
(12831, 15, 26, 42, '2026-09-07 08:00:00', '2026-09-07 12:00:00', 14400, 'Project delivery – Future Ways of Working – Flexitime Pilot', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:32', '2026-09-07', 0),
(12832, 15, 26, 42, '2026-09-08 08:00:00', '2026-09-08 10:30:00', 9000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-09-08', 0),
(12833, 15, 26, 42, '2026-09-09 08:00:00', '2026-09-09 10:00:00', 7200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:32', '2026-09-09', 0),
(12834, 15, 26, 42, '2026-09-10 08:15:00', '2026-09-10 10:45:00', 9000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-09-10', 0),
(12835, 15, 31, 42, '2026-09-11 08:30:00', '2026-09-11 11:00:00', 9000, 'Meetings – Future Ways of Working – Flexitime Pilot', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-09-11', 0),
(12836, 15, 26, 42, '2026-09-14 08:00:00', '2026-09-14 11:30:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-09-14', 0),
(12837, 15, 26, 42, '2026-09-15 08:15:00', '2026-09-15 11:15:00', 10800, 'Project delivery – Future Ways of Working – Flexitime Pilot', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:32', '2026-09-15', 0),
(12838, 15, 29, 42, '2026-09-17 08:15:00', '2026-09-17 10:15:00', 7200, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:32', '2026-09-17', 0),
(12839, 15, 26, 42, '2026-09-18 08:00:00', '2026-09-18 15:00:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-09-18', 0),
(12840, 15, 27, 42, '2026-09-21 08:30:00', '2026-09-21 15:30:00', 25200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-09-21', 0),
(12841, 15, 28, 42, '2026-09-22 08:30:00', '2026-09-22 12:00:00', 12600, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-09-22', 0),
(12842, 15, 26, 42, '2026-09-28 08:30:00', '2026-09-28 14:30:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:32', '2026-09-28', 0),
(12843, 15, 29, 42, '2026-09-30 08:30:00', '2026-09-30 12:30:00', 14400, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:32', '2026-09-30', 0),
(12844, 15, 27, 42, '2026-10-06 08:00:00', '2026-10-06 12:00:00', 14400, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:32', '2026-10-06', 0),
(12845, 15, 28, 42, '2026-10-08 08:30:00', '2026-10-08 11:00:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-10-08', 0),
(12846, 15, 27, 42, '2026-10-12 08:15:00', '2026-10-12 12:15:00', 14400, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 112, NULL, 28, 0, 'Europe/London', 96, 1, 'work', '2026-11-28 10:30:32', '2026-10-12', 0),
(12847, 15, 26, 42, '2026-10-15 08:00:00', '2026-10-15 11:30:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-10-15', 0),
(12848, 15, 27, 42, '2026-10-16 08:15:00', '2026-10-16 11:15:00', 10800, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:32', '2026-10-16', 0),
(12849, 15, 29, 42, '2026-10-19 08:00:00', '2026-10-19 14:00:00', 21600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:32', '2026-10-19', 0),
(12850, 15, 27, 42, '2026-10-21 08:00:00', '2026-10-21 10:00:00', 7200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:32', '2026-10-21', 0),
(12851, 15, 30, 42, '2026-10-22 08:00:00', '2026-10-22 11:30:00', 12600, 'Training – Future Ways of Working – Flexitime Pilot', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-10-22', 0),
(12852, 15, 27, 42, '2026-10-26 09:15:00', '2026-10-26 11:45:00', 9000, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-10-26', 0),
(12853, 15, 26, 42, '2026-10-27 09:00:00', '2026-10-27 12:30:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-10-27', 0),
(12854, 15, 26, 42, '2026-10-28 09:15:00', '2026-10-28 15:15:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:32', '2026-10-28', 0),
(12855, 15, 29, 42, '2026-10-30 09:00:00', '2026-10-30 12:30:00', 12600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-10-30', 0),
(12856, 15, 28, 42, '2026-11-03 09:00:00', '2026-11-03 11:30:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-11-03', 0),
(12857, 15, 29, 42, '2026-11-04 09:30:00', '2026-11-04 12:30:00', 10800, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:32', '2026-11-04', 0),
(12858, 15, 28, 42, '2026-11-05 09:15:00', '2026-11-05 11:15:00', 7200, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:32', '2026-11-05', 0),
(12859, 15, 28, 42, '2026-11-06 09:15:00', '2026-11-06 15:15:00', 21600, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:32', '2026-11-06', 0),
(12860, 15, 27, 42, '2026-11-09 09:15:00', '2026-11-09 11:15:00', 7200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:32', '2026-11-09', 0),
(12861, 15, 27, 42, '2026-11-10 09:30:00', '2026-11-10 14:30:00', 18000, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-11-10', 0),
(12862, 15, 27, 42, '2026-11-11 09:30:00', '2026-11-11 13:00:00', 12600, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 98, NULL, 28, 0, 'Europe/London', 84, 1, 'work', '2026-11-28 10:30:32', '2026-11-11', 0),
(12863, 15, 26, 42, '2026-11-12 09:00:00', '2026-11-12 11:00:00', 7200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 56, NULL, 28, 0, 'Europe/London', 48, 1, 'work', '2026-11-28 10:30:32', '2026-11-12', 0),
(12864, 15, 29, 42, '2026-11-16 09:30:00', '2026-11-16 12:30:00', 10800, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:32', '2026-11-16', 0),
(12865, 15, 31, 42, '2026-11-17 09:00:00', '2026-11-17 14:00:00', 18000, 'Meetings – Future Ways of Working – Flexitime Pilot', 140, NULL, 28, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-11-17', 0),
(12866, 15, 29, 42, '2026-11-18 09:15:00', '2026-11-18 12:15:00', 10800, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:32', '2026-11-18', 0),
(12867, 15, 26, 42, '2026-11-20 09:30:00', '2026-11-20 15:30:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:32', '2026-11-20', 0),
(12868, 15, 26, 42, '2026-11-23 09:15:00', '2026-11-23 12:15:00', 10800, 'Project delivery – Future Ways of Working – Flexitime Pilot', 84, NULL, 28, 0, 'Europe/London', 72, 1, 'work', '2026-11-28 10:30:32', '2026-11-23', 0),
(12869, 15, 29, 42, '2026-11-24 09:00:00', '2026-11-24 15:00:00', 21600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:32', '2026-11-24', 0),
(12870, 15, 27, 42, '2026-11-25 09:30:00', '2026-11-25 12:00:00', 9000, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 70, NULL, 28, 0, 'Europe/London', 60, 1, 'work', '2026-11-28 10:30:32', '2026-11-25', 0),
(12871, 15, 26, 42, '2026-11-26 09:15:00', '2026-11-26 16:15:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 196, NULL, 28, 0, 'Europe/London', 168, 1, 'work', '2026-11-28 10:30:32', '2026-11-26', 0),
(12872, 15, 29, 42, '2026-11-27 09:15:00', '2026-11-27 15:15:00', 21600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 168, NULL, 28, 0, 'Europe/London', 144, 1, 'work', '2026-11-28 10:30:32', '2026-11-27', 0),
(12873, 8, 27, 42, '2026-09-01 08:15:00', '2026-09-01 14:15:00', 21600, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:32', '2026-09-01', 0),
(12874, 8, 26, 42, '2026-09-04 08:00:00', '2026-09-04 12:00:00', 14400, 'Project delivery – Future Ways of Working – Flexitime Pilot', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:32', '2026-09-04', 0),
(12875, 8, 29, 42, '2026-09-07 08:30:00', '2026-09-07 10:30:00', 7200, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:32', '2026-09-07', 0),
(12876, 8, 26, 42, '2026-09-08 08:30:00', '2026-09-08 11:30:00', 10800, 'Project delivery – Future Ways of Working – Flexitime Pilot', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-09-08', 0),
(12877, 8, 26, 42, '2026-09-09 08:00:00', '2026-09-09 12:00:00', 14400, 'Project delivery – Future Ways of Working – Flexitime Pilot', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:32', '2026-09-09', 0),
(12878, 8, 29, 42, '2026-09-10 08:00:00', '2026-09-10 10:30:00', 9000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:32', '2026-09-10', 0),
(12879, 8, 26, 42, '2026-09-11 08:30:00', '2026-09-11 15:30:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:32', '2026-09-11', 0),
(12880, 8, 26, 42, '2026-09-14 08:00:00', '2026-09-14 11:30:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-09-14', 0),
(12881, 8, 27, 42, '2026-09-15 08:00:00', '2026-09-15 10:00:00', 7200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:32', '2026-09-15', 0),
(12882, 8, 28, 42, '2026-09-16 08:15:00', '2026-09-16 14:15:00', 21600, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:32', '2026-09-16', 0),
(12883, 8, 27, 42, '2026-09-17 08:00:00', '2026-09-17 12:00:00', 14400, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:32', '2026-09-17', 0),
(12884, 8, 29, 42, '2026-09-18 08:30:00', '2026-09-18 11:30:00', 10800, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-09-18', 0),
(12885, 8, 30, 42, '2026-09-21 08:30:00', '2026-09-21 12:30:00', 14400, 'Training – Future Ways of Working – Flexitime Pilot', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:32', '2026-09-21', 0),
(12886, 8, 26, 42, '2026-09-22 08:00:00', '2026-09-22 10:30:00', 9000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:32', '2026-09-22', 0),
(12887, 8, 26, 42, '2026-09-23 08:00:00', '2026-09-23 11:00:00', 10800, 'Project delivery – Future Ways of Working – Flexitime Pilot', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-09-23', 0),
(12888, 8, 31, 42, '2026-09-24 08:15:00', '2026-09-24 13:15:00', 18000, 'Meetings – Future Ways of Working – Flexitime Pilot', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:32', '2026-09-24', 0),
(12889, 8, 30, 42, '2026-09-29 08:30:00', '2026-09-29 11:30:00', 10800, 'Training – Future Ways of Working – Flexitime Pilot', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-09-29', 0),
(12890, 8, 29, 42, '2026-09-30 08:00:00', '2026-09-30 14:00:00', 21600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:32', '2026-09-30', 0),
(12891, 8, 29, 42, '2026-10-01 08:15:00', '2026-10-01 13:15:00', 18000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:32', '2026-10-01', 0),
(12892, 8, 30, 42, '2026-10-07 08:00:00', '2026-10-07 10:30:00', 9000, 'Training – Future Ways of Working – Flexitime Pilot', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:32', '2026-10-07', 0),
(12893, 8, 29, 42, '2026-10-08 08:15:00', '2026-10-08 11:15:00', 10800, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-10-08', 0),
(12894, 8, 27, 42, '2026-10-09 08:30:00', '2026-10-09 15:30:00', 25200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:32', '2026-10-09', 0),
(12895, 8, 29, 42, '2026-10-14 08:15:00', '2026-10-14 12:15:00', 14400, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:32', '2026-10-14', 0),
(12896, 8, 26, 42, '2026-10-15 08:15:00', '2026-10-15 14:15:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:32', '2026-10-15', 0),
(12897, 8, 29, 42, '2026-10-19 08:00:00', '2026-10-19 11:30:00', 12600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-10-19', 0),
(12898, 8, 26, 42, '2026-10-20 08:30:00', '2026-10-20 12:30:00', 14400, 'Project delivery – Future Ways of Working – Flexitime Pilot', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:32', '2026-10-20', 0),
(12899, 8, 26, 42, '2026-10-21 08:15:00', '2026-10-21 14:15:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 288, NULL, 48, 0, 'Europe/London', 240, 1, 'work', '2026-11-28 10:30:32', '2026-10-21', 0),
(12900, 8, 26, 42, '2026-10-22 08:30:00', '2026-10-22 12:30:00', 14400, 'Project delivery – Future Ways of Working – Flexitime Pilot', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:32', '2026-10-22', 0),
(12901, 8, 26, 42, '2026-10-23 08:15:00', '2026-10-23 15:15:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:32', '2026-10-23', 0),
(12902, 8, 26, 42, '2026-10-26 09:00:00', '2026-10-26 16:00:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:32', '2026-10-26', 0),
(12903, 8, 30, 42, '2026-10-27 09:00:00', '2026-10-27 16:00:00', 25200, 'Training – Future Ways of Working – Flexitime Pilot', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:32', '2026-10-27', 0),
(12904, 8, 26, 42, '2026-10-29 09:00:00', '2026-10-29 14:00:00', 18000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:32', '2026-10-29', 0),
(12905, 8, 30, 42, '2026-10-30 09:00:00', '2026-10-30 11:30:00', 9000, 'Training – Future Ways of Working – Flexitime Pilot', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:32', '2026-10-30', 0),
(12906, 8, 31, 42, '2026-11-02 09:30:00', '2026-11-02 12:30:00', 10800, 'Meetings – Future Ways of Working – Flexitime Pilot', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-11-02', 0),
(12907, 8, 27, 42, '2026-11-03 09:15:00', '2026-11-03 12:15:00', 10800, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-11-03', 0),
(12908, 8, 27, 42, '2026-11-04 09:15:00', '2026-11-04 12:45:00', 12600, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-11-04', 0),
(12909, 8, 26, 42, '2026-11-10 09:15:00', '2026-11-10 12:45:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-11-10', 0),
(12910, 8, 26, 42, '2026-11-12 09:30:00', '2026-11-12 12:30:00', 10800, 'Project delivery – Future Ways of Working – Flexitime Pilot', 144, NULL, 48, 0, 'Europe/London', 120, 1, 'work', '2026-11-28 10:30:32', '2026-11-12', 0),
(12911, 8, 26, 42, '2026-11-13 09:30:00', '2026-11-13 14:30:00', 18000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 240, NULL, 48, 0, 'Europe/London', 200, 1, 'work', '2026-11-28 10:30:32', '2026-11-13', 0),
(12912, 8, 29, 42, '2026-11-16 09:00:00', '2026-11-16 11:30:00', 9000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:32', '2026-11-16', 0),
(12913, 8, 28, 42, '2026-11-18 09:30:00', '2026-11-18 13:00:00', 12600, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-11-18', 0),
(12914, 8, 29, 42, '2026-11-19 09:00:00', '2026-11-19 11:00:00', 7200, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 96, NULL, 48, 0, 'Europe/London', 80, 1, 'work', '2026-11-28 10:30:32', '2026-11-19', 0),
(12915, 8, 28, 42, '2026-11-20 09:30:00', '2026-11-20 12:00:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 120, NULL, 48, 0, 'Europe/London', 100, 1, 'work', '2026-11-28 10:30:32', '2026-11-20', 0),
(12916, 8, 26, 42, '2026-11-24 09:15:00', '2026-11-24 16:15:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 336, NULL, 48, 0, 'Europe/London', 280, 1, 'work', '2026-11-28 10:30:32', '2026-11-24', 0),
(12917, 8, 30, 42, '2026-11-25 09:15:00', '2026-11-25 12:45:00', 12600, 'Training – Future Ways of Working – Flexitime Pilot', 168, NULL, 48, 0, 'Europe/London', 140, 1, 'work', '2026-11-28 10:30:32', '2026-11-25', 0),
(12918, 8, 28, 42, '2026-11-26 09:30:00', '2026-11-26 13:30:00', 14400, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 192, NULL, 48, 0, 'Europe/London', 160, 1, 'work', '2026-11-28 10:30:32', '2026-11-26', 0),
(12919, 9, 27, 42, '2026-09-01 08:15:00', '2026-09-01 11:15:00', 10800, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-09-01', 0),
(12920, 9, 27, 42, '2026-09-02 08:00:00', '2026-09-02 12:00:00', 14400, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-09-02', 0),
(12921, 9, 29, 42, '2026-09-03 08:15:00', '2026-09-03 10:15:00', 7200, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-09-03', 0),
(12922, 9, 30, 42, '2026-09-04 08:15:00', '2026-09-04 10:45:00', 9000, 'Training – Future Ways of Working – Flexitime Pilot', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-09-04', 0),
(12923, 9, 26, 42, '2026-09-07 08:15:00', '2026-09-07 15:15:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-09-07', 0),
(12924, 9, 26, 42, '2026-09-09 08:00:00', '2026-09-09 10:00:00', 7200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-09-09', 0),
(12925, 9, 26, 42, '2026-09-11 08:30:00', '2026-09-11 11:00:00', 9000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-09-11', 0),
(12926, 9, 27, 42, '2026-09-14 08:15:00', '2026-09-14 11:15:00', 10800, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-09-14', 0),
(12927, 9, 26, 42, '2026-09-15 08:00:00', '2026-09-15 10:30:00', 9000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-09-15', 0),
(12928, 9, 26, 42, '2026-09-17 08:15:00', '2026-09-17 11:15:00', 10800, 'Project delivery – Future Ways of Working – Flexitime Pilot', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-09-17', 0),
(12929, 9, 28, 42, '2026-09-18 08:15:00', '2026-09-18 10:15:00', 7200, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-09-18', 0),
(12930, 9, 26, 42, '2026-09-21 08:00:00', '2026-09-21 12:00:00', 14400, 'Project delivery – Future Ways of Working – Flexitime Pilot', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-09-21', 0),
(12931, 9, 29, 42, '2026-09-22 08:30:00', '2026-09-22 10:30:00', 7200, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-09-22', 0),
(12932, 9, 29, 42, '2026-09-23 08:00:00', '2026-09-23 10:30:00', 9000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-09-23', 0),
(12933, 9, 28, 42, '2026-09-24 08:15:00', '2026-09-24 14:15:00', 21600, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-09-24', 0),
(12934, 9, 26, 42, '2026-09-25 08:00:00', '2026-09-25 15:00:00', 25200, 'Project delivery – Future Ways of Working – Flexitime Pilot', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-09-25', 0),
(12935, 9, 26, 42, '2026-09-28 08:00:00', '2026-09-28 11:30:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-09-28', 0),
(12936, 9, 29, 42, '2026-09-29 08:00:00', '2026-09-29 13:00:00', 18000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-09-29', 0),
(12937, 9, 26, 42, '2026-10-01 08:00:00', '2026-10-01 11:30:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-10-01', 0),
(12938, 9, 26, 42, '2026-10-02 08:30:00', '2026-10-02 13:30:00', 18000, 'Project delivery – Future Ways of Working – Flexitime Pilot', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-10-02', 0),
(12939, 9, 27, 42, '2026-10-05 08:00:00', '2026-10-05 11:30:00', 12600, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-10-05', 0),
(12940, 9, 31, 42, '2026-10-06 08:30:00', '2026-10-06 13:30:00', 18000, 'Meetings – Future Ways of Working – Flexitime Pilot', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-10-06', 0),
(12941, 9, 29, 42, '2026-10-08 08:15:00', '2026-10-08 14:15:00', 21600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-10-08', 0),
(12942, 9, 29, 42, '2026-10-09 08:15:00', '2026-10-09 15:15:00', 25200, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-10-09', 0),
(12943, 9, 27, 42, '2026-10-12 08:15:00', '2026-10-12 15:15:00', 25200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-10-12', 0),
(12944, 9, 26, 42, '2026-10-13 08:15:00', '2026-10-13 11:45:00', 12600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-10-13', 0),
(12945, 9, 27, 42, '2026-10-14 08:30:00', '2026-10-14 10:30:00', 7200, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 84, NULL, 42, 0, 'Europe/London', 76, 1, 'work', '2026-11-28 10:30:32', '2026-10-14', 0),
(12946, 9, 29, 42, '2026-10-15 08:00:00', '2026-10-15 13:00:00', 18000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-10-15', 0),
(12947, 9, 27, 42, '2026-10-16 08:00:00', '2026-10-16 11:00:00', 10800, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-10-16', 0),
(12948, 9, 27, 42, '2026-10-19 08:00:00', '2026-10-19 13:00:00', 18000, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-10-19', 0),
(12949, 9, 28, 42, '2026-10-20 08:30:00', '2026-10-20 11:00:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-10-20', 0),
(12950, 9, 28, 42, '2026-10-23 08:15:00', '2026-10-23 10:45:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-10-23', 0),
(12951, 9, 28, 42, '2026-10-26 09:30:00', '2026-10-26 12:00:00', 9000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-10-26', 0),
(12952, 9, 26, 42, '2026-10-28 09:00:00', '2026-10-28 15:00:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-10-28', 0),
(12953, 9, 29, 42, '2026-10-29 09:15:00', '2026-10-29 13:15:00', 14400, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-10-29', 0),
(12954, 9, 27, 42, '2026-10-30 09:00:00', '2026-10-30 13:00:00', 14400, 'Governance & reporting – Future Ways of Working – Flexitime Pilot', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-10-30', 0),
(12955, 9, 29, 42, '2026-11-03 09:30:00', '2026-11-03 13:30:00', 14400, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-11-03', 0),
(12956, 9, 28, 42, '2026-11-06 09:30:00', '2026-11-06 14:30:00', 18000, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-11-06', 0),
(12957, 9, 28, 42, '2026-11-11 09:30:00', '2026-11-11 16:30:00', 25200, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-11-11', 0),
(12958, 9, 26, 42, '2026-11-12 09:15:00', '2026-11-12 12:15:00', 10800, 'Project delivery – Future Ways of Working – Flexitime Pilot', 126, NULL, 42, 0, 'Europe/London', 114, 1, 'work', '2026-11-28 10:30:32', '2026-11-12', 0),
(12959, 9, 26, 42, '2026-11-13 09:00:00', '2026-11-13 13:00:00', 14400, 'Project delivery – Future Ways of Working – Flexitime Pilot', 168, NULL, 42, 0, 'Europe/London', 152, 1, 'work', '2026-11-28 10:30:32', '2026-11-13', 0),
(12960, 9, 29, 42, '2026-11-16 09:30:00', '2026-11-16 13:00:00', 12600, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-11-16', 0),
(12961, 9, 29, 42, '2026-11-17 09:15:00', '2026-11-17 11:45:00', 9000, 'Admin & BAU – Future Ways of Working – Flexitime Pilot', 105, NULL, 42, 0, 'Europe/London', 95, 1, 'work', '2026-11-28 10:30:32', '2026-11-17', 0),
(12962, 9, 26, 42, '2026-11-18 09:30:00', '2026-11-18 15:30:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-11-18', 0),
(12963, 9, 31, 42, '2026-11-19 09:00:00', '2026-11-19 14:00:00', 18000, 'Meetings – Future Ways of Working – Flexitime Pilot', 210, NULL, 42, 0, 'Europe/London', 190, 1, 'work', '2026-11-28 10:30:32', '2026-11-19', 0),
(12964, 9, 26, 42, '2026-11-20 09:15:00', '2026-11-20 15:15:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-11-20', 0),
(12965, 9, 26, 42, '2026-11-23 09:30:00', '2026-11-23 15:30:00', 21600, 'Project delivery – Future Ways of Working – Flexitime Pilot', 252, NULL, 42, 0, 'Europe/London', 228, 1, 'work', '2026-11-28 10:30:32', '2026-11-23', 0),
(12966, 9, 28, 42, '2026-11-24 09:30:00', '2026-11-24 16:30:00', 25200, 'Stakeholder engagement – Future Ways of Working – Flexitime Pilot', 294, NULL, 42, 0, 'Europe/London', 266, 1, 'work', '2026-11-28 10:30:32', '2026-11-24', 0),
(12967, 9, 31, 42, '2026-11-26 09:30:00', '2026-11-26 13:00:00', 12600, 'Meetings – Future Ways of Working – Flexitime Pilot', 147, NULL, 42, 0, 'Europe/London', 133, 1, 'work', '2026-11-28 10:30:32', '2026-11-26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_timesheet_meta`
--

CREATE TABLE `kimai2_timesheet_meta` (
  `id` int(11) NOT NULL,
  `timesheet_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_timesheet_tags`
--

CREATE TABLE `kimai2_timesheet_tags` (
  `timesheet_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_users`
--

CREATE TABLE `kimai2_users` (
  `id` int(11) NOT NULL,
  `username` varchar(180) NOT NULL,
  `email` varchar(180) NOT NULL,
  `password` varchar(255) NOT NULL,
  `alias` varchar(60) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `registration_date` datetime DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `api_token` varchar(255) DEFAULT NULL,
  `auth` varchar(20) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `account` varchar(30) DEFAULT NULL,
  `totp_secret` varchar(255) DEFAULT NULL,
  `totp_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `system_account` tinyint(1) NOT NULL DEFAULT 0,
  `supervisor_id` int(11) DEFAULT NULL,
  `signature_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_users`
--

INSERT INTO `kimai2_users` (`id`, `username`, `email`, `password`, `alias`, `enabled`, `registration_date`, `title`, `avatar`, `roles`, `last_login`, `confirmation_token`, `password_requested_at`, `api_token`, `auth`, `color`, `account`, `totp_secret`, `totp_enabled`, `system_account`, `supervisor_id`, `signature_date`) VALUES
(1, 'admin', 'admin@example.com', '$2y$13$JJXlif7TqhAP.cnvkYJnoO3fXQXyOOvYbT04mELE2QaBrN6uNRu9u', NULL, 1, '2026-11-26 11:17:43', NULL, NULL, '[\"ROLE_SUPER_ADMIN\"]', '2026-11-28 10:37:37', NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, '2026-11-26 12:05:49'),
(7, 'claire.morrison', 'claire.morrison@wyca-demo.gov.uk', '$2y$13$1hZAlCJvp3DDd0rOA7XhcOXuge1.CRHUG2sQZBkVe3jeLWsr47FKO', 'Claire Morrison', 1, '2026-11-28 10:27:15', 'Head of Digital & Data', NULL, '[\"ROLE_SUPER_ADMIN\"]', '2026-11-28 10:40:36', NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(8, 'james.whitfield', 'james.whitfield@wyca-demo.gov.uk', '$2y$13$p8eBD81iX1qwZzVSIv5SaOnfH1QqHCNCD5bR3/CRo2wqGFJR/Nr76', 'James Whitfield', 1, '2026-11-28 10:27:16', 'Finance Business Partner', NULL, '[\"ROLE_ADMIN\"]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(9, 'sophie.bennett', 'sophie.bennett@wyca-demo.gov.uk', '$2y$13$PX2dw7dwUj1jCn3uJqf.8eI7GHp03crqpxEqhsv9Zabc.Ia/9mHgu', 'Sophie Bennett', 1, '2026-11-28 10:27:16', 'Transport Programmes Lead', NULL, '[\"ROLE_TEAMLEAD\"]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(10, 'oliver.hughes', 'oliver.hughes@wyca-demo.gov.uk', '$2y$13$NGIdICFjibPuII2DRXpguubhGK0qZTt3Cmw0ocPGqM5jtvQF6tkW.', 'Oliver Hughes', 1, '2026-11-28 10:27:17', 'Economic Growth Lead', NULL, '[\"ROLE_TEAMLEAD\"]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(11, 'emily.carter', 'emily.carter@wyca-demo.gov.uk', '$2y$13$IyWOXiOSs/8lUpmLVaTsLuyqrby3fqSYZ4sJJGLVpSR/fQ8nyxZxK', 'Emily Carter', 1, '2026-11-28 10:27:17', 'Transport Officer', NULL, '[]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(12, 'daniel.price', 'daniel.price@wyca-demo.gov.uk', '$2y$13$C71u.0uaxH.SZSxGz8ppT.DlHgoH18olZ4goedSD2QtmgPy1o1NPi', 'Daniel Price', 1, '2026-11-28 10:27:18', 'Transport Analyst', NULL, '[]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(13, 'hannah.collins', 'hannah.collins@wyca-demo.gov.uk', '$2y$13$sAWlPjIeu3MGQDeN5DkOd.YbEoxkaVu9ZojqXOpApH3coRLNXx.fi', 'Hannah Collins', 1, '2026-11-28 10:27:18', 'Economic Growth Officer', NULL, '[]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(14, 'thomas.wright', 'thomas.wright@wyca-demo.gov.uk', '$2y$13$5WAwnekYbYo8/jkiVCOr5OU/96PfR8vVNCc53QVYaPdeTEQ2K1BvC', 'Thomas Wright', 1, '2026-11-28 10:27:19', 'Policy Officer', NULL, '[]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(15, 'charlotte.evans', 'charlotte.evans@wyca-demo.gov.uk', '$2y$13$Up8npQ1Axd0UOt4zdY9vA.DJDSjjoCAbu530.IIOFs9osnd2tNesy', 'Charlotte Evans', 1, '2026-11-28 10:27:19', 'Corporate Services Officer', NULL, '[]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(16, 'benjamin.scott', 'benjamin.scott@wyca-demo.gov.uk', '$2y$13$deIsdmCCt9ZXjToWTwNRLO87GFtf1rWsXsa1SXliIMzQK3f.j9OLC', 'Benjamin Scott', 1, '2026-11-28 10:27:19', 'Place & Housing Officer', NULL, '[]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL),
(17, 'am.aariva', 'priya.sharma@aariva.co.uk', '$2y$13$QyW2gR/gg6Ul19RT85uVQuCztC/LUcjNU0NkXf01IGi29P00MX2lm', 'Priya Sharma', 1, '2026-11-28 10:27:20', 'Aariva Account Manager', NULL, '[\"ROLE_ADMIN\"]', NULL, NULL, NULL, NULL, 'kimai', NULL, NULL, NULL, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_users_teams`
--

CREATE TABLE `kimai2_users_teams` (
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `teamlead` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_users_teams`
--

INSERT INTO `kimai2_users_teams` (`user_id`, `team_id`, `id`, `teamlead`) VALUES
(9, 13, 44, 1),
(11, 13, 45, 0),
(12, 13, 46, 0),
(10, 14, 47, 1),
(13, 14, 48, 0),
(7, 15, 49, 1),
(8, 15, 50, 0),
(15, 15, 51, 0),
(17, 15, 52, 0),
(10, 16, 53, 1),
(14, 16, 54, 0),
(16, 16, 55, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_user_preferences`
--

CREATE TABLE `kimai2_user_preferences` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kimai2_user_preferences`
--

INSERT INTO `kimai2_user_preferences` (`id`, `user_id`, `name`, `value`) VALUES
(1, 1, 'timezone', 'Europe/London'),
(2, 1, 'language', 'en'),
(3, 1, 'locale', 'en_GB'),
(4, 1, 'skin', 'default'),
(5, 1, 'work_contract_type', 'none'),
(6, 1, 'work_monday', '0'),
(7, 1, 'work_tuesday', '0'),
(8, 1, 'work_wednesday', '0'),
(9, 1, 'work_thursday', '0'),
(10, 1, 'work_friday', '0'),
(11, 1, 'work_saturday', '0'),
(12, 1, 'work_sunday', '0'),
(13, 1, 'public_holiday_group', NULL),
(14, 1, 'holidays', '0'),
(15, 1, 'work_start_day', NULL),
(16, 1, 'work_last_day', NULL),
(17, 1, 'hourly_rate', '0'),
(18, 1, 'internal_rate', NULL),
(19, 1, 'first_weekday', 'monday'),
(20, 1, 'update_browser_title', '1'),
(21, 1, 'calendar_initial_view', 'month'),
(22, 1, 'login_initial_view', 'timesheet'),
(23, 1, 'favorite_routes', ''),
(24, 1, 'daily_stats', ''),
(25, 1, 'export_decimal', ''),
(26, 1, '__wizards__', 'intro,profile'),
(27, 1, '_latest_approval', NULL),
(118, 7, 'timezone', 'Europe/London'),
(119, 7, 'language', 'en'),
(120, 7, 'locale', 'en'),
(121, 7, 'skin', 'auto'),
(122, 7, 'work_contract_type', 'none'),
(123, 7, 'work_monday', '0'),
(124, 7, 'work_tuesday', '0'),
(125, 7, 'work_wednesday', '0'),
(126, 7, 'work_thursday', '0'),
(127, 7, 'work_friday', '0'),
(128, 7, 'work_saturday', '0'),
(129, 7, 'work_sunday', '0'),
(130, 7, 'public_holiday_group', NULL),
(131, 7, 'holidays', '0'),
(132, 7, 'work_start_day', NULL),
(133, 7, 'work_last_day', NULL),
(134, 7, 'hourly_rate', '55'),
(135, 7, 'internal_rate', '45'),
(136, 8, 'timezone', 'Europe/London'),
(137, 8, 'language', 'en'),
(138, 8, 'locale', 'en'),
(139, 8, 'skin', 'auto'),
(140, 8, 'work_contract_type', 'none'),
(141, 8, 'work_monday', '0'),
(142, 8, 'work_tuesday', '0'),
(143, 8, 'work_wednesday', '0'),
(144, 8, 'work_thursday', '0'),
(145, 8, 'work_friday', '0'),
(146, 8, 'work_saturday', '0'),
(147, 8, 'work_sunday', '0'),
(148, 8, 'public_holiday_group', NULL),
(149, 8, 'holidays', '0'),
(150, 8, 'work_start_day', NULL),
(151, 8, 'work_last_day', NULL),
(152, 8, 'hourly_rate', '48'),
(153, 8, 'internal_rate', '40'),
(154, 9, 'timezone', 'Europe/London'),
(155, 9, 'language', 'en'),
(156, 9, 'locale', 'en'),
(157, 9, 'skin', 'auto'),
(158, 9, 'work_contract_type', 'none'),
(159, 9, 'work_monday', '0'),
(160, 9, 'work_tuesday', '0'),
(161, 9, 'work_wednesday', '0'),
(162, 9, 'work_thursday', '0'),
(163, 9, 'work_friday', '0'),
(164, 9, 'work_saturday', '0'),
(165, 9, 'work_sunday', '0'),
(166, 9, 'public_holiday_group', NULL),
(167, 9, 'holidays', '0'),
(168, 9, 'work_start_day', NULL),
(169, 9, 'work_last_day', NULL),
(170, 9, 'hourly_rate', '42'),
(171, 9, 'internal_rate', '38'),
(172, 10, 'timezone', 'Europe/London'),
(173, 10, 'language', 'en'),
(174, 10, 'locale', 'en'),
(175, 10, 'skin', 'auto'),
(176, 10, 'work_contract_type', 'none'),
(177, 10, 'work_monday', '0'),
(178, 10, 'work_tuesday', '0'),
(179, 10, 'work_wednesday', '0'),
(180, 10, 'work_thursday', '0'),
(181, 10, 'work_friday', '0'),
(182, 10, 'work_saturday', '0'),
(183, 10, 'work_sunday', '0'),
(184, 10, 'public_holiday_group', NULL),
(185, 10, 'holidays', '0'),
(186, 10, 'work_start_day', NULL),
(187, 10, 'work_last_day', NULL),
(188, 10, 'hourly_rate', '42'),
(189, 10, 'internal_rate', '38'),
(190, 11, 'timezone', 'Europe/London'),
(191, 11, 'language', 'en'),
(192, 11, 'locale', 'en'),
(193, 11, 'skin', 'auto'),
(194, 11, 'work_contract_type', 'none'),
(195, 11, 'work_monday', '0'),
(196, 11, 'work_tuesday', '0'),
(197, 11, 'work_wednesday', '0'),
(198, 11, 'work_thursday', '0'),
(199, 11, 'work_friday', '0'),
(200, 11, 'work_saturday', '0'),
(201, 11, 'work_sunday', '0'),
(202, 11, 'public_holiday_group', NULL),
(203, 11, 'holidays', '0'),
(204, 11, 'work_start_day', NULL),
(205, 11, 'work_last_day', NULL),
(206, 11, 'hourly_rate', '32'),
(207, 11, 'internal_rate', '28'),
(208, 12, 'timezone', 'Europe/London'),
(209, 12, 'language', 'en'),
(210, 12, 'locale', 'en'),
(211, 12, 'skin', 'auto'),
(212, 12, 'work_contract_type', 'none'),
(213, 12, 'work_monday', '0'),
(214, 12, 'work_tuesday', '0'),
(215, 12, 'work_wednesday', '0'),
(216, 12, 'work_thursday', '0'),
(217, 12, 'work_friday', '0'),
(218, 12, 'work_saturday', '0'),
(219, 12, 'work_sunday', '0'),
(220, 12, 'public_holiday_group', NULL),
(221, 12, 'holidays', '0'),
(222, 12, 'work_start_day', NULL),
(223, 12, 'work_last_day', NULL),
(224, 12, 'hourly_rate', '30'),
(225, 12, 'internal_rate', '26'),
(226, 13, 'timezone', 'Europe/London'),
(227, 13, 'language', 'en'),
(228, 13, 'locale', 'en'),
(229, 13, 'skin', 'auto'),
(230, 13, 'work_contract_type', 'none'),
(231, 13, 'work_monday', '0'),
(232, 13, 'work_tuesday', '0'),
(233, 13, 'work_wednesday', '0'),
(234, 13, 'work_thursday', '0'),
(235, 13, 'work_friday', '0'),
(236, 13, 'work_saturday', '0'),
(237, 13, 'work_sunday', '0'),
(238, 13, 'public_holiday_group', NULL),
(239, 13, 'holidays', '0'),
(240, 13, 'work_start_day', NULL),
(241, 13, 'work_last_day', NULL),
(242, 13, 'hourly_rate', '32'),
(243, 13, 'internal_rate', '28'),
(244, 14, 'timezone', 'Europe/London'),
(245, 14, 'language', 'en'),
(246, 14, 'locale', 'en'),
(247, 14, 'skin', 'auto'),
(248, 14, 'work_contract_type', 'none'),
(249, 14, 'work_monday', '0'),
(250, 14, 'work_tuesday', '0'),
(251, 14, 'work_wednesday', '0'),
(252, 14, 'work_thursday', '0'),
(253, 14, 'work_friday', '0'),
(254, 14, 'work_saturday', '0'),
(255, 14, 'work_sunday', '0'),
(256, 14, 'public_holiday_group', NULL),
(257, 14, 'holidays', '0'),
(258, 14, 'work_start_day', NULL),
(259, 14, 'work_last_day', NULL),
(260, 14, 'hourly_rate', '34'),
(261, 14, 'internal_rate', '30'),
(262, 15, 'timezone', 'Europe/London'),
(263, 15, 'language', 'en'),
(264, 15, 'locale', 'en'),
(265, 15, 'skin', 'auto'),
(266, 15, 'work_contract_type', 'none'),
(267, 15, 'work_monday', '0'),
(268, 15, 'work_tuesday', '0'),
(269, 15, 'work_wednesday', '0'),
(270, 15, 'work_thursday', '0'),
(271, 15, 'work_friday', '0'),
(272, 15, 'work_saturday', '0'),
(273, 15, 'work_sunday', '0'),
(274, 15, 'public_holiday_group', NULL),
(275, 15, 'holidays', '0'),
(276, 15, 'work_start_day', NULL),
(277, 15, 'work_last_day', NULL),
(278, 15, 'hourly_rate', '28'),
(279, 15, 'internal_rate', '24'),
(280, 16, 'timezone', 'Europe/London'),
(281, 16, 'language', 'en'),
(282, 16, 'locale', 'en'),
(283, 16, 'skin', 'auto'),
(284, 16, 'work_contract_type', 'none'),
(285, 16, 'work_monday', '0'),
(286, 16, 'work_tuesday', '0'),
(287, 16, 'work_wednesday', '0'),
(288, 16, 'work_thursday', '0'),
(289, 16, 'work_friday', '0'),
(290, 16, 'work_saturday', '0'),
(291, 16, 'work_sunday', '0'),
(292, 16, 'public_holiday_group', NULL),
(293, 16, 'holidays', '0'),
(294, 16, 'work_start_day', NULL),
(295, 16, 'work_last_day', NULL),
(296, 16, 'hourly_rate', '32'),
(297, 16, 'internal_rate', '28'),
(298, 17, 'timezone', 'Europe/London'),
(299, 17, 'language', 'en'),
(300, 17, 'locale', 'en'),
(301, 17, 'skin', 'auto'),
(302, 17, 'work_contract_type', 'none'),
(303, 17, 'work_monday', '0'),
(304, 17, 'work_tuesday', '0'),
(305, 17, 'work_wednesday', '0'),
(306, 17, 'work_thursday', '0'),
(307, 17, 'work_friday', '0'),
(308, 17, 'work_saturday', '0'),
(309, 17, 'work_sunday', '0'),
(310, 17, 'public_holiday_group', NULL),
(311, 17, 'holidays', '0'),
(312, 17, 'work_start_day', NULL),
(313, 17, 'work_last_day', NULL),
(314, 17, 'hourly_rate', '0'),
(315, 17, 'internal_rate', '0'),
(316, 7, 'first_weekday', 'monday'),
(317, 7, 'update_browser_title', '1'),
(318, 7, 'calendar_initial_view', 'month'),
(319, 7, 'login_initial_view', 'timesheet'),
(320, 7, 'favorite_routes', ''),
(321, 7, 'daily_stats', ''),
(322, 7, 'export_decimal', ''),
(323, 7, '__wizards__', 'intro,profile'),
(324, 7, '_latest_approval', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kimai2_working_times`
--

CREATE TABLE `kimai2_working_times` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `expected` int(11) NOT NULL,
  `actual` int(11) NOT NULL,
  `approved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20180701120000', '2026-11-26 11:16:28', 271),
('DoctrineMigrations\\Version20180715160326', '2026-11-26 11:16:28', 153),
('DoctrineMigrations\\Version20180730044139', '2026-11-26 11:16:28', 44),
('DoctrineMigrations\\Version20180805183527', '2026-11-26 11:16:28', 32),
('DoctrineMigrations\\Version20180903202256', '2026-11-26 11:16:28', 9),
('DoctrineMigrations\\Version20180905190737', '2026-11-26 11:16:28', 31),
('DoctrineMigrations\\Version20180924111853', '2026-11-26 11:16:28', 26),
('DoctrineMigrations\\Version20181031220003', '2026-11-26 11:16:28', 225),
('DoctrineMigrations\\Version20190124004014', '2026-11-26 11:16:29', 38),
('DoctrineMigrations\\Version20190201150324', '2026-11-26 11:16:29', 6),
('DoctrineMigrations\\Version20190219200020', '2026-11-26 11:16:29', 1),
('DoctrineMigrations\\Version20190305152308', '2026-11-26 11:16:29', 139),
('DoctrineMigrations\\Version20190321181243', '2026-11-26 11:16:29', 8),
('DoctrineMigrations\\Version20190502161758', '2026-11-26 11:16:29', 50),
('DoctrineMigrations\\Version20190510205245', '2026-11-26 11:16:29', 50),
('DoctrineMigrations\\Version20190605171157', '2026-11-26 11:16:29', 51),
('DoctrineMigrations\\Version20190617100845', '2026-11-26 11:16:29', 164),
('DoctrineMigrations\\Version20190706224211', '2026-11-26 11:16:29', 138),
('DoctrineMigrations\\Version20190706224219', '2026-11-26 11:16:29', 102),
('DoctrineMigrations\\Version20190729162655', '2026-11-26 11:16:29', 92),
('DoctrineMigrations\\Version20190730123324', '2026-11-26 11:16:29', 299),
('DoctrineMigrations\\Version20190813162649', '2026-11-26 11:16:30', 77),
('DoctrineMigrations\\Version20191024100951', '2026-11-26 11:16:30', 47),
('DoctrineMigrations\\Version20191108151534', '2026-11-26 11:16:30', 81),
('DoctrineMigrations\\Version20191113132640', '2026-11-26 11:16:30', 42),
('DoctrineMigrations\\Version20191116110124', '2026-11-26 11:16:30', 51),
('DoctrineMigrations\\Version20191204120823', '2026-11-26 11:16:30', 53),
('DoctrineMigrations\\Version20200109102138', '2026-11-26 11:16:30', 219),
('DoctrineMigrations\\Version20200125123942', '2026-11-26 11:16:30', 59),
('DoctrineMigrations\\Version20200204124425', '2026-11-26 11:16:30', 56),
('DoctrineMigrations\\Version20200205115243', '2026-11-26 11:16:30', 238),
('DoctrineMigrations\\Version20200205115244', '2026-11-26 11:16:31', 79),
('DoctrineMigrations\\Version20200308171950', '2026-11-26 11:16:31', 129),
('DoctrineMigrations\\Version20200323163038', '2026-11-26 11:16:31', 84),
('DoctrineMigrations\\Version20200323163039', '2026-11-26 11:16:31', 0),
('DoctrineMigrations\\Version20200413133226', '2026-11-26 11:16:31', 83),
('DoctrineMigrations\\Version20200524142042', '2026-11-26 11:16:31', 70),
('DoctrineMigrations\\Version20200705152310', '2026-11-26 11:16:31', 75),
('DoctrineMigrations\\Version20200725213424', '2026-11-26 11:16:31', 174),
('DoctrineMigrations\\Version20210316224358', '2026-11-26 11:16:31', 135),
('DoctrineMigrations\\Version20210320162820', '2026-11-26 11:16:32', 107),
('DoctrineMigrations\\Version20210405105611', '2026-11-26 11:16:32', 80),
('DoctrineMigrations\\Version20210605154245', '2026-11-26 11:16:32', 96),
('DoctrineMigrations\\Version20210704111542', '2026-11-26 11:16:32', 96),
('DoctrineMigrations\\Version20210717211144', '2026-11-26 11:16:32', 77),
('DoctrineMigrations\\Version20210719123928', '2026-11-26 11:16:32', 89),
('DoctrineMigrations\\Version20210727104955', '2026-11-26 11:16:32', 271),
('DoctrineMigrations\\Version20210802152259', '2026-11-26 11:16:32', 86),
('DoctrineMigrations\\Version20210802152814', '2026-11-26 11:16:32', 4),
('DoctrineMigrations\\Version20210802160837', '2026-11-26 11:16:32', 131),
('DoctrineMigrations\\Version20210802174318', '2026-11-26 11:16:33', 135),
('DoctrineMigrations\\Version20210802174319', '2026-11-26 11:16:33', 1),
('DoctrineMigrations\\Version20210802174320', '2026-11-26 11:16:33', 98),
('DoctrineMigrations\\Version20211008092010', '2026-11-26 11:16:33', 72),
('DoctrineMigrations\\Version20211230163612', '2026-11-26 11:16:33', 74),
('DoctrineMigrations\\Version20220101204501', '2026-11-26 11:16:33', 132),
('DoctrineMigrations\\Version20220315224645', '2026-11-26 11:16:33', 134),
('DoctrineMigrations\\Version20220404150236', '2026-11-26 11:16:33', 156),
('DoctrineMigrations\\Version20220531145920', '2026-11-26 11:16:33', 133),
('DoctrineMigrations\\Version20220722125847', '2026-11-26 11:16:34', 91),
('DoctrineMigrations\\Version20230126002049', '2026-11-26 11:16:34', 231),
('DoctrineMigrations\\Version20230126002050', '2026-11-26 11:16:34', 130),
('DoctrineMigrations\\Version20230327143628', '2026-11-26 11:16:34', 205),
('DoctrineMigrations\\Version20230606125948', '2026-11-26 11:16:34', 121),
('DoctrineMigrations\\Version20230819090536', '2026-11-26 11:16:34', 164),
('DoctrineMigrations\\Version20231130000719', '2026-11-26 11:16:34', 1),
('DoctrineMigrations\\Version20240214061246', '2026-11-26 11:16:34', 164),
('DoctrineMigrations\\Version20240326125247', '2026-11-26 11:16:35', 16),
('DoctrineMigrations\\Version20240920105524', '2026-11-26 11:16:35', 1),
('DoctrineMigrations\\Version20240926111739', '2026-11-26 11:16:35', 24),
('DoctrineMigrations\\Version20250608143244', '2026-11-26 11:16:35', 133),
('DoctrineMigrations\\Version20251031142000', '2026-11-26 11:16:35', 90),
('DoctrineMigrations\\Version20251031143000', '2026-11-26 11:16:35', 54),
('DoctrineMigrations\\Version20251214160001', '2026-11-26 11:16:35', 157),
('DoctrineMigrations\\Version20260530080724', '2026-11-26 11:16:35', 135),
('DoctrineMigrations\\Version20260802144517', '2026-11-26 11:16:35', 133),
('DoctrineMigrations\\Version20260802173206', '2026-11-26 11:16:35', 128),
('DoctrineMigrations\\Version20260802183206', '2026-11-26 11:16:36', 121),
('DoctrineMigrations\\Version20260804090000', '2026-11-26 11:16:36', 115),
('DoctrineMigrations\\Version20260917080000', '2026-11-26 11:16:36', 1),
('DoctrineMigrations\\Version20261025120000', '2026-11-26 11:16:36', 156),
('DoctrineMigrations\\Version20261122120000', '2026-11-26 11:16:36', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kimai2_access_token`
--
ALTER TABLE `kimai2_access_token`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6FB0DB1E5F37A13B` (`token`),
  ADD KEY `IDX_6FB0DB1EA76ED395` (`user_id`);

--
-- Indexes for table `kimai2_activities`
--
ALTER TABLE `kimai2_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8811FE1C166D1F9C` (`project_id`),
  ADD KEY `IDX_8811FE1C7AB0E859166D1F9C` (`visible`,`project_id`),
  ADD KEY `IDX_8811FE1C7AB0E859166D1F9C5E237E06` (`visible`,`project_id`,`name`),
  ADD KEY `IDX_8811FE1C7AB0E8595E237E06` (`visible`,`name`);

--
-- Indexes for table `kimai2_activities_meta`
--
ALTER TABLE `kimai2_activities_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A7C0A43D81C060965E237E06` (`activity_id`,`name`),
  ADD KEY `IDX_A7C0A43D81C06096` (`activity_id`);

--
-- Indexes for table `kimai2_activities_rates`
--
ALTER TABLE `kimai2_activities_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4A7F11BEA76ED39581C06096` (`user_id`,`activity_id`),
  ADD KEY `IDX_4A7F11BEA76ED395` (`user_id`),
  ADD KEY `IDX_4A7F11BE81C06096` (`activity_id`);

--
-- Indexes for table `kimai2_activities_teams`
--
ALTER TABLE `kimai2_activities_teams`
  ADD PRIMARY KEY (`activity_id`,`team_id`),
  ADD KEY `IDX_986998DA81C06096` (`activity_id`),
  ADD KEY `IDX_986998DA296CD8AE` (`team_id`);

--
-- Indexes for table `kimai2_bookmarks`
--
ALTER TABLE `kimai2_bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4016EF25A76ED3955E237E06` (`user_id`,`name`),
  ADD KEY `IDX_4016EF25A76ED395` (`user_id`);

--
-- Indexes for table `kimai2_configuration`
--
ALTER TABLE `kimai2_configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1C5D63D85E237E06` (`name`);

--
-- Indexes for table `kimai2_customers`
--
ALTER TABLE `kimai2_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5A9760447AB0E859` (`visible`),
  ADD KEY `IDX_5A97604412946D8B` (`invoice_template_id`);

--
-- Indexes for table `kimai2_customers_comments`
--
ALTER TABLE `kimai2_customers_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A5B142D99395C3F3` (`customer_id`),
  ADD KEY `IDX_A5B142D9B03A8386` (`created_by_id`);

--
-- Indexes for table `kimai2_customers_meta`
--
ALTER TABLE `kimai2_customers_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A48A760F9395C3F35E237E06` (`customer_id`,`name`),
  ADD KEY `IDX_A48A760F9395C3F3` (`customer_id`);

--
-- Indexes for table `kimai2_customers_rates`
--
ALTER TABLE `kimai2_customers_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_82AB0AECA76ED3959395C3F3` (`user_id`,`customer_id`),
  ADD KEY `IDX_82AB0AECA76ED395` (`user_id`),
  ADD KEY `IDX_82AB0AEC9395C3F3` (`customer_id`);

--
-- Indexes for table `kimai2_customers_teams`
--
ALTER TABLE `kimai2_customers_teams`
  ADD PRIMARY KEY (`customer_id`,`team_id`),
  ADD KEY `IDX_50BD83889395C3F3` (`customer_id`),
  ADD KEY `IDX_50BD8388296CD8AE` (`team_id`);

--
-- Indexes for table `kimai2_export_templates`
--
ALTER TABLE `kimai2_export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F0CA26F2B36786B` (`title`);

--
-- Indexes for table `kimai2_invoices`
--
ALTER TABLE `kimai2_invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_76C38E372DA68207` (`invoice_number`),
  ADD UNIQUE KEY `UNIQ_76C38E372323B33D` (`invoice_filename`),
  ADD KEY `IDX_76C38E37A76ED395` (`user_id`),
  ADD KEY `IDX_76C38E379395C3F3` (`customer_id`);

--
-- Indexes for table `kimai2_invoices_meta`
--
ALTER TABLE `kimai2_invoices_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_7EDC37D92989F1FD5E237E06` (`invoice_id`,`name`),
  ADD KEY `IDX_7EDC37D92989F1FD` (`invoice_id`);

--
-- Indexes for table `kimai2_invoice_templates`
--
ALTER TABLE `kimai2_invoice_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1626CFE95E237E06` (`name`),
  ADD KEY `IDX_1626CFE99395C3F3` (`customer_id`);

--
-- Indexes for table `kimai2_invoice_templates_meta`
--
ALTER TABLE `kimai2_invoice_templates_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_A165B0555DA0FB85E237E06` (`template_id`,`name`),
  ADD KEY `IDX_A165B0555DA0FB8` (`template_id`);

--
-- Indexes for table `kimai2_projects`
--
ALTER TABLE `kimai2_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_407F12069395C3F3` (`customer_id`),
  ADD KEY `IDX_407F12069395C3F37AB0E8595E237E06` (`customer_id`,`visible`,`name`),
  ADD KEY `IDX_407F12069395C3F37AB0E859BF396750` (`customer_id`,`visible`,`id`);

--
-- Indexes for table `kimai2_projects_comments`
--
ALTER TABLE `kimai2_projects_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_29A23638166D1F9C` (`project_id`),
  ADD KEY `IDX_29A23638B03A8386` (`created_by_id`);

--
-- Indexes for table `kimai2_projects_meta`
--
ALTER TABLE `kimai2_projects_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_50536EF2166D1F9C5E237E06` (`project_id`,`name`),
  ADD KEY `IDX_50536EF2166D1F9C` (`project_id`);

--
-- Indexes for table `kimai2_projects_rates`
--
ALTER TABLE `kimai2_projects_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_41535D55A76ED395166D1F9C` (`user_id`,`project_id`),
  ADD KEY `IDX_41535D55A76ED395` (`user_id`),
  ADD KEY `IDX_41535D55166D1F9C` (`project_id`);

--
-- Indexes for table `kimai2_projects_teams`
--
ALTER TABLE `kimai2_projects_teams`
  ADD PRIMARY KEY (`project_id`,`team_id`),
  ADD KEY `IDX_9345D431166D1F9C` (`project_id`),
  ADD KEY `IDX_9345D431296CD8AE` (`team_id`);

--
-- Indexes for table `kimai2_roles`
--
ALTER TABLE `kimai2_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name` (`name`);

--
-- Indexes for table `kimai2_roles_permissions`
--
ALTER TABLE `kimai2_roles_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_permission` (`role_id`,`permission`),
  ADD KEY `IDX_D263A3B8D60322AC` (`role_id`);

--
-- Indexes for table `kimai2_sessions`
--
ALTER TABLE `kimai2_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lifetime_idx` (`lifetime`);

--
-- Indexes for table `kimai2_tags`
--
ALTER TABLE `kimai2_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_27CAF54C5E237E06` (`name`),
  ADD KEY `IDX_27CAF54C7AB0E859` (`visible`);

--
-- Indexes for table `kimai2_teams`
--
ALTER TABLE `kimai2_teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_3BEDDC7F5E237E06` (`name`);

--
-- Indexes for table `kimai2_timesheet`
--
ALTER TABLE `kimai2_timesheet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_4F60C6B18D93D649` (`user`),
  ADD KEY `IDX_4F60C6B181C06096` (`activity_id`),
  ADD KEY `IDX_4F60C6B1166D1F9C` (`project_id`),
  ADD KEY `IDX_4F60C6B18D93D649502DF587` (`user`,`start_time`),
  ADD KEY `IDX_4F60C6B1502DF587` (`start_time`),
  ADD KEY `IDX_4F60C6B1502DF58741561401` (`start_time`,`end_time`),
  ADD KEY `IDX_4F60C6B1502DF587415614018D93D649` (`start_time`,`end_time`,`user`),
  ADD KEY `IDX_4F60C6B1BDF467148D93D649` (`date_tz`,`user`),
  ADD KEY `IDX_4F60C6B1415614018D93D649` (`end_time`,`user`),
  ADD KEY `IDX_TIMESHEET_TICKTAC` (`end_time`,`user`,`start_time`),
  ADD KEY `IDX_TIMESHEET_RECENT_ACTIVITIES` (`user`,`project_id`,`activity_id`),
  ADD KEY `IDX_TIMESHEET_RESULT_STATS` (`user`,`id`,`duration`);

--
-- Indexes for table `kimai2_timesheet_meta`
--
ALTER TABLE `kimai2_timesheet_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_CB606CBAABDD46BE5E237E06` (`timesheet_id`,`name`),
  ADD KEY `IDX_CB606CBAABDD46BE` (`timesheet_id`);

--
-- Indexes for table `kimai2_timesheet_tags`
--
ALTER TABLE `kimai2_timesheet_tags`
  ADD PRIMARY KEY (`timesheet_id`,`tag_id`),
  ADD KEY `IDX_E3284EFEABDD46BE` (`timesheet_id`),
  ADD KEY `IDX_E3284EFEBAD26311` (`tag_id`);

--
-- Indexes for table `kimai2_users`
--
ALTER TABLE `kimai2_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_B9AC5BCEF85E0677` (`username`),
  ADD UNIQUE KEY `UNIQ_B9AC5BCEE7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_B9AC5BCEC05FB297` (`confirmation_token`),
  ADD KEY `IDX_B9AC5BCE19E9AC5F` (`supervisor_id`);

--
-- Indexes for table `kimai2_users_teams`
--
ALTER TABLE `kimai2_users_teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_B5E92CF8A76ED395296CD8AE` (`user_id`,`team_id`),
  ADD KEY `IDX_B5E92CF8A76ED395` (`user_id`),
  ADD KEY `IDX_B5E92CF8296CD8AE` (`team_id`);

--
-- Indexes for table `kimai2_user_preferences`
--
ALTER TABLE `kimai2_user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D08F631A76ED3955E237E06` (`user_id`,`name`),
  ADD KEY `IDX_8D08F631A76ED395` (`user_id`);

--
-- Indexes for table `kimai2_working_times`
--
ALTER TABLE `kimai2_working_times`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_F95E4933A76ED395AA9E377A` (`user_id`,`date`),
  ADD KEY `IDX_F95E4933A76ED395` (`user_id`),
  ADD KEY `IDX_F95E49334EA3CB3D` (`approved_by`);

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kimai2_access_token`
--
ALTER TABLE `kimai2_access_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_activities`
--
ALTER TABLE `kimai2_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `kimai2_activities_meta`
--
ALTER TABLE `kimai2_activities_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_activities_rates`
--
ALTER TABLE `kimai2_activities_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_bookmarks`
--
ALTER TABLE `kimai2_bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_configuration`
--
ALTER TABLE `kimai2_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kimai2_customers`
--
ALTER TABLE `kimai2_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kimai2_customers_comments`
--
ALTER TABLE `kimai2_customers_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_customers_meta`
--
ALTER TABLE `kimai2_customers_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_customers_rates`
--
ALTER TABLE `kimai2_customers_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_export_templates`
--
ALTER TABLE `kimai2_export_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_invoices`
--
ALTER TABLE `kimai2_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_invoices_meta`
--
ALTER TABLE `kimai2_invoices_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_invoice_templates`
--
ALTER TABLE `kimai2_invoice_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_invoice_templates_meta`
--
ALTER TABLE `kimai2_invoice_templates_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_projects`
--
ALTER TABLE `kimai2_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `kimai2_projects_comments`
--
ALTER TABLE `kimai2_projects_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_projects_meta`
--
ALTER TABLE `kimai2_projects_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_projects_rates`
--
ALTER TABLE `kimai2_projects_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_roles`
--
ALTER TABLE `kimai2_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kimai2_roles_permissions`
--
ALTER TABLE `kimai2_roles_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_tags`
--
ALTER TABLE `kimai2_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_teams`
--
ALTER TABLE `kimai2_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kimai2_timesheet`
--
ALTER TABLE `kimai2_timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12968;

--
-- AUTO_INCREMENT for table `kimai2_timesheet_meta`
--
ALTER TABLE `kimai2_timesheet_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kimai2_users`
--
ALTER TABLE `kimai2_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kimai2_users_teams`
--
ALTER TABLE `kimai2_users_teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `kimai2_user_preferences`
--
ALTER TABLE `kimai2_user_preferences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT for table `kimai2_working_times`
--
ALTER TABLE `kimai2_working_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kimai2_access_token`
--
ALTER TABLE `kimai2_access_token`
  ADD CONSTRAINT `FK_6FB0DB1EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_activities`
--
ALTER TABLE `kimai2_activities`
  ADD CONSTRAINT `FK_8811FE1C166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_activities_meta`
--
ALTER TABLE `kimai2_activities_meta`
  ADD CONSTRAINT `FK_A7C0A43D81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_activities_rates`
--
ALTER TABLE `kimai2_activities_rates`
  ADD CONSTRAINT `FK_4A7F11BE81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4A7F11BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_activities_teams`
--
ALTER TABLE `kimai2_activities_teams`
  ADD CONSTRAINT `FK_986998DA296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_986998DA81C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_bookmarks`
--
ALTER TABLE `kimai2_bookmarks`
  ADD CONSTRAINT `FK_4016EF25A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_customers`
--
ALTER TABLE `kimai2_customers`
  ADD CONSTRAINT `FK_5A97604412946D8B` FOREIGN KEY (`invoice_template_id`) REFERENCES `kimai2_invoice_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kimai2_customers_comments`
--
ALTER TABLE `kimai2_customers_comments`
  ADD CONSTRAINT `FK_A5B142D99395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A5B142D9B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_customers_meta`
--
ALTER TABLE `kimai2_customers_meta`
  ADD CONSTRAINT `FK_A48A760F9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_customers_rates`
--
ALTER TABLE `kimai2_customers_rates`
  ADD CONSTRAINT `FK_82AB0AEC9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_82AB0AECA76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_customers_teams`
--
ALTER TABLE `kimai2_customers_teams`
  ADD CONSTRAINT `FK_50BD8388296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_50BD83889395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_invoices`
--
ALTER TABLE `kimai2_invoices`
  ADD CONSTRAINT `FK_76C38E379395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_76C38E37A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_invoices_meta`
--
ALTER TABLE `kimai2_invoices_meta`
  ADD CONSTRAINT `FK_7EDC37D92989F1FD` FOREIGN KEY (`invoice_id`) REFERENCES `kimai2_invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_invoice_templates`
--
ALTER TABLE `kimai2_invoice_templates`
  ADD CONSTRAINT `FK_1626CFE99395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kimai2_invoice_templates_meta`
--
ALTER TABLE `kimai2_invoice_templates_meta`
  ADD CONSTRAINT `FK_A165B0555DA0FB8` FOREIGN KEY (`template_id`) REFERENCES `kimai2_invoice_templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects`
--
ALTER TABLE `kimai2_projects`
  ADD CONSTRAINT `FK_407F12069395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `kimai2_customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects_comments`
--
ALTER TABLE `kimai2_projects_comments`
  ADD CONSTRAINT `FK_29A23638166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_29A23638B03A8386` FOREIGN KEY (`created_by_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects_meta`
--
ALTER TABLE `kimai2_projects_meta`
  ADD CONSTRAINT `FK_50536EF2166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects_rates`
--
ALTER TABLE `kimai2_projects_rates`
  ADD CONSTRAINT `FK_41535D55166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_41535D55A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_projects_teams`
--
ALTER TABLE `kimai2_projects_teams`
  ADD CONSTRAINT `FK_9345D431166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9345D431296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_roles_permissions`
--
ALTER TABLE `kimai2_roles_permissions`
  ADD CONSTRAINT `FK_D263A3B8D60322AC` FOREIGN KEY (`role_id`) REFERENCES `kimai2_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_timesheet`
--
ALTER TABLE `kimai2_timesheet`
  ADD CONSTRAINT `FK_4F60C6B1166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `kimai2_projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4F60C6B181C06096` FOREIGN KEY (`activity_id`) REFERENCES `kimai2_activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4F60C6B18D93D649` FOREIGN KEY (`user`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_timesheet_meta`
--
ALTER TABLE `kimai2_timesheet_meta`
  ADD CONSTRAINT `FK_CB606CBAABDD46BE` FOREIGN KEY (`timesheet_id`) REFERENCES `kimai2_timesheet` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_timesheet_tags`
--
ALTER TABLE `kimai2_timesheet_tags`
  ADD CONSTRAINT `FK_732EECA9ABDD46BE` FOREIGN KEY (`timesheet_id`) REFERENCES `kimai2_timesheet` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_732EECA9BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `kimai2_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_users`
--
ALTER TABLE `kimai2_users`
  ADD CONSTRAINT `FK_B9AC5BCE19E9AC5F` FOREIGN KEY (`supervisor_id`) REFERENCES `kimai2_users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kimai2_users_teams`
--
ALTER TABLE `kimai2_users_teams`
  ADD CONSTRAINT `FK_B5E92CF8296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `kimai2_teams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B5E92CF8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_user_preferences`
--
ALTER TABLE `kimai2_user_preferences`
  ADD CONSTRAINT `FK_8D08F631A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kimai2_working_times`
--
ALTER TABLE `kimai2_working_times`
  ADD CONSTRAINT `FK_F95E49334EA3CB3D` FOREIGN KEY (`approved_by`) REFERENCES `kimai2_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_F95E4933A76ED395` FOREIGN KEY (`user_id`) REFERENCES `kimai2_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
