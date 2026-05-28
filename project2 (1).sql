-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20 نوفمبر 2024 الساعة 15:16
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project2`
--

-- --------------------------------------------------------

--
-- بنية الجدول `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `customer_username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `address`
--

INSERT INTO `address` (`address_id`, `address_name`, `city`, `street`, `longitude`, `latitude`, `customer_username`) VALUES
(6, 'Home', 'Taif', 'Suhaib Bin Sinan Street', -122.08635281771421, 37.41442908043683, 'So.123x5'),
(18, 'Company', 'Najrn', 'SSS', -122.0839411765337, 37.41916768502873, 'muntaha12'),
(19, 'Home', 'Najran', 'Al-fahad', -122.08788301795722, 37.4218317702116, 'maram123');

-- --------------------------------------------------------

--
-- بنية الجدول `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`) VALUES
(4, 'fixme201@gmail.com', 'badb71036b0262574753ac5c9cb5a70dc26d8510');

-- --------------------------------------------------------

--
-- بنية الجدول `categories`
--

CREATE TABLE `categories` (
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `categories`
--

INSERT INTO `categories` (`categories_name`, `categories_name_ar`) VALUES
('Carpenter', 'نجار'),
('Driver', 'سواق'),
('Electrician', 'كهربائي'),
('Farmer', 'مزارع'),
('Mason', 'بناء'),
('Mechanic', 'ميكانيكي'),
('Painter', 'صباغ'),
('Plumber', 'سباك'),
('ًWelder', 'لحام');

-- --------------------------------------------------------

--
-- بنية الجدول `chat_app`
--

CREATE TABLE `chat_app` (
  `chat_id` int(11) NOT NULL,
  `worker_username` varchar(100) NOT NULL,
  `customer_username` varchar(100) NOT NULL,
  `time_craeted` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `chat_app`
--

INSERT INTO `chat_app` (`chat_id`, `worker_username`, `customer_username`, `time_craeted`) VALUES
(11, 'far226', 'So.123x5', '2024-11-10 12:21:10'),
(13, 'majed112', 'maram123', '2024-11-14 19:54:11'),
(14, 'majed112', 'maram123', '2024-11-14 19:54:18'),
(15, 'Ma0098', 'ftoon456', '2024-11-14 19:55:29'),
(16, 'Ma0098', 'So.123x5', '2024-11-14 20:15:55'),
(31, 'ahame33', 'So.123x5', '2024-11-20 13:35:24'),
(32, 'majed112', 'So.123x5', '2024-11-20 13:47:47');

-- --------------------------------------------------------

--
-- Stand-in structure for view `chat_messages`
-- (See below for the actual view)
--
CREATE TABLE `chat_messages` (
`message_id` int(11)
,`message` text
,`chat_id1` int(11)
,`sender_username` varchar(100)
,`timee_date` timestamp
,`is_read` tinyint(4)
,`chat_id` int(11)
,`worker_username` varchar(100)
,`customer_username` varchar(100)
,`time_craeted` timestamp
);

-- --------------------------------------------------------

--
-- بنية الجدول `contactors`
--

CREATE TABLE `contactors` (
  `user_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `contactor_emial` varchar(100) NOT NULL,
  `contactor_password` varchar(100) NOT NULL,
  `verify_code` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `license` varchar(255) NOT NULL,
  `contractor_approve` tinyint(4) NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL,
  `user_attempts` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `contactors`
--

