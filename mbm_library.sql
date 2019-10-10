-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 22, 2016 at 04:47 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mbm_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `author_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `details` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover` varchar(10) NOT NULL,
  `year_of_publish` int(11) NOT NULL,
  `isbn10` varchar(10) NOT NULL,
  `isbn13` varchar(13) NOT NULL,
  `no_of_copies` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `edition` int(11) NOT NULL,
  `content` text NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn10` (`isbn10`),
  UNIQUE KEY `isbn13` (`isbn13`),
  KEY `FOREIGN_KEY_1` (`category_id`),
  KEY `FOREIGN_KEY_2` (`author_id`),
  KEY `FOREIGN_KEY_3` (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  `abbrevation` varchar(15) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_book`
--

CREATE TABLE IF NOT EXISTS `issue_book` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `issued_to_user` int(11) NOT NULL,
  `issued_by_user` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `issue_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`issue_id`),
  KEY `FOREIGN_KEY_1` (`book_id`),
  KEY `FOREIGN_KEY_2` (`issued_to_user`),
  KEY `FOREIGN_KEY_3` (`issued_by_user`),
  KEY `FOREIGN_KEY_4` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lib_table_update_detail`
--

CREATE TABLE IF NOT EXISTS `lib_table_update_detail` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(30) NOT NULL,
  `device_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `before_update_value` varchar(255) NOT NULL,
  `after_update_value` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`update_id`),
  KEY `FOREIGN_KEY_1` (`device_id`),
  KEY `FOREIGN_KEY_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lib_user`
--

CREATE TABLE IF NOT EXISTS `lib_user` (
  `user_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`),
  KEY `FOREIGN_KEY_1` (`designation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lib_user`
--

INSERT INTO `lib_user` (`user_id`, `designation_id`, `status`, `date_added`, `last_updated`) VALUES
(13, 1, 1, '2015-08-22 18:05:20', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `lib_user_designation`
--

CREATE TABLE IF NOT EXISTS `lib_user_designation` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `permissions` varchar(50) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `lib_user_designation`
--

INSERT INTO `lib_user_designation` (`designation_id`, `name`, `permissions`, `date_added`, `last_updated`) VALUES
(1, 'Library Incharge', '', '2015-08-23 19:06:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE IF NOT EXISTS `login_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `FOREIGN_KEY_1` (`user_id`),
  KEY `FOREIGN_KEY_2` (`device_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=75 ;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`log_id`, `user_id`, `device_id`, `date_time`) VALUES
(3, 13, 5, '2015-09-12 20:28:17'),
(4, 13, 5, '2015-09-12 20:28:26'),
(5, 13, 5, '2015-09-14 09:41:13'),
(6, 13, 5, '2015-09-14 09:52:19'),
(7, 13, 5, '2015-09-14 10:49:55'),
(8, 13, 5, '2015-09-14 11:47:01'),
(9, 13, 5, '2015-09-14 11:51:08'),
(10, 13, 5, '2015-09-14 11:57:43'),
(11, 13, 5, '2015-09-14 12:04:35'),
(12, 13, 5, '2015-09-14 12:04:36'),
(13, 13, 5, '2015-09-14 12:11:16'),
(14, 13, 5, '2015-09-14 13:02:55'),
(15, 13, 5, '2015-09-14 13:09:20'),
(16, 13, 5, '2015-09-14 13:11:57'),
(17, 13, 5, '2015-09-14 13:14:46'),
(18, 13, 5, '2015-09-14 13:29:33'),
(19, 13, 5, '2015-09-14 13:30:38'),
(20, 13, 5, '2015-09-15 11:26:25'),
(21, 13, 5, '2015-09-15 12:11:50'),
(22, 13, 5, '2015-09-15 15:48:43'),
(23, 13, 5, '2015-09-16 17:43:44'),
(24, 13, 5, '2015-09-16 18:01:12'),
(25, 13, 5, '2015-09-16 18:02:01'),
(26, 13, 5, '2015-09-16 18:02:49'),
(27, 13, 5, '2015-09-16 18:09:03'),
(28, 13, 5, '2015-09-16 18:17:42'),
(29, 13, 5, '2015-09-16 18:18:56'),
(30, 13, 5, '2015-09-16 18:41:29'),
(31, 13, 5, '2015-09-16 18:43:25'),
(32, 13, 5, '2015-09-16 18:44:46'),
(33, 13, 5, '2015-09-16 18:58:37'),
(34, 13, 5, '2015-09-16 19:01:39'),
(35, 13, 5, '2015-09-16 19:03:28'),
(36, 13, 5, '2015-09-16 19:07:33'),
(37, 13, 5, '2015-09-16 19:10:23'),
(38, 13, 5, '2015-09-16 19:13:55'),
(39, 13, 5, '2015-09-16 19:15:04'),
(40, 13, 5, '2015-09-16 19:27:17'),
(41, 13, 5, '2015-09-16 19:29:58'),
(42, 13, 5, '2015-09-16 19:31:04'),
(43, 13, 5, '2015-09-16 19:37:15'),
(44, 13, 5, '2015-09-16 19:37:51'),
(45, 13, 5, '2015-09-16 19:38:42'),
(46, 13, 5, '2015-09-16 19:38:59'),
(47, 13, 5, '2015-09-16 19:42:49'),
(48, 13, 5, '2015-09-16 19:44:02'),
(49, 13, 5, '2015-09-16 20:14:23'),
(50, 13, 5, '2015-09-16 20:15:55'),
(51, 13, 5, '2015-09-16 20:18:20'),
(52, 13, 5, '2015-09-16 20:48:30'),
(53, 13, 5, '2015-09-16 20:50:43'),
(54, 13, 5, '2015-09-16 20:53:21'),
(55, 13, 5, '2015-09-17 13:00:44'),
(56, 13, 5, '2015-09-17 14:21:08'),
(57, 13, 5, '2015-09-17 14:23:02'),
(58, 13, 5, '2015-09-17 14:33:13'),
(59, 13, 5, '2015-09-17 16:20:42'),
(60, 13, 5, '2015-09-17 16:21:59'),
(61, 13, 5, '2015-09-17 16:23:17'),
(62, 13, 5, '2015-09-17 16:32:04'),
(63, 13, 5, '2015-09-17 16:35:35'),
(64, 13, 5, '2015-09-17 16:38:19'),
(65, 13, 6, '2015-09-17 16:45:16'),
(66, 13, 6, '2015-09-17 16:50:39'),
(67, 13, 5, '2015-09-17 19:26:04'),
(68, 13, 5, '2015-09-17 19:27:49'),
(69, 13, 5, '2015-09-17 19:29:55'),
(70, 13, 5, '2015-09-17 19:34:50'),
(71, 13, 5, '2015-09-17 19:35:04'),
(72, 13, 5, '2015-09-17 19:36:09'),
(73, 13, 5, '2015-09-17 19:37:22'),
(74, 13, 5, '2015-12-07 20:07:06');

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE IF NOT EXISTS `publisher` (
  `publisher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_no` varchar(13) NOT NULL,
  `abbrevation` varchar(15) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issue_book`
--
ALTER TABLE `issue_book`
  ADD CONSTRAINT `issue_book_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issue_book_ibfk_2` FOREIGN KEY (`issued_to_user`) REFERENCES `mbm_user`.`user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issue_book_ibfk_3` FOREIGN KEY (`issued_by_user`) REFERENCES `mbm_user`.`user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issue_book_ibfk_4` FOREIGN KEY (`device_id`) REFERENCES `mbm_admin`.`device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lib_table_update_detail`
--
ALTER TABLE `lib_table_update_detail`
  ADD CONSTRAINT `lib_table_update_detail_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `mbm_admin`.`device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lib_table_update_detail_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `mbm_user`.`user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login_log`
--
ALTER TABLE `login_log`
  ADD CONSTRAINT `login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `mbm_user`.`user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `login_log_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `mbm_admin`.`device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
