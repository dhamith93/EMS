DROP DATABASE IF EXISTS `EMS`;
CREATE DATABASE `EMS`;
USE `EMS`;

-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 17, 2018 at 03:12 PM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `EMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `ATTENDANCE`
--

CREATE TABLE `ATTENDANCE` (
  `ID` int(11) NOT NULL,
  `EMP_ID` varchar(10) NOT NULL,
  `DATE_IN` date DEFAULT NULL,
  `CLOCK_IN` time DEFAULT NULL,
  `DATE_OUT` date DEFAULT NULL,
  `CLOCK_OUT` time DEFAULT NULL,
  `HOURS` decimal(10,2) DEFAULT NULL,
  `OT` decimal(10,2) DEFAULT NULL,
  `IS_CLOCKED_OUT` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ATTENDANCE`
--

INSERT INTO `ATTENDANCE` (`ID`, `EMP_ID`, `DATE_IN`, `CLOCK_IN`, `DATE_OUT`, `CLOCK_OUT`, `HOURS`, `OT`, `IS_CLOCKED_OUT`) VALUES
(25, 'E556', '2018-07-01', '08:00:00', '2018-07-01', '16:14:00', '8.14', '0.14', 1),
(26, 'E556', '2018-07-02', '08:00:00', '2018-07-02', '19:20:00', '11.20', '3.20', 1),
(27, 'E556', '2018-07-03', '08:26:00', '2018-07-03', '16:00:00', '7.34', '0.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `DEPARTMENT`
--

CREATE TABLE `DEPARTMENT` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(15) DEFAULT NULL,
  `MANAGER_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DEPARTMENT`
--

INSERT INTO `DEPARTMENT` (`ID`, `NAME`, `MANAGER_ID`) VALUES
(8, 'HR', 'E555'),
(10, 'IT', 'E545'),
(11, 'SALES', 'E338'),
(12, 'ACCOUNTING', 'E223'),
(13, 'ADMINISTRATION', 'E762');

-- --------------------------------------------------------

--
-- Table structure for table `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `ID` int(11) NOT NULL,
  `FIRST_NAME` varchar(30) DEFAULT NULL,
  `LAST_NAME` varchar(30) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `GENDER` varchar(6) DEFAULT NULL,
  `NIC` varchar(13) DEFAULT NULL,
  `EMP_ID` varchar(10) DEFAULT NULL,
  `SALARY` decimal(15,2) DEFAULT NULL,
  `JOINED_DATE` date DEFAULT NULL,
  `MANAGED_BY` int(11) DEFAULT NULL,
  `DEPARTMENT` int(11) DEFAULT NULL,
  `POSITION` varchar(10) DEFAULT NULL,
  `ADDRESS_LINE_1` varchar(100) DEFAULT NULL,
  `ADDRESS_LINE_2` varchar(100) DEFAULT NULL,
  `CITY` varchar(50) DEFAULT NULL,
  `TELEPHONE_NO` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`ID`, `FIRST_NAME`, `LAST_NAME`, `DOB`, `GENDER`, `NIC`, `EMP_ID`, `SALARY`, `JOINED_DATE`, `MANAGED_BY`, `DEPARTMENT`, `POSITION`, `ADDRESS_LINE_1`, `ADDRESS_LINE_2`, `CITY`, `TELEPHONE_NO`) VALUES
(8, 'Login', 'Test', '2018-05-11', 'male', '1213', 'E555', '999999.50', '2018-06-07', 8, 8, 'Sales', '117/3, Rahula road', 'Sugathi Mawatha', 'Angoda', '+94773630792'),
(29, 'Kevin', 'Brown', '1987-05-26', 'male', '0123456789v', 'E556', '35500.50', '2018-01-01', 8, 8, 'Payroll ', '001, Some place', 'Some street', 'Some City', '0123456789'),
(32, 'Rob', 'Walters', '1991-07-10', 'male', '0123456789v', 'E338', '25000.00', '2011-06-01', 32, 11, 'SALES', '002, Some place', 'Some street', 'Some City', '0123456789'),
(33, 'Jane', 'Doe', '1977-10-05', 'female', '0123456789v', 'E223', '30000.00', '2009-12-11', 33, 12, 'ACCOUNTANT', '003, Some place', 'Some street', 'Some City', '0123456789'),
(34, 'John', 'Doe', '1965-08-14', 'male', '012345678912', 'E762', '75000.00', '2007-07-12', 34, 13, 'Admin', '004, Some place', 'Some street', 'Some City', '0123456789'),
(35, 'Mike', 'Hunt', '1985-05-01', 'male', '0123456789v', 'E545', '60000.00', '2002-06-01', 35, 10, 'DEV', '005, Some place', 'Some street', 'Some city', '0123456789');

-- --------------------------------------------------------

--
-- Table structure for table `LEAVES`
--

CREATE TABLE `LEAVES` (
  `ID` int(11) NOT NULL,
  `EMP_ID` varchar(10) DEFAULT NULL,
  `MANAGER` int(11) NOT NULL,
  `REASON` varchar(100) DEFAULT NULL,
  `TYPE` varchar(25) NOT NULL,
  `START_ON_DATE` date DEFAULT NULL,
  `END_ON_DATE` date DEFAULT NULL,
  `START_ON_TIME` varchar(8) NOT NULL,
  `END_ON_TIME` varchar(8) NOT NULL,
  `IS_APPROVED` smallint(6) DEFAULT NULL,
  `IS_CONFIRMED` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LEAVES`
--

INSERT INTO `LEAVES` (`ID`, `EMP_ID`, `MANAGER`, `REASON`, `TYPE`, `START_ON_DATE`, `END_ON_DATE`, `START_ON_TIME`, `END_ON_TIME`, `IS_APPROVED`, `IS_CONFIRMED`) VALUES
(15, 'E556', 8, 'Some reason', 'annual', '2018-07-22', '2018-07-24', '', '', 0, 0),
(16, 'E556', 8, 'Some another reason', 'casual', '2018-07-19', '2018-07-19', '', '', 0, 0),
(17, 'E556', 8, 'Yet another reason', 'casual', '2018-07-04', '2018-07-07', '', '', 0, 0),
(18, 'E556', 8, 'Some reason', 'short', '2018-07-26', '2018-07-26', '12:00', '16:00', 0, 0),
(19, 'E556', 8, 'Some another reason', 'short', '2018-07-21', '2018-07-21', '08:00', '13:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `LEAVES_LEFT`
--

CREATE TABLE `LEAVES_LEFT` (
  `ID` int(11) NOT NULL,
  `EMP_ID` varchar(10) NOT NULL,
  `ANNUAL` decimal(10,0) NOT NULL,
  `CASUAL` decimal(10,0) NOT NULL,
  `SHORT` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LEAVES_LEFT`
--

INSERT INTO `LEAVES_LEFT` (`ID`, `EMP_ID`, `ANNUAL`, `CASUAL`, `SHORT`) VALUES
(8, 'E555', '10', '7', '2'),
(9, 'E556', '10', '7', '2'),
(10, 'E338', '10', '7', '2'),
(11, 'E223', '10', '7', '2'),
(12, 'E762', '10', '7', '2'),
(13, 'E545', '10', '7', '2');

-- --------------------------------------------------------

--
-- Table structure for table `LOGIN`
--

CREATE TABLE `LOGIN` (
  `ID` int(11) NOT NULL,
  `EMP_ID` varchar(10) NOT NULL,
  `PASSWORD` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LOGIN`
--

INSERT INTO `LOGIN` (`ID`, `EMP_ID`, `PASSWORD`) VALUES
(3, 'E555', '$2a$10$Frv43oAjOYbEeOi6DtlaSuIAqAME8YN6bjBp/bF/Q5ucILDCbUM6.'),
(12, 'E556', '$2a$10$OrRSAI/vYN9XbluXjPV0fO45CKfgZ4MB093w/BXmhghOuJZxPpCxm'),
(13, 'E338', '$2a$10$h/QLptPzzrDi0ZnObPVfaO.kBrijt2mIQTnd2T1FN8wZlOv0dRfw.'),
(14, 'E223', '$2a$10$D6HtEUtjGdbIwgLxRSb6BeSxBQeBFzScXILczd1xYFHtmeGvPnZ8e'),
(15, 'E762', '$2a$10$j1Wf5K3C.64xwb7QvQK/1.H5pO2y7/RrB4zT16Dj/ijYhCikD0Cr2'),
(16, 'E545', '$2a$10$Jb.5cy7e94lFAf9stgmTg.FRg07Zm9i27xflD/.xYOJZJ/f4kbWVS');

-- --------------------------------------------------------

--
-- Table structure for table `TASKS`
--

CREATE TABLE `TASKS` (
  `ID` int(11) NOT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(25) DEFAULT NULL,
  `DESCRIPTION` text,
  `START_ON` date DEFAULT NULL,
  `END_ON` date DEFAULT NULL,
  `IS_COMPLETED` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TASKS`
--

INSERT INTO `TASKS` (`ID`, `DEPT_ID`, `NAME`, `DESCRIPTION`, `START_ON`, `END_ON`, `IS_COMPLETED`) VALUES
(4, 8, 'Test Task', 'This is a test task for kevin', '2018-07-23', '2018-07-24', 1),
(5, 8, 'Another Test Task', 'This is a another task for kevin', '2018-07-26', '2018-07-29', 0),
(6, 8, 'Another Test Task', 'Another task for kevin', '2018-08-02', '2018-08-04', 0),
(7, 8, 'Another task', 'Another task for kevin  ', '2018-08-05', '2018-08-18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `TASK_ASSESSMENT`
--

CREATE TABLE `TASK_ASSESSMENT` (
  `ID` int(11) NOT NULL,
  `TASK_ID` int(11) DEFAULT NULL,
  `EMP_ID` varchar(10) DEFAULT NULL,
  `PERFORMANCE` double DEFAULT NULL,
  `NOTES` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TASK_ASSESSMENT`
--

INSERT INTO `TASK_ASSESSMENT` (`ID`, `TASK_ID`, `EMP_ID`, `PERFORMANCE`, `NOTES`) VALUES
(13, 4, 'E556', 100, 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `TASK_ASSIGNMENT`
--

CREATE TABLE `TASK_ASSIGNMENT` (
  `ID` int(11) NOT NULL,
  `EMP_ID` varchar(10) DEFAULT NULL,
  `TASK_ID` int(11) DEFAULT NULL,
  `PROGRESS` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TASK_ASSIGNMENT`
--

INSERT INTO `TASK_ASSIGNMENT` (`ID`, `EMP_ID`, `TASK_ID`, `PROGRESS`) VALUES
(4, 'E556', 4, '100'),
(5, 'E556', 5, '95'),
(6, 'E556', 6, '10'),
(7, 'E556', 7, '100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_emp_id_attnd` (`EMP_ID`);

--
-- Indexes for table `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MANAGER_ID` (`MANAGER_ID`);

--
-- Indexes for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `EMP_ID` (`EMP_ID`),
  ADD KEY `DEPARTMENT` (`DEPARTMENT`),
  ADD KEY `MANAGED_BY` (`MANAGED_BY`);

--
-- Indexes for table `LEAVES`
--
ALTER TABLE `LEAVES`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `EMP_ID` (`EMP_ID`),
  ADD KEY `leaves_ibfk_2` (`MANAGER`);

--
-- Indexes for table `LEAVES_LEFT`
--
ALTER TABLE `LEAVES_LEFT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `leaves_fk_emp_id` (`EMP_ID`);

--
-- Indexes for table `LOGIN`
--
ALTER TABLE `LOGIN`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_emp_id` (`EMP_ID`);

--
-- Indexes for table `TASKS`
--
ALTER TABLE `TASKS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DEPT_ID` (`DEPT_ID`);

--
-- Indexes for table `TASK_ASSESSMENT`
--
ALTER TABLE `TASK_ASSESSMENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TASK_ID` (`TASK_ID`),
  ADD KEY `EMP_ID` (`EMP_ID`);

--
-- Indexes for table `TASK_ASSIGNMENT`
--
ALTER TABLE `TASK_ASSIGNMENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `TASK_ID` (`TASK_ID`),
  ADD KEY `EMP_ID` (`EMP_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `LEAVES`
--
ALTER TABLE `LEAVES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `LEAVES_LEFT`
--
ALTER TABLE `LEAVES_LEFT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `LOGIN`
--
ALTER TABLE `LOGIN`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `TASKS`
--
ALTER TABLE `TASKS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `TASK_ASSESSMENT`
--
ALTER TABLE `TASK_ASSESSMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `TASK_ASSIGNMENT`
--
ALTER TABLE `TASK_ASSIGNMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ATTENDANCE`
--
ALTER TABLE `ATTENDANCE`
  ADD CONSTRAINT `fk_emp_id_attnd` FOREIGN KEY (`EMP_ID`) REFERENCES `EMPLOYEE` (`EMP_ID`);

--
-- Constraints for table `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MANAGER_ID`) REFERENCES `EMPLOYEE` (`EMP_ID`);

--
-- Constraints for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DEPARTMENT`) REFERENCES `DEPARTMENT` (`ID`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`MANAGED_BY`) REFERENCES `EMPLOYEE` (`ID`);

--
-- Constraints for table `LEAVES`
--
ALTER TABLE `LEAVES`
  ADD CONSTRAINT `leaves_ibfk_1` FOREIGN KEY (`EMP_ID`) REFERENCES `EMPLOYEE` (`EMP_ID`),
  ADD CONSTRAINT `leaves_ibfk_2` FOREIGN KEY (`MANAGER`) REFERENCES `EMPLOYEE` (`ID`);

--
-- Constraints for table `LEAVES_LEFT`
--
ALTER TABLE `LEAVES_LEFT`
  ADD CONSTRAINT `leaves_fk_emp_id` FOREIGN KEY (`EMP_ID`) REFERENCES `EMPLOYEE` (`EMP_ID`);

--
-- Constraints for table `LOGIN`
--
ALTER TABLE `LOGIN`
  ADD CONSTRAINT `fk_emp_id` FOREIGN KEY (`EMP_ID`) REFERENCES `EMPLOYEE` (`EMP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `TASKS`
--
ALTER TABLE `TASKS`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`DEPT_ID`) REFERENCES `DEPARTMENT` (`ID`);

--
-- Constraints for table `TASK_ASSESSMENT`
--
ALTER TABLE `TASK_ASSESSMENT`
  ADD CONSTRAINT `task_assessment_ibfk_1` FOREIGN KEY (`TASK_ID`) REFERENCES `TASKS` (`ID`),
  ADD CONSTRAINT `task_assessment_ibfk_2` FOREIGN KEY (`EMP_ID`) REFERENCES `EMPLOYEE` (`EMP_ID`);

--
-- Constraints for table `TASK_ASSIGNMENT`
--
ALTER TABLE `TASK_ASSIGNMENT`
  ADD CONSTRAINT `task_assignment_ibfk_1` FOREIGN KEY (`TASK_ID`) REFERENCES `TASKS` (`ID`),
  ADD CONSTRAINT `task_assignment_ibfk_2` FOREIGN KEY (`EMP_ID`) REFERENCES `EMPLOYEE` (`EMP_ID`);
