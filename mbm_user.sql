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
-- Database: `mbm_user`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodgroup`
--

CREATE TABLE IF NOT EXISTS `bloodgroup` (
  `bloodgroup_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`bloodgroup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `bloodgroup`
--

INSERT INTO `bloodgroup` (`bloodgroup_id`, `name`, `date_added`, `last_updated`) VALUES
(1, 'A+', '2015-08-23 19:42:04', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `code` varchar(5) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`city_id`),
  KEY `FOREIGN_KEY_1` (`state_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `state_id`, `name`, `code`, `date_added`, `last_updated`) VALUES
(1, 1, 'Jodhpur', '291', '2015-08-23 19:38:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `code` varchar(5) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`, `code`, `date_added`, `last_updated`) VALUES
(1, 'India', '91', '2015-08-23 19:38:39', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE IF NOT EXISTS `state` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `code` varchar(5) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`state_id`),
  KEY `FOREIGN_KEY_1` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `country_id`, `name`, `code`, `date_added`, `last_updated`) VALUES
(1, 1, 'Rajasthan', '', '2015-08-23 19:38:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email_authorized` int(11) NOT NULL DEFAULT '0',
  `authorized` int(11) NOT NULL DEFAULT '0' COMMENT 'Binary Representation : 0 - Admin | 1 - Library | ',
  `comment` varchar(255) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `email_authorized`, `authorized`, `comment`, `date_added`, `last_updated`) VALUES
(13, 'tarunsmalviya12@gmail.com', 'tarun', 0, 1, '', '2015-07-26 06:10:02', '2015-07-26 06:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_personal`
--

CREATE TABLE IF NOT EXISTS `user_personal` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(20) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `about_user` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `p_address` varchar(150) NOT NULL,
  `p_city_id` int(11) NOT NULL,
  `p_zipcode` varchar(7) NOT NULL,
  `t_address` varchar(150) NOT NULL,
  `t_city_id` int(11) NOT NULL,
  `t_zipcode` varchar(7) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `father_name` varchar(40) NOT NULL,
  `mother_name` varchar(40) NOT NULL,
  `father_contact_no` varchar(10) NOT NULL,
  `blood_group_id` int(11) NOT NULL,
  `date_added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`),
  KEY `FOREIGN_KEY_1` (`p_city_id`),
  KEY `FOREIGN_KEY_2` (`t_city_id`),
  KEY `FOREIGN_KEY_3` (`blood_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_personal`
--

INSERT INTO `user_personal` (`user_id`, `f_name`, `l_name`, `dob`, `about_user`, `sex`, `p_address`, `p_city_id`, `p_zipcode`, `t_address`, `t_city_id`, `t_zipcode`, `contact_no`, `father_name`, `mother_name`, `father_contact_no`, `blood_group_id`, `date_added`, `last_updated`) VALUES
(13, 'Tarun', 'Malviya', '1996-02-11', '', 'M', 'Leela Purushottam Awas, In 4th Lane, Opp. Police Chowki, Vijay Nagar, New Pali Road', 1, '342005', 'Leela Purushottam Awas, In 4th Lane, Opp. Police Chowki, Vijay Nagar, New Pali Road', 1, '342005', '9610400144', 'Sunil Malviya', 'Santosh Malviya', '9829091903', 1, '2015-08-23 19:42:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_table_update_detail`
--

CREATE TABLE IF NOT EXISTS `user_table_update_detail` (
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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`);

--
-- Constraints for table `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `state_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `user_personal`
--
ALTER TABLE `user_personal`
  ADD CONSTRAINT `user_personal_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_personal_ibfk_2` FOREIGN KEY (`p_city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `user_personal_ibfk_3` FOREIGN KEY (`t_city_id`) REFERENCES `city` (`city_id`),
  ADD CONSTRAINT `user_personal_ibfk_4` FOREIGN KEY (`blood_group_id`) REFERENCES `bloodgroup` (`bloodgroup_id`);

--
-- Constraints for table `user_table_update_detail`
--
ALTER TABLE `user_table_update_detail`
  ADD CONSTRAINT `user_table_update_detail_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `mbm_admin`.`device` (`device_id`),
  ADD CONSTRAINT `user_table_update_detail_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
