DROP DATABASE IF EXISTS `EMS`;
CREATE DATABASE `EMS`;
USE `EMS`;

-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 04, 2018 at 03:02 AM
-- Server version: 5.6.38
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `EMS`
--

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
(1, 'IT', 'E338'),
(2, 'HR', 'E545'),
(3, 'SALES', 'E303'),
(4, 'ACCOUNTING', 'E223');

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
(1, 'DHAMITH', 'HEWAMULLAGE', '1993-01-01', 'MALE', '0123456789V', 'E338', '9999.99', '2012-01-01', NULL, 1, 'DEV', '31', 'SRI ANANDARAMA MAWATHA', 'KOLONNAWA', '0778675309'),
(2, 'JOHN', 'DOE', '1989-01-01', 'MALE', '0123456789V', 'E556', '99999.99', '2015-01-01', NULL, 1, 'OPS', '1, CURIOSITY STREET', NULL, 'MARS', '0123456789'),
(3, 'JANE', 'DOE', '1979-01-01', 'FEMALE', '0123456789V', 'E223', '99999.99', '2016-01-01', NULL, 4, NULL, '1, CURIOSITY STREET', NULL, 'MARS', '0123456789'),
(4, 'MIKE', 'HUNT', '1969-01-01', 'MALE', '0123456789V', 'E303', '99999.99', '2017-01-01', NULL, 3, NULL, '666, SOME STREET', 'SOME OTHER STREET', 'SWING CITY', '0123456789'),
(5, 'ROBERT', 'SOLE', '1959-01-01', 'MALE', '0123456789V', 'E545', '99999.99', '2018-01-01', NULL, 2, NULL, '111, SOME STREET', 'SOME ANOTHER STREET', 'FUCK CITY', '0123456789'),
(6, 'Test', 'Tester', '2018-07-19', 'male', '123123v', 'E666', '999999.99', '2018-07-20', 3, 4, 'Auditor', '117/3, Rahula road', 'Sugathi Mawatha', 'Angoda', '+94773630792'),
(7, 'New', 'Test', '2018-07-20', 'male', '123123', 'E888', '123121323.00', '2018-07-18', 5, 2, 'HR', '117/3, Rahula road', 'Sugathi Mawatha', 'Angoda', '+94773630792'),
(8, 'Login', 'Test', '2018-05-11', 'male', '1213', 'E555', '123123.00', '2018-06-07', 5, 2, 'Sales', '117/3, Rahula road', 'Sugathi Mawatha', 'Angoda', '+94773630792');

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
(1, 'E555', 5, 'test', 'annual', '2018-07-05', '2018-07-12', '01:00', '01:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `LEAVES_LEFT`
--

CREATE TABLE `LEAVES_LEFT` (
  `ID` int(11) NOT NULL,
  `EMP_ID` varchar(10) NOT NULL,
  `ANNUAL` decimal(10,0) NOT NULL,
  `CASUAL` decimal(10,0) NOT NULL,
  `SHORT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `LEAVES_LEFT`
--

INSERT INTO `LEAVES_LEFT` (`ID`, `EMP_ID`, `ANNUAL`, `CASUAL`, `SHORT`) VALUES
(1, 'E555', '4', '7', 2);

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
(1, 'E666', '1'),
(2, 'E888', '1'),
(3, 'E555', '$2a$10$Frv43oAjOYbEeOi6DtlaSuIAqAME8YN6bjBp/bF/Q5ucILDCbUM6.');

-- --------------------------------------------------------

--
-- Table structure for table `TASKS`
--

CREATE TABLE `TASKS` (
  `ID` int(11) NOT NULL,
  `DEPT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(25) DEFAULT NULL,
  `DESC` text,
  `START_ON` date DEFAULT NULL,
  `END_ON` date DEFAULT NULL,
  `IS_COMPLETED` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `LEAVES`
--
ALTER TABLE `LEAVES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `LEAVES_LEFT`
--
ALTER TABLE `LEAVES_LEFT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `LOGIN`
--
ALTER TABLE `LOGIN`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `TASKS`
--
ALTER TABLE `TASKS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TASK_ASSESSMENT`
--
ALTER TABLE `TASK_ASSESSMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TASK_ASSIGNMENT`
--
ALTER TABLE `TASK_ASSIGNMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

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