INSERT INTO `contactors` (`user_name`, `first_name`, `contactor_emial`, `contactor_password`, `verify_code`, `city`, `zip`, `street`, `license`, `contractor_approve`, `admin_id`, `user_attempts`) VALUES
('moh_122', 'Mohammed', 'moham@gmail.com', 'moh12345', 0, '', '', '', '2213476659', 1, 4, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `customers`
--

CREATE TABLE `customers` (
  `user_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `customer_password` varchar(100) NOT NULL,
  `verify_code` int(11) NOT NULL,
  `customer_approve` tinyint(4) NOT NULL DEFAULT 0,
  `user_attempts` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `customers`
--

INSERT INTO `customers` (`user_name`, `first_name`, `customer_email`, `customer_password`, `verify_code`, `customer_approve`, `user_attempts`) VALUES
('eman2358', 'eman', 'emankreem@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 12786, 1, 0),
('ftoon456', 'Ftoon', 'fat8874@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 41650, 1, 0),
('maram123', 'Maram', 'mramalyami0711@gmail.com', '39ea307b363af5a6339aa113c73b90afb3367447', 42958, 1, 5),
('muntaha12', 'Muntaha', 'muntaha@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', 54390, 1, 0),
('So.123x5', 'Sara', 'mohammeali37@gmail.com', 'c36ebe8d1f59c6da36a1f0ed4488bcc2716ef24d', 70217, 1, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `evaluation`
--

CREATE TABLE `evaluation` (
  `rating_id` int(11) NOT NULL,
  `customer_username` varchar(100) NOT NULL,
  `worker_username` varchar(100) NOT NULL,
  `comment` text NOT NULL DEFAULT 'none',
  `rate` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `evaluation`
--

INSERT INTO `evaluation` (`rating_id`, `customer_username`, `worker_username`, `comment`, `rate`) VALUES
(1, 'So.123x5', 'far226', 'thanks , the work was done perfectly', 5),
(2, 'So.123x5', 'ahame33', '', 5);

-- --------------------------------------------------------

--
-- بنية الجدول `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `chat_id1` int(11) NOT NULL,
  `sender_username` varchar(100) NOT NULL,
  `timee_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(4) NOT NULL DEFAULT 0,
  `receiver_username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `messages`
--

INSERT INTO `messages` (`message_id`, `message`, `chat_id1`, `sender_username`, `timee_date`, `is_read`, `receiver_username`) VALUES
(128, 'g', 11, 'So.123x5', '2024-11-10 12:21:33', 1, 'far226'),
(130, 'hii', 11, 'far226', '2024-11-10 13:40:07', 1, 'So.123x5'),
(132, 'hii', 11, 'far226', '2024-11-10 13:44:16', 1, 'So.123x5'),
(154, 'hi', 15, 'ftoon456', '2024-11-14 20:03:24', 1, 'Ma0098'),
(155, 'how are you', 15, 'ftoon456', '2024-11-14 20:08:26', 1, 'Ma0098'),
(156, 'hi', 16, 'So.123x5', '2024-11-14 20:16:38', 1, 'Ma0098'),
(157, 'hi', 31, 'So.123x5', '2024-11-20 13:35:38', 0, 'ahame33'),
(158, 'hello', 32, 'So.123x5', '2024-11-20 13:47:58', 0, 'majed112');

-- --------------------------------------------------------

--
-- بنية الجدول `notifications`
--

CREATE TABLE `notifications` (
  `notifications_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `contractor` varchar(100) NOT NULL,
  `time_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `requests`
--

CREATE TABLE `requests` (
  `request_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0:Wating , 1: Rejected, 2: Accepted, 3:Canceled',
  `service` varchar(255) NOT NULL,
  `payment_method` tinyint(4) NOT NULL DEFAULT 0,
  `address_id` int(11) NOT NULL,
  `request_time_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `worker_username` varchar(100) NOT NULL,
  `customer_username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `requests`
--

INSERT INTO `requests` (`request_id`, `cost`, `status`, `service`, `payment_method`, `address_id`, `request_time_date`, `worker_username`, `customer_username`) VALUES
(31, 122, 0, 'thanks', 0, 0, '2024-10-24 08:15:21', 'ahame33', 'So.123x5'),
(35, 563, 4, 'car repair', 1, 6, '2024-11-01 17:15:48', 'far226', 'So.123x5'),
(36, 200, 4, 'thanks', 0, 6, '2024-11-11 14:07:42', 'ahame33', 'So.123x5'),
(37, 566, 4, 'car repair', 0, 6, '2024-11-13 14:12:07', 'ahame33', 'So.123x5'),
(38, 345, 0, 'car repair', 1, 6, '2024-11-20 13:17:37', 'ahame33', 'So.123x5');

-- --------------------------------------------------------

--
-- بنية الجدول `worker`
--

CREATE TABLE `worker` (
  `user_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `worker_email` varchar(100) NOT NULL,
  `worker_password` varchar(100) NOT NULL,
  `verify_code` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `license` varchar(255) NOT NULL,
  `worker_categories` varchar(100) NOT NULL,
  `worker_approve` tinyint(4) NOT NULL DEFAULT 0,
  `admin_id` int(11) NOT NULL,
  `contactor_email` varchar(100) NOT NULL,
  `user_attempts` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `worker`
--

INSERT INTO `worker` (`user_name`, `first_name`, `worker_email`, `worker_password`, `verify_code`, `city`, `zip`, `street`, `license`, `worker_categories`, `worker_approve`, `admin_id`, `contactor_email`, `user_attempts`) VALUES
('ahame33', 'Ahamed', 'aham@gmail.com', '665477', 0, '', '', '', '22135464', 'Electrician', 0, 4, 'moham@gmail.com', 0),
('far226', 'Fares', 'fares@gmail.com', '3333333', 0, '', '', '', '2225454688', 'Mason', 0, 4, 'moham@gmail.com', 0),
('Ma0098', 'Majed', 'majed@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 31335, '', '', '', '2234566', 'Farmer', 2, 4, 'moham@gmail.com', 0),
('majed112', 'Majed', 'majed22@gmail.com', 'f7c3bc1d808e04732adf679965ccc34ca7ae3441', 93965, '', '', '', '2213076552', 'Driver', 0, 4, 'moham@gmail.com', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `workerview`
-- (See below for the actual view)
--
CREATE TABLE `workerview` (
`user_name` varchar(100)
,`first_name` varchar(100)
,`worker_email` varchar(100)
,`worker_password` varchar(100)
,`verify_code` int(11)
,`city` varchar(100)
,`zip` varchar(50)
,`street` varchar(100)
,`license` varchar(255)
,`worker_categories` varchar(100)
,`worker_approve` tinyint(4)
,`admin_id` int(11)
,`contactor_email` varchar(100)
,`user_attempts` tinyint(4)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure for view `chat_messages`
--
DROP TABLE IF EXISTS `chat_messages`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chat_messages`  AS SELECT `messages`.`message_id` AS `message_id`, `messages`.`message` AS `message`, `messages`.`chat_id1` AS `chat_id1`, `messages`.`sender_username` AS `sender_username`, `messages`.`timee_date` AS `timee_date`, `messages`.`is_read` AS `is_read`, `chat_app`.`chat_id` AS `chat_id`, `chat_app`.`worker_username` AS `worker_username`, `chat_app`.`customer_username` AS `customer_username`, `chat_app`.`time_craeted` AS `time_craeted` FROM (`messages` join `chat_app` on(`chat_app`.`chat_id` = `messages`.`chat_id1`)) ;

-- --------------------------------------------------------

--
-- Structure for view `workerview`
--
DROP TABLE IF EXISTS `workerview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `workerview`  AS SELECT `worker`.`user_name` AS `user_name`, `worker`.`first_name` AS `first_name`, `worker`.`worker_email` AS `worker_email`, `worker`.`worker_password` AS `worker_password`, `worker`.`verify_code` AS `verify_code`, `worker`.`city` AS `city`, `worker`.`zip` AS `zip`, `worker`.`street` AS `street`, `worker`.`license` AS `license`, `worker`.`worker_categories` AS `worker_categories`, `worker`.`worker_approve` AS `worker_approve`, `worker`.`admin_id` AS `admin_id`, `worker`.`contactor_email` AS `contactor_email`, `worker`.`user_attempts` AS `user_attempts`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar` FROM (`worker` join `categories` on(`worker`.`worker_categories` = `categories`.`categories_name`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_username` (`customer_username`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_name`);

--
-- Indexes for table `chat_app`
--
ALTER TABLE `chat_app`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `customer_username` (`customer_username`),
  ADD KEY `fk_worker` (`worker_username`);

--
-- Indexes for table `contactors`
--
ALTER TABLE `contactors`
  ADD PRIMARY KEY (`contactor_emial`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`user_name`);

--
-- Indexes for table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `customer_username` (`customer_username`),
  ADD KEY `worker_username` (`worker_username`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `fk_chat_message` (`chat_id1`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notifications_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `worker_username` (`worker_username`),
  ADD KEY `customer_username` (`customer_username`);

--
-- Indexes for table `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`user_name`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `contactor_email` (`contactor_email`),
  ADD KEY `categories_name` (`worker_categories`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chat_app`
--
ALTER TABLE `chat_app`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `evaluation`
--
ALTER TABLE `evaluation`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notifications_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `chat_app`
--
ALTER TABLE `chat_app`
  ADD CONSTRAINT `chat_app_ibfk_2` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_worker` FOREIGN KEY (`worker_username`) REFERENCES `worker` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `contactors`
--
ALTER TABLE `contactors`
  ADD CONSTRAINT `contactors_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `evaluation_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluation_ibfk_2` FOREIGN KEY (`worker_username`) REFERENCES `worker` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_chat_message` FOREIGN KEY (`chat_id1`) REFERENCES `chat_app` (`chat_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`worker_username`) REFERENCES `worker` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requests_ibfk_2` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- قيود الجداول `worker`
--
ALTER TABLE `worker`
  ADD CONSTRAINT `worker_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `worker_ibfk_3` FOREIGN KEY (`contactor_email`) REFERENCES `contactors` (`contactor_emial`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `worker_ibfk_4` FOREIGN KEY (`worker_categories`) REFERENCES `categories` (`categories_name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
