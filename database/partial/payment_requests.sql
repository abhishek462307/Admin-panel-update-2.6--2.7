-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 30, 2023 at 11:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET
SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` char(36) NOT NULL,
  `payer_id` varchar(64) DEFAULT NULL,
  `receiver_id` varchar(64) DEFAULT NULL,
  `payment_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `gateway_callback_url` varchar(191) DEFAULT NULL,
  `success_hook` varchar(100) DEFAULT NULL,
  `failure_hook` varchar(100) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `currency_code` varchar(20) NOT NULL DEFAULT 'USD',
  `payment_method` varchar(50) DEFAULT NULL,
  `additional_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional_data`)),
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payer_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payer_information`)),
  `external_redirect_link` varchar(255) DEFAULT NULL,
  `receiver_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`receiver_information`)),
  `attribute_id` varchar(64) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `payment_platform` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `whatsapp_setting` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `instance_id` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `message_otp` varchar(255) DEFAULT NULL,
  `message_new_order` varchar(255) DEFAULT NULL,
  `message_order_confirm` varchar(255) DEFAULT NULL,
  `message_order_cancel` varchar(255) DEFAULT NULL,
  `message_order_processing` varchar(255) DEFAULT NULL,
  `message_order_handover` varchar(255) DEFAULT NULL,
  `message_order_pickup` varchar(255) DEFAULT NULL,
  `message_order_delivered` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `whatsapp_setting`
--

INSERT INTO `whatsapp_setting` (`id`, `url`, `instance_id`, `access_token`, `message_type`, `message_otp`, `message_new_order`, `message_order_confirm`, `message_order_cancel`, `message_order_processing`, `message_order_handover`, `message_order_pickup`, `message_order_delivered`, `created_at`, `updated_at`) VALUES
(1, 'https://xxxwebsitenamexxx/api/send', '660BC756C62CC', '660bc556cfd85', 'text', 'Darsha Foods OTP for Verification', 'New Order Placed from Darsha Foods', 'Your Order is Confirmed', 'Your Order is Cancelled', 'Your Order is Processing', 'Your Order is Handover', 'Your Order is Picked up', 'Your Order is Delivered', '2024-04-15 14:16:23', '2024-04-15 14:16:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `whatsapp_setting`
--
ALTER TABLE `whatsapp_setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `whatsapp_setting`
--
ALTER TABLE `whatsapp_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;