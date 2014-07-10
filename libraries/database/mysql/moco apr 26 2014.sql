-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 26, 2014 at 08:58 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`ann_id`, `ic_id`, `title`, `ann_stmt`, `date_posted`) VALUES
(1, 22, 'nnhhhhj', 'hhjhhh nmnmnmnm bnbnbnbn', '2014-04-10 00:11:50'),
(2, 22, 'bb vbbvnvn', 'hvghfhfghfhgfh', '2014-04-10 00:14:28'),
(3, 22, 'Sample Prepend Announcement', 'Sample content of prepended announcement', '2014-04-12 01:40:39'),
(4, 22, 'Sample Prepend Announcement 2', 'Sample Prepend Content 2', '2014-04-12 01:42:54'),
(5, 22, 'Una ni', 'blah.llllll', '2014-04-12 01:43:29'),
(10, 23, 'First Announcement', 'It is intended for use as a textbook for a second course in computer \nscience, after students have acquired basic programming skills and familiarity with computer \nsystems. The book also may be useful for self-study or as a reference for people engaged in \nthe development of computer systems or applications programs, since it contains implementations  of  useful  algorithms  and  detailed  information  on  performance  characteristics  and \nclients. The broad perspective taken makes the book an appropriate introduction to the field.\nthe study of algorithms and data structuresis fundamental to any computerscience curriculum, but it is not just for programmers and computer-science students. Everyone who uses a computer wants it to run faster or to solve larger problems. The algorithms \nin this book represent a body of knowledge developed over the last 50 years that has become \nindispensable. From N-body simulation problems in physics to genetic-sequencing problems \nin molecular biology, the basic methods described here have become essential in scientific \nresearch; from architectural modeling systems to aircraft simulation, they have become essential tools in engineering; and from database systems to internet search engines, they have \nbecome essential parts of modern software systems. And these are but a few examples%u2014as the \nscope of computer applications continues to grow, so grows the impact of the basic methods \ncovered here.', '2014-04-12 11:24:57'),
(25, 23, 'Sample Update Test', 'Sample Update Test', '2014-04-26 09:26:29');

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE IF NOT EXISTS `assignment` (
  `assign_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `instruction` text NOT NULL,
  `inst_material` varchar(100) NOT NULL,
  `due_date` date NOT NULL,
  `date_available` date NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`assign_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`assign_id`, `ic_id`, `instruction`, `inst_material`, `due_date`, `date_available`, `title`) VALUES
(2, 22, 'dkfdsfkl sampssdkfkdnfkjk', 'Doctor Post Test Questionare.docx', '2014-04-11', '2014-04-10', 'Sample Announcement Title 2'),
(3, 22, 'Instruction sampple 3\r\n             ', 'post-test(patient).docx', '2014-04-18', '2014-04-10', 'Sample Assignment 3'),
(4, 22, 'jsddsfjds\r\ndfdfdkfkdfk\r\ndl;fkds;lkf;\r\n;sdflkdjfk', 'Suggestions and Recommendations.docx', '2014-04-19', '2014-04-10', 'sample Title 4'),
(5, 22, 'Sample Assignment Instruction', 'Doctor Post Test Questionare.docx', '2014-04-16', '2014-04-10', 'mple Assignment 5'),
(6, 22, 'Graph algorithms and graph representation are a critical tool in CS. We want to create a graph as an ADT (Abstract Data Type) using C++ classes. The basic problem will be to write DijkstraÃ¢â‚¬â„¢s algorithm as a class member function (method in OO speak). You should already know DijkstraÃ¢â‚¬â„¢s algorithm for the shortest path problem from prior experience, but it will be reviewed in class. It is the basis for many route calculations and optimizations programs. \r\n\r\nThere are 2 basic implementations used for graphs Ã¢â‚¬â€œ one is edge lists, and the other is connectivity matrices. You can decide which to use, but comment on your choice. \r\n\r\nBasic problem:  Write a set of constructors for declaring and initializing a graph. An edge will have a positive cost that is its distance. Have a procedure that produces a randomly generated set of edges with positive distances.  Assume the graphs are undirected. The random graph procedure should have edge density as a parameter and distance range as a parameter. So a graph whose density is 0.1 would have 10% of its edges picked at random and its edge distance would be selected at random from the distance range. The procedure should run through all possible undirected edges, say (i,j) and place the edge in the graph if a random probability calculation is less than the density. Compute for a set of randomly generated graphs an average shortest path.\r\n\r\nTurn in:  Printout of program, 200 words on what you learned, and output showing the average path length calculation. Use densities: 20% and 40% on a graph of 50 nodes with a distance range of 1.0 to 10.0.   To get an average path length, compute the 49 paths:\r\n\r\n1 to 2, 1 to 3, 1 to 4, Ã¢â‚¬Â¦, 1 to 50. \r\n\r\n[In an instance where there is no path between 1 and n, omit that value from the average. This should be very rare for the chosen density and size in this homework.]\r\n\r\nKeep in mind: good style Ã¢â‚¬â€œ choice of identifiers, short functions, good documentation, correctness and efficiency. Cite any references in creating this program.\r\n             ', 'Doctor Post Test Questionare.docx', '2014-04-29', '2014-04-10', 'Assignments 6'),
(7, 23, ' \r\n             hfjkdkfjdslfjldsjflsdjflsdfdfdsf', 'Doctor Post Test Questionare.docx', '2014-04-16', '2014-04-15', 'Sample Assignment 3'),
(11, 23, 'Assignment 2 Sample here', '07-authenc-v2-annotated.pdf', '2014-04-27', '2014-04-26', 'Assignment 2'),
(12, 23, '	         asasas         ', '09-basic-key-exchange-annotated.pdf', '2014-04-28', '2014-04-26', 'sample');

