-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2026 at 07:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hris_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`log_id`, `user_id`, `action`, `target`, `created_at`) VALUES
(30, 2, 'Restored Employee', NULL, '2026-03-04 05:47:42'),
(31, 2, 'Deleted Employee Permanently', '0', '2026-03-04 05:55:17'),
(32, 2, 'Deleted Employee Permanently', '0', '2026-03-04 05:56:26'),
(33, 2, 'Restored Employee', NULL, '2026-03-04 05:56:31'),
(34, 2, 'Deleted Employee Permanently', '0', '2026-03-04 05:57:07'),
(35, 2, 'Restored Employee', NULL, '2026-03-04 06:03:18'),
(36, 2, 'Deleted Employee Permanently', '5', '2026-03-04 06:03:32'),
(37, 2, 'Deleted Employee Permanently', '17', '2026-03-04 06:04:10'),
(38, 2, 'Restored Employee', NULL, '2026-03-04 06:08:20'),
(39, 2, 'Deleted Employee Permanently', '22', '2026-03-04 06:09:19'),
(40, 2, 'Restored Employee', NULL, '2026-03-04 06:09:30'),
(41, 2, 'Restored Employee', NULL, '2026-03-04 06:09:31'),
(42, 2, 'Deleted Employee Permanently', '15', '2026-03-04 06:09:42'),
(43, 2, 'Deleted Employee Permanently', '7', '2026-03-04 06:10:10'),
(44, 2, 'Deleted Employee Permanently', '3', '2026-03-04 06:10:42'),
(45, 2, 'Deleted Employee Permanently', '8', '2026-03-04 06:10:59'),
(46, 2, 'Deleted Employee Permanently', '10', '2026-03-04 06:11:01'),
(47, 2, 'Deleted Employee Permanently', '13', '2026-03-04 06:11:06'),
(48, 2, 'Deleted Employee Permanently', '14', '2026-03-04 06:12:49'),
(49, 2, 'Restored Employee', NULL, '2026-03-04 06:14:58'),
(50, 2, 'Deleted Employee Permanently', '23', '2026-03-04 06:16:47'),
(51, 2, 'Deleted Employee Permanently', '21', '2026-03-04 06:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `posted_by` int(11) NOT NULL,
  `date_posted` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `attendance_status` enum('Present','Absent','Late','Overtime','On Leave') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `employee_id`, `attendance_date`, `attendance_status`) VALUES
