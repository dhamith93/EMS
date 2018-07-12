DROP DATABASE IF EXISTS `EMS`;
CREATE DATABASE `EMS`;
USE `EMS`;

-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 12, 2018 at 01:41 AM
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
(6, 'E555', '2018-07-11', '03:51:00', '2018-07-11', '03:53:00', '0.02', '0.00', 1),
(7, 'E555', '2018-07-02', '03:03:03', '2018-07-02', '03:04:03', '1.00', '0.00', 1),
(8, 'E555', '2018-07-04', '03:03:03', '2018-07-04', '03:04:03', '1.00', '0.00', 1),
(9, 'E555', '2018-06-01', '03:03:03', '2018-06-01', '03:04:03', '1.00', '0.00', 1);

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
(1, 'IT', 'E09321'),
(2, 'HR', 'E545'),
(3, 'SALES', 'E303'),
(4, 'ACCOUNTING', 'E223'),
(6, 'Marketing', 'E338');

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
(1, 'DHAMITH', 'HEWAMULLAGE', '1993-01-01', 'male', '0123456789V', 'E338', '9999.99', '2012-01-01', 1, 1, 'DEV', '31', 'SRI ANANDARAMA MAWATHA', 'KOLONNAWA', '0778675309'),
(2, 'JOHN', 'DOE', '1989-01-01', 'male', '0123456789V', 'E556', '99999.99', '2015-01-01', 1, 1, 'OPS', '1, CURIOSITY STREET', '', 'MARS', '0123456789'),
(3, 'JANE', 'DOE', '1979-01-01', 'female', '0123456789V', 'E223', '99999.99', '2018-02-01', 5, 2, 'HR', '1, CURIOSITY STREET', '', 'MARS', '0123456789'),
(4, 'MIKE', 'HUNT', '1969-01-01', 'male', '0123456789V', 'E303', '99999.99', '2017-01-01', 4, 3, '', '666, SOME STREET', 'SOME OTHER STREET', 'SWING CITY', '0123456789'),
(5, 'ROBERT', 'SOLE', '1959-01-01', 'MALE', '0123456789V', 'E545', '99999.99', '2018-01-01', NULL, 2, NULL, '111, SOME STREET', 'SOME ANOTHER STREET', 'FUCK CITY', '0123456789'),
(8, 'Login', 'Test', '2018-05-11', 'male', '1213', 'E555', '999999.50', '2018-06-07', 5, 2, 'Sales', '117/3, Rahula road', 'Sugathi Mawatha', 'Angoda', '+94773630792'),
(25, 'Test', 'Name', '1980-10-28', 'male', '0123456789v', 'E441', '32563.59', '2017-09-14', 4, 3, 'Sales', '111, some place', 'some street', 'some city', '01234567890'),
(27, 'Test', 'Person', '1990-03-03', 'female', '123467985', 'E09321', '12564321.00', '2015-02-02', 1, 1, 'DEV', '123, Some Place', 'Some street', 'Some city', '1234453');

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
(4, 'E555', 5, 'test', 'short', '2018-07-06', '2018-07-06', '01:00', '02:00', 0, 0),
(5, 'E555', 5, 'test', 'short', '2018-07-11', '2018-07-11', '01:00', '02:00', 1, 1),
(6, 'E555', 5, 'test', 'annual', '2018-07-19', '2018-07-25', '', '', 1, 1),
(7, 'E555', 5, 'Some reason here', 'casual', '2018-07-09', '2018-07-10', '', '', 0, 0),
(8, 'E555', 5, 'test', 'annual', '2018-07-01', '2018-07-04', '', '', 1, 1),
(9, 'E555', 5, 'c test', 'casual', '2018-07-01', '2018-07-04', '', '', 1, 0),
(10, 'E555', 5, 'test', 'short', '2018-07-11', '2018-07-11', '01:00', '05:00', 0, 0),
(11, 'E555', 5, 'test reason', 'casual', '2018-01-01', '2018-01-05', '', '', 0, 0);

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
(1, 'E555', '10', '7', '2'),
(4, 'E441', '10', '7', '2'),
(6, 'E09321', '10', '7', '2');

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
(4, 'E223', '$2a$10$IqB0VrRcN0yQDkypoFoOU.HEqYOi4QEbyCqQhdGIKm.ff2SgpmUo2'),
(5, 'E338', '$2a$10$dQ8cJrRfkZE0am.QhREnAOAPteTmhDje6PY3Tl/iMkWvzEmB2LIT.'),
(8, 'E441', '$2a$10$4/qu2X64wx2cw0U83nB1GuN6mYVDUPqecThXV0Hb72yy8io80acDu'),
(10, 'E09321', '$2a$10$IOE8dHsPsFHz2JWgtxMIc.3eCt9C05vEdH1gK4rKj4vSJXvv7oBDy');

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

--
-- Dumping data for table `TASKS`
--

INSERT INTO `TASKS` (`ID`, `DEPT_ID`, `NAME`, `DESC`, `START_ON`, `END_ON`, `IS_COMPLETED`) VALUES
(1, 2, 'Test Task', 'This is a test task. ', '2018-06-30', '2018-07-21', 0),
(2, 2, 'Test task 2', 'This is a test task', '2018-07-03', '2018-07-06', 1);

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
(1, 2, 'E555', 99.99, 'This is a test note');

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
(1, 'E555', 1, '50'),
(2, 'E555', 2, '100');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `DEPARTMENT`
--
ALTER TABLE `DEPARTMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `LEAVES`
--
ALTER TABLE `LEAVES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `LEAVES_LEFT`
--
ALTER TABLE `LEAVES_LEFT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `LOGIN`
--
ALTER TABLE `LOGIN`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `TASKS`
--
ALTER TABLE `TASKS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `TASK_ASSESSMENT`
--
ALTER TABLE `TASK_ASSESSMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `TASK_ASSIGNMENT`
--
ALTER TABLE `TASK_ASSIGNMENT`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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


