-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 22, 2016 at 04:46 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mbm_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table_update_detail`
--

CREATE TABLE IF NOT EXISTS `admin_table_update_detail` (
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
-- Table structure for table `device`
--

CREATE TABLE IF NOT EXISTS `device` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `device_imei` varchar(16) NOT NULL,
  `serial` varchar(15) NOT NULL,
  `model` varchar(15) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `android_id` varchar(15) NOT NULL,
  `fingerprint` varchar(150) NOT NULL,
  `os_version` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Binary Representation : 0 - Admin | 1 - Library | ',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`device_id`),
  UNIQUE KEY `device_imei` (`device_imei`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`device_id`, `device_imei`, `serial`, `model`, `manufacturer`, `android_id`, `fingerprint`, `os_version`, `status`, `date_added`, `last_updated`) VALUES
(5, '911356500105089', '6ab728b', 'Q1100', 'XOLO', 'JLS36C', 'XOLO/Q1100/Q1100:4.3/JLS36C/user.release_admin.20140213.201119:user/release-keys', '4.3', 7, '2015-08-23 10:52:06', '0000-00-00 00:00:00'),
(6, '911384900775202', '0123456789ABCDE', 'Q610s', 'XOLO', 'LRX21M', 'XOLO/Q610s/Q610s:5.0/LRX21M/1421834175:user/release-keys', '5.0', 6, '2015-09-17 16:44:28', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

CREATE TABLE IF NOT EXISTS `password` (
  `password_id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`password_id`),
  UNIQUE KEY `key` (`key`,`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `password`
--

INSERT INTO `password` (`password_id`, `key`, `value`, `status`, `date_added`, `last_updated`) VALUES
(2, 'admin_api_secret_key', 'doubt', 1, '2016-02-03 10:46:23', '2016-02-03 10:46:23'),
(3, 'library_api_secret_key', 'doubtt', 1, '2016-02-05 18:04:53', '2016-02-05 18:04:53');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_table_update_detail`
--
ALTER TABLE `admin_table_update_detail`
  ADD CONSTRAINT `admin_table_update_detail_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `admin_table_update_detail_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `mbm_user`.`user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
