-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2022 at 05:25 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_commission`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `account_ID` int(11) NOT NULL,
  `account_Username` varchar(50) NOT NULL,
  `account_Email` varchar(100) DEFAULT NULL,
  `account_Password` varchar(100) NOT NULL,
  `account_Name` varchar(100) NOT NULL,
  `account_Department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`account_ID`, `account_Username`, `account_Email`, `account_Password`, `account_Name`, `account_Department`) VALUES
(1, 'admin1', 'admin1@gmail.com', '0250F403B0140860AD0950A103908E03E0EB03D0830BC04001000105F0CC09B0ED0B305B04302E00002908D0500210F7', 'Engr  John Lemar Tirao', 'BSCE'),
(2, 'admin2', 'Almerol@gmail.com', '01C01402B02D0010AA0340E90A306B0DE0480060450A507F0D609E01401505D0AC0FA0B50A30F902507B0770FD0C80D8', 'Engr. Jemuel D. Almerol', 'BSEE'),
(3, 'admin', 'admin@gmail.com', '08C0690760E50B50410040150BD0E90080BD04D0EE0150DF0B10670A90C80730FC04B0B80A801F06F02A0B40480A9018', 'Patrick Luis Francisco, MIT', 'BSIT');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_activitylog`
--

CREATE TABLE `tbl_activitylog` (
  `log_ID` int(11) NOT NULL,
  `log_Time` time(4) NOT NULL,
  `log_Date` date DEFAULT NULL,
  `log_UserID` int(11) DEFAULT NULL,
  `log_Activity` varchar(50) DEFAULT NULL,
  `log_Detail` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_curriculum`
--

CREATE TABLE `tbl_curriculum` (
  `curr_ID` int(11) NOT NULL,
  `curr_Code` varchar(50) DEFAULT NULL,
  `curr_Title` varchar(100) DEFAULT NULL,
  `curr_Units` int(11) NOT NULL,
  `curr_Pre_Req` varchar(50) NOT NULL,
  `curr_Semester` varchar(50) NOT NULL,
  `curr_Yearlevel` int(11) NOT NULL,
  `curr_Batch` int(11) DEFAULT NULL,
  `curr_Department` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grade_record`
--

CREATE TABLE `tbl_grade_record` (
  `record_ID` int(11) NOT NULL,
  `record_StudentID` int(11) NOT NULL,
  `record_FinalGrade` double NOT NULL,
  `record_Remarks` varchar(50) NOT NULL,
  `record_CourseID` int(11) NOT NULL,
  `record_DateIssued` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_ID` int(11) NOT NULL,
  `student_StudentNo` varchar(50) NOT NULL,
  `student_Name` varchar(50) NOT NULL,
  `student_Department` varchar(50) DEFAULT NULL,
  `student_Batch` int(11) NOT NULL,
  `student_DateEvaluated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`account_ID`);

--
-- Indexes for table `tbl_activitylog`
--
ALTER TABLE `tbl_activitylog`
  ADD PRIMARY KEY (`log_ID`),
  ADD KEY `tbl_activitylog_ibfk_1` (`log_UserID`);

--
-- Indexes for table `tbl_curriculum`
--
ALTER TABLE `tbl_curriculum`
  ADD PRIMARY KEY (`curr_ID`);

--
-- Indexes for table `tbl_grade_record`
--
ALTER TABLE `tbl_grade_record`
  ADD PRIMARY KEY (`record_ID`),
  ADD KEY `tbl_grade_record_ibfk_1` (`record_CourseID`),
  ADD KEY `tbl_grade_record_ibfk_2` (`record_StudentID`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_activitylog`
--
ALTER TABLE `tbl_activitylog`
  MODIFY `log_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_curriculum`
--
ALTER TABLE `tbl_curriculum`
  MODIFY `curr_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_grade_record`
--
ALTER TABLE `tbl_grade_record`
  MODIFY `record_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_activitylog`
--
ALTER TABLE `tbl_activitylog`
  ADD CONSTRAINT `tbl_activitylog_ibfk_1` FOREIGN KEY (`log_UserID`) REFERENCES `tbl_account` (`account_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_grade_record`
--
ALTER TABLE `tbl_grade_record`
  ADD CONSTRAINT `tbl_grade_record_ibfk_1` FOREIGN KEY (`record_CourseID`) REFERENCES `tbl_curriculum` (`curr_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_grade_record_ibfk_2` FOREIGN KEY (`record_StudentID`) REFERENCES `tbl_student` (`student_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
