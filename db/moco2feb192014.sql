-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 19, 2014 at 10:53 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moco2`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `ann_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `ann_stmt` text NOT NULL,
  `date_posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ann_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`ann_id`, `ic_id`, `title`, `ann_stmt`, `date_posted`) VALUES
(21, 12, 'Sample Announcement Title 2', 'Sample Announcement Content here\nupdated today Feb 18, 2013', '2014-02-09 10:07:13'),
(22, 12, 'Sample Announcement Title 3', ' Sample Announcement Content 3 updated  today Feb 18, 2013\n        ', '2014-02-09 11:10:23'),
(26, 14, 'Homework 1', 'Your task is to compute the total number of comparisons used to sort the given input file by QuickSort. As you know, the number of comparisons depends on which elements are chosen as pivots, so we''ll ask you to explore three different pivoting rules.\n You should not count comparisons one-by-one. Rather, when there is a recursive call on a subarray of length m, you should simply add m%u22121 to your running total of comparisons. (This is because the pivot element is compared to each of the other m%u22121 elements in the subarray in this recursive call.) \n\nWARNING: The Partition subroutine can be implemented in several different ways, and different implementations can give you differing numbers of comparisons. For this problem, you should implement the Partition subroutine exactly as it is described in the video lectures (otherwise you might get the wrong answer). \n\nDIRECTIONS FOR THIS PROBLEM: \n\nFor the first part of the programming assignment, you should always use the first element of the array as the pivot element. \n', '2014-02-17 21:05:14'),
(27, 14, 'Assignment 2', 'Click <a href=''#''>here</a></br>For more details</br>\n<i>Information italicized</i>', '2014-02-18 04:48:20'),
(28, 12, 'Lecture 4 - C   Recursion ', 'Our next lecture would be recursion in C  .This colud be mindbending for you guys. For you to have an early understandng please visit this <a href="#">site</a> and study in advance.\n<br>\n<br>\nyours truly,\n</br>\n<i>byREnX</i>', '2014-02-18 07:36:19'),
(29, 14, 'Announcement 3 Title', 'Sample Announcement test update', '2014-02-18 08:19:36'),
(30, 15, 'Welcome to Bio 1', 'To all my students Welcome to Bio 1 class andI am excited to teach you about the most important facts of life. But before that, I would like you to invite to visit <a href="www.google.com">www.google.com</a> and search for this keyword:<br>\n <ul>\n     <li>Introduction to Biology</li>\n     <li>Origins of Life</li>\n    <li>Basics unit of Life</li>\n</ul>\n<br>\nThis will serve as a warmup for you. be sure to read all this stuff, so that we will have a highly interactive discussion.\n<br><br>\ntruly yours,\n<br>\nMariano', '2014-02-18 13:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE IF NOT EXISTS `assignment` (
  `assign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `instruction` text NOT NULL,
  `inst_material` varchar(100) NOT NULL,
  `due_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_available` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`assign_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `assignment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ass_submission`
--

CREATE TABLE IF NOT EXISTS `ass_submission` (
  `assign_sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scr_id` int(10) unsigned NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `date_submitted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`assign_sub_id`),
  KEY `scr_id` (`scr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `ass_submission`
--


-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE IF NOT EXISTS `chapter` (
  `ch_id` int(11) NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `seq_no` int(11) NOT NULL,
  PRIMARY KEY (`ch_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`ch_id`, `ic_id`, `title`, `seq_no`) VALUES
(1, 12, 'Sample New Chapter 1 update test 2', 1),
(2, 12, 'Mathematical Binary Computation', 2),
(3, 12, 'Search Algorithms update 1', 3),
(4, 12, 'Advanced Programming 0', 4),
(5, 12, 'Advanced Programming 2', 5),
(6, 12, 'Advanced Programming 3', 6),
(7, 12, 'Advanced Programming 4', 7),
(8, 12, 'Advanced Programming 5 update', 8),
(9, 14, 'Inroduction to Programming', 1);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `course_id` varchar(10) NOT NULL,
  `course_desc` varchar(100) NOT NULL,
  `dept_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_id`, `course_desc`, `dept_id`) VALUES
