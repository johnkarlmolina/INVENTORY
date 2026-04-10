-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2026 at 03:40 AM
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
-- Database: `inventory_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `computer_service`
--

CREATE TABLE `computer_service` (
  `service_id` int(255) NOT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `property_tag` varchar(255) DEFAULT NULL,
  `problem` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `time_encoded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type_of_asset` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `computer_service`
--

INSERT INTO `computer_service` (`service_id`, `serial_number`, `property_tag`, `problem`, `remarks`, `time_encoded`, `type_of_asset`) VALUES
(100, 'test sn', 'test pt', 'test problem ', 'test remarks', '2026-03-30 05:24:10', NULL),
(101, 'test sn', 'test pt', 'rerwerwe', 'werwerwer', '2026-03-30 05:24:10', NULL),
(102, 'NXGCUSP004725102FC7600', '', '', '', '2026-03-30 05:24:10', NULL),
(103, 'testsn213123', '7723299329', 'computer not working', 'bhla bla bla bla', '2026-03-30 05:24:10', NULL),
(104, 'testtoday', '213123123', 'testing description', 'test remarks and solution', '2026-03-30 05:24:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `consumable_logs`
--

CREATE TABLE `consumable_logs` (
  `item` varchar(255) DEFAULT NULL,
  `item_status` text DEFAULT NULL,
  `transact_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `issued_quantity` int(10) DEFAULT NULL,
  `item_class` text DEFAULT NULL,
  `stock_no` int(255) DEFAULT NULL,
  `issued_to` varchar(255) DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL,
  `consumable_no` int(255) NOT NULL,
  `date_input` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumable_logs`
--

INSERT INTO `consumable_logs` (`item`, `item_status`, `transact_date`, `issued_quantity`, `item_class`, `stock_no`, `issued_to`, `batch_number`, `consumable_no`, `date_input`) VALUES
('gagi5', NULL, '2026-03-16 04:34:38', 5, 'IT Consumables', 9, 'it', '121323454', 9, '2026-03-16T12:34'),
('ink', NULL, '2026-03-16 06:35:50', 5, 'ink', 5, 'admitting', '', 10, '2026-03-16T14:35'),
('ink', NULL, '2026-03-16 06:53:58', 10, 'ink', 5, 'billing', '', 11, '2026-03-16T14:53'),
('ink', NULL, '2026-03-16 07:17:56', 10, 'ink', 5, 'accounting', '', 12, '2026-03-16T15:17');

-- --------------------------------------------------------

--
-- Table structure for table `consumable_logs_statuses`
--

CREATE TABLE `consumable_logs_statuses` (
  `item` varchar(255) DEFAULT NULL,
  `item_status` text DEFAULT NULL,
  `transact_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `issued_quantity` int(10) DEFAULT NULL,
  `item_class` text DEFAULT NULL,
  `stock_no` int(255) DEFAULT NULL,
  `issued_to` varchar(255) DEFAULT NULL,
  `item_log` varchar(255) DEFAULT NULL,
  `consumable_no` int(255) DEFAULT NULL,
  `consumable_log_number` int(255) NOT NULL,
  `item_classification` text DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL,
  `return_qty` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumable_logs_statuses`
--

INSERT INTO `consumable_logs_statuses` (`item`, `item_status`, `transact_date`, `issued_quantity`, `item_class`, `stock_no`, `issued_to`, `item_log`, `consumable_no`, `consumable_log_number`, `item_classification`, `batch_number`, `return_qty`) VALUES
('gagi5', 'UNDO', '2026-03-11 04:59:14', 11, NULL, 9, 'Admitting', NULL, 4, 1, 'IT Consumables', '121323454', NULL),
('ink', 'UNDO', '2026-03-11 05:00:15', 3, NULL, 5, 'billing', NULL, 5, 2, 'ink', '', NULL),
('ink', 'UNDO', '2026-03-11 05:01:12', 5, NULL, 5, 'IT', NULL, 3, 3, 'ink', '', NULL),
('gagi5', 'UNDO', '2026-03-12 06:52:10', 1, NULL, 9, 'it', NULL, 6, 4, 'IT Consumables', '121323454', NULL),
('ink', 'UNDO', '2026-03-13 00:57:19', 1, NULL, 1, 'admitting', NULL, 8, 5, '', '', NULL),
('ink', 'UNDO', '2026-03-16 03:00:18', 1, NULL, 5, 'Billing', NULL, 7, 6, 'ink', '', NULL),
('ink', 'UNDO', '2026-03-16 04:32:48', 0, NULL, 1, NULL, NULL, 1, 7, '', NULL, NULL),
('ink', 'UNDO', '2026-03-16 04:32:53', 0, NULL, 5, NULL, NULL, 2, 8, 'ink', NULL, NULL),
('gagi5', 'RETURNED', '2026-03-16 06:17:01', 2, NULL, 9, 'it', NULL, 9, 9, 'IT Consumables', '121323454', NULL),
('ink', 'RETURNED', '2026-03-16 06:35:49', 5, NULL, 5, 'admitting', NULL, 10, 10, 'ink', '', NULL),
('ink', 'RETURNED', '2026-03-16 07:17:56', 10, NULL, 5, 'accounting', NULL, 12, 11, 'ink', '', NULL),
('ink', 'UNDO', '2026-03-18 07:39:55', 32, NULL, 5, '', NULL, 14, 12, 'ink', '', 32),
('gagi5', 'UNDO', '2026-03-18 07:40:01', 20, NULL, 9, '', NULL, 13, 13, 'IT Consumables', '121323454', 20);

-- --------------------------------------------------------

--
-- Table structure for table `consumable_reports`
--

CREATE TABLE `consumable_reports` (
  `item` varchar(255) DEFAULT NULL,
  `item_status` text DEFAULT NULL,
  `transact_date` varchar(255) DEFAULT NULL,
  `encoded_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `issued_quantity` int(10) DEFAULT NULL,
  `item_class` text DEFAULT NULL,
  `stock_no` int(255) DEFAULT NULL,
  `issued_to` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consumable_reports`
--

INSERT INTO `consumable_reports` (`item`, `item_status`, `transact_date`, `encoded_time`, `issued_quantity`, `item_class`, `stock_no`, `issued_to`) VALUES
('ink', 'Stock available', '2023-01-10 14:55:29', '2023-01-10 06:55:35', 3, 'ink', 5, ''),
('ink', 'Stock available', '2023-04-27 09:19:28', '2023-04-27 01:20:08', 1, '', 1, ''),
('ink', 'Stock available', '2023-04-27 09:19:47', '2023-04-27 01:20:08', 4, 'ink', 5, ''),
('ink', 'Stock available', '2023-04-27 09:19:28', '2023-04-27 01:20:19', 1, '', 1, ''),
('ink', 'Stock available', '2023-04-27 09:19:47', '2023-04-27 01:20:19', 4, 'ink', 5, ''),
('ink', 'Stock available', '2023-04-27 09:19:28', '2023-04-27 01:20:28', 1, '', 1, ''),
('ink', 'Stock available', '2023-04-27 09:20:25', '2023-04-27 01:20:28', 5, 'ink', 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'ychad', 'ychad', '2026-02-25 00:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `main_consumables`
--

CREATE TABLE `main_consumables` (
  `item` varchar(255) DEFAULT NULL,
  `item_classification` varchar(255) DEFAULT NULL,
  `current_stock` int(255) DEFAULT NULL,
  `stock_no` int(255) NOT NULL,
  `date_of_entry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_purchase` varchar(255) DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `model` varchar(10) DEFAULT NULL,
  `starting_stock` int(255) DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL,
  `item_status` text DEFAULT NULL,
  `delivery_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_consumables`
--

INSERT INTO `main_consumables` (`item`, `item_classification`, `current_stock`, `stock_no`, `date_of_entry`, `date_of_purchase`, `brand`, `model`, `starting_stock`, `batch_number`, `item_status`, `delivery_date`) VALUES
('ink', 'Office Supplies', 8, 1, '2026-03-18 03:53:49', '2023-02-09', 'test', 'test Model', NULL, '3456789', 'inactive', NULL),
('ink', '', 0, 3, '2026-03-18 03:53:01', '', '', '', NULL, NULL, 'active', NULL),
('ink', '', 31, 5, '2026-03-18 07:40:45', '', 'epson', 'l310', NULL, '', 'active', NULL),
('', '', NULL, 6, '2026-03-18 03:53:01', NULL, '', '', 0, NULL, 'active', NULL),
('', '', NULL, 7, '2026-03-18 03:53:01', NULL, '', '', 0, NULL, 'active', NULL),
('Ink', 'Ink', NULL, 8, '2026-03-18 03:53:01', NULL, 'gagi brand', '003', 20, NULL, 'active', NULL),
('gagi5', 'IT Consumables', 19, 9, '2026-03-18 07:40:54', '', 'gagi5brand', 'gagi model', 20, '121323454', 'active', NULL),
('mop', 'Cleaning Supplies', 7, 10, '2026-03-18 03:53:42', '2026-03-16', 'test', 'test Model', 7, '3232343233', 'inactive', '2026-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `main_consumables_changes`
--

CREATE TABLE `main_consumables_changes` (
  `item` varchar(255) DEFAULT NULL,
  `item_classification` varchar(255) DEFAULT NULL,
  `current_stock` int(255) DEFAULT NULL,
  `stock_no` int(255) NOT NULL,
  `date_of_entry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_of_purchase` varchar(255) DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `model` varchar(10) DEFAULT NULL,
  `starting_stock` int(255) DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL,
  `issued_to` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_consumables_changes`
--

