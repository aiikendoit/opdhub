-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 09:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `opdhub_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aemail` varchar(255) NOT NULL,
  `apassword` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aemail`, `apassword`) VALUES
('admin@opdhub.com', '$2y$10$ibXWW/4tSmT8aIm8feTw3uktbXHGwjWhTJZ3GS6BG21h7mhHdueM.');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appoid` int(11) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `apponum` int(3) DEFAULT NULL,
  `scheduleid` int(10) DEFAULT NULL,
  `appodate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appoid`, `pid`, `apponum`, `scheduleid`, `appodate`) VALUES
(9, 3, 1, 10, '2023-11-03'),
(10, 4, 1, 11, '2023-11-03');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `docid` int(11) NOT NULL,
  `docemail` varchar(255) DEFAULT NULL,
  `docname` varchar(255) DEFAULT NULL,
  `docpassword` varchar(255) DEFAULT NULL,
  `docnic` varchar(15) DEFAULT NULL,
  `doctel` varchar(15) DEFAULT NULL,
  `specialties` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`docid`, `docemail`, `docname`, `docpassword`, `docnic`, `doctel`, `specialties`) VALUES
(1, 'jdoe@amcb.com', 'John Doe', '$2y$10$L3ZSvdfrdYftUrvi2hJ1b.MHY23NuToZwlwnkMAW3kGV2xypiyn0S', '000000000', '0110000000', 1),
(2, 'janedoe@amcb.com', 'Jane Doe', '$2y$10$wbi..2sNNFd3Hf2N5nHVj.GNU9Zbd3smoF6XnItHnTw/s8HFTVZ3m', '0000000001', '000000001', 5),
(3, 'peterjames@pedro.com', 'Peter James', '$2y$10$DkNQJZPOojhd5b0ZbJ9uHemiUQ24QzsSlkwO0lqDm1dVPh7KFo3.W', '0000000007', '000000001', 6),
(4, 'chopper@chop.com', 'Chopper', '$2y$10$h555RyMvrQeS/tbYJkH9rurQyFvOgU1kJy/s/5IzyModvMim9Xbci', '0000000011', '000000001', 4),
(5, 'duke@nukem.com', 'Duke Nukem', '$2y$10$MymmEStpCMPzKm3BJLX6Euf6xuX0rAgzbGIfZ1GLoPVEOTkhuPV2S', '0000000001', '000000001', 1),
(6, 'test@test1.com', 'test', '$2y$10$O7cZMKKPbU6bptDARCdaoeJUgnnXNQnkApIpR4WZvX.YfjAUXdjyS', '0000000001', '000000001', 7),
(7, 'jredick@test.com', 'JJ Redick', '$2y$10$ZteoFZNIXN9S6EMW3Cxvm.pzz5IQPR5Vj6KwZL/AUJtNBAef8szPe', '0000000001', '000000001', 2);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pid` int(11) NOT NULL,
  `pemail` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `ppassword` varchar(255) DEFAULT NULL,
  `paddress` varchar(255) DEFAULT NULL,
  `pnic` varchar(15) DEFAULT NULL,
  `pdob` date DEFAULT NULL,
  `ptel` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pid`, `pemail`, `pname`, `ppassword`, `paddress`, `pnic`, `pdob`, `ptel`) VALUES
(5, 'jdeep@carribean.com', 'Johnny Deep', '$2y$10$pMHFC.6n8opxhc5cYFYvnu6RZILalVZOv02E2XN9meJX3szE8XcKm', 'Carribean', '0000000006', '1985-05-15', ''),
(4, 'simpet@gogo.com', 'Simon Peter', '$2y$10$rupV275Gy6tOUaXiL3p4Ee3Ymxim.O9xpkMfFAcP36Y.4y/pr60NG', 'Nazareth', '0000000002', '1990-04-16', ''),
(3, 'akdisrael15@gmail.com', 'Kenneth Israel', '$2y$10$p0xqNRQPQ8OSthS3p.5lb.v9unjP0JlLe.sXQxEv4K1v2Gc3RNKA6', 'Bacolod', '0000000003', '1992-04-16', ''),
(6, 'pedropenduko@enkantadya.com', 'Pedro Penduko', '$2y$10$9Re0DLDdngdw3YuZSbXqlO0Bccq28rGBGdvNjA5FIsleI01mBfGHS', 'Encantadia', '0000000009', '1989-05-15', '');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheduleid` int(11) NOT NULL,
  `docid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `scheduledate` date DEFAULT NULL,
  `scheduletime` time DEFAULT NULL,
  `nop` int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleid`, `docid`, `title`, `scheduledate`, `scheduletime`, `nop`) VALUES
(10, '1', 'General Surgery', '2023-11-03', '09:00:00', 5),
(9, '2', 'Obstetrics and gynec', '2023-11-03', '08:40:00', 5),
(11, '3', 'FAMED for workers', '2023-11-03', '09:00:00', 5);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` int(2) NOT NULL,
  `sname` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `sname`) VALUES
(1, 'Internal Medicine'),
(2, 'Surgery'),
(3, 'Family Medicine (for workers)'),
(4, 'Pediatrics'),
(5, 'Obstetrics & Gynecology'),
(6, 'Park \'N Care'),
(7, 'Family Medicine (for outpatients)');

-- --------------------------------------------------------

--
-- Table structure for table `webuser`
--

CREATE TABLE `webuser` (
  `email` varchar(255) NOT NULL,
  `usertype` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `webuser`
--

INSERT INTO `webuser` (`email`, `usertype`) VALUES
('admin@opdhub.com', 'a'),
('jdoe@amcb.com', 'd'),
('jdeep@carribean.com', 'p'),
('simpet@gogo.com', 'p'),
('janedoe@amcb.com', 'd'),
('akdisrael15@gmail.com', 'p'),
('peterjames@pedro.com', 'd'),
('pedropenduko@enkantadya.com', 'p'),
('chopper@chop.com', 'd'),
('test@test.com', 'd'),
('test@test1.com', 'd'),
('jredick@test.com', 'd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aemail`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appoid`),
  ADD KEY `pid` (`pid`),
  ADD KEY `scheduleid` (`scheduleid`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`docid`),
  ADD KEY `specialties` (`specialties`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleid`),
  ADD KEY `docid` (`docid`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `webuser`
--
ALTER TABLE `webuser`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appoid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `docid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
