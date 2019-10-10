-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2017 at 02:55 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mbm`
--

-- --------------------------------------------------------

--
-- Table structure for table `newsfeed`
--

CREATE TABLE `newsfeed` (
  `newsId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `newsContent` varchar(1000) NOT NULL,
  `newsImage` varchar(255) NOT NULL,
  `newsVisibility` varchar(255) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `newsLike` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsfeed`
--

INSERT INTO `newsfeed` (`newsId`, `userId`, `newsContent`, `newsImage`, `newsVisibility`, `createdDate`, `newsLike`) VALUES
(1, 10, 'This is first news Item\r\nThis is first news Item\r\nThis is first news Item\r\nThis is first news Item', '', 'ECC', '2017-04-27 11:13:18', 0),
(2, 11, 'This is second news Item. This is second news Item v This is second news Item This is second news Item This is second news Item', '', 'All', '2017-04-27 11:13:18', 0),
(3, 10, 'This is first news Item\r\nThis is first news Item\r\nThis is first news Item\r\nThis is first news Item', '', 'ECC', '2017-04-27 11:13:22', 0),
(4, 11, 'This is second news Item. This is second news Item v This is second news Item This is second news Item This is second news Item', '', 'All', '2017-04-27 11:13:22', 0),
(5, 9, 'Yes, This is third one and is working.', '', 'All Professors', '2017-04-27 11:14:34', 0),
(6, 9, 'This is fourth news Item.. haahaahaaaaaahhaaa', '', 'All', '2017-04-27 11:14:34', 0),
(7, 9, 'Yes, This is third one and is working.', '', 'All Professors', '2017-04-27 11:14:53', 0),
(8, 9, 'This is fourth news Item.. haahaahaaaaaahhaaa', '', 'All', '2017-04-27 11:14:53', 0),
(9, 9, 'Yes, This is third one and is working.', '', 'All Professors', '2017-04-27 11:14:53', 0),
(10, 9, 'This is fourth news Item.. haahaahaaaaaahhaaa', '', 'All', '2017-04-27 11:14:53', 0),
(11, 9, 'Yes, This is third one and is working.', '', 'All Professors', '2017-04-27 11:15:02', 0),
(12, 9, 'This is fourth news Item.. haahaahaaaaaahhaaa', '', 'All', '2017-04-27 11:15:02', 0),
(13, 11, 'i am new to this', '', 'All', '2017-04-28 13:17:38', 0),
(14, 11, 'jjhgyujjn', '', 'Civil CSE ', '2017-05-02 12:38:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `newslike`
--

CREATE TABLE `newslike` (
  `newsId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newslike`
--

INSERT INTO `newslike` (`newsId`, `userId`, `id`) VALUES
(3, 10, 14),
(5, 10, 17);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Type` char(1) NOT NULL,
  `Branch` varchar(255) NOT NULL,
  `Dob` date DEFAULT NULL,
  `Gender` char(1) NOT NULL,
  `MobileNo` bigint(20) DEFAULT NULL,
  `FacultyNo` varchar(20) NOT NULL,
  `JobDetails` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `FirstName`, `LastName`, `Username`, `Password`, `Type`, `Branch`, `Dob`, `Gender`, `MobileNo`, `FacultyNo`, `JobDetails`) VALUES
(9, 'Poorva', 'Sinha', 'sinhapoorva.0509@gmail.com', 'poorva', 's', 'ECC', '1995-09-05', 'F', 9460405698, '13ECC19036', ''),
(10, 'Poojan', 'Jangid', 'poojan', 'poojan', 'a', 'ECC', '1997-01-01', 'F', 7798016711, '13/19035', ''),
(11, 'Kirti', 'Desai', 'kd', 'kd', 'a', 'ECC', '1994-12-19', 'M', 9784845100, '19033', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `newsfeed`
--
ALTER TABLE `newsfeed`
  ADD PRIMARY KEY (`newsId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `newslike`
--
ALTER TABLE `newslike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `newsId` (`newsId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `userId_2` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `username` (`Username`),
  ADD UNIQUE KEY `Username_2` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `newsfeed`
--
ALTER TABLE `newsfeed`
  MODIFY `newsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `newslike`
--
ALTER TABLE `newslike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `newsfeed`
--
ALTER TABLE `newsfeed`
  ADD CONSTRAINT `newsfeed_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

--
-- Constraints for table `newslike`
--
ALTER TABLE `newslike`
  ADD CONSTRAINT `newslike_ibfk_1` FOREIGN KEY (`newsId`) REFERENCES `newsfeed` (`newsId`),
  ADD CONSTRAINT `newslike_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