INSERT INTO `main_consumables_changes` (`item`, `item_classification`, `current_stock`, `stock_no`, `date_of_entry`, `date_of_purchase`, `brand`, `model`, `starting_stock`, `batch_number`, `issued_to`) VALUES
('ink', '', 7, 1, '2026-03-12 07:16:36', '2023-02-09', 'test', 'test Model', NULL, '', NULL),
('ink', 'Office Supplies', 7, 1, '2026-03-12 07:17:33', '2023-02-09', 'test', 'test Model', NULL, '3456789', NULL),
('ink', NULL, 33, 5, '2026-03-18 07:40:22', '', 'epson', 'l310', NULL, '', NULL),
('ink', '', 31, 5, '2026-03-18 07:40:45', '', 'epson', 'l310', NULL, '', NULL),
('gagi5', 'IT Consumables', 19, 9, '2026-03-18 07:40:54', '', 'gagi5brand', 'gagi model', NULL, '121323454', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `main_inventory`
--

CREATE TABLE `main_inventory` (
  `computer_id` int(10) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `property_tag` varchar(255) DEFAULT NULL,
  `os_version` varchar(50) DEFAULT NULL,
  `procie` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `os_license` varchar(255) DEFAULT NULL,
  `pc_user` text DEFAULT NULL,
  `user_dept` text DEFAULT NULL,
  `date_of_purchase` varchar(50) DEFAULT NULL,
  `date_of_entry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `picture_of_pc` varchar(255) DEFAULT NULL,
  `office_license` varchar(255) DEFAULT NULL,
  `pc_no` text DEFAULT NULL,
  `pc_status` text DEFAULT NULL,
  `pc_location` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_inventory`
--

INSERT INTO `main_inventory` (`computer_id`, `brand`, `model`, `serial_number`, `property_tag`, `os_version`, `procie`, `ram`, `os_license`, `pc_user`, `user_dept`, `date_of_purchase`, `date_of_entry`, `picture_of_pc`, `office_license`, `pc_no`, `pc_status`, `pc_location`) VALUES
(9, 'ACER', 'Veriton', 'DTVSDSP00L010009DC3000', '2021-05-03-82730-01-4421', 'WINDOWS 10', 'i7-9700', '8', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T', 'Mary Rose S. Bartolome', 'Admitting', '2021-06-17', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', '83015@office365online.co', '6', 'active', '1st Floor'),
(10, 'ACER', 'Veriton', 'DTVSDSP00L010009E23000', '2021-05-03-82729-01-4421', 'Windows 10', 'i7-9700', '8', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T', 'Florence Erika Karen P. Molina', 'Billing and Claims', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'N7DHG-GPFVY-6T9DH-XV7D4-F626G', '5', 'active', '1st Floor'),
(11, 'ACER', 'Veriton', 'DTVSDSP00L010009C43000', '2021-05-03-82736-01-4421', 'Windows 11', 'i7-9700', '8', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T', 'Ralph Arian M. Santos', 'Billing and Claims', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'TQ3NY-QK7MM-FTJG4-BF3B2-XTQT2', '12', 'active', '1st Floor'),
(12, 'ACER', 'Veriton', 'DTVSDSP00L010009CB3000', '2021-05-03-82738-01-4421', 'Windows 11', 'i7-9700', '8', '8WWNC-8T9BT-YJ96M-4988T-QYH22', 'Accounting Staff', 'Accounting', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'N7BH-3M64J-7WT8Q-XG68V-7QYCT', '14', 'active', '3rd Floor'),
(13, 'ACER', 'Veriton', 'DTVSDSP00L010009CD3000', '2021-05-03-82734-01-4421', 'Windows 11', 'i7-9700', '8', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T', 'Maria Andrea P. Rabino', 'Accounting', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'X7NJG-VKHFB-C6BFD-8B2QH-6XY86', '10', 'active', '3rd Floor'),
(14, 'ACER', 'Veriton', 'DTVSDSP00L010009EE3000', '2021-05-03-82725-01-4421', 'Windows 11', 'i7-9700', '8', 'NVWDT-6JFM7-HH6C3-964HC-4RG6P', 'Jerlie C. Soledad', 'Cashier', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'NBVJJ-D2HTP-3TW2Q-HTPJJ-TQ9GG', '1', 'active', '1st Floor'),
(15, 'ACER', 'Veriton', 'DTVSDSP00L010009E53000', '2021-05-03-82727-01-4421', 'Windows 11', 'i7-9700', '8', 'QRNMP-C9CGW-M96QH-FRK3T-CGYP2', 'Mary Grace M. Dela Cruz', 'Cashier', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'N7DHG-GPFVY-6T9DH-XV7D4-F626G', '3', 'active', '1st Floor'),
(16, 'ACER', 'Veriton', 'DTVSDSP00L010009C93000', '2021-05-03-82735-01-4421', 'Windows 11', 'i7-9700', '8', 'X79NW-6YHQ7-C2RBB-DBMBH-T3BP2', 'Cecilia G. Ortiz', 'Laboratory Blood Bank', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', '2YNDC-YQVT4-D3J9F-6H2V4-WFJJ6', '11', 'active', '1st Floor'),
(17, 'ACER', 'Veriton', 'DTVSDSP00L010009E43000', '2021-05-03-82728-01-4421', 'Windows 11', 'i7-9700', '8', 'NVCJJ-FRJD2-GGP7R-6PFH4-Q9MP2', 'Edmund M. Agus', 'Medical Records', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', '9HGN4-K4P28-7M6FR-VXQMP-7CGKP', '4', 'active', '1st Floor'),
(18, 'ACER', 'Veriton', 'DTVSDSP00L010009D43000', '2021-05-03-82732-01-4421', 'Windows 11', 'i7-9700', '8', 'VTC2J-DNKP9-TJ94T-V7FDV-R9CKC', 'Marife O. Gozon', 'Medical Records', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'TNJ8B-TXJYP-RCRJ9-QKV8Y-PR6TG', '8', 'active', '1st Floor'),
(19, 'ACER', 'Veriton', 'DTVSDSP00L010009E73000', '2021-05-03-82726-01-4421', 'Windows 11', 'i7-9700', '8', 'NF6HC-QH89W-F8WYV-WWXV4-WFG6P', 'Dennis G. Villanueva', 'Information Technology', '2024-05-14', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'TVN8R-7R7YB-9B4Q9-QCC9Y-HVB3C', '2', 'active', '4th Floor'),
(20, 'ACER', 'Veriton', 'DTVSDSP00L010009863000', '2021-05-03-82737-01-4421', 'Windows 11', 'i7-9700', '8', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T', 'Olive S. Bartolome', 'Pharmacy', '2024-05-14', '2026-03-19 05:25:59', NULL, 'JDGTK-G8NKX-PJQC8-KPP9C-RVXGG', '13', 'active', '1st Floor'),
(21, 'ACER', 'Veriton', 'DTVSDSP00L010009CF3000', '2021-05-03-82733-01-4421', 'Windows 11', 'i7-9700', '8', 'FGMGN-6MFQD-Y7GPK-V2MTD-3PFC2', 'Pharmacy Staff', 'Pharmacy', '2024-05-14', '2026-03-19 05:25:59', NULL, 'JD99N-KYQR2-PGVYY-Y4VRX-QV8DC', '9', 'active', '1st Floor'),
(22, 'ACER', 'Veriton', 'DTVSDSP00L010009DA3000', '2021-05-03-82731-01-4421', 'Windows 11', 'i7-9700', '8', '6MBW3-3NQM3-GHX93-F9CPY-QJ3GP', 'Lexter Carl N. Castro', 'Information Technology', '2024-05-14', '2026-03-19 05:25:59', NULL, '2XFHB-FNKPT-G4DBV-49CBK-DYJ9P', '7', 'active', '4th Floor'),
(23, 'HP', 'Pavilion', '8CC8240QP8', '18-27634AB', 'Windows 10', 'i7-8700T', '8', 'Digital License', 'Eric H. Molina', 'Property and Supply', '2024-05-14', '2026-03-19 05:25:59', NULL, 'N/A', '3', 'active', '4th Floor'),
(24, 'HP', 'Pavilion', '8CC821072W', '18-27633AB', 'Windows 10', 'i7-8700T', '8', 'Digital License', 'Jo-ann S. Gutierrez', 'Personnel', '2024-05-14', '2026-03-19 05:25:59', NULL, 'N/A', '2', 'active', '3rd Floor'),
(25, 'HP', 'Pavilion', '8CC2240QRS', '18-27632AB', 'Windows 10', 'i7-8700T', '8', 'Digital License', 'Ralph Ariane M. Santos', 'Billing and Claims', '2024-05-14', '2025-01-24 02:26:33', NULL, 'N/A', '1', 'For Condemned', 'IT Storage Room'),
(26, 'ACER', 'Aspire C24-865', 'DQBBUSP00292907B2D3000', 'N/A', 'Windows 10', 'i5-8250U', '4', 'Digital License', 'Claire S. Herry', 'Malasakit', '2018-10-01', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '1st Floor'),
(27, 'ACER', 'Aspire C24-865', 'DQBBUSP00292907B123000', 'N/A', 'Windows 10', 'i5-8250U', '4', 'Digital License', 'Carmela Krizha C. Jimenez', 'Malasakit', '2018-10-01', '2026-03-19 05:25:59', NULL, 'N/A', '2', 'active', '1st Floor'),
(28, 'ACER', 'Aspire C24-865', 'DQBBUSP00292907AFB3000', 'N/A', 'Windows 10', 'i5-8250U', '4', 'Digital License', 'Jonabelle E. Guevarra', 'Malasakit', '2018-10-01', '2026-03-19 05:25:59', NULL, 'N/A', '3', 'active', '1st Floor'),
(29, 'ACER', 'Aspire C24-865', 'DQBBUSP00292907B103000', 'N/A', 'Windows 10', 'i5-8250U', '4', 'Digital License', 'Emmanuel D. Pacubas', 'Malasakit', '2018-10-01', '2026-03-19 05:25:59', NULL, 'N/A', '4', 'active', '1st Floor'),
(30, 'ASUS', 'Fortress', 'H6M0KC279141', '17-15657B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Daryl R. Carida', 'Accounting', '2018-03-01', '2025-01-21 03:13:34', NULL, 'N/A', '6', 'For Condemn', 'IT Storage Room'),
(31, 'ASUS', 'Fortress', 'H6M0KC462409', '17-15656B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'April SG Paura', 'Billing and Claims', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '13', 'active', '1st Floor'),
(32, 'ASUS', 'Fortress', 'FBPDCG000ADB', '17-15665B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Angelica L. Tambal', 'CQI', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '5', 'active', '3rd Floor'),
(33, 'ASUS', 'Fortress', 'H6M0KC462411', '17-15661B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Robert Noel P. Felias', 'CQI', '2018-03-01', '2026-03-19 05:25:59', NULL, '10594@aqgfwacnz0.onmicrosoft.com', '4', 'active', '3rd Floor'),
(34, 'ASUS', 'Fortress', 'H6M0KC279142', '17-15658B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Medtech Staff', 'Laboratory', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '11', 'active', '1st Floor'),
(35, 'ASUS', 'Fortress', 'H6M0KC462408', '17-15662B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Medtech Staff', 'Laboratory', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '12', 'active', '1st Floor'),
(36, 'ASUS', 'Fortress', 'H6M0KC462406', '17-15659B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Roloromo A. Bacud', 'Medical Records', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '8', 'active', '1st Floor'),
(37, 'ASUS', 'Fortress', 'H6M0KC462305', '17-15663B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Lowie Joy A. Ayes', 'Medical Records', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '9', 'active', '1st Floor'),
(38, 'ASUS', 'Fortress', 'H6M0KC462407', '17-15653B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Marivic O. Rombaon', 'Medical Records', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '7', 'active', '1st Floor'),
(39, 'ASUS', 'Fortress', 'H6M0KC279144', '17-15664B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Doctors', 'TaskForce', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '3rd Floor'),
(40, 'ASUS', 'Fortress', 'H6M0KC462302', '17-15660B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Ferdinand R. Molina', 'Radiology Ultrasound', '2018-03-01', '2025-01-21 03:14:47', NULL, 'N/A', '10', 'For Condemn', 'IT Storage Room'),
(41, 'ASUS', 'Fortress', 'H6M0KC462297', '17-15654B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Ailime P. Samano', 'Personnel', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '2', 'active', '3rd Floor'),
(42, 'LENOVO', 'H30-50', 'R30106GR', '16-7959 B', 'WINDOWS 10', 'i5-4460', '4', 'Digital License', 'Jennifer G. Calpito', 'IPC', '2016-02-01', '2024-11-18 06:37:47', NULL, 'N/A', '1', 'Condemned', '3rd Floor'),
(43, 'LENOVO', 'H30-50', 'R30106ZB', '16-7962B', 'Windows 10', 'i5-4460', '4', 'Digital License', 'Rolando O. Tanglao', 'Billing and Claims', '2016-02-01', '2026-03-19 05:25:59', NULL, 'N/A', '4', 'active', '1st Floor'),
(44, 'LENOVO', 'H30-50', 'R30106HK', '16-7960B', 'WINDOWS 10', 'i5-4460', '4', 'Digital License', 'Racquel T. Dela Torre', 'DO', '2016-02-01', '2024-11-18 06:38:54', NULL, 'N/A', '2', 'Condemned', '3rd Floor'),
(45, 'LENOVO', 'H30-50', 'R30106UP', '16-7965B', 'Windows 10', 'i5-4460', '4', 'Digital License', 'Cherry I. Cajilog', 'Physical Therapy', '2016-02-01', '2024-12-03 02:41:18', NULL, 'N/A', '7', 'Condemned', '1st Floor'),
(46, 'LENOVO', 'H30-50', 'R30106UQ', '16-7964B', 'Windows 10', 'i5-4460', '4', 'Digital License', 'Merlito S. Viray', 'Radiology', '2016-02-01', '2026-03-19 05:25:59', NULL, 'N/A', '6', 'active', '1st Floor'),
(47, 'LENOVO', 'Think Centre M70Q', 'PBVLBFC', 'N/A', 'WINDOWS 10', 'i5-12500T', '16', 'Digital License', 'Pauline Tingin', 'Philhealth', '2022-01-13', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '1st Floor Philhealth Office'),
(48, 'LENOVO', 'C20-00', 'MP10ZLUR', '16-12423', 'Windows 10', 'Intel Pentium J3710', '4', 'Digital License', 'Renz Arby S. Santos', 'Continuous Quality Improvement', '2016-12-28', '2026-03-19 05:25:59', NULL, 'N/A', '2', 'active', '3rd Floor'),
(49, 'LENOVO', 'C20-00', 'MP10ZLWR', '16-12451', 'Windows 10', 'Intel Pentium J3710', '4', 'Digital License', 'Anna Liza G. Suaring', 'Continuous Quality Improvement', '2016-12-28', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '3rd Floor'),
(50, 'CROWN', 'Generic', 'Clone', '11-1701 (7-7)B', 'Windows 10', 'i3-2100', '2', 'Digital License', 'Roberto A. Bansil', 'Infection Prevention Control Unit', '2011-11-11', '2026-03-19 05:25:59', NULL, 'N/A', '7', 'active', '3rd Floor'),
(51, 'CROWN', 'Generic', 'Clone', '11-1701 (4-7)B', 'Windows 10', 'i3-2100', '2', 'Digital License', 'Marimar S. Lapesura', 'Personnel', '2011-11-11', '2026-03-19 05:25:59', NULL, 'N/A', '4', 'active', '3rd Floor'),
(52, 'DELL', 'Inspiron', '94FQQ12', '16-4017B', 'Windows 10', 'i5-4460S', '8', 'Digital License', 'Abegael U. Baranda', 'Personnel', '2016-04-04', '2026-03-19 05:25:59', NULL, 'N/A', '4', 'active', '3rd Floor'),
(53, 'DELL', 'Inspiron', 'C1FQQ12', '16-4019B', 'Windows 10', 'i5-4460S', '8', 'Digital License', 'John Manolhet G. Logrosa', 'Personnel', '2016-04-04', '2026-03-19 05:25:59', NULL, 'N/A', '6', 'active', '3rd Floor'),
(54, 'DELL', 'Inspiron', '13BKW22', '16-4014B', 'Windows 10', 'i5-4460S', '8', 'Digital License', 'Maria Vera Y. Navarro', 'Personnel', '2016-04-04', '2026-03-19 05:25:59', NULL, '83015@office365online.co', '1', 'active', '3rd Floor'),
(55, 'DELL', 'Inspiron', '14FQQ12', '16-4018B', 'Windows 10', 'i5-4460S', '8', 'Digital License', 'Joselyn M. Montecalvo', 'Nursing Service Office', '2016-04-04', '2026-03-19 05:25:59', NULL, 'N/A', '5', 'active', '3rd Floor'),
(56, 'DELL', 'Inspiron', 'D42JR42', '16-4020B', 'Windows 10', 'i5-4460S', '8', 'Digital License', 'NBS Staff', 'New Born Screening', '2016-04-04', '2026-03-19 05:25:59', NULL, 'N/A', '7', 'active', '2nd Floor'),
(57, 'DELL', 'Inspiron', '8HDQQ12', '16-4016B', 'Windows 10', 'i5-4460S', '8', 'Digital License', 'Sammy Jones S. Durante', 'Nursing Service CSR', '2016-04-04', '2026-03-19 05:25:59', NULL, 'N/A', '3', 'active', '4th Floor'),
(58, 'DELL', 'Inspiron', 'J8DQQ12', '16-4015B', 'Windows 10', 'i5-4460S', '8', 'Digital License', 'Nanette Rabino', 'Dietary', '2016-04-04', '2025-05-06 03:27:24', NULL, 'N/A', '2', 'For Condemn', '4th Floor IT Storage Room'),
(59, 'ASUS', 'CP6230', 'C4PDAG0013VV', '13-695 (1-7)', 'Windows 10 Pro', 'G850', '4', 'Digital License', 'Analiza Rega', 'Nursing Service Office', '2013-07-29', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '3rd Floor'),
(60, 'ASUS', 'CP6230', 'C4PDA60013W7', '13-695 (7-7)', 'Windows 10', 'G850', '4', 'Digital License', 'Mary Grace Ruiz', 'Cashier', '2013-07-29', '2024-12-03 02:31:20', NULL, 'N/A', '7', 'Condemned', '1st Floor'),
(62, 'ASUS', 'CP6230', 'C4PDAG0013WA', '13-695 (2-7)', 'Windows 10 Pro', 'G850', '4', 'Digital License', 'Franchezca Marie A. De Lumen', 'Personnel', '2013-07-29', '2026-03-19 05:25:59', NULL, 'N/A', '2', 'active', '3rd Floor'),
(63, 'ASUS', 'Fortress', 'H6M0KC462298', '17-15655B', 'Windows 10', 'i5-7400', '4', 'Digital License', 'Alpha T. Sagario', 'RT', '2018-03-01', '2026-03-19 05:25:59', NULL, 'N/A', '3', 'active', '1st Floor'),
(64, 'INTEL', 'E7400', 'BTPR913006W4', '09-1058(1-4)', 'WINDOWS 10', '', '', 'N/A', 'Glen Corpuz', 'CQI', '2009-05-08', '2024-11-14 06:50:49', NULL, 'N/A', '', '', ''),
(65, 'HP', 'Pavilion NY792AA-A2K ', 'CNX95103M0', '09-1058', 'Windows 10 Pro', 'Intel Core 2 Quad Q8400', '4', 'Digital License', 'Pharmacy Staff', 'Pharmacy', '2009-05-08', '2025-01-24 05:58:13', NULL, 'N/A', '1', 'For Condemn', '4th Floor IT Storage Room'),
(66, 'ASUS', 'N/A', 'MF70B8G10910189', 'N/A', 'os', 'Intel G620', '4', 'N/A', 'Cristina R. Florencio', 'OPD', '2022-01-04', '2024-11-07 05:37:39', NULL, 'N/A', NULL, NULL, NULL),
(67, 'ASUS', 'CP6230', 'C4PDAG000CEF', '13-695 (3-7)', 'Windows 10 Pro', 'G850', '4', 'Digital License', 'Shiera Santos', 'DO', '2013-07-29', '2026-03-19 05:25:59', NULL, 'N/A', '3', 'active', '3rd Floor'),
(68, 'ASUS', 'CP6230', 'C4PDAG0013VT', '13-695 (4-7)', 'Windows 10', 'G850', '4', 'Digital License', 'Erica Kryzta I. Patiag', 'NICU', '2013-07-29', '2024-12-03 02:22:03', NULL, 'N/A', '4', 'Condemned', '2nd Floor'),
(69, 'HP', '280 G2 MT', 'SGH733TCGJ', 'N/A', 'Windows 10 Pro', ' i7-6700', '8', 'N/A', 'Alpha Baltazar', 'Philhealth', '2022-01-13', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '1st Floor Philhealth Office'),
(70, 'ASUS', 'CP6230', 'C4PDAG0013VS', '13-695(6-7)', 'Windows 10 Pro', 'G850', '4', 'Digital License', 'Joy T. Gualberto', 'OR/DR', '2013-07-29', '2026-03-19 05:25:59', NULL, 'N/A', '6', 'active', '2nd Floor'),
(71, 'LENOVO', 'H30-50', 'R30106UJ', '16-7961B', 'Windows 10', 'i5-4460', '4', 'Digital License', 'Cindy May G. Del Mundo', 'Dental', '2016-02-01', '2026-03-19 05:25:59', NULL, 'N/A', '3', 'active', '1st Floor'),
(72, 'ACER', 'Veriton M2640G', 'DBVPN11001828013089100', '19-2061B', 'Windows 7', '', '', 'N/A', 'Claire G. Santos', 'Laboratory Drug Testing', '2019-03-19', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '1st Floor'),
(73, 'ACER', 'E5-475', 'NXGCUSP0047251035D7600', '18-012', 'WINDOWS 10', '', '', '7FJWN-Q2MPG-PCX8P-DKQBY-K766T', 'Renz Arby Santos', 'CQI', '2019-01-15', '2025-08-11 03:20:38', NULL, 'BWTPN-TM3JT-DVRV9-JX338-6MXJK', '', '', ''),
(74, 'ACER', 'E5-475', 'NXGCUSP0047251019D7600', '18-013', 'WINDOWS 10', '', '', 'N/A', 'Erickson Sto. Tomas', 'Information Technology', '2019-01-15', '2025-08-11 03:21:51', NULL, 'MJ93M-VNHM2-JPX48-MFV8T-CG34X', '', '', ''),
(75, 'CROWN', 'Generic', 'Clone', '11-1701 (1-7)B', 'Windows 10', 'i3-2100', '2', 'Digital License', 'Roberto N. Gonzales', 'Engineering', '2011-11-11', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '4th Floor'),
(77, 'INTEL', 'E7400', 'BTPR909001RA', '14-0077785', 'os', '', '4', 'N/A', 'Armi-Linda T. Pacheco', 'Laboratory Blood Bank', '2022-07-29', '2024-11-06 05:29:36', NULL, 'N/A', NULL, NULL, NULL),
(78, 'LENOVO', 'H30-50', 'R30106R4', '16-79638', 'Windows 10', 'i5-4460', '4', 'Digital License', 'Omega Fralix G. Cruz', 'OB', '2016-02-01', '2026-03-19 05:25:59', NULL, 'N/A', '5', 'active', '2nd Floor'),
(79, 'TRENDSONIC', 'CLONE', 'BTCR137018L6', 'N/A', 'Windows 10', 'i3-2100', '2', 'Digital License', 'Rohclem O. Esguerra', 'Engineering Office', '2009-11-04', '2026-03-19 05:25:59', NULL, 'N/A', '1', 'active', '4th Floor'),
(80, 'ASUS', 'All Series', '150850919111704', '14-516B', 'Windows 10 Pro', 'i3-4170', '8', 'Digital License', 'Cherry I. Cajilog', 'Physical Therapy', '2020-01-01', '2026-03-19 05:25:59', 'D:/xampp/htdocs//inventory_system/test_environment/pc_images/', 'N/A', '1', 'active', '1st Floor Physical Therapy Office'),
(81, 'Apple', 'Macintosh', 'C02J100QDHJF', '0076226', 'os', 'Intel', '4', '', 'William', 'HOPSS', '1990-01-01', '2024-01-11 02:07:46', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'n/a', NULL, NULL, NULL),
(82, 'LENOVO', 'D24-40', 'GM09LT5D', '2024-05-03-0448-01-1031', 'Windows 11', 'i5-12500T', '16', 'Digital License', 'Merlito S. Viray', 'Radiology', '2024-02-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '2', 'active', '1st Floor'),
(83, 'LENOVO', 'D24-40', 'GM09LTM5', '2024-05-03-0449-01-1031', 'Windows 11', 'i5-12500T', '16', 'Digital License', 'Jennifer G. Calpito', 'IPC', '2024-05-20', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '3', 'active', '3rd Floor'),
(84, 'LENOVO', 'D24-40', 'GM09LTV7', '2024-05-03-0447-01-1031', 'Windows 11', 'i5-12500T', '16', 'Digital License', 'Ferdinand Domingo', 'PHU', '2024-02-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '1', 'active', '1st Floor'),
(85, 'ACER', 'Aspire', 'NXVPQSP01S20229F987600', '2022-05-03-19505-01-4421', 'Windows 10 pro', 'i7 11th gen', '16', 'N/A', 'Rhay Sousa', 'DO', '2024-02-06', '2024-02-19 08:09:49', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'n/a', NULL, NULL, NULL),
(89, 'LENOVO', 'TB-73051', 'HPV1TDSC(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:19:54', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(90, 'LENOVO', 'TB-73051', 'HPV1TCXV(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:21:23', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(91, 'LENOVO', 'TB-73051', 'HA159YBN(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:22:25', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(92, 'LENOVO', 'TB-73051', 'HPV1TDKK(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:23:10', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(93, 'LENOVO', 'TB-73051', 'HPV1TDQM(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:23:48', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(94, 'LENOVO', 'TB-73051', 'HPV1TD22(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:24:23', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(95, 'LENOVO', 'TB-73051', 'HPV1TDQY(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:25:01', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(96, 'LENOVO', 'TB-73051', 'HA159HJF(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:25:46', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(97, 'LENOVO', 'TB-73051', 'HPV1TDUK(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:27:37', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(98, 'LENOVO', 'TB-73051', 'HPV1TD14(81)', 'N/A', 'ANDROID 9', 'MT8321 32 BIT', '1', 'N/A', '', 'OPD', '2021-03-11', '2024-05-10 08:31:09', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/TAB7.jpg', 'N/A', NULL, NULL, NULL),
(99, 'DELL', 'Vostro', 'BXXDJM3', '2022-05-03-21336-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Edelyn Rose R. Rendon', 'Radiology', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh3100722@outlook.com', '3', 'active', '1st Floor'),
(100, 'DELL', 'Vostro', 'FVXDJM3', '2022-05-03-21337-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Bhlesh M. Tee', 'Medical Records', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh4100722@outlook.com', '4', 'active', '1st Floor'),
(101, 'DELL', 'Vostro', '2XXDJM3', '2022-05-03-21343-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Paolo G. Mateo', 'Medical Records', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh10100722@outlook.com', '5', 'active', '1st Floor'),
(102, 'DELL', 'Vostro', '2WXDJM3', '2022-05-03-21362-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Emyrose Jennifer L. Tibang', 'Emergency Room', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh29100722@outlook.com', '6', 'active', '1st Floor'),
(103, 'DELL', 'Vostro', 'GXXDJM3', '2022-05-03-21349-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Eric H. Molina', 'Property and Supply', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh16100722@outlook.com', '7', 'active', '4th Floor'),
(104, 'DELL', 'Vostro', '2YXDJM3', '2022-05-03-21353-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Nanette P. Rabino', 'Dietary', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh20100722@outlook.com', '8', 'active', '1st Floor'),
(105, 'DELL', 'Vostro', '1YXDJM3', '2022-05-03-21359-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Omega Fralix G. Cruz', 'Out Patient Department', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh26100722@outlook.com', '9', 'active', '1st Floor'),
(106, 'DELL', 'Vostro', 'HVXDJM3', '2022-05-03-21335-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'CSR Staff', 'Central Supply Room', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh2100722@outlook.com', '10', 'active', '4th Floor'),
(107, 'DELL', 'Vostro', 'BWXDJM3', '2022-05-03-21342-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Cynthia S. Dolor', 'Accounting', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh9100722@outlook.com', '11', 'active', '3rd Floor'),
(108, 'DELL', 'Vostro', '1XXDJM3', '2022-05-03-21361-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Pharmacy Staff', 'Pharmacy', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh26100722@outlook.com', '12', 'active', '1st Floor'),
(109, 'DELL', 'Vostro', '7VXDJM3', '2022-05-03-21350-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Maria Jesusa B. De Leon', 'Laboratory', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh17100722@outlook.com', '13', 'active', '1st Floor'),
(110, 'DELL', 'Vostro', '3YXDJM3', '2022-05-03-21351-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Rosario J. Cruz', 'Medical Social Service', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh18100722@outlook.com', '14', 'active', '1st Floor'),
(111, 'DELL', 'Vostro', '3XXDJM3', '2022-05-03-21346-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Mary Rose S. Bartolome', 'Admitting', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh13100722@outlook.com', '15', 'active', '1st Floor'),
(112, 'DELL', 'Vostro', 'FXXDJM3', '2022-05-03-21344-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'NBS Staff', 'New Born Screening', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh11100722@outlook.com', '16', 'active', '2nd Floor'),
(114, 'ACER ASPIRE', 'N16Q1', 'NXGCUSP004725102FC7600', '', 'WINDOWS 10', 'i3', '4', '', '', 'RADIOLOGY', '', '2024-06-20 01:49:14', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '', NULL, NULL, NULL),
(116, 'DELL', 'Vostro', 'GWXDJM3', '2022-05-03-21347-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Jenevi M. Serenas', 'Personnel', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh14100722@outlook.com', '22', 'active', '3rd Floor'),
(117, 'DELL', 'Vostro', 'DWXDJM3', '2022-05-03-21352-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Gwendoline C. Belino', 'MALASAKIT', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh19100722@outlook.com', '23', 'active', '1st Floor'),
(118, 'DELL', 'Vostro', '6VXDJM3', '2022-05-03-21355-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Helen G. Bautista', 'Surgery Ward', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh22100722@outlook.com', '24', 'active', '2nd Floor'),
(120, 'DELL', 'Vostro', '8SZR6L3', '2022-05-03-21367-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Erika Kryzta I. Patiag', 'Neonatal Specialty Care Unit', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh34100722@outlook.com', '26', 'active', '2nd Floor'),
(121, 'DELL', 'Vostro', '7XXDJM3', '2022-05-03-21345-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Mary Grace M. Dela Cruz', 'Cashier', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh12100722@outlook.com', '28', 'active', '1st Floor'),
(122, 'DELL', 'Vostro', 'HJ674K3', '2022-05-03-21365-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Emergency Room Staff', 'Emergency Room', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh32100722@outlook.com', '29', 'active', '1st Floor'),
(123, 'DELL', 'Vostro', '1H674K3', '2022-05-03-21363-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'PICU Staff', 'PICU', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh30100722@outlook.com', '30', 'active', '1st Floor'),
(124, 'DELL', 'Vostro', '4WXDJM3', '2022-05-03-21334-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Ferdinand R. Molina', 'Radiology Ultrasound', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh1100722@outlook.com', '31', 'active', '1st Floor'),
(125, 'DELL', 'Vostro', 'JWXDJM3', '2022-05-03-21334-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'IT Staff', 'Information Technology', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh23100722@outlook.com', '32', 'active', '4th Floor'),
(127, 'DELL', 'Vostro', '72674K3', '2022-05-03-21364-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Erickson D. Sto. Tomas', 'Information Technology', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh33100722@outlook.com', '33', 'active', '4th Floor'),
(128, 'DELL', 'Vostro', '4VXDJM3', '2022-05-03-21354-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Aubrie B. Novesteras', 'Information Technology', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh21100722@outlook.com', '34', 'active', '4th Floor'),
(129, 'DELL', 'Vostro', 'GSZR6L3', '2022-05-03-21368-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Richard James S. Gaspar', 'Information Technology', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh35100722@outlook.com', '35', 'active', '4th Floor'),
(130, 'DELL', 'Vostro', '3VXDJM3', '2022-05-03-21341-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Evangeline A. Aguinaldo', 'OB/Pedia Ward', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh8100722@outlook.com', '21', 'active', '2nd Floor'),
(131, 'DELL', 'Vostro', '9VXDJM3', '2022-05-03-21340-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Admitting Clerk', 'Admitting', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh7100722@outlook.com', '20', 'active', '1st Floor'),
(132, 'DELL', 'Vostro', 'JVXDJM3', '2022-05-03-21348-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Ronald G. Domingo', 'General Ward', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh15100722@outlook.com', '19', 'active', '3rd Floor'),
(133, 'DELL', 'Vostro', '8XXDJM3', '2022-05-03-21339-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Nikka Rose B. Balbaloza', 'OB Ward', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh6100722@outlook.com', '18', 'active', '2nd Floor'),
(134, 'DELL', 'Vostro', 'DXXDJM3', '2022-05-03-21358-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Joy T. Gualberto', 'OR/DR', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh25100722@outlook.com', '17', 'active', '2nd Floor'),
(135, 'DELL', 'Vostro', 'HXXDJM3', '2022-05-03-21360-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Rhaymond Souza', 'DO', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh27100722@outlook.com', '2', 'active', '3rd Floor'),
(136, 'DELL', 'Vostro', '7TZR6L3', '2022-05-03-21366-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Luzviminda S. Kwong', 'DO', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh33100722@outlook.com', '1', 'active', '3rd Floor'),
(137, 'DELL', 'Vostro', '4YXDJM3', '2022-05-03-21338-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Heart Station Staff', 'Heart Station', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh5100722@outlook.com', '27', 'active', '1st Floor'),
(138, 'Power Logic', '', 'V200BK24061404', 'N/A', 'WIN 10', '', '16', '', 'Malasakit', 'Malasakit', '2024-08-29', '2024-08-30 06:42:22', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '', NULL, NULL, NULL),
(139, 'LENOVO', 'Laptop IdeaPad', 'PF54W8HT', 'N/A Donation', 'Windows 11', 'i3 12th Gen', '8', 'Digital License', 'Rosario Cruz', 'Malasakit', '2024-11-08', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '83015@office365online.co', '1', 'active', '1st Floor'),
(151, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008A73000', '2024-05-03-4326-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'OPD Staff', 'Out Patient Department', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '', '1', 'active', '1st Floor OPD Triage Area'),
(152, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434007C23000', '2024-05-03-4327-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Rohclem O. Esguerra', 'Engineering', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'er198@ms365pro.site', '2', 'active', '4th floor Engineering Office'),
(153, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008793000', '2024-05-03-4328-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Marimar S. Lapesura', 'Personnel', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'er196@ms365pro.site', '3', 'active', '3rd floor Personnel'),
(154, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008A03000', '2024-05-03-4329-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Roberto A. Bansil', 'Infection Prevention Control Unit', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'Zebediahtzwc@nthu.me', '4', 'active', '3rd Floor IPC Office'),
(155, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008853000', '2024-05-03-4330-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Pharmacy Staff', 'Pharmacy', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'Zebediahtzwc@nthu.me', '5', 'active', '1st Floor Pharmacy Dispensing Window'),
(156, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008BD3000', '2024-05-03-4331-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Daryl R. Carida', 'Accounting', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '10594@aqgfwacnz0.onmicrosoft.com', '6', 'active', '3rd Floor Accounting Office'),
(157, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008C63000', '2024-05-03-4332-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Human Milk Bank Staff', 'Human Milk Bank', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'Zebediahtzwc@nthu.me', '7', 'active', '1st floor Human Milk Bank Office'),
(158, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008933000', '2024-05-03-4333-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Medical Social Service Staff', 'Medical Social Service', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'er196@ms365pro.site', '8', 'active', '1st Floor Malasakit Center'),
(159, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434007893000', '2024-05-03-4334-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Accounting Staff', 'Accounting', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'er198@ms365pro.site	', '9', 'active', '3rd Floor Accounting Office'),
(160, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008B93000', '2024-05-03-4335-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Ryan James S. Gaspar', 'Continuous Quality Improvement', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'er198@ms365pro.site', '10', 'active', '3rd Floor CQI Office'),
(161, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434007833000', '2024-05-03-4336-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Ma. Janice A. Medina', 'Property and Supply', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '83015@office365online.co', '11', 'active', '4th Floor Property and Supply Office'),
(162, 'ACER', 'Veriton Vero N4720GT', 'DTR2BSP002434008413000', '2024-05-03-4337-01-1031', 'Windows 11', 'i5-14500T', '16', 'Digital License', 'Jennifer N. Mendoza', 'Property and Supply', '2024-11-12', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '83015@office365online.co', '12', 'active', '4th Floor Property and Supply Office'),
(163, 'DELL', 'Vostro', '6XXDJM3', '2022-05-03-21357-01-4421', 'Windows 11', 'i7-10700', '8', 'Digital License', 'Mary Joy A. Gario', 'Billing and Claims', '2022-10-03', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'qcndh24100722@outlook.com', '25', 'active', '1st floor'),
(164, 'ASUS', 'CP6230', 'C4PDAG0013VX', '13-695 (5-7)', 'Windows 10', 'G850', '4', 'Digital License', 'Olive S. Bartolome', 'Pharmacy', '2013-07-29', '2024-12-03 02:36:24', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '5', 'Condemned', '1st floor'),
(165, 'CROWN', 'Generic', 'Clone', '11-1701 (6-7)B', 'Windows 10', 'i3-2100', '2', 'Digital License', 'Analiza C. Rega', 'Nursing Service Office', '2011-11-11', '2024-12-04 04:48:02', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '6', 'Condemned', '3rd floor'),
(166, 'CROWN', 'Generic', 'Clone', '11-1701 (2-7)B', 'Windows 10', 'i3-2100', '2', 'Digital License', 'Erica N. Tierra', 'Personnel', '2011-11-11', '2024-12-04 04:06:19', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '2', 'Condemned', '3rd floor'),
(167, 'CROWN', 'Generic', 'Clone', '11-1701 (3-7)B', 'Windows 10', 'i3-2100', '2', 'Digital License', 'Eric H. Molina', 'Property and Supply', '2011-11-11', '2024-12-04 04:15:54', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '3', 'Condemned', '1st floor'),
(168, 'CROWN', 'Generic', 'Clone', '11-1701 (5-7)B', 'Windows 10', 'i3-2100', '2', 'Digital License', 'Jenevi M. Serenas', 'Personnel', '2011-11-11', '2024-12-04 04:18:06', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '5', 'Condemned', '3rd floor'),
(169, 'INTEL', 'Generic', 'Clone', '09-1058', 'Windows 7', 'Intel E7400 2.8', '2', 'N/A', 'Admitting Clerk', 'Admitting', '2009-05-05', '2024-12-05 01:41:57', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '1', 'Condemned', '1st floor'),
(170, 'LENOVO', 'C20-00', 'MP13ZCUK', '16-12392', 'Windows 10', 'Intel Pentium J3710', '4', 'Digital License', 'Ryan James S. Gaspar', 'Continuous Quality Improvement', '2016-12-28', '2024-12-06 06:28:27', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', 'N/A', '3', 'Condemned', '3rd floor'),
(171, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800A129600', '2025-05-03-1852-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Dietary Staff', 'Dietary Section', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-08338-AA801', '1', 'active', '1st Floor'),
(172, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800AE89600', '2025-05-03-1853-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Shiera Santos', 'Directors Office', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '', '2', 'active', '3rd Floor'),
(173, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800A5B9600', '2025-05-03-1854-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Emmanuel Punzalan', 'Directors Office', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-13650-AA238', '3', 'active', '3rd Floor Directors Office'),
(174, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800A309600', '2025-05-03-1855-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Physical Therapy Staff', 'Physical Therapy Section', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-22596-AA665', '4', 'active', '1st Floor Physical Therapy Office'),
(175, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800AE49600', '2025-05-03-1856-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Billing and Claims Staff', 'Billing and Claims', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-2147-AA036', '5', 'active', '1st Floor Billing and Claims Office'),
(176, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800A369600', '2025-05-03-1857-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Grandeuso Corpuz', 'Continuous Quality Improvement', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-14361-AA247', '6', 'active', '3rd Floor CQI Office'),
(177, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800AC89600', '2025-05-03-1858-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Anna Liza G. Suaring', 'Continuous Quality Improvement', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-08000-AA115', '7', 'active', '3rd Floor CQI Office'),
(178, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800A829600', '2025-05-03-1859-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Renz Arby S. Santos', 'Continuous Quality Improvement', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-08692-AA025', '8', 'active', '3rd Floor CQI Office'),
(179, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800A8E9600', '2025-05-03-1860-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Analiza Rega', 'Nursing Service Office', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', ' 00469-55029-05904-AA227 ', '9', 'active', '3rd Floor Nursing Office'),
(180, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800AEC9600', '2025-05-03-1861-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Maria Vera Y. Navarro', 'Personnel', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-11424-AA725', '10', 'active', '3rd Floor Personnel Office'),
(181, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800AF09600', '2025-05-03-1862-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'OR/DR Staff', 'OR/DR', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-07803-AA416', '11', 'active', '2nd Floor Recovery Room'),
(182, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800AD19600', '2025-05-03-1863-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', 'Billing and Claims Staff', 'Billing and Claims', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-07803-AA416', '12', 'active', '1st Floor Billing and Claims Office'),
(183, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800AB89600', '2025-05-03-1864-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', '', '', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-20297-AA598', '13', 'active', '4th floor'),
(184, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800AAB9600', '2025-05-03-1865-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', '', '', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-16690-AA426', '14', 'active', '4th floor'),
(185, 'ACER', 'ALTOS P10 F9', 'DTL0USP00L50800A989600', '2025-05-03-1866-01-1011', 'Windows 11 Pro', 'i5-14400', '16', 'Digital License', '', '', '2025-05-05', '2026-03-19 05:25:59', 'D:/xampp/htdocs/inventory_system/test_environment/pc_images/', '00469-55029-20140-AA803', '15', 'active', '4th floor'),
(186, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 02:08:11', NULL, NULL, NULL, 'inactive_deleted', NULL),
(187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 02:08:20', NULL, NULL, NULL, 'inactive_deleted', NULL),
(188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 02:08:23', NULL, NULL, NULL, 'inactive_deleted', NULL),
(189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 02:08:27', NULL, NULL, NULL, 'inactive_deleted', NULL),
(190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 02:08:32', NULL, NULL, NULL, 'inactive_deleted', NULL),
(191, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'IT Department', '2026-02-19', '2026-03-19 05:25:59', NULL, '12121323123', 'trse', 'active', 'Office A'),
(192, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'IT Department', '2026-02-19', '2026-03-19 05:25:59', 'gg.jpg', '12121323123', 'trse', 'active', 'Office A'),
(193, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'IT Department', '2026-02-19', '2026-03-19 05:25:59', 'gg.jpg', '12121323123', 'trse', 'active', 'Office A'),
(194, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'IT Department', '2026-02-19', '2026-03-19 05:25:59', 'gg.jpg', '12121323123', 'trse', 'active', 'Office A'),
(195, 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', '2026-01-01', '2026-03-19 05:25:59', 'test', 'test', 'PC-1001', 'active', 'Office A'),
(196, 'gagi', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'IT Department', '2026-02-19', '2026-03-19 05:25:59', 'WIN_20240411_07_58_38_Pro.jpg', '12121323123', 'trse', 'active', 'Office A'),
(197, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 02:08:41', NULL, NULL, NULL, 'inactive_deleted', NULL),
(198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 02:08:45', NULL, NULL, NULL, 'inactive_deleted', NULL),
(199, 'gagi brand2', 'test2', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'Operations', '2026-02-25', '2026-03-19 05:25:59', 'gg.jpg', '466565544', 'trse23', 'active', 'Floor 1');

-- --------------------------------------------------------

--
-- Table structure for table `peripherals`
--

CREATE TABLE `peripherals` (
  `computer_id` int(10) DEFAULT NULL,
  `brand` text DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `date_of_purchase` varchar(255) DEFAULT NULL,
  `date_of_entry` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `peripheral_user` text DEFAULT NULL,
  `user_dept` text DEFAULT NULL,
  `peripheral_id` int(10) NOT NULL,
  `kind_of_peripheral` text DEFAULT NULL,
  `peripheral` text DEFAULT NULL,
  `peripheral_pic` varchar(255) DEFAULT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `property_tag` varchar(255) DEFAULT NULL,
  `peripheral_no` text DEFAULT NULL,
  `peripheral_status` text DEFAULT NULL,
  `peripheral_location` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peripherals`
--

INSERT INTO `peripherals` (`computer_id`, `brand`, `model`, `date_of_purchase`, `date_of_entry`, `peripheral_user`, `user_dept`, `peripheral_id`, `kind_of_peripheral`, `peripheral`, `peripheral_pic`, `serial_no`, `property_tag`, `peripheral_no`, `peripheral_status`, `peripheral_location`) VALUES
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Eric H. Molina', 'Property and Supply', 11, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93P231896', '2021-05-03-82744-01-4421', '6', 'active', '4th Floor Property and Supply Office'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Jennifer C. Calpito', 'IPC', 12, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93P245868', '2021-05-03-82751-01-4421', '12', 'active', '3rd Floor IPC Office'),
(0, 'Epson', 'L3150', '2021-05-03', '2026-03-19 05:46:20', 'Daryl R. Carida', 'Accounting', 13, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93K046358', '2021-05-03-83178-01-4421', '1', 'active', '3rd Floor Accounting Office'),
(0, 'Canon', 'G2000', '2017-01-01', '2026-03-19 05:46:20', 'Angelica L. Tambal', 'CQI', 15, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'KKRS7719', 'N/A Pesonnal IT Service Unit', '1', 'active', '3rd Floor'),
(0, 'Epson', 'L3150', '2021-05-03', '2026-03-19 05:46:20', 'Annaliza Suaring', 'CQI', 16, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93K046342', '2021-05-03-83180-01-4421', '3', 'active', '3rd Floor Continuous Quality Improvement Office'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Joselyn M. Montecalvo', 'Nursing Service Office', 17, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93P232668', '2021-05-03-82748-01-4421', '9', 'active', '3rd Floor Nursing Service Office'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Ana Liza C. Rega', 'Nursing Service Office', 18, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93P231893', '2021-05-03-82743-01-4421', '5', 'active', '3rd Floor Nursing Service Office'),
(0, 'Epson', 'L3150', '2021-05-03', '2026-03-19 05:46:20', 'Thomas Jay B. Nerpio', 'OPD', 20, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93K052154', '2021-05-03-83182-01-4421', '5', 'active', '1st Floor Out Patient Department'),
(0, 'Canon', 'G2010', '2020-01-01', '2026-03-19 05:46:20', 'MSS PCSO', 'MALASAKIT', 21, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'KMFJ21407', 'N/A Personal', '1', 'active', '1st Floor'),
(0, 'Canon', 'G2010', '2020-01-01', '2026-03-19 05:46:20', 'Alphaida C. Baltazar', 'Billing and Claims', 22, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'KMYV91628', 'N/A Personal', '2', 'active', '1st Floor'),
(0, 'Canon', 'G2010', '2023-06-16', '2026-03-19 05:46:20', 'Rosario J. Cruz', 'MALASAKIT', 23, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'KNYD91107', 'N/A Personal', '3', 'active', '1st Floor'),
(0, 'Epson', 'L120', '', '2024-11-15 06:47:56', 'Rosario J. Cruz', 'MALASAKIT', 24, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'TP3K921449', '', NULL, NULL, NULL),
(0, 'Canon', 'G1000', '', '2026-03-19 05:46:20', 'Nanette P. Rabino', 'Dietary', 25, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', '', 'N/A', '1', 'active', '1st Floor'),
(0, 'Canon', 'G2010', '', '2026-03-19 05:46:20', 'Cecilia D. Ortiz', 'Laboratory Blood Bank', 26, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'KMFJ01963', 'N/A Personal', '1', 'active', '1st Floor'),
(0, 'Epson', 'L121', '', '2024-11-15 07:51:58', 'Laboratory Staff', 'Laboratory Blood Bank', 27, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', '', 'N/A Personal', NULL, NULL, NULL),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Marivic O. Rombaon', 'Medical Records', 28, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93P231239', '2021-05-03-82740-01-4421', '2', 'active', '1st Floor Medical Records Office'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Olive S. Bartolome', 'Pharmacy', 29, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93P231214', '2021-05-03-82747-01-4421', '8', 'active', '1st Floor Pharmacy Office'),
(0, 'Canon', 'G1000', '2018-03-01', '2026-03-19 05:46:20', 'Pharmacy Staff', 'Pharmacy', 30, 'Ink Jet', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'KKEP23690', 'N/A', '2', 'active', '1st Floor'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Florence Erika Karen P. Molina', 'Billing and Claims', 31, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93P231229', '2021-05-03-82746-01-4421', '7', 'active', '1st Floor Business Office'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Jerlie C. Soledad', 'Cashier', 32, 'Printer', 'Printer', 'D:/xampp/htdocs//inventory_system/test_environment/peripheral_image/', 'X93P231139', '2021-05-03-82742-01-4421', '4', 'active', '1st Floor Business Office'),
(0, 'Canon', 'G1000', '1990-01-01', '2024-10-11 07:40:42', 'Ailime P. Samano', 'Personnel', 33, 'printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'KLHK92952', 'N/A', NULL, NULL, NULL),
(0, 'Canon', 'G2000', '1990-01-01', '2024-11-15 07:49:30', 'Narwen Brabante', 'Biomed', 34, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'KKEP23695', 'N/A', NULL, NULL, NULL),
(0, 'Epson', 'LX-310', '2022-05-03', '2026-03-19 05:46:20', 'Emy Rose Jennifer L. Tibang', 'Emergency Room', 35, 'Dot Matrix', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CYJ07951', '2022-05-03-21425-01-4421', '', 'active', '1st Floor'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Cherry I. Cajilog', 'Rehab', 36, 'printer', 'printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X93P231551', '2021-05-03-82749-01-4421', '10', 'active', '1st Floor Rehabilitation Room'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Renee Justine C. Poblete', 'Heart Station', 37, 'printer', 'printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X93P231906', '2021-05-03-82739-01-4421', '1', 'active', '1st Floor Heart Station Room'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Merlito S. Viray', 'Radiology', 38, 'printer', 'printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X93P231234', '2021-05-03-82741-01-4421', '3', 'active', '1st Floor Radiology Room'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Mary Rose S. Bartolome', 'Admitting', 39, 'Printer', 'printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X93P231244', '2021-05-03-82750-01-4421', '11', 'active', '1st Floor Admitting Office'),
(0, 'Brother', 'DCPL2540DW', '2018-01-01', '2026-03-19 05:46:20', 'Maria Andrea P. Rabino', 'Accounting', 40, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'E73801F8N239590', '18-27640', '2', 'active', '3rd Floor'),
(0, 'Canon', 'G2000', '2016-01-01', '2024-11-15 07:56:40', 'Abegael U. Baranda', 'Personnel', 41, 'Printer', 'printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '13BKW22', '16-4014B', NULL, NULL, NULL),
(0, 'Canon', 'G1000', '2018-01-01', '2024-11-15 07:57:23', 'Jenevi M. Serenas', 'Personnel', 42, 'printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'KKEB09456', 'NDH-18-01045', NULL, NULL, NULL),
(0, 'Epson', 'LX-300', '1990-01-01', '2026-03-19 05:46:20', 'Olive S. Bartolome', 'Pharmacy', 43, 'Dot Matrix', 'Dotmatrix', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CY239873', 'N/A', '', 'active', '1st Floor'),
(0, 'Epson', 'L3110', '2021-05-03', '2026-03-19 05:46:20', 'Joy T. Gualberto', 'ORDR', 44, 'printer', 'printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X93P231247', '2021-05-03-82752-01-4421', '13', 'active', '2nd Floor ORDR'),
(0, 'Canon', 'G2010', '1990-01-01', '2024-11-15 08:00:14', 'Rochlem Eseguerra', 'Engineering', 45, 'printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'KMCN59915', 'N/A', NULL, NULL, NULL),
(0, 'Brother', 'DCPL2540DW', '2018-01-01', '2026-03-19 05:46:20', 'Jo-Ann S. Gutierrez', 'Personnel', 47, 'Printer', 'printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'E73801F8N289538', '18-27638', '1', 'active', '3rd Floor'),
(0, 'Brother', 'MFC', '1990-01-01', '2026-03-19 05:46:20', 'Joseph Andrew A. Cuizon', 'ORDR', 48, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'E73186J6H813217', 'N/A Personal', '', 'active', '2nd Floor'),
(0, 'Epson', 'L120', '1990-01-01', '2024-11-15 08:03:43', 'Cecilia D. Ortiz', 'Laboratory', 49, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'TP3KB22457', 'N/A', NULL, NULL, NULL),
(0, 'Canon', 'G3000', '1990-01-01', '2026-03-19 05:46:20', 'William Christian V. Reboton', 'HOPSS', 50, 'printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'KKEB21174', 'N/A Personal', '1', 'active', '3rd Floor'),
(0, 'Epson', 'LX-310', '2022-05-03', '2026-03-19 05:46:20', 'Theody S. Acusar', 'Pharmacy', 51, 'Dot Matrix', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CYJ07962', '2022-05-03-21419-101-4421', '', 'active', '1st Floor'),
(0, 'Brother', 'DCPL2540DW', '2018-01-05', '2024-11-19 01:31:56', 'Mafea O. Gozon', 'Hospital Information Management', 52, 'Laser Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'E73801F2N239590', '18-27689', '3', 'Inactive', '4th Floor'),
(0, 'EPSON', 'L121', '2024-01-29', '2026-03-19 05:46:20', 'Cecilia D. Ortiz', 'Laboratory', 53, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X9LV388694', '2023-05-03-3912-01-4421', '2', 'active', '1st Floor Laboratory Office'),
(0, 'EPSON', 'L121', '2024-01-29', '2026-03-19 05:46:20', 'Nanette P. Rabino', 'Dietary Section', 54, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X9LV389003', '2023-05-03-3914-01-4421', '3', 'active', '1st Floor Dietary Office'),
(0, 'EPSON', 'L121', '2024-01-29', '2026-03-19 05:46:20', 'Eric H. Molina', 'Property and Supply', 55, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X9LV388944', '2023-05-03-3915-01-4421', '4', 'active', '4th Floor Property and Supply Office'),
(0, 'EPSON', 'L121', '2024-01-29', '2026-03-19 05:46:20', 'Emy Rose L. Tibang', 'Nursing Service - ER', 56, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X9LV388991', '2023-05-03-3913-01-4421', '1', 'active', '1st Floor'),
(0, 'Canon', 'G2010', '2019-01-01', '2026-03-19 05:46:20', 'Claire Santos', 'Laboratory', 58, 'printer', 'printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'KLWA75184', '19-2064', '2', 'active', '1st Floor'),
(0, 'N/A', 'N/A', '2024-01-30', '2024-04-04 08:21:12', 'JENNIFER CALPITO', 'IPC', 59, 'Power cable', 'AC ADAPTER', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '899A11B48988L2CZ3470A7B', 'N/A', NULL, NULL, NULL),
(0, 'N/A', 'N/A', '2024-01-30', '2024-04-04 08:24:05', 'William Christian Reboton', 'HOPSS', 60, 'Power cable', 'AC ADAPTER', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '899A11B48988L2CZ3470NMK', 'N/A', NULL, NULL, NULL),
(0, 'Lenovo', 'Lenovo', '2024-01-30', '2024-04-04 08:34:30', 'JENNIFER CALPITO', 'IPC', 61, 'keyboard', 'KEYBOARD', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '8ssd51m37179avlc37aaoe', 'N/A', NULL, NULL, NULL),
(0, 'Lenovo', 'Lenovo', '2024-01-30', '2024-04-04 08:37:31', 'William Christian Reboton', 'HOPSS', 62, 'keyboard', 'KEYBOARD', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '8SSD51M37179AVLC37AAOBM', 'N/A', NULL, NULL, NULL),
(0, 'Epson', 'L121', '2023-05-03', '2024-07-09 06:04:51', 'Ferdinand Molina', 'Ultrasound', 63, 'Printer', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X9LV388719', '2023-05-03-3911-01-4421', NULL, NULL, NULL),
(0, 'Canon', 'G1000', '2018-01-12', '2024-07-12 01:45:45', 'Rochelm Esguerra', 'Engineering', 64, '', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'KKEP23695', 'N/A', NULL, NULL, NULL),
(0, 'Canon', 'CanoScan 9000F Mark II', '2018-11-28', '2024-11-19 01:38:35', 'Erika Kryzta I. Patiag', 'NEWBORN SCREENING', 65, 'Scanner', 'Scanner', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'ACUW06632', '18-27641', '', 'Condemned', '4th Floor'),
(0, 'Epson', 'Eco Tank', '2022-05-03', '2024-10-01 02:21:58', 'Marife Gozon', 'HIM / Medical Records', 66, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X5HQ004138', '2022-05-03-21431--01-4421', NULL, NULL, NULL),
(0, 'Epson', 'L3150', '2021-05-03', '2026-03-19 05:46:20', 'Cindy May Del Mundo', 'Dental', 67, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X93K046329', '2021-05-03-83179-01-4421', '2', 'active', '1st Floor Dental Office'),
(0, 'Epson', 'L3150', '2021-05-03', '2026-03-19 05:46:20', 'Emmanuel Punzalan', 'Directors Office', 68, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X93K049847', '2021-05-03-83181-01-4421', '4', 'active', '3rd Floor Directors Office'),
(0, 'Epson', 'LX-310', '2022-05-03', '2026-03-19 05:46:20', 'John Carlo M. Mari', 'Pharmacy', 69, 'Dot Matrix', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CYJ08004', '2022-05-03-21423-01-4421', '', 'active', '1st Floor'),
(0, 'Epson', 'LX-310', '2022-05-03', '2026-03-19 05:46:20', 'OR/DR Staff', 'Operating Room Delivery Room', 70, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CYJ07936', '2022-05-00-21424--01-4421', '', 'active', '2nd Floor'),
(0, 'Epson', 'L3250', '2024-11-12', '2026-03-19 05:46:20', 'Pharmacy Staff', 'Pharmacy', 72, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X8JZL70262', '2024-05-03-4076-01-1031', '2', 'active', '1st Floor Pharmacy Window'),
(0, 'Epson', 'L3250', '2024-11-12', '2026-03-19 05:46:20', 'IT Staff', 'Information Technology', 73, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X8JZL70346', '2024-05-03-4077-01-1031', '3', 'active', '4th Floor Information Technology Office'),
(0, 'Epson', 'L3250', '2024-11-12', '2026-03-19 05:46:20', 'NBS Staff', 'New Born Screening', 74, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X8JZL70273', '2024-05-03-4078-01-1031', '4', 'active', '2nd Floor New Born Screening Office'),
(0, 'Epson', 'L3250', '2024-11-12', '2026-03-19 05:46:20', 'Robert Noel P. Felias Jr', 'Continuous Quality Improvement', 75, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X8JZL70257', '2024-05-03-4079-01-1031', '5', 'active', '3rd Floor Continuous Quality Improvement Office'),
(0, 'Epson', 'L121', '2024-11-12', '2026-03-19 05:46:20', 'Rohclem O. Esguerra', 'Engineering Office', 76, 'Ink Jet', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X9LV551246', '2024-05-03-3876-01-1031', '1', 'active', '4th Floor Engineering Office'),
(0, 'Epson', 'L121', '2024-11-12', '2026-03-19 05:46:20', 'Cynthia S. Dolor', 'Accounting', 77, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X9LV551261', '2024-05-03-3877-01-1031', '2', 'active', '3rd Floor Accounting Office'),
(0, 'Epson', 'L121', '2024-11-12', '2026-03-19 05:46:20', 'Admitting Staff', 'Admitting Satellite', 78, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X9LV550887', '2024-05-03-3878-01-1031', '3', 'active', '1st Floor ER Satellite'),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', '', '', 79, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301D3F3W01', '', '1', 'active', ''),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', '', '', 80, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301D1B3W01', '', '2', 'active', ''),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', '', '', 81, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301C753W01', '', '3', 'active', ''),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', '', '', 82, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301D4D3W01', '', '4', 'active', ''),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', '', '', 83, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301CA63W01', '', '5', 'active', ''),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', 'Daryl R. Carida', 'Accounting', 84, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301C133W01', '', '6', 'active', '3rd Floor'),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', 'Human Milk Bank Staff', 'Human Milk Bank', 85, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301C783W01', '', '7', 'active', '1st Floor'),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', 'Social Service Staff', 'Medical Social Service', 86, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301CA93W01', '', '8', 'active', '1st Floor'),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', 'Cynthia Dolor', 'Accounting', 87, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301CE33W01', '', '9', 'active', '3rd Floor'),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', 'Ryan James S. Gaspar', 'Continuous Quality Improvement', 88, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301C793W01', '', '10', 'active', '3rd Floor'),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', 'Ma. Janice A. Medina', 'Property and Supply', 89, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301D363W01', '', '11', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2024-11-12', '2026-03-19 05:46:20', 'Jennifer N. Mendoza', 'Property and Supply', 90, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00343301BD83W01', '', '12', 'active', '4th Floor'),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 91, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112701296', '', '1', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 92, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112700462', '', '2', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 93, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112701320', '', '3', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 94, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112700818', '', '4', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 95, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112700746', '', '5', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 96, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112701251', '', '6', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 97, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112701249', '', '7', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 98, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112701345', '', '8', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', '', '', 99, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112701319', '', '9', 'active', ''),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', 'Ryan James S. Gaspar', 'Continuous Quality Improvement', 100, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112701348', '', '10', 'active', '3rd Floor'),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', 'Ma. Janice A. Medina', 'Property and Supply', 101, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112700774', '', '11', 'active', '4th Floor'),
(0, 'KEBOS', 'PowerGarde Plus', '2024-11-12', '2026-03-19 05:46:20', 'Jennifer N. Mendoza', 'Property and Supply', 102, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '23112701369', '', '12', 'active', '4th Floor'),
(0, 'Canon', 'G2000', '2022-01-15', '2024-11-15 07:47:48', 'Lexter Carl N. Castro', 'Information Technology', 104, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'KLAL92096', 'N/A Personal', NULL, NULL, NULL),
(0, 'Epson', 'LX-310', '2022-10-03', '2026-03-19 05:46:20', 'Nurse Staff', 'Medicine ward', 106, 'Dot-matrix', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CYJ07997', '2022-05-03-21417-01-4421', '1', 'active', '3rd Floor'),
(0, 'Epson', 'LX-310', '2022-10-03', '2026-03-19 05:46:20', 'Nurse Staff', 'OB Ward', 108, 'Dot-matrix', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CYJ06510', '2022-05-03-21429-01-4421', '', 'active', '2nd Floor'),
(0, 'Epson', 'L3250', '2024-11-12', '2026-03-19 05:46:20', 'Jo-Ann S. Gutierrez', 'Personnel', 109, 'Printer', 'Printer', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X8JZL63736', '2024-05-03-4075-01-1031', '1', 'active', '3rd Floor Personnel Office'),
(0, 'Epson', 'LX-310', '2022-10-03', '2026-03-19 05:46:20', 'Radiology Staff', 'Radiology', 110, 'Dot-matrix', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CYJ07968', '2022-05-03-21426-01-4421', '', 'active', '1st Floor'),
(0, 'LENOVO', 'LI2054A', '2016-02-01', '2024-12-03 01:43:52', 'Merlito S. Viray', 'Radiology', 111, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'U38L4906', '16-7964A', '6', 'Condemned', '1st Floor'),
(0, 'LENOVO', 'LI2054A', '2016-02-01', '2024-12-03 01:45:48', 'Raquel Dela Torre', 'Directors Office', 112, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'U38N2583', '16-7960A', '2', 'Condemned', '3rd Floor'),
(0, 'ASUS', 'VS197DE', '2013-07-29', '2024-12-03 06:31:17', 'Erica Kryzta I. Patiag', 'NICU', 113, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'D4LMTF145499', '13-695 (4-7)', '4', 'Condemned', '2nd Floor'),
(0, 'ASUS', 'VS207', '2018-03-01', '2024-12-03 04:43:37', 'Ferdinand R. Molina', 'Radiology Ultrasound', 114, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'H4LMTF106567', '17-15660A', '10', 'Condemned', '1st Floor'),
(0, 'AOC', 'TFT22W90PS', '2011-11-11', '2024-12-04 04:31:27', 'Jenevi M. Serenas', 'Personnel', 115, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'BRWB5HA020875', '11-1701 (5-7)A', '5', 'Condemned', '3rd Floor'),
(0, 'AOC', 'TFT22W90PS', '2011-11-11', '2024-12-04 04:34:25', 'Analiza Rega', 'Nursing Service Office', 116, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'BRWB5HA021173', '11-1701 (6-7)A', '6', 'Condemned', '3rd Floor'),
(0, 'AOC', 'TFT22W90PS', '2011-11-11', '2026-03-19 05:46:20', 'Roberto N. Gonzales', 'Engineering Office', 117, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'BRWB5HA', '11-1701 (1-7)A', '1', 'active', '4th Floor'),
(0, 'AOC', 'TFT22W90PS', '2011-11-11', '2024-12-04 04:54:48', 'Erica N. Tierra', 'Personnel', 118, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'BRWB5HA', '11-1701 (4-7)A', '4', 'Condemned', '3rd Floor'),
(0, 'AOC', 'TFT22W90PS', '2011-11-11', '2024-12-04 04:38:57', 'Eric H. Molina', 'Property and Supply', 119, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'BRWB5HA', '11-1701 (3-7)A', '3', 'Condemned', '4th Floor'),
(0, 'AOC', 'TFT22W90PS', '2011-11-11', '2026-03-19 05:46:20', 'Franchezca Marie A. De Lumen', 'Personnel', 120, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'BRWB5HA020877', '11-1701 (2-7)A', '2', 'active', '3rd Floor'),
(0, 'AOC', 'TFT22W90PS', '2011-11-11', '2026-03-19 05:46:20', 'Roberto A. Bansil', 'Infection Prevention Control Unit', 121, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'BRWB5HA', '11-1701 (7-7)A', '7', 'active', '3rd Floor'),
(0, 'ASUS', 'VS197DE', '2013-07-29', '2026-03-19 05:46:20', 'Roberto N. Gonzales', 'Engineering Office', 122, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'D5LMTF097634', '13-695 (2-7)', '2', 'active', '4th Floor'),
(0, 'ASUS', 'VS197DE', '2013-07-29', '2026-03-19 05:46:20', '', '', 123, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '13-695 (1-7)', '1', 'active', '1st Floor'),
(0, 'ASUS', 'VS197DE', '2013-07-29', '2026-03-19 05:46:20', '', '', 124, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '13-695 (3-7)', '3', 'active', '1st Floor'),
(0, 'ASUS', 'VS197DE', '2013-07-29', '2026-03-19 05:46:20', '', '', 125, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '13-695 (5-7)', '5', 'active', '1st Floor'),
(0, 'ASUS', 'VS197DE', '2013-07-29', '2026-03-19 05:46:20', '', '', 126, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '13-695 (6-7)', '6', 'active', '1st Floor'),
(0, 'ASUS', 'VS197DE', '2013-07-29', '2026-03-19 05:46:20', '', '', 127, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '13-695 (7-7)', '7', 'active', '1st Floor'),
(0, 'VIEWSONIC', 'VA1716W', '2009-05-05', '2024-12-04 06:09:28', 'Cecilia D. Ortiz', 'Laboratory Blood Bank', 128, 'Monitor', 'Monitor', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'QQ2082245950', '09-1058', '1', 'Condemned', '1st Floor'),
(0, 'HP', 'Deskjet Ink Advantage 2515', '2013-07-29', '2025-01-20 05:11:21', 'Olive S. Bartolome', 'Pharmacy', 129, 'Printer', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'CN34G3JHHK', '13-695 (6-7)', '6', 'Condemned', 'IT Storage Room'),
(0, 'HP', 'Deskjet Ink Advantage 2515', '2013-07-29', '2024-12-04 06:53:21', 'Cecilia G. Ortiz', 'Laboratory', 130, 'Printer', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'CN34G3JM0P', '13-695 (1-7)', '1', 'Condemned', '1st Floor'),
(0, 'ABRAVO', '', '', '2026-03-19 05:46:20', 'Personnel Staff', 'Personnel', 131, 'Paper Shredder', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '', '', 'active', '3rd Floor'),
(0, 'ABRAVO', '', '', '2026-03-19 05:46:20', 'Directors Office Staff', 'Directors Office', 132, 'Paper Shredder', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '', '', 'active', '3rd Floor'),
(0, 'ABRAVO', '', '', '2026-03-19 05:46:20', 'Hospital Information Management Section Staff', 'Hospital Information Management Section', 133, 'Paper Shredder', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '', '', 'active', '1st Floor'),
(0, 'ABRAVO', '', '', '2024-12-05 00:55:08', '', 'Property and Supply', 134, '', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '', '', '', 'Inactive', '1st Floor'),
(0, 'KOBRA', 'Kobra +1 SS4 Straight Cut Shredder', '2022-05-02', '2026-03-19 05:46:20', 'Information Technology Staff', 'Information Technology', 135, 'Paper Shredder', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '6658110442', '2002-05-02-0285-01-4421', '1', 'active', '4th Floor'),
(0, 'EPSON', 'LX-300+II', '2009-05-05', '2025-01-20 05:11:43', 'Pharmacy Staff', 'Pharmacy', 136, 'Dot Matrix Printer', 'Dotmatrix', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'G8NY111898', 'N/A', '1', 'Condemned', 'IT Storage Room'),
(0, 'EPSON', 'LX-300+II', '2009-05-05', '2024-12-05 03:37:33', 'Medical Social Service Staff', 'Medical Social Service', 137, 'Dot Matrix Printer', 'Dotmatrix', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'G8NY112193', 'N/A', '2', 'Condemned', '1st Floor'),
(0, 'EPSON', 'LX-300+II', '2009-05-05', '2024-12-05 03:37:45', 'Cashier Staff', 'Cashier', 138, 'Dot Matrix Printer', 'Dotmatrix', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'G8NY113035', 'N/A', '3', 'Condemned', '1st Floor'),
(0, 'EPSON', 'LX-300+II', '2009-05-05', '2025-01-20 05:11:58', 'Pharmacy Staff', 'Pharmacy', 139, 'Dot Matrix Printer', 'Dotmatrix', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'G8NY112157', 'N/A', '4', 'Condemned', 'IT Storage Room'),
(0, 'EPSON', 'LX-300+II', '2009-05-05', '2024-12-05 03:38:00', 'Billing and Claims Clerk', 'Billing and Claims', 140, 'Dot Matrix Printer', 'Dotmatrix', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'G8NY224674', 'N/A', '5', 'Condemned', '1st Floor'),
(0, 'EPSON', 'LX-310', '', '2026-03-19 05:46:20', 'Pharmacy Staff', 'Pharmacy', 141, 'Dot Matrix Printer', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'Q7CY239878', 'N/A', '1', 'active', '1st Floor Pharmacy Window'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2024-12-06 05:38:49', 'Lexter Carl N. Castro', 'Information Technology', 142, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000076', '2021-05-03-82757-01-4421', '7', 'Condemned', '4th Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2024-12-05 07:32:22', 'Edmund M. Agus', 'Health Information Management Section', 143, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000677', '2021-05-03-82765-01-4421', '4', 'Condemned', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Jerlie C. Soledad', 'Cashier', 144, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000618', '2021-05-03-82753-01-4421', '1', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Dennis G. Villanueva', 'Information Technology', 145, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000619', '2021-05-03-82755-01-4421', '2', 'active', '4th Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Mary Grace M. Dela Cruz', 'Cashier', 146, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000111', '2021-05-03-82758-01-4421', '3', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Pharmacy Staff', 'Pharmacy', 147, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000110', '2021-05-03-82754-01-4421', '9', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Olive S. Bartolome', 'Pharmacy', 148, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000112', '2021-05-03-82760-01-4421', '13', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Florence Erika Karen P. Molina', 'Billing and Claims', 149, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000617', '2021-05-03-82762-01-4421', '5', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Mary Rose S. Bartolome', 'Admitting', 150, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000680', '2021-05-03-82763-01-4421', '6', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Marife O. Gozon', 'Health Information Management Section', 151, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000679', '2021-05-03-82761-01-4421', '8', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2024-12-06 05:13:13', 'Maria Andrea P. Rabino', 'Accounting', 152, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000678', '2021-05-03-82759-01-4421', '10', 'Condemned', '3rd Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Cecilia G. Ortiz', 'Laboratory Blood Bank', 153, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000620', '2021-05-03-82764-01-4421', '11', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Ralph Arian M. Santos', 'Billing and Claims', 154, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000109', '2021-05-03-82756-01-4421', '12', 'active', '1st Floor'),
(0, 'SECURE', 'UPS-650VA', '2021-05-03', '2026-03-19 05:46:20', 'Accounting Staff', 'Accounting', 155, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '310026736B46351000690', '2023-05-03-3912-01-4421', '14', 'active', '3rd Floor'),
(0, 'INTEX', 'UPS MAESTRO 650VA', '2018-03-03', '2024-12-06 06:37:11', 'Information Technology Staff', 'Information Technology', 156, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '21018692211744000108', '', '1', 'Condemned', '1st Floor'),
(0, 'Epson', 'DS-870', '2022-05-03', '2026-03-19 05:46:20', 'IT Staff', 'Information Technology', 157, 'Scanner', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X5XV002331', '2022-05-03-21415-01-4421', '1', 'active', '4th Floor'),
(0, 'Abravo', '216D CROSSCUT', '2022-05-02', '2026-03-19 05:46:20', 'Personnel Staff', 'Personnel', 158, 'Shredder', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '21050000034', '2022-05-02-0373-014421', '2', 'active', '3rd Floor'),
(0, 'ACER', 'V227Q', '', '2026-03-19 05:46:20', 'Dietary Staff', 'Dietary Section', 159, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F423W01', '', '1', 'active', '1st Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 160, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F363W01', '', '2', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 161, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F1C3W01', '', '3', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 162, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F2C3W01', '', '4', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 163, '', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804FA53W01', '', '5', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 164, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804FA13W01', '', '6', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 165, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804FAD3W01', '', '7', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 166, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F293W01', '', '8', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 167, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804FD23W01', '', '9', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 168, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804FAB3W01', '', '10', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 169, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F2B3W01', '', '11', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 170, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F113W01', '', '12', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 171, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F2F3W01', '', '13', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 172, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804F583W01', '', '14', 'active', '4th Floor'),
(0, 'ACER', 'V227Q', '2025-05-05', '2026-03-19 05:46:20', '', '', 173, 'Monitor', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'MMTVGSP00350804FEF3W01', '', '15', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 06:25:00', 'Dietary Staff', 'Dietary Section', 174, 'UPS', 'UPS', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204405', '', '1', 'active', '1st Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 175, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204417', '', '2', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 176, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204506', '', '3', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 177, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204420', '', '4', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 178, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204418', '', '5', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 179, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204342', '', '5', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 180, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204342', '', '6', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 181, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204508', '', '7', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 182, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204370', '', '8', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 183, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204505', '', '9', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 184, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204507', '', '10', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 185, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204530', '', '11', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 186, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204586', '', '12', 'active', '4th Floor'),
(0, 'ACER', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 187, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204514', '', '13', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 188, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204593', '', '14', 'active', '4th Floor'),
(0, 'ABRELEX', '650L (LED)', '2025-05-05', '2026-03-19 05:46:20', '', '', 189, 'UPS', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', '24090204515', '', '15', 'active', '4th Floor'),
(0, 'EPSON', 'DS-870', '', '2026-03-19 05:46:20', 'Jane Vitug', 'HIM / Medical Records', 190, 'Scanner', '', 'D:/xampp/htdocs/inventory_system/test_environment/peripheral_image/', 'X5XV002332', '2022-05-03-0301-01-4421', '', 'active', '4th Floor'),
(NULL, 'gagi', 'test', '2026-02-19', '0000-00-00 00:00:00', 'IT Department', 'Keyboard', 191, '1231236566', NULL, NULL, 'sd12313', '23', 'Active', '1st Floor', NULL),
(NULL, 'gagi brand3', 'gagi model3', '2026-02-25', '0000-00-00 00:00:00', 'Engineering', 'Keyboard', 192, '556888', NULL, NULL, '123123', '233', 'Active', '2nd Floor', NULL),
(NULL, 'gagi brand4', 'gagi model3', '2026-02-25', '0000-00-00 00:00:00', 'Admin', 'Keyboard', 193, '556888', NULL, NULL, '123123', '233', 'Active', '1st Floor', '176'),
(178, 'gagi brand6', 'gagi model3', '2026-02-25', '2026-03-19 05:46:20', 'test', 'HR', 194, 'Other', NULL, NULL, '556888', '123123', '233', 'active', '3rd Floor');

-- --------------------------------------------------------

--
-- Table structure for table `pm_hardware`
--

CREATE TABLE `pm_hardware` (
  `pm_act_no` varchar(255) DEFAULT NULL,
  `checking_of_system_unit` varchar(255) DEFAULT NULL,
  `checking_of_storage` varchar(255) DEFAULT NULL,
  `checking_of_monitor` varchar(255) DEFAULT NULL,
  `checking_of_keyboard` varchar(255) DEFAULT NULL,
  `checking_of_mouse` varchar(255) DEFAULT NULL,
  `checking_of_powercables` varchar(255) DEFAULT NULL,
  `checking_of_vide_display` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pm_hardware`
--

INSERT INTO `pm_hardware` (`pm_act_no`, `checking_of_system_unit`, `checking_of_storage`, `checking_of_monitor`, `checking_of_keyboard`, `checking_of_mouse`, `checking_of_powercables`, `checking_of_vide_display`, `remarks`) VALUES
('004', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', NULL),
('005', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', NULL),
('006', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', NULL),
('008', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', NULL),
('009', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', NULL),
('010', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'test unit,test storage,test monitor,test keyboard,test mouse,test powercables,test display'),
('011', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'Good', 'test,test,test,test,test,test,test');

-- --------------------------------------------------------

--
-- Table structure for table `pm_software`
--

CREATE TABLE `pm_software` (
  `pm_act_no` varchar(255) DEFAULT NULL,
  `software_pm` text DEFAULT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `software_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pm_software`
--

INSERT INTO `pm_software` (`pm_act_no`, `software_pm`, `start_time`, `end_time`, `software_remarks`) VALUES
('009', 'Windows Update', '15:17', '15:17', NULL),
('009', 'Anti-virus update and scanning', '03:17', '03:18', NULL),
('009', 'Microsoft Office update', '03:18', '03:18', NULL),
('009', 'Application updates', '03:18', '03:18', NULL),
('009', 'Disk defragmentation', '03:18', '03:20', NULL),
('009', 'Clearing temporary files', '03:18 ', '15:18', NULL),
('009', 'Clearing of Recycle bin', '15:18', '03:18', NULL),
('009', 'Clearing web browser history', '15:18', '03:18', NULL),
('010', 'Windows Update', '09:57', '09:57', NULL),
('010', 'Anti-virus update and scanning', '21:57', '21:57', NULL),
('010', 'Microsoft Office update', '09:57', '21:57', NULL),
('010', 'Application updates', '09:57', '21:57', NULL),
('010', 'Disk defragmentation', '21:00', '01:01', NULL),
('010', 'Clearing temporary files', '21:00 ', '09:58', NULL),
('010', 'Clearing of Recycle bin', '09:58', '09:58', NULL),
('010', 'Clearing web browser history', '09:58', '09:58', NULL),
('011', 'Windows Update', '20:16', '08:16', 'test wup'),
('011', 'Anti-virus update and scanning', '09:16', '20:16', 'test av'),
('011', 'Microsoft Office update', '08:16', '20:16', 'test ms office'),
('011', 'Application updates', '20:16', '20:16', 'test app'),
('011', 'Disk defragmentation', '01:16', '08:16', 'test dd'),
('011', 'Clearing temporary files', '08:16 ', '20:16', 'test clear'),
('011', 'Clearing of Recycle bin', '08:16', '20:16', 'test clear rc'),
('011', 'Clearing web browser history', '08:16', '20:16', 'test clear web');

-- --------------------------------------------------------

--
-- Table structure for table `preventive_maintenance`
--

CREATE TABLE `preventive_maintenance` (
  `pm_act_no` varchar(255) NOT NULL,
  `department` varchar(255) DEFAULT NULL,
  `username` text DEFAULT NULL,
  `time_of_encode` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `property_tag` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `overall_remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `preventive_maintenance`
--

INSERT INTO `preventive_maintenance` (`pm_act_no`, `department`, `username`, `time_of_encode`, `property_tag`, `start_time`, `end_time`, `overall_remarks`) VALUES
('001', 'it', 'ychad', '0000-00-00 00:00:00', 'hgygyggy', '09:21', '09:21', NULL),
('002', 'test', 'test', '0000-00-00 00:00:00', 'test', '09:25', '21:27', NULL),
('003', 'test', 'ychad', '2023-04-16 01:28:38', 'test', '09:28', '09:29', NULL),
('004', 'test', 'ychad13', '2023-04-16 01:39:43', 'test', '09:39', '21:39', NULL),
('005', 'test', 'ychad', '2023-04-16 07:01:56', 'test', '15:01', '03:01', NULL),
('006', 'test', 'ychad', '2023-04-16 07:03:14', 'test', '15:01', '03:01', NULL),
('008', 'test', 'ychad', '2023-04-16 07:06:31', 'test', '15:05', '03:05', NULL),
('009', 'test', 'ychad', '2023-04-16 07:18:22', 'test', '15:17', '03:17', NULL),
('010', 'test', 'ychad13', '2023-04-20 01:58:11', 'test', '21:58', '09:57', NULL),
('011', 'test', 'ychad', '2023-04-25 12:17:22', 'hgygyggy', '20:15', '08:15', NULL),
('test', 'test', 'test', '0000-00-00 00:00:00', 'test', '09:26', '02:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sheet1`
--

CREATE TABLE `sheet1` (
  `brand` varchar(10) DEFAULT NULL,
  `model` varchar(14) DEFAULT NULL,
  `serial_number` varchar(22) DEFAULT NULL,
  `property_tag` varchar(24) DEFAULT NULL,
  `os_version` varchar(16) DEFAULT NULL,
  `os_license` varchar(29) DEFAULT NULL,
  `pc_user` varchar(19) DEFAULT NULL,
  `user_dept` varchar(22) DEFAULT NULL,
  `date_of_purchase` varchar(10) DEFAULT NULL,
  `office_license` varchar(29) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sheet1`
--

INSERT INTO `sheet1` (`brand`, `model`, `serial_number`, `property_tag`, `os_version`, `os_license`, `pc_user`, `user_dept`, `date_of_purchase`, `office_license`) VALUES
('ACER', 'VERITON S', 'DTVSDSP00L010009863000', '2021-05-03-82737-01-4421', 'windows 10 64bit', 'VK7JG-NPHTM-C97JM-9MPGT-3V66T', 'Olive Bartolome', 'Pharmacy', '2021-06-17', 'JDGTK-G8NKX-PJQC8-KPP9C-RVXGG'),
('ACER', 'VERITON S', 'DTVSDSP00L010009CF3000', '2021-05-03-82733-01-4421', 'windows 10 64bit', 'FGMGN-6MFQD-Y7GPK-V2MTD-3PFC2', 'Theody Acusar', 'Pharmacy', '2021-06-17', 'JD99N-KYQR2-PGVYY-Y4VRX-QV8DC'),
('ACER', 'VERITON S', 'DTVSDSP00L010009DA3000', '2021-05-03-82731-01-4421', 'windows 10 64bit', '6MBW3-3NQM3-GHX93-F9CPY-QJ3GP', 'Erickson Sto Tomas', 'Information Technology', '2021-06-17', '2XFHB-FNKPT-G4DBV-49CBK-DYJ9P'),
('HP', 'ALL IN ONE', 'ACC8240QP3', '18-27634AB', 'WIN 10', 'N/A', 'Eric Molina', 'Property and Supply', '2018-11-28', 'N/A'),
('HP', 'All in one', '8CC821072W', '18-27633AB', 'WINDOWS 10', 'N/A', 'Gutirrez, Jo-ann', 'Personnel', '2018-11-28', 'N/A'),
('HP', 'all in one', 'ACC2240QRS', '18-27632AB', 'WINDOWS 10', 'N/A', 'Ralph Santos', 'Billing and Claims', '2018-11-28', 'N/A'),
('ACER', 'C24-865', 'DQBBUSP00292907B2D3000', 'N/A', 'WINDOWS 10', 'N/A', 'Claire Subdi', 'Malasakit', '2019-10-21', 'N/A'),
('ACER', 'C24-865', 'DQBBUSP00292907B123000', 'N/A', 'WINDOWS 10', 'N/A', 'Janine Arizala', 'Malasakit', '2019-10-21', 'N/A'),
('ACER', 'C24-865', 'DQBBUSP00292907AFB3000', 'N/A', 'WINDOWS 10', 'N/A', 'Jonabelle Estrella', 'Malasakit', '2019-10-21', 'N/A'),
('ACER', 'C24-865', 'DQBBUSP00292907B103000', 'N/A', 'WINDOWS 10', 'N/A', 'Rosie Cruz', 'Malasakit', '2019-10-21', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462301', '17-15657B', 'WINDOWS 10', 'N/A', 'Daryl Carida', 'Accounting', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462409', '17-15656B', 'WINDOWS 10', 'N/A', 'April Paura', 'Billing and claims', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462300', '17-15662B', 'WINDOWS 10', 'N/A', 'Angelica Tambal', 'CQI', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462299', '17-15661B', 'WINDOWS 10', 'N/A', 'Robert Felias', 'CQI', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462306', '17-15658B', 'WINDOWS 10', 'N/A', 'Flodalyn Bautista', 'CQI', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462307', '17-15665B', 'WINDOWS 10', 'N/A', 'Krystel Co', 'Laboratory', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462303', '17-15659B', 'WINDOWS 10', 'N/A', 'Kenneth Babiera', 'Medical Records', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462304', '17-15663B', 'WINDOWS 10', 'N/A', 'Lowie Joy Ayes', 'Medical Records', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462302', '17-15653B', 'WINDOWS 10', 'N/A', 'Marivic Rombaon', 'Medical Records', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC279144', '17-15664B', 'WINDOWS 10', 'N/A', 'Janice Medina', 'Property and supply', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462305', '17-15660B', 'WINDOWS 10', 'N/A', 'Ferdinand Molina', 'Radiology', '2018-01-12', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462297', '17-15654B', 'WINDOWS 10', 'N/A', 'Ailime Samano', 'Personnel', '2018-01-12', 'N/A'),
('LENOVO', 'H30', 'R30106GR', '16-7959 B', 'WINDOWS 10', 'N/A', 'Jennifer Calpito', 'IPC', '2016-02-01', 'N/A'),
('LENOVO', 'H30', 'R30106ZB', '16-79628', 'WINDOWS 10', 'N/A', 'Rolando Tanglao', 'Billing and claims', '2016-08-01', 'N/A'),
('LENOVO', 'H30', 'R30106HK', '16-7960B', 'WINDOWS 10', 'N/A', 'Racquel Dela Torre', 'DO', '2016-08-01', 'N/A'),
('LENOVO', 'H30', 'R30106UP', '16-7965B', 'WINDOWS 10', 'N/A', 'Cherry Imperial', 'Rehab', '2016-08-01', 'N/A'),
('LENOVO', 'H30', 'R30106UQ', '16-7961B', 'WINDOWS 10', 'N/A', 'Merlito Viray', 'Radiology', '2016-08-01', 'N/A'),
('LENOVO', 'Think Centre', 'PBVLBFC', 'N/A', 'WINDOWS 10', 'N/A', 'Pauline Tingin', 'Philhealth', '2022-01-13', 'N/A'),
('LENOVO', 'all in one', 'MP10ZLUR', '16-12423', 'WINDOWS 10', 'N/A', 'Renz Arby Santos', 'CQI', '2016-12-28', 'N/A'),
('LENOVO', 'all in one', 'MP10ZLWR', '16-12451', 'WINDOWS 10', 'N/A', 'Ryan James Gaspar', 'CQI', '2016-12-28', 'N/A'),
('CROWN', 'N/A', 'ECS H61H2-M2 1.0', '11-1701 7-7 B', 'WINDOWS 10', 'N/A', 'Paulo Terrado', 'IPC', '2011-11-11', 'N/A'),
('CROWN', 'N/A', 'ECS H61H2-M2 1.0', '(4-7)', 'WINDOWS 10', 'N/A', 'Vera Yumul Navarro', 'Personnel', '2011-11-11', 'N/A'),
('DELL', 'Inspiron', '94FQQ12', '16-4017B', 'WINDOWS 10', 'N/A', 'Abe Baranda', 'Personnel', '2016-04-04', 'N/A'),
('DELL', 'Inspiron', 'C1FQQ12', '16-4019B', 'WINDOWS 10', 'N/A', 'Michael Galgana', 'Personnel', '2016-04-04', 'N/A'),
('DELL', 'Inpiron', '13BKW22', '16-4014B', 'WINDOWS 10', 'N/A', 'Ericka Lasala', 'Personnel', '2016-04-04', 'N/A'),
('DELL', 'Inpiron', '14FQQ12', '16-4018B', 'WINDOWS 10', 'N/A', 'Jocelyn Montecalvo', 'Nursing', '2016-04-04', 'N/A'),
('DELL', 'Inpiron', 'D42JR42', '16-4020B', 'WINDOWS 10', 'N/A', 'Jennifer Navalta', 'Property and supply', '2016-04-04', 'N/A'),
('DELL', 'Inpiron', '8HDQQ12', '16-4016B', 'WINDOWS 10', 'N/A', 'Imelda Canapi', 'Nursing', '2016-04-04', 'N/A'),
('DELL', 'Inpiron', 'J8DQQ12', '16-4015B', 'WINDOWS 10', 'N/A', 'Nanette Rabino', 'Dietary', '2016-04-04', 'N/A'),
('ASUS', 'G850', 'CP6230', '13-693(1-7)', 'WINDOWS 10', 'N/A', 'Analiza Rega', 'Nursing', '2013-07-29', 'N/A'),
('ASUS', 'G850', 'C4PDA60013W7', '13-643(7-2)', 'WINDOWS 10', 'N/A', 'Mary Grace Ruiz', 'Cashier', '2013-07-29', 'N/A'),
('ASUS', 'G850', 'ECS H61H2-M2 1.0', 'N/A', 'WINDOWS 10', 'N/A', 'Ivy Auquino', 'OPD', '2013-07-29', 'N/A'),
('ASUS', 'CP6230', 'C4PDAG0013WA', '13-695(2-7)', 'WINDOWS 10', 'N/A', 'Jhoanne Marie', 'Personnel', '2013-07-29', 'N/A'),
('ASUS', 'Fortress', 'H6M0KC462298', '17-15655B', 'WINDOWS 10', 'N/A', 'Jenevi Serenas', 'Personnel', '2019-01-12', 'N/A'),
('INTEL', 'E7400', 'BTPR913006W4', '09-1058(1-4)', 'WINDOWS 10', 'N/A', 'Ana Suaring', 'CQI', '2009-05-08', 'N/A'),
('INTEL', 'Q8400', 'CNX95103M0', '09-1058(1-4)', 'WINDOWS 10', 'N/A', 'Gretchen Aguda', 'Pharmacy', '2009-05-08', 'N/A'),
('ASUS', 'N/A', 'MF70B8G10910189', 'N/A', 'WINDOWS 10', 'N/A', 'Helen Arcega', 'Radiology', '2022-01-04', 'N/A'),
('ASUS', 'G450', 'C4PDAG000CEF', 'N/A', 'WINDOWS 10', 'N/A', 'Emman Punzalan', 'DO', '2013-07-29', 'N/A'),
('ASUS', 'CP6230', 'C4PDAG0013VT', 'N/A', 'WINDOWS 10', 'N/A', 'Erica Patiag', 'NICU', '2013-07-29', 'N/A'),
('HP', '280 G2 MT', 'SGH733TCGJ', 'N/A', 'WINDOWS 10', 'N/A', 'Alpha Baltazar', 'Philhealth', '2022-01-13', 'N/A'),
('ASUS', 'N/A', 'N/A', '13-695(6-7)', 'WINDOWS 10', 'N/A', 'Joy Gualberto', 'ORDR', '2013-07-29', 'N/A'),
('DELL', 'N/A', 'N/A', '16-7961B', 'WINDOWS 10', 'N/A', 'Cindy Delmundo', 'Dental', '2016-08-01', 'N/A'),
('ACER', 'VERITON M2640G', 'DBVPN11001828013089100', '19-2061B', 'Windows 7', 'N/A', 'Claire Santos', 'Lab Drugtesting', '2019-03-19', 'N/A'),
('ACER', 'E5-475', 'NXGCUSP0047251035D7600', '18-012', 'WINDOWS 10', 'N/A', 'Renz Arby Santos', 'CQI', '2019-01-15', 'N/A'),
('ACER', 'E5-475', 'NXGCUSP0047251019D7600', '18-013', 'WINDOWS 10', 'N/A', 'Erickson Sto. Tomas', 'Information Technology', '2019-01-15', 'N/A'),
('INTEL', 'N/A', 'N/A', '11-1701(1-7)B', 'WINDOWS 10', 'N/A', 'Roberto Gonzales', 'Engineering', '2011-02-11', 'N/A'),
('TRENDSONIC', 'N/A', 'BTCR137018L6', 'N/A', 'WINDOWS 10', 'N/A', 'Rochlem Esguerra', 'Engineering', '2022-02-17', 'N/A'),
('INTEL', 'E7400', 'BTPR909001RA', 'N/A', 'WIN10', 'N/A', 'Armie Pacheco', 'Pharmacy bloodbank', '2022-07-29', 'N/A'),
('LENOVO', 'H30-50', 'R30106R4', 'N/A', 'WIN 10', 'N/A', 'OMEGA FRALIX CRUZ', 'OB GYN', '2022-07-28', 'N/A'),
('CROWN', 'N/A', 'CNX9340162', '09-1649', 'WIN 10', 'N/A', 'NARWEN BRABANTE', 'BIOMED', '2009-11-04', 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `fname` text DEFAULT NULL,
  `department` text DEFAULT NULL,
  `uname` text DEFAULT NULL,
  `upassword` text DEFAULT NULL,
  `access_lvl` text DEFAULT NULL,
  `user_no` int(255) NOT NULL,
  `user_stats` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`fname`, `department`, `uname`, `upassword`, `access_lvl`, `user_no`, `user_stats`) VALUES
('Richard James  S. Gaspar', 'test', 'ychad', '$2b$10$IWSfNB.qegs2BZmQyres6OVeBQL0LV/r9LqoO8a.y4ctr8Id9.V7K', 'Admin', 1, 'active'),
('Juan Dela Cruz', 'test', 'jdcruz', '2123123', 'Staff', 2, 'inactive'),
('Juan Dela Cruz', 'IT', 'juan', 'juan', 'IT Technician', 3, 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `computer_service`
--
ALTER TABLE `computer_service`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `consumable_logs`
--
ALTER TABLE `consumable_logs`
  ADD PRIMARY KEY (`consumable_no`);

--
-- Indexes for table `consumable_logs_statuses`
--
ALTER TABLE `consumable_logs_statuses`
  ADD PRIMARY KEY (`consumable_log_number`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `main_consumables`
--
ALTER TABLE `main_consumables`
  ADD PRIMARY KEY (`stock_no`);

--
-- Indexes for table `main_inventory`
--
ALTER TABLE `main_inventory`
  ADD PRIMARY KEY (`computer_id`);

--
-- Indexes for table `peripherals`
--
ALTER TABLE `peripherals`
  ADD PRIMARY KEY (`peripheral_id`);

--
-- Indexes for table `preventive_maintenance`
--
ALTER TABLE `preventive_maintenance`
  ADD PRIMARY KEY (`pm_act_no`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `computer_service`
--
ALTER TABLE `computer_service`
  MODIFY `service_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `consumable_logs`
--
ALTER TABLE `consumable_logs`
  MODIFY `consumable_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `consumable_logs_statuses`
--
ALTER TABLE `consumable_logs_statuses`
  MODIFY `consumable_log_number` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_consumables`
--
ALTER TABLE `main_consumables`
  MODIFY `stock_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `main_inventory`
--
ALTER TABLE `main_inventory`
  MODIFY `computer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `peripherals`
--
ALTER TABLE `peripherals`
  MODIFY `peripheral_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
