-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 02, 2014 at 10:44 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE IF NOT EXISTS `dept` (
  `dept_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int(10) unsigned NOT NULL,
  `item_type` tinyint(3) unsigned NOT NULL,
  `question` text NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `test_id` (`test_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Triggers `item`
--
DROP TRIGGER IF EXISTS `add_item`;
DELIMITER //
CREATE TRIGGER `add_item` AFTER INSERT ON `item`
 FOR EACH ROW begin 







   UPDATE test







   SET total_items = (total_items + 1)







   WHERE test_id=NEW.test_id;







end
//
DELIMITER ;
DROP TRIGGER IF EXISTS `del_item`;
DELIMITER //
CREATE TRIGGER `del_item` AFTER DELETE ON `item`
 FOR EACH ROW begin

   UPDATE test



   SET total_items = (total_items - 1)

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `mpchoice`
--

CREATE TABLE IF NOT EXISTS `mpchoice` (
  `choice_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `choice_val` varchar(100) NOT NULL,
  `iscorrect` tinyint(1) NOT NULL,
  `points` float NOT NULL,
  `c_no` tinyint(4) NOT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=97 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `mt_f`
--

CREATE TABLE IF NOT EXISTS `mt_f` (
  `mtf_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `ans` varchar(100) NOT NULL,
  `points` float NOT NULL,
  PRIMARY KEY (`mtf_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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

-- --------------------------------------------------------

--
-- Table structure for table `stud_tf_ans`
--

CREATE TABLE IF NOT EXISTS `stud_tf_ans` (
  `stfa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `strec_id` int(10) unsigned NOT NULL,
  `ans` bit(1) DEFAULT b'0',
  PRIMARY KEY (`stfa_id`),
  KEY `item_id` (`item_id`),
  KEY `strec_id` (`strec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `test_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ic_id` int(10) unsigned NOT NULL,
  `test_type` bit(1) DEFAULT b'1',
  `due_date` date NOT NULL,
  `test_date` date NOT NULL,
  `total_items` int(10) unsigned NOT NULL,
  `total_points` float NOT NULL,
  `title` varchar(100) NOT NULL,
  `duration` tinyint(4) NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `ic_id` (`ic_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `t_f`
--

CREATE TABLE IF NOT EXISTS `t_f` (
  `tf_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `ans` bit(1) DEFAULT b'1',
  `points` int(11) NOT NULL,
  PRIMARY KEY (`tf_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

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
