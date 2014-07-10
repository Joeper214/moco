-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 31, 2014 at 10:39 PM
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
-- Table structure for table `instructorcourserecord`
--

CREATE TABLE IF NOT EXISTS `instructorcourserecord` (
  `ic_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` varchar(10) NOT NULL,
  `IDNUMBER` int(11) NOT NULL,
  `course_overview` text NOT NULL,
  `course_type` tinyint(4) NOT NULL DEFAULT '1',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`ic_id`),
  KEY `course_id` (`course_id`),
  KEY `IDNUMBER` (`IDNUMBER`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `instructorcourserecord`
--

INSERT INTO `instructorcourserecord` (`ic_id`, `course_id`, `IDNUMBER`, `course_overview`, `course_type`, `date_start`, `date_end`, `status`) VALUES
(12, 'Csc 101', 10001, '	               Introduction to Scientific Programming was developed over a period of three years for use in teaching a course in scientific computing to beginning science and engineering students at the University of Utah.\r\n\r\nIn conventional science and engineering degree programs, computation is commonly treated as a narrow technical tool to be studied and applied in isolation from the traditional topics of the discipline. Many students go through their degree programs without ever using computation in any significant way.\r\n\r\nIntroduction to Scientific Programming was designed to encourage the integration of computation into the science and engineering curricula. This textbook is ideal for a course whose goal is to teach introductory programming while simultaneously preparing students to immediately exploit the broad power of modern computing in their science and engineering courses. This textbook has at least four distinguishing features:	               		    		    ', 1, '2014-03-15', '2014-03-31', b'1'),
(13, 'Csc 171', 10001, 'Introduction to Scientific Programming was developed over a period of three years for use in teaching a course in scientific computing to beginning science and engineering students at the University of Utah.\r\n\r\nIn conventional science and engineering degree programs, computation is commonly treated as a narrow technical tool to be studied and applied in isolation from the traditional topics of the discipline. Many students go through their degree programs without ever using computation in any significant way.\r\n\r\nIntroduction to Scientific Programming was designed to encourage the integration of computation into the science and engineering curricula. This textbook is ideal for a course whose goal is to teach introductory programming while simultaneously preparing students to immediately exploit the broad power of modern computing in their science and engineering courses. This textbook has at least four distinguishing features: ', 0, '0000-00-00', '0000-00-00', b'1'),
(14, 'Csc 100', 10001, 'Introduction to Scientific Programming was developed over a period of three years for use in teaching a course in scientific computing to beginning science and engineering students at the University of Utah.\r\n\r\nIn conventional science and engineering degree programs, computation is commonly treated as a narrow technical tool to be studied and applied in isolation from the traditional topics of the discipline. Many students go through their degree programs without ever using computation in any significant way.\r\n\r\nIntroduction to Scientific Programming was designed to encourage the integration of computation into the science and engineering curricula. This textbook is ideal for a course whose goal is to teach introductory programming while simultaneously preparing students to immediately exploit the broad power of modern computing in their science and engineering courses. This textbook has at least four distinguishing features:               		    ', 0, '0000-00-00', '0000-00-00', b'0'),
(15, 'Bio1', 10003, 'Biology 1 is the Introductory biology course for all university students. This course intends to help students to understand the basic concepts of life. It includes the concepts of cell which is the smallest unit of life where organisms are composed of. it will also tackles the characteristics of life of different species here on earth.\r\nWhile we are roaming around this planet, it is important to know biology. it is important to know life better in the concept of science which is presented in a factual manner.	               		    	               		    ', 0, '0000-00-00', '0000-00-00', b'0'),
(16, 'Csc 121', 10001, 'Data Structures	is one of the fundamental theory of computing.               		    ', 1, '2014-03-15', '2014-03-31', b'1'),
(17, 'Bio 101', 10001, 'dfhsdhfdjf jhdfdfhjksdfhjds\r\nfdjhfjdfjd lorem ipsum. study of life nin maulay.               		    ', 1, '2014-03-24', '2014-04-15', b'0'),
(18, 'Math 61', 10001, 'Analytic Geometry and Calculus II is an advanced topic for all science and mathematics major. This is the continuation of Math 51. Pagbantay mo kay daghan nabagsak ani. Mag-study ug tarong dili na mag dota kay makalambo sa pag eskwela	               		    ', 0, '0000-00-00', '0000-00-00', b'0'),
(19, 'Math 17', 10001, 'College Algebra and Trigonometry sayonrani part. Pwede ra mo mag-overnight ug dota ani part. Wala ni siyay challenge mura ra ni ug College Algebra ug Trigonometry	               		    ', 1, '2014-03-14', '2014-04-16', b'1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `instructorcourserecord`
--
ALTER TABLE `instructorcourserecord`
  ADD CONSTRAINT `instructorcourserecord_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `instructorcourserecord_ibfk_2` FOREIGN KEY (`IDNUMBER`) REFERENCES `employees` (`IDNUMBER`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