('Bio 101', 'Basic Biology', 6),
('Bio1', 'Biology 1', 6),
('Csc 100', 'Introduction to Computer Programming', 4),
('Csc 101', 'Introduction to Scientific Computer Programming', 5),
('Csc 121', 'Data Structures', 4),
('Csc 171', 'Introduction to Artificial Intellegence', 4),
('Math 17', 'College Algebra and Trigonometry', 9),
('Math 61', 'Analytic Geometry and Calculus II', 9);

-- --------------------------------------------------------

--
-- Table structure for table `course_key`
--

CREATE TABLE IF NOT EXISTS `course_key` (
  `ck_id` int(11) NOT NULL AUTO_INCREMENT,
  `ck_key` varchar(5) NOT NULL,
  `ic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ck_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `course_key`
--

INSERT INTO `course_key` (`ck_id`, `ck_key`, `ic_id`) VALUES
(1, '50OF4', 16),
(2, '49RD5', 17),
(3, '54CM4', 19);

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `dept_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dept_id`, `dept_name`) VALUES
(4, 'Computer Science'),
(5, 'Engineering'),
(6, 'Biology'),
(7, 'Chemistry'),
(8, 'Physics'),
(9, 'Mathematics'),
(10, 'Philosophy'),
(11, 'English'),
(12, 'History'),
(13, 'Accounting');

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
(10010, 'ANUB', 'Remedios', 'Rapirap', 'Alicia, Zamboanga Sibugay', '09085284459', 'remrem', 1, NULL, 0x5b42494e4152595d, 'Instructor 2', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `identification`
--

CREATE TABLE IF NOT EXISTS `identification` (
  `ident_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(15) NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`ident_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `identification`
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
  PRIMARY KEY (`ic_id`),
  KEY `course_id` (`course_id`),
  KEY `IDNUMBER` (`IDNUMBER`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `instructorcourserecord`
--

INSERT INTO `instructorcourserecord` (`ic_id`, `course_id`, `IDNUMBER`, `course_overview`, `course_type`) VALUES
(12, 'Csc 101', 10001, '	               Introduction to Scientific Programming was developed over a period of three years for use in teaching a course in scientific computing to beginning science and engineering students at the University of Utah.\r\n\r\nIn conventional science and engineering degree programs, computation is commonly treated as a narrow technical tool to be studied and applied in isolation from the traditional topics of the discipline. Many students go through their degree programs without ever using computation in any significant way.\r\n\r\nIntroduction to Scientific Programming was designed to encourage the integration of computation into the science and engineering curricula. This textbook is ideal for a course whose goal is to teach introductory programming while simultaneously preparing students to immediately exploit the broad power of modern computing in their science and engineering courses. This textbook has at least four distinguishing features:	               		    		    ', 0),
(13, 'Csc 171', 10001, 'Introduction to Scientific Programming was developed over a period of three years for use in teaching a course in scientific computing to beginning science and engineering students at the University of Utah.\r\n\r\nIn conventional science and engineering degree programs, computation is commonly treated as a narrow technical tool to be studied and applied in isolation from the traditional topics of the discipline. Many students go through their degree programs without ever using computation in any significant way.\r\n\r\nIntroduction to Scientific Programming was designed to encourage the integration of computation into the science and engineering curricula. This textbook is ideal for a course whose goal is to teach introductory programming while simultaneously preparing students to immediately exploit the broad power of modern computing in their science and engineering courses. This textbook has at least four distinguishing features: ', 0),
(14, 'Csc 100', 10001, 'Introduction to Scientific Programming was developed over a period of three years for use in teaching a course in scientific computing to beginning science and engineering students at the University of Utah.\r\n\r\nIn conventional science and engineering degree programs, computation is commonly treated as a narrow technical tool to be studied and applied in isolation from the traditional topics of the discipline. Many students go through their degree programs without ever using computation in any significant way.\r\n\r\nIntroduction to Scientific Programming was designed to encourage the integration of computation into the science and engineering curricula. This textbook is ideal for a course whose goal is to teach introductory programming while simultaneously preparing students to immediately exploit the broad power of modern computing in their science and engineering courses. This textbook has at least four distinguishing features:               		    ', 0),
(15, 'Bio1', 10003, 'Biology 1 is the Introductory biology course for all university students. This course intends to help students to understand the basic concepts of life. It includes the concepts of cell which is the smallest unit of life where organisms are composed of. it will also tackles the characteristics of life of different species here on earth.\r\nWhile we are roaming around this planet, it is important to know biology. it is important to know life better in the concept of science which is presented in a factual manner.	               		    	               		    ', 0),
(16, 'Csc 121', 10001, 'Data Structures	is one of the fundamental theory of computing.               		    ', 1),
(17, 'Bio 101', 10001, 'dfhsdhfdjf jhdfdfhjksdfhjds\r\nfdjhfjdfjd lorem ipsum. study of life nin maulay.               		    ', 1),
(18, 'Math 61', 10001, 'Analytic Geometry and Calculus II is an advanced topic for all science and mathematics major. This is the continuation of Math 51. Pagbantay mo kay daghan nabagsak ani. Mag-study ug tarong dili na mag dota kay makalambo sa pag eskwela	               		    ', 0),
(19, 'Math 17', 10001, 'College Algebra and Trigonometry sayonrani part. Pwede ra mo mag-overnight ug dota ani part. Wala ni siyay challenge mura ra ni ug College Algebra ug Trigonometry	               		    ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_id` varchar(15) NOT NULL,
  `test_id` int(10) unsigned NOT NULL,
  `item_type` tinyint(3) unsigned NOT NULL,
  `question` text NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `test_id` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--


-- --------------------------------------------------------

--
-- Table structure for table `lecture`
--

CREATE TABLE IF NOT EXISTS `lecture` (
  `lect_id` int(11) NOT NULL AUTO_INCREMENT,
  `ch_id` int(11) NOT NULL,
  `tittle` varchar(100) NOT NULL,
  `seq_no` int(11) NOT NULL,
  PRIMARY KEY (`lect_id`),
  KEY `ch_id` (`ch_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`lect_id`, `ch_id`, `tittle`, `seq_no`) VALUES
(1, 1, 'Sample lecture 1', 0),
(2, 2, 'Chapter 2 Lecture 2', 0),
(6, 1, 'Sample Lecture 2', 0),
(4, 2, 'Computational Analysis', 0),
(5, 3, 'Programming Paradigm 1', 0),
(7, 1, 'Sample Lecture 3', 0),
(8, 1, '', 0),
(9, 3, 'Introduction to Programming paradigms', 0),
(10, 1, 'lecture 4', 0),
(11, 9, 'Binary Conversion', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lect_mat`
--

CREATE TABLE IF NOT EXISTS `lect_mat` (
  `lectmat_id` int(11) NOT NULL AUTO_INCREMENT,
  `lect_id` int(11) NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `file_type` varchar(45) NOT NULL,
  PRIMARY KEY (`lectmat_id`),
  KEY `lect_id` (`lect_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `lect_mat`
--

INSERT INTO `lect_mat` (`lectmat_id`, `lect_id`, `file_url`, `file_type`) VALUES
(1, 1, 'problems2.pdf', 'pdf'),
(2, 1, 'MyProposedProjectList.docx', 'docx'),
(3, 2, 'accounts.txt', 'txt'),
(4, 6, 'MyProposedProjectList.docx', 'docx'),
(5, 2, '1 - 1 - Why Study Algorithms  (4 min).mp4', 'mp4'),
(6, 4, 'slides_algo1-intro2-annotated.pdf', 'pdf');

-- --------------------------------------------------------

--
-- Table structure for table `mpchoice`
--

CREATE TABLE IF NOT EXISTS `mpchoice` (
  `choice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(15) NOT NULL,
  `choice_val` varchar(100) NOT NULL,
  `iscorrect` tinyint(1) NOT NULL,
  `points` float NOT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mpchoice`
--


-- --------------------------------------------------------

--
-- Table structure for table `mtf_ans`
--

CREATE TABLE IF NOT EXISTS `mtf_ans` (
  `mtfa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(15) NOT NULL,
  `strec_id` int(10) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`mtfa_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mtf_ans`
--


-- --------------------------------------------------------

--
-- Table structure for table `mt_f`
--

CREATE TABLE IF NOT EXISTS `mt_f` (
  `mtf_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(15) NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`mtf_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `mt_f`
--


-- --------------------------------------------------------

--
-- Table structure for table `studentaccounts`
--

CREATE TABLE IF NOT EXISTS `studentaccounts` (
  `IDNUMBER` int(11) NOT NULL,
  `PASS_WORD` varchar(50) NOT NULL,
  `DAYSVALID` int(11) NOT NULL,
  `DATECREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `STUDENTACCOUNT_UNIQUE` (`IDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentaccounts`
--

INSERT INTO `studentaccounts` (`IDNUMBER`, `PASS_WORD`, `DAYSVALID`, `DATECREATED`) VALUES
(1048064, '352415', 365, '0000-00-00 00:00:00'),
(1058167, '126063', 365, '0000-00-00 00:00:00'),
(1059897, '825542', 365, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `studentcourserecord`
--

CREATE TABLE IF NOT EXISTS `studentcourserecord` (
  `scr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IDNUMBER` int(11) NOT NULL,
  `ic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`scr_id`),
  KEY `IDNUMBER` (`IDNUMBER`),
  KEY `ic_id` (`ic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `studentcourserecord`
--


-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `IDNUMBER` int(11) NOT NULL,
  `FIRSTNAME` varchar(50) NOT NULL,
  `MIDDLENAME` varchar(30) NOT NULL,
  `LASTNAME` varchar(30) NOT NULL,
  `COURSE` varchar(100) DEFAULT NULL,
  `SEX` varchar(6) DEFAULT 'Female',
  `PICTURE` blob,
  PRIMARY KEY (`IDNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`IDNUMBER`, `FIRSTNAME`, `MIDDLENAME`, `LASTNAME`, `COURSE`, `SEX`, `PICTURE`) VALUES
(1048064, 'Zenny', 'Becina', 'DELA CRUZ', 'BS Information Technology (Database Systems)', 'Female', 0x5b42494e4152595d),
(1058167, 'Joeper', 'Pantaleon', 'SERRANO', 'BS Information Technology (Database Systems)', 'Male', 0x5b42494e4152595d),
(1059897, 'Jofel', 'B', 'BAYRON', 'BS Information Technology (Database Systems)', 'Male', 0x5b42494e4152595d);

-- --------------------------------------------------------

--
-- Table structure for table `studenttestrec`
--

CREATE TABLE IF NOT EXISTS `studenttestrec` (
  `strec_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL,
  `scr_id` int(10) unsigned NOT NULL,
  `score` float DEFAULT '0',
  `date_taken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`strec_id`),
  KEY `test_id` (`test_id`),
  KEY `scr_id` (`scr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `studenttestrec`
--


-- --------------------------------------------------------

--
-- Table structure for table `stud_ident_ans`
--

CREATE TABLE IF NOT EXISTS `stud_ident_ans` (
  `sia_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(15) NOT NULL,
  `strec_id` int(10) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`sia_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `stud_ident_ans`
--


-- --------------------------------------------------------

--
-- Table structure for table `stud_mpc_ans`
--

CREATE TABLE IF NOT EXISTS `stud_mpc_ans` (
  `stmpca_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strec_id` int(10) unsigned NOT NULL,
  `item_id` varchar(15) NOT NULL,
  `choice_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`stmpca_id`),
  KEY `strec_id` (`strec_id`),
  KEY `item_id` (`item_id`),
  KEY `choice_id` (`choice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `stud_mpc_ans`
--


-- --------------------------------------------------------

--
-- Table structure for table `stud_tf_ans`
--

CREATE TABLE IF NOT EXISTS `stud_tf_ans` (
  `stfa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(15) NOT NULL,
  `strec_id` int(10) unsigned NOT NULL,
  `ans` bit(1) DEFAULT b'0',
  PRIMARY KEY (`stfa_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `stud_tf_ans`
--


-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `test_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `test_type` bit(1) DEFAULT b'1',
  `due_date` DATE NOT NULL,
  `test_date` DATE NOT NULL,
  `total_items` int(10) unsigned NOT NULL,
  `total_points` float NOT NULL,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `test`
--


-- --------------------------------------------------------

--
-- Table structure for table `t_f`
--

CREATE TABLE IF NOT EXISTS `t_f` (
  `tf_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(15) NOT NULL,
  `ans` bit(1) DEFAULT b'1',
  PRIMARY KEY (`tf_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `t_f`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`);

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ass_submission`
--
ALTER TABLE `ass_submission`
  ADD CONSTRAINT `ass_submission_ibfk_1` FOREIGN KEY (`scr_id`) REFERENCES `studentcourserecord` (`scr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`) ON UPDATE CASCADE;

--
-- Constraints for table `course_key`
--
ALTER TABLE `course_key`
  ADD CONSTRAINT `ck_fk1` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`) ON UPDATE CASCADE;

--
-- Constraints for table `identification`
--
ALTER TABLE `identification`
  ADD CONSTRAINT `identification_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructorcourserecord`
--
ALTER TABLE `instructorcourserecord`
  ADD CONSTRAINT `instructorcourserecord_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `instructorcourserecord_ibfk_2` FOREIGN KEY (`IDNUMBER`) REFERENCES `employees` (`IDNUMBER`) ON UPDATE CASCADE;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mpchoice`
--
ALTER TABLE `mpchoice`
  ADD CONSTRAINT `mpchoice_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mtf_ans`
--
ALTER TABLE `mtf_ans`
  ADD CONSTRAINT `mtf_ans_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `mtf_ans_ibfk_2` FOREIGN KEY (`strec_id`) REFERENCES `studenttestrec` (`strec_id`) ON UPDATE CASCADE;

--
-- Constraints for table `mt_f`
--
ALTER TABLE `mt_f`
  ADD CONSTRAINT `mt_f_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentaccounts`
--
ALTER TABLE `studentaccounts`
  ADD CONSTRAINT `studentaccounts_ibfk_1` FOREIGN KEY (`IDNUMBER`) REFERENCES `students` (`IDNUMBER`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studentaccounts_ibfk_2` FOREIGN KEY (`IDNUMBER`) REFERENCES `students` (`IDNUMBER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studentcourserecord`
--
ALTER TABLE `studentcourserecord`
  ADD CONSTRAINT `studentcourserecord_ibfk_1` FOREIGN KEY (`IDNUMBER`) REFERENCES `students` (`IDNUMBER`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studentcourserecord_ibfk_2` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `studenttestrec`
--
ALTER TABLE `studenttestrec`
  ADD CONSTRAINT `studenttestrec_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `test` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `studenttestrec_ibfk_2` FOREIGN KEY (`scr_id`) REFERENCES `studentcourserecord` (`scr_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stud_ident_ans`
--
ALTER TABLE `stud_ident_ans`
  ADD CONSTRAINT `stud_ident_ans_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stud_ident_ans_ibfk_2` FOREIGN KEY (`strec_id`) REFERENCES `studenttestrec` (`strec_id`) ON UPDATE CASCADE;

--
-- Constraints for table `stud_mpc_ans`
--
ALTER TABLE `stud_mpc_ans`
  ADD CONSTRAINT `stud_mpc_ans_ibfk_1` FOREIGN KEY (`strec_id`) REFERENCES `studenttestrec` (`strec_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stud_mpc_ans_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stud_mpc_ans_ibfk_3` FOREIGN KEY (`choice_id`) REFERENCES `mpchoice` (`choice_id`) ON UPDATE CASCADE;

--
-- Constraints for table `stud_tf_ans`
--
ALTER TABLE `stud_tf_ans`
  ADD CONSTRAINT `stud_tf_ans_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stud_tf_ans_ibfk_2` FOREIGN KEY (`strec_id`) REFERENCES `studenttestrec` (`strec_id`) ON UPDATE CASCADE;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`ic_id`) REFERENCES `instructorcourserecord` (`ic_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_f`
--
ALTER TABLE `t_f`
  ADD CONSTRAINT `t_f_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