-- --------------------------------------------------------

--
-- Table structure for table `ass_submission`
--

CREATE TABLE IF NOT EXISTS `ass_submission` (
  `assign_sub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scr_id` int(10) unsigned NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `date_submitted` date NOT NULL,
  `rating` float DEFAULT '0',
  `assign_id` int(11) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`ch_id`, `ic_id`, `title`, `seq_no`) VALUES
(11, 22, 'Chapter 1 - Introduction to HCI', 1),
(27, 22, 'Chapter 2 - HCI Concepts', 2),
(14, 23, 'C++ Inheritance', 3),
(16, 23, 'C++ OOP Concepts', 1),
(17, 23, 'C++ 11 Features', 2),
(28, 22, 'jhdfhdhfkdf', 3),
(20, 23, 'Sample New Chapter 1 update March 19', 4);

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
('Csc 100.1X', 'Introduction to C++ Programming', 16),
('CSc186', 'Human Computer Interaction', 16);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `course_key`
--

INSERT INTO `course_key` (`ck_id`, `ck_key`, `ic_id`) VALUES
(6, '48JX5', 22),
(7, '48PM5', 23);

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `dept_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`dept_id`, `dept_name`) VALUES
(16, 'Computer Studies');

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
  `item_id` int(11) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`ident_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`ic_id`),
  KEY `course_id` (`course_id`),
  KEY `IDNUMBER` (`IDNUMBER`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `instructorcourserecord`
--

INSERT INTO `instructorcourserecord` (`ic_id`, `course_id`, `IDNUMBER`, `course_overview`, `course_type`, `date_start`, `date_end`, `status`) VALUES
(22, 'CSc186', 10003, 'My First Course', 1, '2014-04-03', '2014-04-30', b'0'),
(23, 'Csc 100.1X', 10003, '		 The advent of the ISO/ANSI C++ standard marked the beginning of a new era for C++ programmers. The standard offers many new facilities and opportunities, but how can a real-world programmer find the time to discover the key nuggets of wisdom within this mass of information? The C++ In-Depth Series minimizes learning time and confusion by giving programmers concise, focused guides to specific topics.\r\n\r\nEach book in this series presents a single topic, at a technical level appropriate to that topic. The Series'' practical approach is designed to lift professionals to their next level of programming skills. Written by experts in the field, these short, in-depth monographs can be read and referenced without the distraction of unrelated material. The books are cross-referenced within the Series, and also reference The C++ Programming Language by Bjarne Stroustrup.\r\n\r\nAs you develop your skills in C++, it becomes increasingly important to separate essential information from hype and glitz, and to find the in-depth content you need in order to grow. The C++ In-Depth Series provides the tools, concepts, techniques, and new approaches to C++ that will give you a critical edge.\r\n\r\n		                           ', 0, '2014-04-07', '2014-06-26', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL,
  `item_type` tinyint(3) unsigned NOT NULL,
  `question` text NOT NULL,
  `points` float DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `test_id` (`test_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=128 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `test_id`, `item_type`, `question`, `points`) VALUES
(126, 20, 1, 'Is like the body of the main part of the program wherein it consists of declarations and executable statements enclosed within a pair of brace.', 2),
(127, 20, 2, 'A variable declared in a function definition is said to be local to the function.', 2);

--
-- Triggers `item`
--
DROP TRIGGER IF EXISTS `add_item_points`;
DELIMITER //
CREATE TRIGGER `add_item_points` AFTER INSERT ON `item`
 FOR EACH ROW begin     
	UPDATE test    
	SET total_points = total_points + NEW.points,
	    total_items = (total_items + 1)
        WHERE test_id=NEW.test_id;
end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `update_item_points`;
DELIMITER //
CREATE TRIGGER `update_item_points` AFTER UPDATE ON `item`
 FOR EACH ROW begin 

    UPDATE test

    SET total_points = total_points + NEW.points - OLD.points

    WHERE test_id=NEW.test_id;

end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `del_item_update_points`;
DELIMITER //
CREATE TRIGGER `del_item_update_points` AFTER DELETE ON `item`
 FOR EACH ROW begin



   UPDATE test

   SET total_items = (total_items - 1),
       total_points = (total_points - OLD.points)

   WHERE test_id=OLD.test_id;



end
//
DELIMITER ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`lect_id`, `ch_id`, `tittle`, `seq_no`) VALUES
(12, 11, 'lecture 1', 0),
(39, 11, 'C   Basic Syntax and Structure', 0),
(38, 12, 'C   Basic Syntax and Structure', 0),
(37, 12, 'C   Basics', 0),
(36, 12, 'hjshjshdjsd', 0),
(35, 12, 'Bayot si albert', 0),
(34, 12, 'Bayot si albert', 0),
(33, 13, 'Int and Double', 0),
(41, 11, 'Birth of HCI', 0),
(42, 11, 'Concepts of HCI', 0),
(43, 16, 'Classes and Objects', 0),
(44, 16, 'Inheritance', 0),
(45, 16, 'Polymorphism', 0),
(46, 17, 'Sample Lecture', 0),
(47, 17, 'C++ Features', 0),
(48, 17, 'New C++ Lecture', 0),
(49, 17, 'kkskskd**', 0),
(50, 17, 'jkjkjk', 0),
(51, 17, 'Java ++-', 0),
(53, 14, 'Inheritance from Base Class', 0),
(54, 14, 'klklkl-=-=', 0),
(59, 20, 'sample ', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `lect_mat`
--

INSERT INTO `lect_mat` (`lectmat_id`, `lect_id`, `file_url`, `file_type`) VALUES
(7, 12, 'pis_work2.txt', 'txt'),
(8, 12, 'pis_log_hours.txt', 'txt'),
(9, 12, 'post-test(patient).docx', 'docx'),
(10, 34, 'Doctor Post Test Questionare.docx', 'docx'),
(11, 35, '2 - 1 - Information theoretic security and the one time pad (19 min).mp4', 'mp4'),
(12, 45, '2 - 4 - Real-world stream ciphers (20 min).mp4', 'mp4'),
(13, 38, '2 - 4 - Real-world stream ciphers (20 min).mp4', 'mp4'),
(14, 39, '2 - 2 - Stream ciphers and pseudo random generators (20 min).mp4', 'mp4'),
(15, 43, '11 - 4 - PKCS 1 (23 min).mp4', 'mp4');

-- --------------------------------------------------------

--
-- Table structure for table `mpchoice`
--

CREATE TABLE IF NOT EXISTS `mpchoice` (
  `choice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `choice_val` varchar(100) NOT NULL,
  `iscorrect` tinyint(1) NOT NULL,
  `c_no` tinyint(4) NOT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=193 ;

--
-- Dumping data for table `mpchoice`
--

INSERT INTO `mpchoice` (`choice_id`, `item_id`, `choice_val`, `iscorrect`, `c_no`) VALUES
(189, 126, 'Function body', 1, 1),
(190, 126, 'Function header', 0, 2),
(191, 126, 'Function prototype', 0, 3),
(192, 126, 'Function Parameter List', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `mtf_ans`
--

CREATE TABLE IF NOT EXISTS `mtf_ans` (
  `mtfa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
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
  `item_id` int(11) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  PRIMARY KEY (`mtf_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `studentcourserecord`
--

INSERT INTO `studentcourserecord` (`scr_id`, `IDNUMBER`, `ic_id`) VALUES
(1, 1058167, 22);

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
  `date_taken` date NOT NULL,
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
  `item_id` int(11) unsigned NOT NULL,
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
  `item_id` int(11) unsigned NOT NULL,
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
-- Table structure for table `stud_mtf_ans`
--

CREATE TABLE IF NOT EXISTS `stud_mtf_ans` (
  `smtfa_id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `strec_id` int(10) NOT NULL,
  `ans` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`smtfa_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `stud_mtf_ans`
--


-- --------------------------------------------------------

--
-- Table structure for table `stud_tf_ans`
--

CREATE TABLE IF NOT EXISTS `stud_tf_ans` (
  `stfa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `strec_id` int(10) unsigned NOT NULL,
  `ans` tinyint(1) NOT NULL,
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
  `test_type` tinyint(1) NOT NULL,
  `due_date` date NOT NULL,
  `test_date` date NOT NULL,
  `total_items` int(10) unsigned NOT NULL,
  `total_points` float NOT NULL,
  `title` varchar(100) NOT NULL,
  `duration` tinyint(4) NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`test_id`, `ic_id`, `test_type`, `due_date`, `test_date`, `total_items`, `total_points`, `title`, `duration`) VALUES
(20, 23, 0, '2014-04-26', '2014-04-26', 2, 4, 'Programming Quiz 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_f`
--

CREATE TABLE IF NOT EXISTS `t_f` (
  `tf_id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `ans` tinyint(1) NOT NULL,
  PRIMARY KEY (`tf_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `t_f`
--

INSERT INTO `t_f` (`tf_id`, `item_id`, `ans`) VALUES
(1, 109, 0),
(2, 110, 1),
(3, 111, 0),
(4, 120, 1),
(5, 122, 1),
(6, 124, 1),
(7, 127, 1);

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;