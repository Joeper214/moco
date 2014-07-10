-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 09, 2014 at 07:40 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moco`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `IDNUMBER` int(11) NOT NULL,
  `LASTNAME` varchar(50) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `MIDDLENAME` varchar(50) DEFAULT NULL,
  `HOMEADDRESS` varchar(200) DEFAULT NULL,
  `PHONE` varchar(50) DEFAULT NULL,
  `PASS_WORD` varchar(30) DEFAULT NULL,
  `ACTIVESERVICE` int(11) DEFAULT NULL,
  `SIGNATURE` blob,
  `PICTURE` blob,
  `POSITIONRANK` varchar(100) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`IDNUMBER`, `LASTNAME`, `FIRSTNAME`, `MIDDLENAME`, `HOMEADDRESS`, `PHONE`, `PASS_WORD`, `ACTIVESERVICE`, `SIGNATURE`, `PICTURE`, `POSITIONRANK`, `GENDER`) VALUES
(10001, 'ALMORADO', 'Roland', 'Cinco', 'Alicia, Zamboanga Sibugay', '09085284459', 'JPJULIA.LJ', 1, NULL, 0x5b42494e4152595d, 'Instructor I', 'Male'),
(10003, 'BADINAS', 'Mariano', 'Rapirap', 'Alicia, Zamboanga Sibugay', '', '1234', 1, NULL, 0x5b42494e4152595d, 'Associate Professor 5', 'Female'),
(10010, 'ANUB', 'Remedios', 'Rapirap', 'Alicia, Zamboanga Sibugay', '09085284459', 'remrem', 1, NULL, 0x5b42494e4152595d, 'Instructor 2', 'Female'),
(15286, 'NAMALATA', 'Ma. Theresa', 'Gayawon', NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL);
(16753, 'DOE', 'John', '', NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL);
(10005, 'AQUINO', 'Noynoy', '', NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL);
(10004, 'OBAMA', 'Barack', 'Hussein', NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
