DROP TABLE IF EXISTS `vendor_special_day`;
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
(1, 1, '2015-12-21', 'opened', 0, '19:00:00', '22:00:00'),
(2, 1, '2015-12-22', 'opened', 0, '19:00:00', '22:00:00'),
(3, 1, '2015-12-23', 'opened', 0, '19:00:00', '22:00:00'),
(4, 1, '2015-12-24', 'closed', 1, NULL, NULL),
(5, 1, '2015-12-25', 'closed', 1, NULL, NULL),
(6, 1, '2015-12-26', 'opened', 0, '19:00:00', '22:00:00'),
(7, 1, '2015-12-27', 'opened', 0, '19:00:00', '22:00:00'),
(8, 2, '2015-12-21', 'opened', 0, '19:00:00', '22:00:00'),
(9, 2, '2015-12-22', 'opened', 0, '19:00:00', '22:00:00'),
(10, 2, '2015-12-23', 'opened', 0, '19:00:00', '22:00:00'),
(11, 2, '2015-12-24', 'closed', 1, NULL, NULL),
(12, 2, '2015-12-25', 'closed', 1, NULL, NULL),
(13, 2, '2015-12-26', 'opened', 0, '19:00:00', '22:00:00'),
(14, 2, '2015-12-27', 'opened', 0, '19:00:00', '22:00:00'),
(15, 3, '2015-12-21', 'opened', 0, '19:00:00', '22:00:00'),
(16, 3, '2015-12-22', 'opened', 0, '19:00:00', '22:00:00'),
(17, 3, '2015-12-23', 'opened', 0, '19:00:00', '22:00:00'),
(18, 3, '2015-12-24', 'closed', 1, NULL, NULL),
(19, 3, '2015-12-25', 'closed', 1, NULL, NULL),
(20, 3, '2015-12-26', 'opened', 0, '19:00:00', '22:00:00'),
(21, 3, '2015-12-27', 'opened', 0, '19:00:00', '22:00:00'),
(22, 4, '2015-12-21', 'opened', 0, '19:00:00', '22:00:00'),
(23, 4, '2015-12-22', 'opened', 0, '19:00:00', '22:00:00'),
(24, 4, '2015-12-23', 'opened', 0, '19:00:00', '22:00:00'),
(25, 4, '2015-12-24', 'closed', 1, NULL, NULL),
(26, 4, '2015-12-25', 'closed', 1, NULL, NULL),
(27, 4, '2015-12-26', 'opened', 0, '19:00:00', '22:00:00'),
(28, 4, '2015-12-27', 'opened', 0, '19:00:00', '22:00:00');

--
-- Indexes for dumped tables
--

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