(1, 4, '2026-02-04', 'Present'),
(2, 1, '2026-02-04', 'Present'),
(3, 2, '2026-02-04', 'Present'),
(4, 4, '2026-02-05', 'Present'),
(5, 2, '2026-02-05', 'Present'),
(6, 9, '2026-02-11', 'Present'),
(7, 6, '2026-02-11', 'Present'),
(8, 1, '2026-02-12', 'Present'),
(9, 1, '2026-02-23', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `break_logs`
--

CREATE TABLE `break_logs` (
  `break_log_id` int(11) NOT NULL,
  `time_log_id` int(11) NOT NULL,
  `break_start` datetime NOT NULL,
  `break_end` datetime DEFAULT NULL,
  `total_break_minutes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `break_logs`
--

INSERT INTO `break_logs` (`break_log_id`, `time_log_id`, `break_start`, `break_end`, `total_break_minutes`) VALUES
(1, 2, '2026-02-04 13:00:46', NULL, NULL),
(2, 2, '2026-02-04 13:00:49', NULL, NULL),
(3, 3, '2026-02-04 13:14:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `civil_status` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `personal_email` varchar(100) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `account` varchar(100) DEFAULT NULL,
  `cluster` varchar(100) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `employment_status` varchar(20) DEFAULT NULL,
  `employee_type` varchar(30) DEFAULT NULL,
  `date_hired` date NOT NULL,
  `archived` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `user_id`, `first_name`, `middle_name`, `last_name`, `address`, `birthdate`, `civil_status`, `email`, `personal_email`, `position`, `account`, `cluster`, `contact_number`, `employment_status`, `employee_type`, `date_hired`, `archived`) VALUES
(1, 2, 'admin', NULL, 'admin', NULL, NULL, NULL, 'admin@ireply.com', NULL, 'superadmin', NULL, NULL, NULL, NULL, NULL, '0000-00-00', 0),
(2, 7, 'dennis', NULL, 'Severino', NULL, NULL, NULL, 'test@gmail.com', NULL, 'csr', 'sample', NULL, NULL, 'Active', NULL, '2026-01-29', 0),
(4, 9, 'stella', NULL, 'eriman', NULL, NULL, NULL, 'stellamarieeriman@gmail.com', NULL, 'csr', 'voya', NULL, NULL, 'Active', NULL, '2026-01-30', 1),
(6, 11, 'jan kevin', 'dilag', 'dilas', 'mandalagan', '2016-02-09', NULL, 'jankevin@gmail.com', 'jankevin@gmail.com', 'csr', 'royal', 'Cluster B', '09321742123', 'Active', 'Regular', '2026-02-05', 1),
(9, 14, 'kenneth', NULL, 'De vera', NULL, NULL, NULL, 'kenneth@gmail.com', NULL, 'csr', 'pepsi', NULL, NULL, 'Active', NULL, '2026-02-11', 1),
(16, 33, 'stella', 'stella', 'stellaa', 'ireply', '2002-08-23', 'Married', 'stellaa@gmail.com', 'stella@gmail.com', 'Sr. Recruitment Specialist', 'iReply Back Office Services', 'Cluster B', '09521511421', 'Active', 'Regular', '2026-02-17', 0),
(18, 35, 'test2', 'test2', 'test2', 'iqor', '2002-11-20', 'Married', 'test2@gmail.com', 'test2@gmail.com', 'Accounting', 'NUSO', 'Cluster D', '095827361234', 'Active', 'Contractual', '2026-02-18', 1),
(19, 37, 'jadenn', 'jaden', 'jaden', 'ireply', '2001-11-11', 'Widowed', 'jaden1@gmail.com', 'jaden1@gmail.com', 'Service Delivery Manager', 'SIPPIO', 'Night Support', '09876452612', 'Active', 'Probationary', '2026-02-20', 0),
(20, 38, 'admin1', 'admin1', 'admin1', 'admin1@gmail.com', '2002-11-11', 'Single', 'admin1@gmail.com', 'admin1@gmail.com', 'HR Coordinator', 'iReply Back Office Services', 'Technical Team', '09521235612', 'Active', 'Regular', '2026-02-26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `holiday_id` int(11) NOT NULL,
  `holiday_name` varchar(50) NOT NULL,
  `holiday_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `leave_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Approved','Denied') DEFAULT 'Pending',
  `reviewed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission_id` int(11) NOT NULL,
  `permission_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_id`, `permission_name`) VALUES
(1, 'Add Employee'),
(2, 'Edit Employee'),
(3, 'Delete Employee'),
(4, 'Set Attendance'),
(5, 'Edit Attendance'),
(6, 'View Dashboard'),
(7, 'View Team'),
(8, 'View Attendance'),
(9, 'View Employee List'),
(10, 'Edit Profile');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `role_description`) VALUES
(1, 'Superadmin', 'System Super Administrator'),
(2, 'Admin', 'Administrator'),
(3, 'Teamcoach', 'Team Coach'),
(4, 'Employee', 'Regular Employee');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 6),
(4, 7),
(4, 8),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `shift_type` enum('Morning','Mid','Night') NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `work_setup` enum('Onsite','WFH','Hybrid') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `employee_id`, `day_of_week`, `shift_type`, `start_time`, `end_time`, `work_setup`, `created_at`) VALUES
(1, 2, 'Monday', 'Night', '22:00:00', '06:00:00', 'WFH', '2026-01-29 09:41:56'),
(2, 2, 'Tuesday', 'Night', '21:00:00', '06:00:00', 'Onsite', '2026-01-29 09:41:56'),
(3, 2, 'Wednesday', 'Night', '21:00:00', '06:00:00', 'Onsite', '2026-01-29 09:41:56'),
(4, 2, 'Thursday', 'Night', '21:00:00', '06:00:00', 'Onsite', '2026-01-29 09:41:56'),
(5, 2, 'Friday', 'Morning', '09:00:00', '18:00:00', 'WFH', '2026-01-29 09:41:56'),
(8, 4, 'Monday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2026-01-29 23:44:40'),
(9, 4, 'Tuesday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2026-01-29 23:44:40'),
(10, 4, 'Wednesday', 'Night', '21:00:00', '06:00:00', 'WFH', '2026-01-29 23:44:40'),
(11, 4, 'Thursday', 'Night', '21:00:00', '06:00:00', 'WFH', '2026-01-29 23:44:40'),
(12, 4, 'Friday', 'Morning', '09:00:00', '18:00:00', 'Onsite', '2026-01-29 23:44:40'),
(18, 6, 'Monday', 'Night', '21:00:00', '05:00:00', 'Onsite', '2026-02-05 10:04:16'),
(29, 9, 'Wednesday', 'Morning', '21:00:00', '20:00:00', 'Onsite', '2026-02-11 01:20:59'),
(30, 9, 'Thursday', 'Morning', '21:00:00', '20:00:00', 'Onsite', '2026-02-11 01:20:59'),
(31, 9, 'Tuesday', 'Night', '08:00:00', '09:00:00', 'Onsite', '2026-02-11 01:20:59'),
(32, 9, 'Friday', 'Night', '08:00:00', '09:00:00', 'Onsite', '2026-02-11 01:20:59'),
(58, 16, 'Monday', 'Mid', '17:00:00', '02:00:00', 'Hybrid', '2026-02-19 03:19:03'),
(59, 16, 'Wednesday', 'Mid', '17:00:00', '02:00:00', 'Hybrid', '2026-02-19 03:19:03'),
(60, 16, 'Thursday', 'Mid', '17:00:00', '02:00:00', 'Hybrid', '2026-02-19 03:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `team_cluster`
--

CREATE TABLE `team_cluster` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `approved_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `team_member_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_logs`
--

CREATE TABLE `time_logs` (
  `time_log_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `attendance_id` int(11) DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `log_date` date NOT NULL,
  `total_work_minutes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `time_logs`
--

INSERT INTO `time_logs` (`time_log_id`, `employee_id`, `attendance_id`, `time_in`, `time_out`, `log_date`, `total_work_minutes`) VALUES
(1, 4, 1, '2026-02-04 12:30:17', '2026-02-04 12:30:19', '2026-02-04', 0),
(2, 1, 2, '2026-02-04 13:00:23', '2026-02-04 13:00:55', '2026-02-04', 0),
(3, 2, 3, '2026-02-04 13:14:30', '2026-02-04 13:19:27', '2026-02-04', 0),
(4, 4, 4, '2026-02-05 08:40:18', '2026-02-05 08:40:23', '2026-02-05', 0),
(5, 2, 5, '2026-02-05 08:57:14', '2026-02-05 18:10:06', '2026-02-05', 132),
(6, 9, 6, '2026-02-11 09:22:25', '2026-02-11 09:22:29', '2026-02-11', 0),
(7, 6, 7, '2026-02-11 09:38:58', '2026-02-11 09:39:00', '2026-02-11', 0),
(8, 1, 8, '2026-02-12 15:24:33', '2026-02-12 15:24:35', '2026-02-12', 0),
(9, 1, 9, '2026-02-23 15:42:37', '2026-02-23 15:42:42', '2026-02-23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `role_id`, `created_at`) VALUES
(2, 'superadmin', '$2y$10$0b26/Du3MJNhyhuKn9/IeOWlayMPo5DtAV2zRuF/Alt1xwDk4hhy6', 1, '2026-01-29 17:04:40'),
(7, 'test@gmail.com', '$2y$10$/Gaks65ILKb/ivLB6wmROupTUEzzOw4f4lwHUFBIZHo54rMS3chN2', 4, '2026-01-29 17:41:56'),
(8, 'dennis@gmail.com', '$2y$10$U8mD1Xamfqzu1NFouNEv5OHB2W9oj4a5NXnT21IEx9xODiyCmDnDu', 4, '2026-01-29 17:49:01'),
(9, 'stellamarieeriman@gmail.com', '$2y$10$WdOze02mUKE1nqw6mF5p5.bnhywRv7SFiiyLSV6H3ZRnQ19cSBKsu', 4, '2026-01-30 07:44:40'),
(10, 'eu@gmail.com', '$2y$10$V1iiw1IoLNRdBXPgA7FuXu5k1BFbnRWiQW3/.3.GR3yEUFRdthRiu', 4, '2026-02-05 17:57:46'),
(11, 'jankevin@gmail.com', '$2y$10$AY1YEVHrTDAlb3FaDj6/m.3FgrzXuPydiqw6SKW7ktFuZsoVuNHGq', 4, '2026-02-05 18:04:16'),
(12, 'johnray@gmail.com', '$2y$10$NmQRA1RoFeGwk.HuvCm5hu4HLGfldIqcoXRu.cUKq5V9heSuGV4wC', 4, '2026-02-05 18:31:43'),
(13, 'yannie@gmail.com', '$2y$10$vLxg7LU/MQbxPDzQjzIdZuLsog9iQjIq2sG/8tKHhVHATwpCrvPte', 4, '2026-02-06 19:59:35'),
(14, 'kenneth@gmail.com', '$2y$10$12EDa4wL52EhJ1nEP3uke.wim/0k3cKtZ2Q2ReUusqUqBTWFfJ/kO', 4, '2026-02-11 09:20:59'),
(15, 'jaden@gmail.com', '$2y$10$naA6jYVsMyQRCUx9vdSzWeuDkq/uHuumMUQy5BDR0TujRn6DNVxOO', 4, '2026-02-11 10:00:32'),
(17, 'test1@gmail.com', '$2y$10$t2FwnouuUgI8s5Eg4l3mqO3aLgVEkHHZv86oIxYxeGm3r4GrUoMn.', 4, '2026-02-12 14:29:11'),
(18, 'kevs@gmail.com', '$2y$10$l0sOpNrgILYczMqc9q24DuT84WPM9yZ3HTNclWonGfmSKTG0gPx7C', 4, '2026-02-12 15:21:14'),
(19, 'any@any.com', '$2y$10$.rKEJHapdGlNkryifxA9bOEmCNtrbrahnVn4JeyMV9Zz1VID/bF1G', 4, '2026-02-13 16:50:50'),
(20, 'figs@gmail.com', '$2y$10$pAeTJeQtwDnixO/nJof8cO4X0LN5mUD0KwNhNHyAHugUJjUGNyDQu', 4, '2026-02-16 16:20:36'),
(32, 'stella@gmail.com', '$2y$10$9yrhP0IqG4bNpPcQ5vFPw.pSss/ujmN8egmHnjJe6BMSqJ/54DOIW', 3, '2026-02-17 15:59:01'),
(33, 'stellaa@gmail.com', '$2y$10$vJwLDimPJZ4b9VpGPix2Ku9EdSYjvtxAs4Oj5wxkBL46WIqyItBZ.', 4, '2026-02-17 16:33:53'),
(34, 'new@gmail.com', '$2y$10$id7cOlM1dH/cMHnMtyKV4ul8WBF5SgdQaagTbdRR7sDQOsGcz.j1W', 4, '2026-02-18 15:46:56'),
(35, 'test2@gmail.com', '$2y$10$7DMKRw.KqnLjXp7CAP4OP.ViRORgkBjKgleeCXNIDPR6sJ2Lyn8pi', 4, '2026-02-18 15:48:46'),
(37, 'jaden1@gmail.com', '$2y$10$BGKaFnbHG2juvvB.HC8sv.ruH/rvbkGftNW5DmIaJVdtvORpgFcX6', 4, '2026-02-20 10:28:20'),
(38, 'admin1@gmail.com', '$2y$10$GbYhQz9I2M1eAQkKEiaYvOE7s3/JJzrYI7o63Q7B9c1G9Iw71rxbG', 2, '2026-02-26 09:31:30'),
(39, 'eu.ireply@gmail.com', '$2y$10$IBKepYJLwO2GwvU1Ne7vROyXXIXyIP1P4xzroHpofbW6dUNThVkRa', 4, '2026-02-27 11:49:29'),
(41, 'eug.ireply@gmail.com', '$2y$10$H0Dp7Hv2ZClWPT4MtcKmfe1QMb4Tt58fDvwYXAvjNO9uu0ChQWo36', 4, '2026-02-27 11:52:10'),
(42, 'kev@gmail.com', '$2y$10$e7czirYvDHFn8G7UYFUR6Ot.63LfpLegi5QR0OCG/CHjNiVXuIJ5e', 4, '2026-03-04 14:16:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `is_allowed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `permission_id`, `is_allowed`) VALUES
(1, 38, 1, 0),
(2, 38, 2, 0),
(3, 38, 3, 0),
(4, 38, 4, 0),
(5, 38, 5, 0),
(6, 38, 6, 1),
(7, 38, 7, 1),
(8, 38, 8, 1),
(9, 38, 9, 1),
(10, 38, 10, 0),
(21, 7, 1, 0),
(22, 7, 2, 0),
(23, 7, 3, 0),
(24, 7, 4, 0),
(25, 7, 5, 0),
(26, 7, 6, 1),
(27, 7, 7, 1),
(28, 7, 8, 0),
(29, 7, 9, 1),
(30, 7, 10, 0),
(51, 15, 1, 0),
(52, 15, 2, 0),
(53, 15, 3, 0),
(54, 15, 4, 0),
(55, 15, 5, 0),
(56, 15, 6, 0),
(57, 15, 7, 1),
(58, 15, 8, 1),
(59, 15, 9, 0),
(60, 15, 10, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `posted_by` (`posted_by`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `break_logs`
--
ALTER TABLE `break_logs`
  ADD PRIMARY KEY (`break_log_id`),
  ADD KEY `time_log_id` (`time_log_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`holiday_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`leave_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `reviewed_by` (`reviewed_by`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `fk_employee_schedule` (`employee_id`);

--
-- Indexes for table `team_cluster`
--
ALTER TABLE `team_cluster`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `coach_id` (`coach_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`team_member_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD PRIMARY KEY (`time_log_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `attendance_id` (`attendance_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_permission` (`user_id`,`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `break_logs`
--
ALTER TABLE `break_logs`
  MODIFY `break_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `leave_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `team_cluster`
--
ALTER TABLE `team_cluster`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `team_member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_logs`
--
ALTER TABLE `time_logs`
  MODIFY `time_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`posted_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `break_logs`
--
ALTER TABLE `break_logs`
  ADD CONSTRAINT `break_logs_ibfk_1` FOREIGN KEY (`time_log_id`) REFERENCES `time_logs` (`time_log_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `leave_requests_ibfk_2` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`permission_id`) ON DELETE CASCADE;

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_employee_schedule` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `team_cluster`
--
ALTER TABLE `team_cluster`
  ADD CONSTRAINT `team_cluster_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `team_cluster_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `team_members`
--
ALTER TABLE `team_members`
  ADD CONSTRAINT `team_members_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team_cluster` (`team_id`),
  ADD CONSTRAINT `team_members_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD CONSTRAINT `time_logs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `time_logs_ibfk_2` FOREIGN KEY (`attendance_id`) REFERENCES `attendance` (`attendance_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
