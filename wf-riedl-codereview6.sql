-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2020 at 01:40 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wf-riedl-codereview6`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `classID` int(11) NOT NULL,
  `className` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`classID`, `className`) VALUES
(1, '1a'),
(2, '1b'),
(3, '2a'),
(4, '2b');

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `Enroll_ID` int(11) NOT NULL,
  `EnrollClassID` int(11) NOT NULL,
  `EnrollStudentID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`Enroll_ID`, `EnrollClassID`, `EnrollStudentID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 8),
(4, 2, 4),
(5, 3, 3),
(6, 2, 7),
(7, 4, 11),
(8, 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `StudentID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`StudentID`, `name`, `surname`, `email`) VALUES
(1, 'Hans', 'Müller', 'hans.müller@gmx.at'),
(2, 'peter', 'obermüller', 'peter.obermüller@gmx.at'),
(3, 'Franz', 'Haus', 'Franz.haus@gmx.at'),
(4, 'Franz', 'Kafka', 'franz.kafka@gmx.at'),
(7, 'Gerhard', 'Heringer', 'gerhard.heringer@gmx.at'),
(8, 'Max', 'Mustermann', 'max.mustermann@gmx.at'),
(9, 'peter', 'frederik', 'peter.frederik@gmx.at'),
(10, 'heinz', 'christian', 'heinz.c@gmx.at'),
(11, 'gerhard', 'zink', 'gerhard.zink@gmx.at'),
(12, 'paul', 'peter der 2te', 'paul.peter@gmx.at');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `TeacherID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`TeacherID`, `name`, `surname`, `email`) VALUES
(1, 'Peter', 'klaus', 'peter.klaus@gmx.at'),
(2, 'hans ', 'mayer', 'hans.mayer@gmx.at'),
(3, 'stephan', 'rohringer', 'stephan.rohringer@gmx.at'),
(4, 'freddy', 'krüger', 'fredy.krüger@gmx.at');

-- --------------------------------------------------------

--
-- Table structure for table `teacherenrollclass`
--

CREATE TABLE `teacherenrollclass` (
  `TeacherEnrollClass` int(11) NOT NULL,
  `TeacherID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacherenrollclass`
--

INSERT INTO `teacherenrollclass` (`TeacherEnrollClass`, `TeacherID`, `ClassID`) VALUES
(1, 2, 1),
(2, 4, 2),
(3, 1, 3),
(4, 4, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classID`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`Enroll_ID`),
  ADD KEY `EnrollClassID` (`EnrollClassID`),
  ADD KEY `EnrollStudentID` (`EnrollStudentID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`TeacherID`);

--
-- Indexes for table `teacherenrollclass`
--
ALTER TABLE `teacherenrollclass`
  ADD PRIMARY KEY (`TeacherEnrollClass`),
  ADD KEY `TeacherID` (`TeacherID`),
  ADD KEY `ClassID` (`ClassID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `classID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `Enroll_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `TeacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teacherenrollclass`
--
ALTER TABLE `teacherenrollclass`
  MODIFY `TeacherEnrollClass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `enroll_ibfk_1` FOREIGN KEY (`EnrollClassID`) REFERENCES `class` (`classID`),
  ADD CONSTRAINT `enroll_ibfk_2` FOREIGN KEY (`EnrollStudentID`) REFERENCES `student` (`StudentID`);

--
-- Constraints for table `teacherenrollclass`
--
ALTER TABLE `teacherenrollclass`
  ADD CONSTRAINT `teacherenrollclass_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`TeacherID`),
  ADD CONSTRAINT `teacherenrollclass_ibfk_2` FOREIGN KEY (`TeacherID`) REFERENCES `teacher` (`TeacherID`),
  ADD CONSTRAINT `teacherenrollclass_ibfk_3` FOREIGN KEY (`ClassID`) REFERENCES `class` (`classID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
