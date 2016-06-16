-- phpMyAdmin SQL Dump
-- version 4.5.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 16, 2016 at 05:09 PM
-- Server version: 5.6.30
-- PHP Version: 7.0.3-3+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodora-test`
--

-- --------------------------------------------------------

--
-- Table structure for table `backup_vendor_schedule`
--

CREATE TABLE `backup_vendor_schedule` (
  `id` bigint(20) NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `weekday` tinyint(4) DEFAULT NULL,
  `all_day` tinyint(3) DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `stop_hour` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `backup_vendor_schedule`
--

INSERT INTO `backup_vendor_schedule` (`id`, `vendor_id`, `weekday`, `all_day`, `start_hour`, `stop_hour`) VALUES
(1, 1, 2, 0, '19:00:00', '22:00:00'),
(2, 1, 3, 0, '19:00:00', '22:00:00'),
(12, 2, 2, 0, '19:00:00', '22:00:00'),
(13, 2, 3, 0, '19:00:00', '22:00:00'),
(23, 3, 2, 0, '19:00:00', '22:00:00'),
(24, 3, 3, 0, '19:00:00', '22:00:00'),
(34, 4, 2, 0, '19:00:00', '22:00:00'),
(35, 4, 3, 0, '19:00:00', '22:00:00'),
(93, 1, 4, 1, NULL, NULL),
(94, 1, 5, 1, NULL, NULL),
(95, 1, 6, 0, '19:00:00', '22:00:00'),
(96, 1, 7, 0, '19:00:00', '22:00:00'),
(97, 2, 4, 1, NULL, NULL),
(98, 2, 5, 1, NULL, NULL),
(99, 2, 6, 0, '19:00:00', '22:00:00'),
(100, 2, 7, 0, '19:00:00', '22:00:00'),
(101, 3, 4, 1, NULL, NULL),
(102, 3, 5, 1, NULL, NULL),
(103, 3, 6, 0, '19:00:00', '22:00:00'),
(104, 3, 7, 0, '19:00:00', '22:00:00'),
(105, 4, 4, 1, NULL, NULL),
(106, 4, 5, 1, NULL, NULL),
(107, 4, 6, 0, '19:00:00', '22:00:00'),
(108, 4, 7, 0, '19:00:00', '22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` bigint(20) NOT NULL,
  `name` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `name`) VALUES
(1, 'FooBar'),
(2, 'Paradise'),
(3, 'Vox'),
(4, 'The Bird');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_schedule`
--

CREATE TABLE `vendor_schedule` (
  `id` bigint(20) NOT NULL,
  `vendor_id` bigint(20) DEFAULT NULL,
  `weekday` tinyint(4) DEFAULT NULL,
  `all_day` tinyint(3) DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `stop_hour` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor_schedule`
--

INSERT INTO `vendor_schedule` (`id`, `vendor_id`, `weekday`, `all_day`, `start_hour`, `stop_hour`) VALUES
(1, 1, 2, 0, '19:00:00', '22:00:00'),
(2, 1, 3, 0, '19:00:00', '22:00:00'),
(8, 1, 4, 1, NULL, NULL),
(9, 1, 5, 1, NULL, NULL),
(10, 1, 6, 0, '19:00:00', '22:00:00'),
(11, 1, 7, 0, '19:00:00', '22:00:00'),
(12, 2, 4, 1, NULL, NULL),
(13, 2, 5, 1, NULL, NULL),
(14, 2, 6, 0, '19:00:00', '22:00:00'),
(15, 2, 7, 0, '19:00:00', '22:00:00'),
(16, 3, 4, 1, NULL, NULL),
(17, 3, 5, 1, NULL, NULL),
(18, 3, 6, 0, '19:00:00', '22:00:00'),
(19, 3, 7, 0, '19:00:00', '22:00:00'),
(20, 4, 4, 1, NULL, NULL),
(21, 4, 5, 1, NULL, NULL),
(22, 4, 6, 0, '19:00:00', '22:00:00'),
(23, 4, 7, 0, '19:00:00', '22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_special_day`
--

CREATE TABLE `vendor_special_day` (
  `id` bigint(20) NOT NULL,
  `vendor_id` bigint(1) DEFAULT NULL,
  `special_date` date DEFAULT NULL,
  `event_type` enum('opened','closed') CHARACTER SET latin1 DEFAULT NULL,
  `all_day` tinyint(1) DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `stop_hour` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vendor_special_day`
--

INSERT INTO `vendor_special_day` (`id`, `vendor_id`, `special_date`, `event_type`, `all_day`, `start_hour`, `stop_hour`) VALUES
(1, 1, '2015-12-24', 'closed', 1, NULL, NULL),
(2, 1, '2015-12-25', 'closed', 1, NULL, NULL),
(3, 1, '2015-12-26', 'opened', 0, '19:00:00', '22:00:00'),
(4, 1, '2015-12-27', 'opened', 0, '19:00:00', '22:00:00'),
(5, 2, '2015-12-24', 'closed', 1, NULL, NULL),
(6, 2, '2015-12-25', 'closed', 1, NULL, NULL),
(7, 2, '2015-12-26', 'opened', 0, '19:00:00', '22:00:00'),
(8, 2, '2015-12-27', 'opened', 0, '19:00:00', '22:00:00'),
(9, 3, '2015-12-24', 'closed', 1, NULL, NULL),
(10, 3, '2015-12-25', 'closed', 1, NULL, NULL),
(11, 3, '2015-12-26', 'opened', 0, '19:00:00', '22:00:00'),
(12, 3, '2015-12-27', 'opened', 0, '19:00:00', '22:00:00'),
(13, 4, '2015-12-24', 'closed', 1, NULL, NULL),
(14, 4, '2015-12-25', 'closed', 1, NULL, NULL),
(15, 4, '2015-12-26', 'opened', 0, '19:00:00', '22:00:00'),
(16, 4, '2015-12-27', 'opened', 0, '19:00:00', '22:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backup_vendor_schedule`
--
ALTER TABLE `backup_vendor_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vendor` (`vendor_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_schedule`
--
ALTER TABLE `vendor_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_special_day`
--
ALTER TABLE `vendor_special_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vendor_special` (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `backup_vendor_schedule`
--
ALTER TABLE `backup_vendor_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vendor_schedule`
--
ALTER TABLE `vendor_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `vendor_special_day`
--
ALTER TABLE `vendor_special_day`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `vendor_special_day`
--
ALTER TABLE `vendor_special_day`
  ADD CONSTRAINT `fk_vendor_special` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
