-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2017 at 01:57 PM
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
-- Table structure for table `forumcomment`
--

CREATE TABLE `forumcomment` (
  `id` int(11) NOT NULL,
  `forumId` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumcomment`
--

INSERT INTO `forumcomment` (`id`, `forumId`, `userId`, `comment`, `createdDate`) VALUES
(1, 1, 10, '20june', '2017-06-18 11:13:06');

-- --------------------------------------------------------

--
-- Table structure for table `forumfeed`
--

CREATE TABLE `forumfeed` (
  `forumId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `forumContent` varchar(1000) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forumLike` int(11) NOT NULL DEFAULT '0',
  `forumComment` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumfeed`
--

INSERT INTO `forumfeed` (`forumId`, `userId`, `forumContent`, `createdDate`, `forumLike`, `forumComment`) VALUES
(1, 10, 'what is project submission date??', '2017-06-16 10:16:58', 0, 0),
(2, 11, 'What will be last working date', '2017-06-16 10:18:05', 1, 0),
(3, 10, 'how to install an app?', '2017-06-18 08:40:33', 0, 0),
(4, 11, 'How to delete an app?', '2017-06-18 08:41:30', 0, 0),
(5, 11, 'When will project viva start?', '2017-06-18 11:30:19', 1, 0),
(6, 10, 'how to uninstall an app?', '2017-06-18 12:11:36', 0, 0),
(7, 10, 'how to delt an app??', '2017-06-18 12:16:38', 0, 0),
(8, 10, 'tarun pagl h??', '2017-06-18 13:43:23', 0, 0),
(9, 10, 'tarun shi h??', '2017-06-18 14:19:13', 0, 0),
(10, 10, 'pooofgf??', '2017-06-18 14:25:28', 0, 0),
(11, 10, 'ddghnfcx?', '2017-06-18 14:28:23', 0, 0),
(12, 11, 'this is kd', '2017-06-18 17:35:50', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `forumlike`
--

CREATE TABLE `forumlike` (
  `id` int(11) NOT NULL,
  `forumId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `forumlike`
--

INSERT INTO `forumlike` (`id`, `forumId`, `userId`) VALUES
(18, 2, 11),
(21, 5, 11);

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
(1, 10, 'NewsId:1\r\nThis is first news Item\r\nThis is first news Item\r\nThis is first news Item', '', 'ECC', '2017-04-27 11:13:18', 0),
(2, 11, 'NewsId:2\r\nThis is second news Item. This is second news Item v This is second news Item This is second news Item This is second news Item', '', 'All', '2017-04-27 11:13:18', 2),
(3, 10, 'NewsId:3\r\nThis is first news Item\r\nThis is first news Item\r\nThis is first news Item\r\nThis is first news Item', '', 'ECC', '2017-04-27 11:13:22', 1),
(4, 11, 'news id 4\r\nThis is second news Item. This is second news Item v This is second news Item This is second news Item This is second news Item', '', 'All', '2017-04-27 11:13:22', 0),
(5, 9, 'news id 5\r\nYes, This is third one and is working.', '', 'All Professors', '2017-04-27 11:14:34', 0),
(6, 9, 'NewsId:6\r\nhis is fourth news Item.. haahaahaaaaaahhaaa', '', 'All', '2017-04-27 11:14:34', 1),
(7, 9, 'news id:7\r\nYes, This is third one and is working.', '', 'All Professors', '2017-04-27 11:14:53', 0),
(8, 9, 'NewsId:8\r\nThis is fourth news Item.. haahaahaaaaaahhaaa', '', 'All', '2017-04-27 11:14:53', 2),
(9, 9, 'new id:9\r\nYes, This is third one and is working.', '', 'All Professors', '2017-04-27 11:14:53', 1),
(10, 9, 'news id 10\r\nThis is fourth news Item.. haahaahaaaaaahhaaa', '', 'All', '2017-04-27 11:14:53', 1),
(11, 9, 'news id 11\r\nYes, This is third one and is working.', '', 'All Professors', '2017-04-27 11:15:02', 1),
(12, 9, 'news id 12\r\nThis is fourth news Item.. haahaahaaaaaahhaaa', '', 'All', '2017-04-27 11:15:02', 1),
(13, 11, 'news id 13\r\ni am new to this', '', 'All', '2017-04-28 13:17:38', 0),
(14, 11, 'news id 14\r\njjhgyujjn', '', 'Civil CSE ', '2017-05-02 12:38:46', 1),
(15, 11, 'jzjajxujz isidj osjsjdj 1', '', 'EEE ECE Mechanical Civil ', '2017-05-12 17:27:03', 1),
(16, 11, 'jabxhhshz jajsjsj poojan', '', 'All', '2017-05-12 17:53:18', 1),
(17, 11, 'this is my attitude....', '', 'All', '2017-05-12 18:01:07', 0),
(18, 11, 'poojan is great', '', 'All', '2017-05-12 18:46:48', 0),
(19, 11, 'you r mine', '', 'All', '2017-05-12 18:48:22', 0),
(20, 11, 'love the weather', '', 'All', '2017-05-12 18:48:38', 2),
(21, 9, 'xdgvkjvkv', '', 'ECC', '2017-05-14 17:05:33', 1),
(26, 10, 'xdgvkjvkvpoojan', '', 'ECC', '2017-05-14 17:25:52', 0),
(27, 10, 'again poojan', '', 'All', '2017-05-14 17:29:19', 1),
(28, 10, 'trying ...tryiing...trying...nv=ECC EEE', '', 'ECC EEE', '2017-05-14 17:44:53', 2),
(29, 10, 'trying ...tryiing...trying...', '', 'ECC EEE', '2017-05-14 17:47:20', 0),
(30, 10, 'exam tym...', '', 'ECC EEE', '2017-05-14 17:48:38', 2),
(31, 10, 'exam tym...zjhshsafh', '', 'ECC EEE', '2017-05-14 17:52:26', 0),
(32, 10, 'lets play...zjhshsafh', '', 'ECC CSE', '2017-05-14 17:55:54', 0),
(33, 11, 'nothing to do...', '', 'ECC CSE', '2017-05-14 17:57:40', 0),
(34, 11, 'nothinggggg to do...', '', 'ECC CSE EEE', '2017-05-14 18:00:37', 1),
(35, 11, 'nothinggggg to do...', '', 'ECC CSE EEE', '2017-05-14 18:03:30', 1),
(36, 11, 'nothinggggg to do...', '', 'ECC CSE EEE', '2017-05-14 18:03:36', 1),
(37, 11, 'nothinggggg to do...', '', 'ECC CSE EEE', '2017-05-14 18:04:57', 2),
(38, 10, 'nothinggggg to do...', '', 'ECC CSE EEE', '2017-05-14 18:05:17', 0),
(39, 10, 'nothinggggg to do...', '', 'ECC CSE EEE', '2017-05-14 18:07:52', 1),
(40, 10, 'nothinggggg to do...', '', 'ECC CSE EEE', '2017-05-14 18:07:56', 2),
(41, 11, 'lol', '', 'All', '2017-06-16 10:45:01', 1),
(42, 11, 'hie', '', 'All', '2017-06-16 10:45:40', 0),
(43, 11, 'bie', '', 'All', '2017-06-16 11:19:35', 0),
(44, 11, 'hsskansbdbssjsbsbsbs', '', 'All', '2017-06-16 11:58:31', 0),
(45, 10, 'Plane crashed', '', 'All', '2017-06-18 08:29:55', 0),
(46, 10, 'fjdnczvnd', '', 'All', '2017-06-18 12:05:48', 0),
(47, 11, 'this is new news', '', 'All', '2017-06-19 15:29:35', 0);

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
(6, 11, 39),
(9, 11, 51),
(11, 10, 52),
(8, 10, 53),
(12, 11, 56),
(14, 10, 57),
(2, 10, 58),
(36, 11, 60),
(28, 11, 62),
(20, 11, 63),
(16, 11, 64),
(10, 11, 65),
(2, 11, 67),
(40, 10, 68),
(37, 10, 69),
(30, 10, 70),
(28, 10, 71),
(21, 10, 72),
(20, 10, 73),
(30, 11, 75),
(8, 11, 80),
(15, 11, 83),
(27, 11, 84),
(3, 11, 87),
(35, 11, 90),
(39, 11, 91),
(40, 11, 111),
(37, 11, 112),
(41, 11, 113),
(34, 11, 114);

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
(10, 'Poojan', 'Jangid', 'poojan', 'poojan', 's', 'ECC', '1997-01-01', 'F', 7798016711, '13/19035', ''),
(11, 'Kirti', 'Desai', 'kd', 'kd', 's', 'ECC', '1994-12-19', 'M', 9784845100, '19033', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forumcomment`
--
ALTER TABLE `forumcomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forumId` (`forumId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `forumfeed`
--
ALTER TABLE `forumfeed`
  ADD PRIMARY KEY (`forumId`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `forumlike`
--
ALTER TABLE `forumlike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forumId` (`forumId`),
  ADD KEY `userId` (`userId`);

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
-- AUTO_INCREMENT for table `forumcomment`
--
ALTER TABLE `forumcomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `forumfeed`
--
ALTER TABLE `forumfeed`
  MODIFY `forumId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forumlike`
--
ALTER TABLE `forumlike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `newsfeed`
--
ALTER TABLE `newsfeed`
  MODIFY `newsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `newslike`
--
ALTER TABLE `newslike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `forumcomment`
--
ALTER TABLE `forumcomment`
  ADD CONSTRAINT `forumcomment_ibfk_1` FOREIGN KEY (`forumId`) REFERENCES `forumfeed` (`forumid`),
  ADD CONSTRAINT `forumcomment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

--
-- Constraints for table `forumfeed`
--
ALTER TABLE `forumfeed`
  ADD CONSTRAINT `forumfeed_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

--
-- Constraints for table `forumlike`
--
ALTER TABLE `forumlike`
  ADD CONSTRAINT `forumlike_ibfk_1` FOREIGN KEY (`forumId`) REFERENCES `forumfeed` (`forumid`),
  ADD CONSTRAINT `forumlike_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`);

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
